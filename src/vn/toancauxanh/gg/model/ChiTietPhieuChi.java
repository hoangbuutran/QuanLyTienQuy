package vn.toancauxanh.gg.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.zul.Window;

import vn.toancauxanh.model.Model;

@Entity
@Table(name = "chitietphieuchi")
public class ChiTietPhieuChi extends Model<ChiTietPhieuChi>{
	
	private String tenMuc;
	private double soTien;
	private PhieuChi phieuChi;

	public ChiTietPhieuChi() {
		super();
	}
	public ChiTietPhieuChi(String tenMuc, double soTien) {
		super();
		this.tenMuc = tenMuc;
		this.soTien = soTien;
	}
	public String getTenMuc() {
		return tenMuc;
	}
	public void setTenMuc(String tenMuc) {
		this.tenMuc = tenMuc;
	}
	public double getSoTien() {
		return soTien;
	}
	public void setSoTien(double soTien) {
		this.soTien = soTien;
	}
	@ManyToOne
	public PhieuChi getPhieuChi() {
		return phieuChi;
	}
	public void setPhieuChi(PhieuChi phieuChi) {
		this.phieuChi = phieuChi;
	}

	public void addChiTietPhieuChi(@BindingParam("list") final Object listObject, @BindingParam("attr") final String attr, @BindingParam("wdn") final Window wdn) throws IOException {
		BindUtils.postNotifyChange(null, null, listObject, attr);
	}
}
