package org.mp.service;

import java.util.List;

import org.mp.domain.ReservationVO;
import org.mp.domain.RestDetailVO;

public interface ReservationService {

	public void regist(ReservationVO reser) throws Exception;
	public List<ReservationVO> roomList() throws Exception;
	

}
