package org.mp.service;


import java.util.List;



import org.mp.domain.Criteria;
import org.mp.domain.RestVO;


public interface RestService {

	public List<RestVO> listRest();
	public RestVO detailRest(Long restId);
	public List<RestVO> listRestPaging(Criteria cri);
	
}
