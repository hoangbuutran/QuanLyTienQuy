package vn.toancauxanh.gg.model;

import java.io.IOException;
import java.util.ArrayList;
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

import vn.toancauxanh.model.Model;
import vn.toancauxanh.model.NhanVien;
import vn.toancauxanh.service.BasicService;
import vn.toancauxanh.service.SendEmail;

@Entity
@Table(name = "lydothu")
public class LyDoThu extends Model<LyDoThu> {

	private double soTien;
	private String loaiThu;
	private String complete;
	private String lyDoContent = "";
	
	List<ThuTien> modelThuTien = new ArrayList<ThuTien>();

	public LyDoThu() {
		super();
	}
	public LyDoThu(double soTien, String lyDoContent, String complete) {
		super();
		this.soTien = soTien;
		this.lyDoContent = lyDoContent;
		this.complete = complete;
	}

	// tạo mới lý do thu quỹ
	@Command
	public void saveLyDoThuQuy(@BindingParam("list") final Object listObject, @BindingParam("attr") final String attr, @BindingParam("wdn") final Window wdn) throws IOException {
		if (noId()) { // tạo mới lý do
			saveLyDoThuAndAddThuTienQuy();
		} else { // cập nhật lý do
			save();
		}
		wdn.detach();
		BindUtils.postNotifyChange(null, null, listObject, attr);
	}

	// lưu lý do thu và thêm dữ liệu vào bảng thu tiền ứng với số nhân viên
	public void saveLyDoThuAndAddThuTienQuy() {
		setLoaiThu(core().LOAI_THU_QUY);
		setComplete(core().TT_THU_CHUA_HOAN_THANH);
		save();
		
		List<NhanVien> nhanViens = new ArrayList<>();
		nhanViens.addAll(queryListNhanVien());
		
		for (NhanVien nhanVien : nhanViens) {
			ThuTien thuTien = new ThuTien(this, nhanVien, false);
			thuTien.save();
		}
	}
	
	// tạo mới lý do thu phat sinh 
	@Command
	public void saveLyDoThuPhatSinh(@BindingParam("list") final Object listObject, @BindingParam("attr") final String attr, @BindingParam("wdn") final Window wdn) throws IOException {
		if (noId()) { // tạo mới lý do
			saveLyDoThuAndAddThuTienPhatSinh();
		} else { // cập nhật lý do
			save();
		}
		wdn.detach();
		BindUtils.postNotifyChange(null, null, listObject, attr);
	}

	public void saveLyDoThuAndAddThuTienPhatSinh() {
		setLoaiThu(core().LOAI_THU_PHAT_SINH);
		setComplete(core().TT_THU_CHUA_HOAN_THANH);
		save();
		
		List<NhanVien> nhanViens = new ArrayList<>();
		nhanViens.addAll(queryListNhanVien());
		
		for (NhanVien nhanVien : nhanViens) {
			ThuTien thuTien = new ThuTien(this, nhanVien, false);
			thuTien.save();
		}
	}
	
	// gửi mail thông báo cho toàn bộ nhân viên trong team java biết.
	public void sendEmailNotiForAllStaff(String title, String content) {
		
		List<NhanVien> nhanViens = new ArrayList<>();
		nhanViens.addAll(queryListNhanVien());
		
		for (NhanVien nhanVien : nhanViens) {
			SendEmail.sendEmailGmail(nhanVien.getEmail(), title, content);
		}
	}
	
	// lưu tiền thu khác(khoản thu do nhậu nhẹt dư)
	@Command
	public void saveThuKhac(@BindingParam("list") final Object listObject, @BindingParam("attr") final String attr, @BindingParam("wdn") final Window wdn) throws IOException {

		if (noId()) { // tạo mới 
			saveThuKhacAndAddThuTien();
		} else { // cập nhật 
			save();
		}
		wdn.detach();
		BindUtils.postNotifyChange(null, null, listObject, attr);

	}

	// lưu lý do thu và thêm dữ liệu vào bảng thu tiền
	public void saveThuKhacAndAddThuTien() {
		setLoaiThu(core().LOAI_THU_DU);
		setComplete(core().TT_THU_DA_HOAN_THANH);
		save();
		ThuTien thuTien = new ThuTien(this, getNguoiTao(), true);
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
		// set thuộc tính complete đã hoàn thành hay không.
		if (totalNhanVien == totalDaNop) {
			setComplete(core().TT_THU_DA_HOAN_THANH);
			this.save();
		}else {
			setComplete(core().TT_THU_CHUA_HOAN_THANH);
			this.save();
		}
		wdn.detach();
		BindUtils.postNotifyChange(null, null, listObject, attr);
	}

	// hàm hiển thị danh sách nhân viên trong đợt quỹ đó
	@Command
	public void showListNhanVien(@BindingParam("zul") String zul, @BindingParam("vmArgs") Object vmArgs, @BindingParam("item") LyDoThu lyDoThu) {
		modelThuTien.addAll(getThuTienWithLyDo(lyDoThu.getId()));
		redirectPage(zul, vmArgs, lyDoThu, null);
	}
	
	@Command
	public void sendMailNhacNopQuy(@BindingParam("item") ThuTien thuTien) {
		// kiểm tra tài khoản có email hay không
		if (thuTien.getNguoiNop().getEmail() == null || thuTien.getNguoiNop().getEmail().isEmpty()) {
			showNotification("Nhân viên chưa cập nhật Email !", "", "warning");
			return;
		}
		// gửi mail nhắc nhở nộp tiền
		SendEmail.sendEmailGmail(thuTien.getNguoiNop().getEmail(), "Email notification from Team java", "<h2>Đề nghị "+ thuTien.getNguoiNop().getHoVaTen() +" nộp tiền trong đợt " + thuTien.getLyDoThu().lyDoContent + "</h2>");
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

	public String getLoaiThu() {
		return loaiThu;
	}
	public void setLoaiThu(String loaiThu) {
		this.loaiThu = loaiThu;
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
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}
	
	public List<ThuTien> getThuTienWithLyDo(long id) {
		return core().getThuTiens().getThuTienWithLyDo(id).fetch();
	}

	public List<NhanVien> queryListNhanVien() {
		return core().getNhanViens().getTargetQueryNhanVien().fetch();
	}
	
	public void setModelThuTien(List<ThuTien> modelThuTien) {
		this.modelThuTien = modelThuTien;
	}
	@Transient
	public List<ThuTien> getModelThuTien() {
		return modelThuTien;
	}
	@Transient
	public String getHoanThanhText() {
		return new BasicService<>().getTrangThaiThuTienList().get(getComplete());
	}
}
