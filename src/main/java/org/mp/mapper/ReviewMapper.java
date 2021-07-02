package org.mp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mp.domain.Criteria;
import org.mp.domain.ReviewVO;

public interface ReviewMapper {

	public int insert(ReviewVO vo);
	
	public ReviewVO read(Long restId);
	
	public int delete(Long reno);
	
	public int update(ReviewVO review);
	
	public List<ReviewVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("reno") Long reno);
			
	
	
}
