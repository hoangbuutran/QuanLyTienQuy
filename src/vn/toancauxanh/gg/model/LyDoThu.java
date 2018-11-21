package vn.toancauxanh.gg.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.ValidationContext;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.validator.AbstractValidator;
import org.zkoss.zul.Window;

import com.querydsl.jpa.impl.JPAQuery;

import vn.toancauxanh.model.Model;
import vn.toancauxanh.model.NhanVien;
import vn.toancauxanh.model.QNhanVien;
import vn.toancauxanh.service.SendEmail;

@Entity
@Table(name = "lydothu")
public class LyDoThu extends Model<LyDoThu> {

	private double soTien;
	private String lyDoContent = "Nộp tiền quỹ tháng: \"" + (Calendar.getInstance().get(Calendar.MONTH)+1) + "\" - năm: \"" + Calendar.getInstance().get(Calendar.YEAR) + "\"";
	private String lyDoKeyWord;
	private boolean complete;
	private boolean quy = true;

	List<ThuTien> modelThuTien;

	public LyDoThu() {
		super();
	}
	public LyDoThu(double soTien, String lyDoContent, String lyDoKeyWord, boolean complete, boolean quy) {
		super();
		this.soTien = soTien;
		this.lyDoContent = lyDoContent;
		this.lyDoKeyWord = lyDoKeyWord;
		this.complete = complete;
		this.quy = quy;
	}

	public String getLyDoKeyWord() {
		return lyDoKeyWord;
	}
	public void setLyDoKeyWord(String lyDoKeyWord) {
		this.lyDoKeyWord = lyDoKeyWord;
	}
	public boolean isQuy() {
		return quy;
	}
	public void setQuy(boolean quy) {
		this.quy = quy;
	}
	public double getSoTien() {
		return soTien;
	}
	public void setSoTien(double soTien) {
		this.soTien = soTien;
	}
	public String getLyDoContent() {
		return lyDoContent;
	}
	public void setLyDoContent(String lyDoContent) {
		this.lyDoContent = lyDoContent;
	}
	public boolean isComplete() {
		return complete;
	}
	public void setComplete(boolean complete) {
		this.complete = complete;
	}

	// tạo mới lý do thu (tương ứng với thu tiền quỹ).
	@Command
	public void saveLyDoThu(@BindingParam("list") final Object listObject, @BindingParam("attr") final String attr, @BindingParam("wdn") final Window wdn) throws IOException {
		if (noId()) { // tạo mới lý do
			saveQuyAndAddThuTien();
			// sendEmailNotiForAllStaff(String title, String content)
		} else { // cập nhật lý do
			save();
		}
		wdn.detach();
		BindUtils.postNotifyChange(null, null, listObject, attr);
	}

	// lưu lý do thu và thêm dữ liệu vào bảng thu tiền ứng với số nhân viên(được gọi từ hàm saveLyDoThu)
	public void saveQuyAndAddThuTien() {
		lyDoKeyWord = "ly-do-" + Calendar.getInstance().getTimeInMillis();
		setQuy(true);
		save();
		LyDoThu lyDoThu = this.<LyDoThu>query().from(QLyDoThu.lyDoThu).where(QLyDoThu.lyDoThu.lyDoKeyWord.eq(lyDoKeyWord)).fetchFirst();
		List<NhanVien> nhanViens = queryNhanVien().fetch();
		for (NhanVien nhanVien : nhanViens) {
			ThuTien thuTien = new ThuTien(lyDoThu, nhanVien, false);
			thuTien.save();
		}
	}
	
	// gửi mail thông báo cho toàn bộ nhân viên trong team java biết.
	public void sendEmailNotiForAllStaff(String title, String content) {
		List<NhanVien> nhanViens = queryNhanVien().fetch();
		for (NhanVien nhanVien : nhanViens) {
			SendEmail.sendEmailGmail(nhanVien.getEmail(), title, content);
		}
	}
	
	// lưu tiền thu khác(khoản thu do nhậu nhẹt dư)
	@Command
	public void saveThuKhac(@BindingParam("list") final Object listObject, @BindingParam("attr") final String attr, @BindingParam("wdn") final Window wdn) throws IOException {

		if (noId()) { // tạo mới thu tiền khác
			saveThuKhacAndAddThuTien();
			// sendEmailNotiForAllStaff(String title, String content)
		} else { // cập nhật thu tiền khác
			save();
		}
		wdn.detach();
		BindUtils.postNotifyChange(null, null, listObject, attr);

	}

	// lưu lý do thu và thêm dữ liệu vào bảng thu tiền (được gọi từ hàm saveThuKhac)
	public void saveThuKhacAndAddThuTien() {
		lyDoKeyWord = "ly-do-" + Calendar.getInstance().getTimeInMillis();
		setQuy(false);
		save();
		LyDoThu lyDoThu = this.<LyDoThu>query().from(QLyDoThu.lyDoThu).where(QLyDoThu.lyDoThu.lyDoKeyWord.eq(lyDoKeyWord)).fetchFirst();
		ThuTien thuTien = new ThuTien(lyDoThu, getNguoiTao(), true);
		thuTien.save();
	}
	
	// lưu và update những nhân viên nộp quỹ
	@Command
	public void saveNhanVienAndQuy(@BindingParam("list") final Object listObject, @BindingParam("attr") final String attr, @BindingParam("wdn") final Window wdn) throws IOException {
		int totalNhanVien = modelThuTien.size();
		int totalDaNop = 0;
		for (ThuTien thuTien : modelThuTien) {
			if (thuTien.isXacNhan()) {
				totalDaNop ++;
			}
			thuTien.save();
		}
		if (totalNhanVien == totalDaNop) {
			setComplete(true);
			this.save();
		}else {
			setComplete(false);
			this.save();
		}
		wdn.detach();
		BindUtils.postNotifyChange(null, null, listObject, attr);
	}

	@Command
	public void showListNhanVien(@BindingParam("zul") String zul, @BindingParam("vmArgs") Object vmArgs, @BindingParam("item") LyDoThu lyDoThu) {
		modelThuTien = new ArrayList<ThuTien>();
		modelThuTien.addAll(getThuTienWithLyDo(lyDoThu.getId()));
		redirectPage(zul, vmArgs, lyDoThu, null);
	}
	
	@Command
	public void sendMailNhacNopQuy(@BindingParam("item") ThuTien thuTien) {
		if (thuTien.getNguoiNop().getEmail() == null || thuTien.getNguoiNop().getEmail().isEmpty()) {
			showNotification("Nhân viên chưa cập nhật Email !", "", "warning");
			return;
		}
		SendEmail.sendEmailGmail(thuTien.getNguoiNop().getEmail(), "Email notification from Team java", "Đề nghị <h2> "+ thuTien.getNguoiNop().getHoVaTen() +"</h2> nộp tiền trong đợt <h2>\"" + thuTien.getLyDoThu().lyDoContent + "\"</h2>");
		showNotification("Mail đã được gửi!", "", "success");
	}

	// validate 
	@Transient
	public AbstractValidator getValidatorLyDoThu() {
		return new AbstractValidator() {
			@Override
			public void validate(final ValidationContext ctx) {
				List<LyDoThu> lyDoThu = find(LyDoThu.class).where(QLyDoThu.lyDoThu.id.ne(getId())).fetch();
				for (LyDoThu lyDoThu2 : lyDoThu) {
					if (lyDoThu2.getLyDoContent().equals(getLyDoContent())) {
						addInvalidMessage(ctx, "lyDoContextError", "Nội dung lý do đã được tạo");
						return;
					}
				}
			}
		};
	}


	public List<ThuTien> getThuTienWithLyDo(long id) {
		List<ThuTien> thuTiens = new ArrayList<ThuTien>();
		thuTiens = find(ThuTien.class).where(QThuTien.thuTien.trangThai.ne(core().TT_DA_XOA))
				.where(QThuTien.thuTien.lyDoThu.id.eq(id)).fetch();
		return thuTiens;
	}

	public JPAQuery<NhanVien> queryNhanVien() {
		return find(NhanVien.class).where(QNhanVien.nhanVien.trangThai.ne(core().TT_DA_XOA));
	}
	
	public void setModelThuTien(List<ThuTien> modelThuTien) {
		this.modelThuTien = modelThuTien;
	}
	@Transient
	public List<ThuTien> getModelThuTien() {
		return modelThuTien;
	}
}
