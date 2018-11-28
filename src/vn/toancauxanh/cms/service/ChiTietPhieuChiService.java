package vn.toancauxanh.cms.service;

import com.querydsl.jpa.impl.JPAQuery;

import vn.toancauxanh.gg.model.ChiTietPhieuChi;
import vn.toancauxanh.gg.model.QChiTietPhieuChi;
import vn.toancauxanh.service.BasicService;

public class ChiTietPhieuChiService extends BasicService<ChiTietPhieuChi> {
	
	public JPAQuery<ChiTietPhieuChi> queryListChiTietPhieuChi(long id) {
		return find(ChiTietPhieuChi.class)
				.where(QChiTietPhieuChi.chiTietPhieuChi.trangThai.ne(core().TT_DA_XOA))
				.where(QChiTietPhieuChi.chiTietPhieuChi.phieuChi.id.eq(id));
	}
}
