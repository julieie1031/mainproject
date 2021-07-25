package org.mp.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class TipVO {
	private String userId;
	private Long tno;
	private String tipContent;
	private String tipTitle;
	private Date tipDate;
	private Date tipUpdateDate;
	private List<TipAttachVO> attachList;
}
