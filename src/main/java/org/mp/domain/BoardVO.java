package org.mp.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String userId;
	private String title;
	private String content;
	private int hit;
	private int good;
	private Date board_Date;
	private Date board_updateDate;
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;
}
