package vn.toancauxanh.cms.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.MapUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.util.resource.Labels;

import com.querydsl.jpa.impl.JPAQuery;

import vn.toancauxanh.gg.model.LyDoThu;
import vn.toancauxanh.gg.model.PhieuChi;
import vn.toancauxanh.gg.model.QLyDoThu;
import vn.toancauxanh.gg.model.QPhieuChi;
import vn.toancauxanh.service.BasicService;
import vn.toancauxanh.service.ExcelUtil;

public class LyDoThuService extends BasicService<LyDoThu> {

	public JPAQuery<LyDoThu> getTargetQuery() {

		String paramTuKhoa = MapUtils.getString(argDeco(), Labels.getLabel("param.tukhoa"), "").trim();
		String paramTrangThaiThuTien = MapUtils.getString(argDeco(), Labels.getLabel("param.trangthaithutien"), "");

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
		
		if ("da_hoan_thanh".equals(paramTrangThaiThuTien)) {
			q.where(QLyDoThu.lyDoThu.complete.eq(core().TT_THU_DA_HOAN_THANH));
		}
		
		if ("chua_hoan_thanh".equals(paramTrangThaiThuTien)) {
			q.where(QLyDoThu.lyDoThu.complete.eq(core().TT_THU_CHUA_HOAN_THANH));
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

	@Command
	public void exportExcelThuKhac() {
		
		try {
			List<Object[]> list = new ArrayList<Object[]>();
			
		    List<LyDoThu> lyDoThus = find(LyDoThu.class).where(QLyDoThu.lyDoThu.trangThai.ne(core().TT_DA_XOA))
					.where(QLyDoThu.lyDoThu.quy.isFalse()).fetch();
		    
		    int i = 1;
		    double tongTienThu = 0;
		    
		    for (LyDoThu lyDoThu : lyDoThus) {
		    	list.add(new Object[]{ i, lyDoThu.getLyDoContent(), lyDoThu.getNgayTao(), lyDoThu.getSoTien()});
		    	tongTienThu += lyDoThu.getSoTien();
		    	i++;
			}
		    
		    list.add(new Object[]{ "", "", "", tongTienThu});
			ExcelUtil.exportThuKhac("Danh sách khoản thu khác", "Danh sách thu khác" + new Date(), "thu khác", list);
			
		} catch (IOException e) {
			System.out.println("Error: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
}
