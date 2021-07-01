package org.mp.mapper;

import java.util.List;

import org.mp.domain.RestDetailVO;

public interface RestDetailMapper {

	public List<RestDetailVO> listRestDetail(Long restId);
	
}
