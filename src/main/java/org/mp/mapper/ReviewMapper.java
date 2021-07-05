package org.mp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mp.domain.Criteria;
import org.mp.domain.ReviewVO;

public interface ReviewMapper {

	public int rinsert(ReviewVO vo);
	
	public ReviewVO rread(Long restId);
	
	public int rdelete(Long reno);
	
	public int rupdate(ReviewVO review);
	
	public List<ReviewVO> rgetListWithPaging(
			@Param("cri") Criteria cri,
			@Param("restId") Long restId);
			
	
	
}
