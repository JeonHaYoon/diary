package com.google.domain;

import lombok.Data;

@Data
public class SelectOneAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long select_pk;
	
}
