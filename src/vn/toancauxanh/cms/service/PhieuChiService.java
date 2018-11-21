package vn.toancauxanh.cms.service;

import org.apache.commons.collections.MapUtils;
import org.zkoss.util.resource.Labels;

import com.querydsl.jpa.impl.JPAQuery;

import vn.toancauxanh.gg.model.PhieuChi;
import vn.toancauxanh.gg.model.QPhieuChi;
import vn.toancauxanh.service.BasicService;

public class PhieuChiService extends BasicService<PhieuChi> {
	public JPAQuery<PhieuChi> getTargetQuery() {
		long nhanVien = MapUtils.getLongValue(argDeco(), Labels.getLabel("param.nhanvien"));
		
		String paramTuKhoa = MapUtils.getString(argDeco(), Labels.getLabel("param.tukhoa"), "").trim();
		
		JPAQuery<PhieuChi> q = find(PhieuChi.class)
				.where(QPhieuChi.phieuChi.trangThai.ne(core().TT_DA_XOA));
		if (paramTuKhoa != null && !paramTuKhoa.isEmpty()) {
			String tukhoa = "%" + paramTuKhoa + "%";
			q.where(QPhieuChi.phieuChi.lyDo.like(tukhoa));
		}
		if (getFixTuNgay() != null && getFixDenNgay() == null) {
			q.where(QPhieuChi.phieuChi.ngayTao.after(getFixTuNgay()));
		} else if (getFixTuNgay() == null && getFixDenNgay() != null) {
			q.where(QPhieuChi.phieuChi.ngayTao.before(getFixDenNgay()));
		} else if (getFixTuNgay() != null && getFixDenNgay() != null) {
			q.where(QPhieuChi.phieuChi.ngayTao.between(getFixTuNgay(), getFixDenNgay()));
		}
		if (nhanVien > 0) {
			q.where(QPhieuChi.phieuChi.nguoiChi.id.eq(nhanVien));
		}
		q.orderBy(QPhieuChi.phieuChi.ngaySua.desc());
		return q;
	}
}
