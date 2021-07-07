package org.mp.service;

import java.util.List;

import javax.inject.Inject;

import org.mp.domain.ReservationVO;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReservationServiceImpl implements ReservationService {

	@Inject
	private ReservationDAO dao;	

	@Override
	public void regist(ReservationVO reser) throws Exception {
		dao.roomInsert(reser);
	}

	@Override
	public List<ReservationVO> roomList() throws Exception {
	
		return dao.roomList();
	}

}
