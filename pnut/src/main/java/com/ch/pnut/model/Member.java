package com.ch.pnut.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String id;			// 아이디
	private String password;	// 비밀번호
	private String name;		// 이름
	private String email;		// 이메일
	private String tel;			// 전화번호
	private Date regdate;		// 가입일
	private String del; 		// 탈퇴여부
}
