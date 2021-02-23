package com.ch.pnut.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {
	private String m_id;			// 아이디
	private String m_pw;			// 비밀번호
	private String m_name;			// 이름
	private String m_nickname;		// 별명
	private String m_email;			// 이메일
	private String m_tel;			// 전화번호
	private Date m_regdate;			// 가입일
	private String m_del; 			// 탈퇴여부
	private String m_profile;
	private String m_bg;
	
	private MultipartFile file;		// upload용
}