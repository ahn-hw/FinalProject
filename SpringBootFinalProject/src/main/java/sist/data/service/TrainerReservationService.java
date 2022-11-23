package sist.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.data.dto.ReservationDto;
import sist.data.mapper.TrainerReservationMapperInter;

@Service
public class TrainerReservationService implements TrainerReservationServiceInter {

	@Autowired
	TrainerReservationMapperInter mapperInter;

	@Override
	public void insertReservation(ReservationDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertReservation(dto);
	}

	@Override
	public ReservationDto getData(String res_num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(res_num);
	}

	@Override
	public void deleteReservation(String res_num) {
		// TODO Auto-generated method stub
		mapperInter.deleteReservation(res_num);
	}

	@Override
	public void updateReservation(ReservationDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateReservation(dto);
	}
}
