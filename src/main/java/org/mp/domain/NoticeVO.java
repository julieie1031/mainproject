package org.mp.domain;

import java.util.Date;


import lombok.Data;

@Data
public class NoticeVO {
private Long nno;
private String userId;
private String noticeTitle;	
private String noticeContent;
private Date noticeDate;
private Date noticeUpdateDate;
}
