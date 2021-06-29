package org.mp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
private Long nno;
private String userId;
private String nTitle;	
private String nContent;
private Date nDate;
private Date nUpdateDate;
}
