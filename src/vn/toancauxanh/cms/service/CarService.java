package vn.toancauxanh.cms.service;

import org.apache.commons.collections.MapUtils;
import org.zkoss.util.resource.Labels;

import com.querydsl.jpa.impl.JPAQuery;

import vn.toancauxanh.gg.model.Car;
import vn.toancauxanh.gg.model.QCar;
import vn.toancauxanh.service.BasicService;

public class CarService extends BasicService<Car> {

	public JPAQuery<Car> getTargetQuery() {
		String tuKhoa = MapUtils.getString(argDeco(),Labels.getLabel("param.tukhoa"),"").trim();
		String trangThai = MapUtils.getString(argDeco(),Labels.getLabel("param.trangthai"),"");
		
		JPAQuery<Car> q = find(Car.class)
				.where(QCar.car.trangThai.ne(core().TT_DA_XOA));

		if (tuKhoa != null && !tuKhoa.isEmpty()) {
			String tukhoa = "%" + tuKhoa + "%";
			q.where(QCar.car.title.like(tukhoa)
				.or(QCar.car.description.like(tukhoa)));
		}
		if (!trangThai.isEmpty()) {
			q.where(QCar.car.trangThai.eq(trangThai));
		}		
		
		if (getFixTuNgay() != null && getFixDenNgay() == null) {
			q.where(QCar.car.publishBeginTime.after(getFixTuNgay()));
		} else if (getFixTuNgay() == null && getFixDenNgay() != null) {
			q.where(QCar.car.publishBeginTime.before(getFixDenNgay()));
		} else if (getFixTuNgay() != null && getFixDenNgay() != null) {
			q.where(QCar.car.publishBeginTime.between(getFixTuNgay(), getFixDenNgay()));
		}
		
		q.orderBy(QCar.car.ngaySua.desc());
		return q;
	}
	
	public JPAQuery<Car> getTargetQueryDaXoa(){
		JPAQuery<Car> q = this.<Car>query().from(QCar.car);
		q.where(QCar.car.daXoa.isTrue());
		return q;
	}
	
}
