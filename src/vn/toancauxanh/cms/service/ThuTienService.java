package vn.toancauxanh.cms.service;

import com.querydsl.jpa.impl.JPAQuery;

import vn.toancauxanh.gg.model.QThuTien;
import vn.toancauxanh.gg.model.ThuTien;
import vn.toancauxanh.service.BasicService;

public class ThuTienService extends BasicService<ThuTien> {

	public JPAQuery<ThuTien> getTargetQuery() {
		
		JPAQuery<ThuTien> q = find(ThuTien.class)
				.where(QThuTien.thuTien.trangThai.ne(core().TT_DA_XOA))
				.where(QThuTien.thuTien.lyDoThu.quy.isFalse());
		q.orderBy(QThuTien.thuTien.ngaySua.desc());
		return q;
	}

}
