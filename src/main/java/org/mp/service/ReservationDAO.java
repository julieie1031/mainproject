package org.mp.service;

import java.util.List;

import org.mp.domain.ReservationVO;

public interface ReservationDAO {

	
	public void roomInsert(ReservationVO reser) throws Exception;
	public List<ReservationVO> roomList() throws Exception;
	
	
}
