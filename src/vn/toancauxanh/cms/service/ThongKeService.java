package vn.toancauxanh.cms.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.zkoss.util.resource.Labels;

import vn.toancauxanh.gg.model.LyDoThu;
import vn.toancauxanh.gg.model.PhieuChi;
import vn.toancauxanh.gg.model.QPhieuChi;
import vn.toancauxanh.gg.model.QThuTien;
import vn.toancauxanh.gg.model.ThuTien;
import vn.toancauxanh.service.BasicService;

public class ThongKeService extends BasicService<LyDoThu> {

	@SuppressWarnings("deprecation")
	public double getToTalThu() {

		String thang = MapUtils.getString(argDeco(), Labels.getLabel("param.thang"), "");
		String nam = MapUtils.getString(argDeco(), Labels.getLabel("param.nam"), "");

		double toTalThu = 0;
		List<ThuTien> thuTiens = find(ThuTien.class).where(QThuTien.thuTien.trangThai.ne(core().TT_DA_XOA))
				.where(QThuTien.thuTien.xacNhan.isTrue()).fetch();
		if (thang.isEmpty() && nam.isEmpty()) {
			for (ThuTien thuTien : thuTiens) {
				toTalThu += thuTien.getLyDoThu().getSoTien();
			}
			return toTalThu;
		}
		
		if (!thang.isEmpty() && nam.isEmpty()) {
			for (ThuTien thuTien : thuTiens) {
				toTalThu += thuTien.getLyDoThu().getSoTien();
			}
			showNotification("năm chưa được chọn !", "", "warning");
			return toTalThu;
		}
		
		if (!thang.isEmpty() && !nam.isEmpty()) {
			for (ThuTien thuTien : thuTiens) {
				if (thuTien.getLyDoThu().getLyDoContent().contains("\"")) {
					String test = thuTien.getLyDoThu().getLyDoContent();
					String[] output = test.split("\"");
					if (output[1].equals(thang) && output[3].equals(nam)) {
						toTalThu += thuTien.getLyDoThu().getSoTien();
					}
					
				} else if (1+thuTien.getNgayTao().getMonth() == Integer.parseInt(thang) && 1900 + thuTien.getNgayTao().getYear() == Integer.parseInt(nam)) {
					toTalThu += thuTien.getLyDoThu().getSoTien();
				}
			}
		}
		
		if (thang.isEmpty() && !nam.isEmpty()) {
			for (ThuTien thuTien : thuTiens) {
				if (thuTien.getLyDoThu().getLyDoContent().contains("\"")) {
					String test = thuTien.getLyDoThu().getLyDoContent();
					String[] output = test.split("\"");
					if (output[3].equals(nam)) {
						toTalThu += thuTien.getLyDoThu().getSoTien();
					}
				}else if (1900 + thuTien.getNgayTao().getYear() == Integer.parseInt(nam)) {
					toTalThu += thuTien.getLyDoThu().getSoTien();
				}
			}
		}
		
		return toTalThu;
	}

	@SuppressWarnings("deprecation")
	public double getToTalChi() {

		String thang = MapUtils.getString(argDeco(), Labels.getLabel("param.thang"), "");
		String nam = MapUtils.getString(argDeco(), Labels.getLabel("param.nam"), "");
		
		double toTalChi = 0;
		List<PhieuChi> phieuChis = find(PhieuChi.class).where(QPhieuChi.phieuChi.trangThai.ne(core().TT_DA_XOA))
				.fetch();
		
		if (thang.isEmpty() && nam.isEmpty()) {
			for (PhieuChi phieuChi : phieuChis) {
				toTalChi += phieuChi.getTongSoTien();
			}
			return toTalChi;
		}
		
		if (!thang.isEmpty() && nam.isEmpty()) {
			for (PhieuChi phieuChi : phieuChis) {
				toTalChi += phieuChi.getTongSoTien();
			}
			showNotification("năm chưa được chọn !", "", "warning");
			return toTalChi;
		}
		
		if (!thang.isEmpty() && !nam.isEmpty()) {
			for (PhieuChi phieuChi : phieuChis) {
				if (1+phieuChi.getNgayTao().getMonth() == Integer.parseInt(thang) && 1900 + phieuChi.getNgayTao().getYear() == Integer.parseInt(nam)) {
					toTalChi += phieuChi.getTongSoTien();
				}
			}
		}
		
		if (thang.isEmpty() && !nam.isEmpty()) {
			for (PhieuChi phieuChi : phieuChis) {
				if (1900 + phieuChi.getNgayTao().getYear() == Integer.parseInt(nam)) {
					toTalChi += phieuChi.getTongSoTien();
				}
			}
		}

		return toTalChi;
	}

	public double getSoDu() {
		return getToTalThu() - getToTalChi();
	}

	public Map<Integer, String> getListThang() {
		HashMap<Integer, String> result = new HashMap<>();
		result.put(null, "      ");
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
		result.put(null, "      ");
		int yearNow = Calendar.getInstance().get(Calendar.YEAR);
		for (int i = 0; i <= 10; i++) {
			result.put(yearNow + i, "Năm " + (yearNow + i));
		}
		return result;
	}
}
