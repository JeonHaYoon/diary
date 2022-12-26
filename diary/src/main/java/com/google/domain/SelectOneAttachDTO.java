package com.google.domain;

import lombok.Data;

@Data
public class SelectOneAttachDTO {

	private String fileName; //파일명
	private String uploadPath; //업로드경로
	private String uuid;  //UUID
	private boolean filetype; //이미지파일인지 확인
	private boolean image;
	private Long select_pk;
	
}
