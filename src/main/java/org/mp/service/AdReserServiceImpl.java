package org.mp.service;

import java.util.List;

import org.mp.domain.ReservationVO;
import org.mp.mapper.AdReserMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class AdReserServiceImpl implements AdReserService {
	
	@Setter
	private AdReserMapper mapper;

	@Override
	public List<ReservationVO> adReserList() {
		// TODO Auto-generated method stub
		return mapper.adReserList();
	}

	
}
