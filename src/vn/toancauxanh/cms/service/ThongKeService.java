package vn.toancauxanh.cms.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.util.resource.Labels;

import com.querydsl.jpa.impl.JPAQuery;

import vn.toancauxanh.gg.model.LyDoThu;
import vn.toancauxanh.gg.model.PhieuChi;
import vn.toancauxanh.gg.model.QPhieuChi;
import vn.toancauxanh.gg.model.QThuTien;
import vn.toancauxanh.gg.model.ThuTien;
import vn.toancauxanh.service.BasicService;
import vn.toancauxanh.service.ExcelUtil;

public class ThongKeService extends BasicService<LyDoThu> {

	public double getToTalThu() {

		String thang = MapUtils.getString(argDeco(), Labels.getLabel("param.thang"), "");
		String nam = MapUtils.getString(argDeco(), Labels.getLabel("param.nam"), "");
		double toTalThu = 0;

		JPAQuery<ThuTien> q = find(ThuTien.class).where(QThuTien.thuTien.trangThai.ne(core().TT_DA_XOA))
				.where(QThuTien.thuTien.xacNhan.isTrue());
		
		if (!thang.isEmpty() && nam.isEmpty()) {
			showNotification("năm chưa được chọn !", "", "warning");
		}
		
		// tháng và năm được chọn
		if (!thang.isEmpty() && !nam.isEmpty()) {
			q.where(QThuTien.thuTien.lyDoThu.ngayTao.month().eq(Integer.parseInt(thang)).and(QThuTien.thuTien.lyDoThu.ngayTao.year().eq(Integer.parseInt(nam))));
		}
		
		// năm được chọn
		if (thang.isEmpty() && !nam.isEmpty()) {
			q.where(QThuTien.thuTien.lyDoThu.ngayTao.year().eq(Integer.parseInt(nam)));
		}
		
		List<ThuTien> thuTiens = q.fetch();
		
		// vòng lặp tính tổng số tình có trong list thuTiens
		for (ThuTien thuTien : thuTiens) {
			toTalThu += thuTien.getLyDoThu().getSoTien();
		}
		return toTalThu;
	}

	public double getToTalChi() {

		String thang = MapUtils.getString(argDeco(), Labels.getLabel("param.thang"), "");
		String nam = MapUtils.getString(argDeco(), Labels.getLabel("param.nam"), "");
		
		double toTalChi = 0;

		JPAQuery<PhieuChi> q = find(PhieuChi.class).where(QPhieuChi.phieuChi.trangThai.ne(core().TT_DA_XOA));
		
		if (!thang.isEmpty() && nam.isEmpty()) {
			showNotification("năm chưa được chọn !", "", "warning");
		}
		
		// tháng được chọn, năm được chọn
		if (!thang.isEmpty() && !nam.isEmpty()) {
			q.where(QPhieuChi.phieuChi.ngayTao.month().eq(Integer.parseInt(thang)).and(QPhieuChi.phieuChi.ngayTao.year().eq(Integer.parseInt(nam))));
		}
		
		// năm được chọn
		if (thang.isEmpty() && !nam.isEmpty()) {
			q.where(QPhieuChi.phieuChi.ngayTao.year().eq(Integer.parseInt(nam)));
		}
		
		List<PhieuChi> phieuChis = q.fetch();
		
		// vòng lặp tính tổng chi có trong list phieuChis
		for (PhieuChi phieuChi : phieuChis) {
			toTalChi += phieuChi.getTongSoTien();
		}
		return toTalChi;
	}

	public double getSoDu() {
		// số dư của tổng thu và tổng chi.
		return getToTalThu() - getToTalChi();
	}

	public Map<Integer, String> getListThang() {
		HashMap<Integer, String> result = new HashMap<>();
		result.put(null, "");
		result.put(1, "Tháng 1");
		result.put(2, "Tháng 2");
		result.put(3, "Tháng 3");
		result.put(4, "Tháng 4");
		result.put(5, "Tháng 5");
		result.put(6, "Tháng 6");
		result.put(7, "Tháng 7");
		result.put(8, "Tháng 8");
		result.put(9, "Tháng 9");
		result.put(10, "Tháng 10");
		result.put(11, "Tháng 11");
		result.put(12, "Tháng 12");
		return result;
	}
	
	public Map<Integer, String> getListNam() {
		HashMap<Integer, String> result = new HashMap<>();
		result.put(null, "");
		int year = 2010;
		int yearCurent = Calendar.getInstance().get(Calendar.YEAR) + 12;
		int subYear = yearCurent - year;
        for (int i = 0; i <= subYear; i++) {
			result.put(yearCurent - i, "Năm " + (yearCurent - i));
		}
		return result;
	}	
	
	@Command
	public void exportExcelThuChi() {
		String nam = MapUtils.getString(argDeco(), Labels.getLabel("param.nam"), "");
		
		if (nam.isEmpty()) {
			// combobox năm chưa được chọn
			showNotification("Năm chưa được chọn để thống kê!", "", "warning");
			return;
			
		} else {
			
			List<Object[]> list = new ArrayList<Object[]>();
			
			try {
				// lấy ra thu thuộc năm muốn thống kê
				List<ThuTien> thuTiens = find(ThuTien.class).where(QThuTien.thuTien.trangThai.ne(core().TT_DA_XOA))
						.where(QThuTien.thuTien.ngayTao.year().eq(Integer.parseInt(nam)))
						.where(QThuTien.thuTien.xacNhan.isTrue())
						.fetch();
				// lấy ra chi thuộc năm muốn thống kê
				List<PhieuChi> phieuChis = find(PhieuChi.class).where(QPhieuChi.phieuChi.trangThai.ne(core().TT_DA_XOA))
						.where(QPhieuChi.phieuChi.ngayTao.year().eq(Integer.parseInt(nam)))
						.fetch();
				
				double toTalNamThu = 0;
				double toTalNamChi = 0;
				
				// lặp 12 tháng của năm
				for (int i = 1; i < 13; i++) {
					
					double toTalThangThu = 0;
					double toTalThangChi = 0;
					// tổng tiền thu trong tháng 
					for (ThuTien thuTien : thuTiens) {
							if (1 + thuTien.getLyDoThu().getNgayTao().getMonth() == i && 1900 + thuTien.getLyDoThu().getNgayTao().getYear() == Integer.parseInt(nam)) {
							toTalThangThu += thuTien.getLyDoThu().getSoTien();
						}
					}
					
					// tổng tiền chi trong tháng
					for (PhieuChi phieuChi : phieuChis) {
						if (1 + phieuChi.getNgayTao().getMonth() == i && 1900 + phieuChi.getNgayTao().getYear() == Integer.parseInt(nam)) {
							toTalThangChi += phieuChi.getTongSoTien();
						}
					}
					// cộng vào tổng của năm
					toTalNamThu += toTalThangThu;
					toTalNamChi += toTalThangChi;
					
					// tạo mới object thống kê
					list.add(new Object[]{ "Tháng: " + i, toTalThangThu, toTalThangChi, toTalThangThu - toTalThangChi});
				}
				
				// kết thúc 12 tháng, thì thêm object thống kê tổng của năm
				list.add(new Object[]{ "Tổng thu chi năm: " + nam, toTalNamThu, toTalNamChi, toTalNamThu - toTalNamChi});

				// gọi hàm export
				ExcelUtil.exportThuChi("Thống kê thu chi năm " + nam, "Thống kê thu chi " + nam, nam, list);
				
			} catch (IOException e) {
				System.out.println("Error: "+ e.getMessage());
				e.printStackTrace();
			}
		}
	}
	
}
