package org.mp.service;

import java.util.List;

import org.mp.domain.RestVO;

public interface RestDAO {

	public List<RestVO> listRest();
	public RestVO detailRest(String restId);
	public void updateRest(RestVO vo);
	public void deleteRest(int restId);
	
}
