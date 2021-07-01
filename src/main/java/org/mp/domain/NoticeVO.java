package org.mp.domain;

import java.util.Date;


import lombok.Data;

@Data
public class NoticeVO {
private Long nno;
private String userId;
private String ntitle;	
private String ncontent;
private Date ndate;
private Date nupdateDate;
}
