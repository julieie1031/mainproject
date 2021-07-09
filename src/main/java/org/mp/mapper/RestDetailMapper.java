package org.mp.mapper;

import java.util.List;


import org.mp.domain.RestDetailVO;
import org.mp.domain.RestVO;

public interface RestDetailMapper {

	public List<RestDetailVO> listRestDetail(Long restId);
	
	public List<RestDetailVO> roomRestDetail(Long roomId);
	
	public RestVO read(Long restId);
	
}
