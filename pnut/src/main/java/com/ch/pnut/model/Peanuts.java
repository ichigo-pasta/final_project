package com.ch.pnut.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Peanuts {
	private int peanut_no;		// 게시글 번호(pk)
	private String writer;		// 게시글 작성자(fk)
	private String content;		// 게시글 내용
	private String ip;			// IP
	private int renut;			// 리넛(을 누르면 팔로워들한테 게시글 전송)
	private String picture1;	// 사진 1
	private String picture2;	// 사진 2
	private String picture3;	// 사진 3
	private String picture4;	// 사진 4
	private Date regdate;		// 작성일
	private String del;			// 삭제여부 
}
