package com.kh.md.member.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVo {
	private String no;
	private String name;
	private String email;
	private String pwd;
	private String pwd2;
	private String privateEmail;
	private String grade;
	private String address;
	private String address2;
	private String phone;
	private String profileName;
	private MultipartFile profile;
	private String deptNo;
	private String positionNo;
	private String bankNo;
	private String account;
	private String enrollDate;
	private String updateDate;
	private String startDate;
	private String quitDate;
	private String quitYn;
	
	private String deptName;
	private String positionName;
	private String rankName;
}
