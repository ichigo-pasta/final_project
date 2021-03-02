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
	private String m_intro;			// 자기소개
	private Date m_regdate;			// 가입일
	private String m_del; 			// 탈퇴여부
	private String m_profile;		// 프로필 파일명
	private String m_bg;			// 배경화면 파일명
	private String re_nick;			// 리넛 작성자 닉네임
	private String re_pf;			// 리넛 작성자 프로필
	
	private MultipartFile file_p;	// 프로필 화면
	private MultipartFile file_b;	// 배경화면
}