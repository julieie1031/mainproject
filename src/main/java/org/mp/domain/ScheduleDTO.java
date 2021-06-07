package org.mp.domain;

import lombok.Data;

@Data
public class ScheduleDTO {

	private String id;
	private String subject;
	private String startDate;
	private String endDate;
	private String memo;
	
}
