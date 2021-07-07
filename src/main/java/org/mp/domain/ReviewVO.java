package org.mp.domain;

import java.util.Date;

import lombok.Data;
@Data
public class ReviewVO {
	private Long reno;
	private Long restId;
	private String review;
	private String reviewer;
	private Date reviewDate;
	private Date updateDate;
	private Long star;
}
