package com.ch.pnut.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Replies {
	private int reply_no;
	private int peanut_no;
	private String rep_target;
	private String writer;
	private String content; 
	private Date regdate;
	private String ip;
	private int ref;
	private int ref_level;
	private String del;
	// 조인용
	private Member member;
	


}

