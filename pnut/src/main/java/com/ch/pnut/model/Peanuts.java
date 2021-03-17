package com.ch.pnut.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Peanuts {
	private int peanut_no;		// 게시글 번호(pk)
	private String writer;		// 게시글 작성자(fk)
	private String content;		// 게시글 내용
	private String ip;			// IP
	private Integer renut;		// 리넛(을 누르면 팔로워들한테 게시글 전송)
	private String picture1;	// 사진 1 파일명
	private String picture2;	// 사진 2 파일명
	private String picture3;	// 사진 3 파일명
	private String picture4;	// 사진 4 파일명
	private Date regdate;		// 작성일
	private String del;			// 삭제여부
	
	// 파일 업로드
	private MultipartFile file1;	// 사진 1
	private MultipartFile file2;	// 사진 2
	private MultipartFile file3;	// 사진 3
	private MultipartFile file4;	// 사진 4
	
	//Join용
	private Member member;			// 회원 정보
	private String re_writer;		// 리넛 작성자
	
	private boolean bookmarked;		// 내가 북마크한 피넛인가?
	private boolean renuted;		// 내가 리넛한 피넛인가?
	
	// 피넛 하단 아이콘 카운터
	private Integer repCnt;			// 리플 개수
	private Integer renutCnt;		// 리넛 개수
	private Integer bmCnt;			// 북마크 개수
	
	private boolean followPn;		// 내가 팔로우 한 사람의 피넛인가? 
	private boolean blockMe;		// 나를 차단하거나 내가 차단한 사람의 피넛인가?
}
