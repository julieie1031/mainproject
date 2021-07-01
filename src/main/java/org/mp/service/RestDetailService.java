package org.mp.service;

import java.util.List;

import org.mp.domain.RestDetailVO;

public interface RestDetailService {

	public List<RestDetailVO> listRestDetail(Long restId);
	
}
