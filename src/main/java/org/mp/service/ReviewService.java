package org.mp.service;

import java.util.List;

import org.mp.domain.Criteria;
import org.mp.domain.ReviewVO;

public interface ReviewService {

	public int register(ReviewVO vo);
	public ReviewVO get(Long reno);
	public int modify(ReviewVO vo);
	public int remove(Long reno);
	
	public List<ReviewVO> getList(Criteria cri,Long restId);
}
