package com.kh.md.messenger.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MsgNoteVo {

	private String noteNo;
	
	private String msgNo;
	private String sendName;
	
	private String receiveNo;
	private String receiveName;
	
	private String title;
	private String content;
	private String sendDate;
	private String receiveDate;
	private String originName;
	private String fileName;
	private MultipartFile attFile;
	private String checkDelete;
	
	
}//class
