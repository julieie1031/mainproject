package org.mp.mapper;

import java.util.List;

import org.mp.domain.Criteria;
import org.mp.domain.RestVO;

public interface RestMapper {

	public List<RestVO> listRest();
	public List<RestVO> listRestPaging(Criteria cri);
	public RestVO detailRest(Long restId);
}
