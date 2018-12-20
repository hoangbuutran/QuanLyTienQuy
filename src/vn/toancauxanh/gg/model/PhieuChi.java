package vn.toancauxanh.gg.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.ValidationContext;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.bind.validator.AbstractValidator;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Window;

import vn.toancauxanh.model.Model;
import vn.toancauxanh.model.NhanVien;
import vn.toancauxanh.service.SendEmail;

@Entity
@Table(name = "phieuchi")
public class PhieuChi extends Model<PhieuChi> {

	private String lyDo;
	private NhanVien nguoiChi;
	private double tongSoTien;
	
	private List<ChiTietPhieuChi> arrayRemoveItem = new ArrayList<ChiTietPhieuChi>();

	@Command
	public void savePhieuChi(@BindingParam("list") final Object listObject, @BindingParam("attr") final String attr, @BindingParam("wdn") final Window wdn) throws IOException {
		save();
		for (ChiTietPhieuChi chiTietPhieuChi : listItemCTPC) {
			chiTietPhieuChi.setPhieuChi(this);
			chiTietPhieuChi.doSave();
		}
		if (arrayRemoveItem.size() > 0) {
			for (ChiTietPhieuChi chiTietPhieuChi : arrayRemoveItem) {
				chiTietPhieuChi.deleteTrangThaiConfirmAndNoNotify(listObject, attr);
			}
		}
		
		wdn.detach();
		BindUtils.postNotifyChange(null, null, listObject, attr);
		BindUtils.postNotifyChange(null, null, listObject, "listItemCTPC");
	}

	// add chitietphieuchi vao datalist khi click nut update
	@Command
	public void editPhieuChi(@BindingParam("zul") String zul, @BindingParam("vmArgs") Object vmArgs, @BindingParam("vm") Object vm){
		
		Map<String, Object> args = new HashMap<>();
		List<ChiTietPhieuChi> chiTietPhieuChis = new ArrayList<>();
		args.put("vm", vm);
		args.put("vmArgs", vmArgs);
		listItemCTPC.clear();
		
		PhieuChi phieuChi = (PhieuChi) vm;
		chiTietPhieuChis.addAll(queryListChiTietPhieuChi(phieuChi.getId()));
		
		for (ChiTietPhieuChi chiTietPhieuChi2 : chiTietPhieuChis) {
			listItemCTPC.add(chiTietPhieuChi2);
		}
		Executions.createComponents(zul, null, args);
	}
	
	@Command
	@NotifyChange({"listItemCTPC","arrayRemoveItem", "tongSoTien"})
	public void removeItemCTPC(@BindingParam("list") final Object listObject, @BindingParam("item") Object item, @BindingParam("attr") final String attr) {
		ChiTietPhieuChi chiTietPhieuChi = (ChiTietPhieuChi) item;
		arrayRemoveItem.add(chiTietPhieuChi);
		listItemCTPC.remove(item);
		changeSoTien(listObject, attr);
		BindUtils.postNotifyChange(null, null, listObject, attr);
		BindUtils.postNotifyChange(null, null, listObject, "tongSoTien");
	}
	
	// thêm mới một item chi tiêu mới
	@Command
	public void addNewItemCTPC(@BindingParam("list") final Object listObject, @BindingParam("attr") final String attr) {
		listItemCTPC.add(new ChiTietPhieuChi("tên khoản chi", 0));
		BindUtils.postNotifyChange(null, null, listObject, attr);
	}
	
	
	// ggia trị tổng tiền tự động cập nhật khi thêm các item chi tiết chi
	@Command
	@NotifyChange("tongSoTien")
	public void changeSoTien(@BindingParam("list") final Object listObject, @BindingParam("attr") final String attr) {
		tongSoTien = 0;
		
		for (ChiTietPhieuChi chiTietPhieuChi : listItemCTPC) {
			tongSoTien += chiTietPhieuChi.getSoTien();
		}
		BindUtils.postNotifyChange(null, null, listObject, attr);
	}
	
	@Transient
	public AbstractValidator getValidatorChiTien() {
		return new AbstractValidator() {
			@Override
			public void validate(final ValidationContext ctx) {
				for (ChiTietPhieuChi chiTietPhieuChi : listItemCTPC) {
					if (chiTietPhieuChi.getTenMuc().equals("tên khoản chi") || chiTietPhieuChi.getSoTien() == 0) {
						addInvalidMessage(ctx, "itemError", "Không được để giá trị mặc định");
						return;
					}
				}
			}
		};
	}

	// gửi mail thông báo cho toàn bộ nhân viên trong team java biết.
	public void sendEmailNotiForAllStaff(String title, String content) {
		
		List<NhanVien> nhanViens = new ArrayList<>(); 
		nhanViens.addAll(queryListNhanVien());
		
		for (NhanVien nhanVien : nhanViens) {
			if (nhanVien.getEmail() != null || !nhanVien.getEmail().isEmpty()) {				
				SendEmail.sendEmailGmail(nhanVien.getEmail(), title, content);
			}
		}
	}

	@SuppressWarnings("serial")
	private List<ChiTietPhieuChi> listItemCTPC = new ArrayList<ChiTietPhieuChi>() {
		{
			add(new ChiTietPhieuChi("tên khoản chi", 0));
		}
	};
	
	public List<NhanVien> queryListNhanVien() {
		return core().getNhanViens().getTargetQueryNhanVien().fetch();
	}
	public List<ChiTietPhieuChi> queryListChiTietPhieuChi(long id) {
		return core().getChiTietPhieuChis().queryListChiTietPhieuChi(id).fetch();
	}
	public double getTongSoTien() {
		return tongSoTien;
	}
	public void setTongSoTien(double tongSoTien) {
		this.tongSoTien = tongSoTien;
	}
	public String getLyDo() {
		return lyDo;
	}
	public void setLyDo(String lyDo) {
		this.lyDo = lyDo;
	}
	@ManyToOne
	public NhanVien getNguoiChi() {
		return nguoiChi;
	}
	public void setNguoiChi(NhanVien nguoiChi) {
		this.nguoiChi = nguoiChi;
	}
	@Transient
	public List<ChiTietPhieuChi> getListItemCTPC() {
		return listItemCTPC;
	}
	public void setListItemCTPC(List<ChiTietPhieuChi> listItemCTPC) {
		this.listItemCTPC = listItemCTPC;
	}
	@Transient
	public List<ChiTietPhieuChi> getArrayRemoveItem() {
		return arrayRemoveItem;
	}
	public void setArrayRemoveItem(List<ChiTietPhieuChi> arrayRemoveItem) {
		this.arrayRemoveItem = arrayRemoveItem;
	}
}
