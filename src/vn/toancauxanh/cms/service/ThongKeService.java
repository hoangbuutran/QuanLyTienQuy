package vn.toancauxanh.cms.service;

import java.util.List;

import vn.toancauxanh.gg.model.LyDoThu;
import vn.toancauxanh.gg.model.PhieuChi;
import vn.toancauxanh.gg.model.QPhieuChi;
import vn.toancauxanh.gg.model.QThuTien;
import vn.toancauxanh.gg.model.ThuTien;
import vn.toancauxanh.service.BasicService;

public class ThongKeService extends BasicService<LyDoThu> {

	public double getToTalThu() {
		double toTalThu = 0;
		List<ThuTien> thuTiens = find(ThuTien.class).where(QThuTien.thuTien.trangThai.ne(core().TT_DA_XOA))
				.where(QThuTien.thuTien.xacNhan.isTrue()).fetch();
		for (ThuTien thuTien : thuTiens) {
			toTalThu += thuTien.getLyDoThu().getSoTien();
		}
		return toTalThu;
	}

	public double getToTalChi() {

		double toTalChi = 0;
		List<PhieuChi> phieuChis = find(PhieuChi.class).where(QPhieuChi.phieuChi.trangThai.ne(core().TT_DA_XOA)).fetch();
		for (PhieuChi phieuChi : phieuChis) {
			toTalChi += phieuChi.getTongSoTien();
		}
		return toTalChi;
	}

	public double getSoDu() {
		return getToTalThu() - getToTalChi();
	}
}
