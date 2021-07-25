package org.mp.domain;

import lombok.Data;

@Data
public class TipAttachVO {
	private String fileName;
	private String uuid;
	private String uploadPath;
	private Long tno;
	private boolean fileType;
}
