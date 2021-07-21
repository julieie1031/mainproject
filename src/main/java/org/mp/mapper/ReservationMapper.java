package org.mp.mapper;

import java.util.List;


import org.mp.domain.ReservationVO;

public interface ReservationMapper {

	public List<ReservationVO> roomList();
	public void roomInsert(ReservationVO reser);
	public List<ReservationVO> reservationList(String userId);
	
}
