package org.mp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rno;
	private Long bno;
	private String userId;
	private String replyContent;
	private Date replyDate;
	private Date replyUpdateDate;

	
}
