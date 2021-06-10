package org.mp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rno;
	private Long bno;
	private String userId;
	private String reply_content;
	private Date reply_date;
	private Date reply_updateDate;

	
}
