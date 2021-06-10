package org.mp.domain;

import lombok.Data;

@Data // getter setter tostring 대신 사용가능한 어노테이션
public class RestVO {

	private	String restId;
	private String restName;
	private String restAddress;
	private String restNumber;
	private String restPrice;
	private String restPhone;
	private String restContent;
	private String restImage;
	
}

