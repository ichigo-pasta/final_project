package com.ch.pnut.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {
	private int notice_no;
	private String active;
	private String passive;
	private String n_type;
	private int peanut_no;
	private int reply_no;
	private Date regdate;
	private String read;
	
	private String n_content;
	private String active_nn;
	private String active_pf;
}
