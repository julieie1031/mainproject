package org.mp.service;

import java.util.List;

import org.mp.domain.RestVO;

public interface AdRestService {
	
	public List<RestVO> adRestList();
	public int restDelete(String restId);
	public int restInsert(RestVO vo);
}
