package org.mp.domain;

import lombok.Data;

@Data
public class RestDetailVO {

	private Long roomId;
	private String roomName;
	private String roomPeople;
	private String roomDescription;
	private int roomPrice;
	private String roomImage;
	private Long restId;
}
