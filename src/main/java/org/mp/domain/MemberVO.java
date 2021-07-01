package org.mp.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userId;
	private String userPwd;
	private String userName;
	private String address;
	private String phone;
	private String email;
	private Date registerdate;
	private boolean enabled;
	
	private List<AuthVO> authList;
	
	}

