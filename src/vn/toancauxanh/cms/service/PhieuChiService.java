package vn.toancauxanh.cms.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.MapUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.util.resource.Labels;

import com.querydsl.jpa.impl.JPAQuery;

import vn.toancauxanh.gg.model.PhieuChi;
import vn.toancauxanh.gg.model.QPhieuChi;
import vn.toancauxanh.service.BasicService;
import vn.toancauxanh.service.ExcelUtil;

public class PhieuChiService extends BasicService<PhieuChi> {
	public JPAQuery<PhieuChi> getTargetQuery() {
		
		long nhanVien = MapUtils.getLongValue(argDeco(), Labels.getLabel("param.nhanvien"));
		String paramTuKhoa = MapUtils.getString(argDeco(), Labels.getLabel("param.tukhoa"), "").trim();
		
		JPAQuery<PhieuChi> q = find(PhieuChi.class).where(QPhieuChi.phieuChi.trangThai.ne(core().TT_DA_XOA));
		
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
	
	@Command
	public void exportExcel() {
		try {
			
			List<Object[]> list = new ArrayList<Object[]>();
			
		    List<PhieuChi> phieuChis = find(PhieuChi.class).where(QPhieuChi.phieuChi.trangThai.ne(core().TT_DA_XOA)).fetch();
		    
		    int i = 1;
		    double tongTienChi = 0;
		    
		    for (PhieuChi phieuChi : phieuChis) {
		    	list.add(new Object[]{ i, phieuChi.getNguoiChi().getHoVaTen(), phieuChi.getLyDo(), phieuChi.getNgayTao(), phieuChi.getTongSoTien()});
		    	tongTienChi += phieuChi.getTongSoTien();
		    	i++;
			}
		    
		    list.add(new Object[]{ "", "", "", "", tongTienChi});
			ExcelUtil.exportPhieuChi("Danh sách phiếu chi", "Danh sách phiếu chi" + new Date(), "phiếu chi", list);
			
		} catch (IOException e) {
			System.out.println("Error: "+ e.getMessage());
			e.printStackTrace();
		}
	}
}
