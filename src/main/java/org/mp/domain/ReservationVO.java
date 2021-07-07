package org.mp.domain;

import lombok.Data;

@Data
public class ReservationVO {

	private Long reserId;
	private String roomName;
	private String roomPeople;
	private int roomPrice;
	private int restPhone;
	private String dogType;
	private int dogNumber;
	private String restName;
	private String startDate;
	private String endDate;
	private Long restId;
	
}
