package org.mp.domain;

import lombok.Data;

@Data // getter setter tostring 대신 사용가능한 어노테이션
public class ScheduleDTO {

	private String id;
	private String subject;
	private String startDate;
	private String endDate;
	private String memo;
	
}
