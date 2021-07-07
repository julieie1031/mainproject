package org.mp.service;

import java.util.List;

import org.mp.domain.RestDetailVO;
import org.mp.mapper.RestDetailMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class RestDetailServiceImpl implements RestDetailService {

	private RestDetailMapper mapper;
	
	@Override
	public List<RestDetailVO> listRestDetail(Long restId) {
		
		return mapper.listRestDetail(restId);
	}

	@Override
	public List<RestDetailVO> roomRestDetail(Long roomId) {

		return mapper.roomRestDetail(roomId);
	}

}
