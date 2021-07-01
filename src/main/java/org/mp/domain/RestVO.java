package org.mp.domain;

import lombok.Data;

@Data // getter setter tostring 대신 사용가능한 어노테이션
public class RestVO {

	private	Long restId;
	private String restName;
	private String restAddress;
	private String restPhone;
	private String restContent;
	private String restImage;
	
}

