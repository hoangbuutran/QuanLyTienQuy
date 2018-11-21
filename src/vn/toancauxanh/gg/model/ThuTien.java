package vn.toancauxanh.gg.model;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.zkoss.bind.ValidationContext;
import org.zkoss.bind.validator.AbstractValidator;

import vn.toancauxanh.model.Model;
import vn.toancauxanh.model.NhanVien;

@Entity
@Table(name = "thutien")
public class ThuTien extends Model<ThuTien> {

	private LyDoThu lyDoThu;
	private NhanVien nguoiNop;
	private boolean xacNhan = false;

	
	public ThuTien() {
		super();
	}
	public ThuTien(LyDoThu lyDoThu, NhanVien nguoiNop, boolean xacNhan) {
		super();
		this.lyDoThu = lyDoThu;
		this.nguoiNop = nguoiNop;
		this.xacNhan = xacNhan;
	}
	public boolean isXacNhan() {
		return xacNhan;
	}
	public void setXacNhan(boolean xacNhan) {
		this.xacNhan = xacNhan;
	}
	@ManyToOne
	public LyDoThu getLyDoThu() {
		return lyDoThu;
	}
	public void setLyDoThu(LyDoThu lyDoThu) {
		this.lyDoThu = lyDoThu;
	}
	@ManyToOne
	public NhanVien getNguoiNop() {
		return nguoiNop;
	}
	public void setNguoiNop(NhanVien nguoiNop) {
		this.nguoiNop = nguoiNop;
	}
	
	@Transient
	public AbstractValidator getValidatorThuTien() {
		return new AbstractValidator() {
			@Override
			public void validate(final ValidationContext ctx) {
				
			}
		};
	}
}
