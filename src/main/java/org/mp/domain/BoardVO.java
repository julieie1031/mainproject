package org.mp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String id;
	private String title;
	private String content;
	private int hit;
	private int good;
	private Date board_Date;
}
