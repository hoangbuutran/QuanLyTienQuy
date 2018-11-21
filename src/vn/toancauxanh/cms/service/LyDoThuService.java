package vn.toancauxanh.cms.service;

import org.apache.commons.collections.MapUtils;
import org.zkoss.util.resource.Labels;

import com.querydsl.jpa.impl.JPAQuery;

import vn.toancauxanh.gg.model.LyDoThu;
import vn.toancauxanh.gg.model.QLyDoThu;
import vn.toancauxanh.service.BasicService;

public class LyDoThuService extends BasicService<LyDoThu> {

	public JPAQuery<LyDoThu> getTargetQuery() {

		String paramTuKhoa = MapUtils.getString(argDeco(), Labels.getLabel("param.tukhoa"), "").trim();

		JPAQuery<LyDoThu> q = find(LyDoThu.class).where(QLyDoThu.lyDoThu.trangThai.ne(core().TT_DA_XOA))
				.where(QLyDoThu.lyDoThu.quy.isTrue());
		if (paramTuKhoa != null && !paramTuKhoa.isEmpty()) {
			String tukhoa = "%" + paramTuKhoa + "%";
			q.where(QLyDoThu.lyDoThu.lyDoContent.like(tukhoa));
		}
		if (getFixTuNgay() != null && getFixDenNgay() == null) {
			q.where(QLyDoThu.lyDoThu.ngayTao.after(getFixTuNgay()));
		} else if (getFixTuNgay() == null && getFixDenNgay() != null) {
			q.where(QLyDoThu.lyDoThu.ngayTao.before(getFixDenNgay()));
		} else if (getFixTuNgay() != null && getFixDenNgay() != null) {
			q.where(QLyDoThu.lyDoThu.ngayTao.between(getFixTuNgay(), getFixDenNgay()));
		}
		
		String paramTrangThaiThuTien = MapUtils.getString(argDeco(), Labels.getLabel("param.trangthaithutien"), "");
		
		/*if (argDeco().get(Labels.getLabel("param.trangthaithutien")) != null && !paramTrangThaiThuTien.isEmpty()) {
			
			boolean trangThaiThuTien = MapUtils.getBooleanValue(argDeco(), Labels.getLabel("param.trangthaithutien"));
			if (trangThaiThuTien) {
				
				System.out.println("true:" + trangThaiThuTien);
				q.where(QLyDoThu.lyDoThu.complete.isTrue());
			} else if(!trangThaiThuTien){
				
				System.out.println("false:" + trangThaiThuTien);
				q.where(QLyDoThu.lyDoThu.complete.isFalse());
			}
		}*/
		System.out.println("hihi: "+paramTrangThaiThuTien);
		if ("true".equals(paramTrangThaiThuTien)) {
			System.out.println("hihi2");
			q.where(QLyDoThu.lyDoThu.complete.isTrue());
		}
		if ("false".equals(paramTrangThaiThuTien)) {
			System.out.println("hihi3");
			q.where(QLyDoThu.lyDoThu.complete.isFalse());
		}
		q.orderBy(QLyDoThu.lyDoThu.ngaySua.desc());
		return q;
	}

	public JPAQuery<LyDoThu> getTargetQueryThuKhac() {

		long tacGia = MapUtils.getLongValue(argDeco(), Labels.getLabel("param.tacgia"));
		String paramTuKhoa = MapUtils.getString(argDeco(), Labels.getLabel("param.tukhoa"), "").trim();

		JPAQuery<LyDoThu> q = find(LyDoThu.class).where(QLyDoThu.lyDoThu.trangThai.ne(core().TT_DA_XOA))
				.where(QLyDoThu.lyDoThu.quy.isFalse());
		if (paramTuKhoa != null && !paramTuKhoa.isEmpty()) {
			String tukhoa = "%" + paramTuKhoa + "%";
			q.where(QLyDoThu.lyDoThu.lyDoContent.like(tukhoa));
		}
		if (getFixTuNgay() != null && getFixDenNgay() == null) {
			q.where(QLyDoThu.lyDoThu.ngayTao.after(getFixTuNgay()));
		} else if (getFixTuNgay() == null && getFixDenNgay() != null) {
			q.where(QLyDoThu.lyDoThu.ngayTao.before(getFixDenNgay()));
		} else if (getFixTuNgay() != null && getFixDenNgay() != null) {
			q.where(QLyDoThu.lyDoThu.ngayTao.between(getFixTuNgay(), getFixDenNgay()));
		}
		if (tacGia > 0) {
			q.where(QLyDoThu.lyDoThu.nguoiTao.id.eq(tacGia));
		}
		q.orderBy(QLyDoThu.lyDoThu.ngaySua.desc());
		return q;
	}

}