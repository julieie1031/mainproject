package org.mp.mapper;

import org.apache.ibatis.annotations.Param;

public interface AdAuthMapper {
	
	public int memUpdate(@Param("userId") String userId,@Param("authority") String authority);

}
