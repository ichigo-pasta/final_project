-- 테이블 삭제
DROP table pn_member CASCADE CONSTRAINTS;
DROP table pn_master CASCADE CONSTRAINTS;
DROP table pn_peanuts CASCADE CONSTRAINTS;
DROP table pn_replies CASCADE CONSTRAINTS;
DROP table pn_follow CASCADE CONSTRAINTS;
DROP table pn_block CASCADE CONSTRAINTS;
DROP table pn_bookmark CASCADE CONSTRAINTS;
DROP table pn_notice CASCADE CONSTRAINTS;
DROP table pn_message CASCADE CONSTRAINTS;

-- 회원 테이블 생성
create table pn_member (
	m_id		varchar2(20)	primary key,	-- 회원 ID(pk)
	m_pw		varchar2(20)	not null,		-- 회원 비밀번호
	m_name		varchar2(20)	not null,		-- 회원 이름
	m_nickname	varchar2(20)	not null,		-- 회원 별명
	m_email		varchar2(40)	not null,		-- 회원 이메일
	m_tel		varchar2(20)	not null,		-- 회원 전화번호
	m_intro		varchar2(600),					-- 자기소개
	m_regdate	date			not null,		-- 가입일
	m_del		char(1)			not null,		-- 탈퇴여부
	m_profile   varchar2(200),					-- 사진 파일명 uuid로 길게 생성, 파일명만 데이터베이스에 넣기
	m_bg 		varchar2(200)    				-- 배경사진 파일명
);

-- 관리자 테이블 생성
create table pn_master (
	mas_id	varchar2(20)	primary key,		-- 관리자 ID(pk)	
	mas_pw	varchar2(20)	not null			-- 관리자 비밀번호
);

-- 게시글 테이블 생성
create table pn_peanuts (
	peanut_no	number			primary key,	-- 게시글 번호(pk)
	writer		varchar2(20)	not null,		-- 게시글 작성자(fk)
	content		varchar2(600)	not null,		-- 게시글 내용
	ip			varchar2(40)	null,			-- IP
	renut		number			null,			-- 리넛(을 누르면 팔로워들한테 게시글 전송)
	picture1	varchar2(200)	null,			-- 사진 1
	picture2	varchar2(200)	null,			-- 사진 2
	picture3	varchar2(200)	null,			-- 사진 3
	picture4	varchar2(200)	null,			-- 사진 4
	regdate		date			not null,		-- 작성일
	del			char(1)			not null,		-- 삭제여부
	foreign key (writer) references pn_member(m_id)
);

-- 댓글 테이블 생성
create table pn_replies (
	reply_no	number			primary key,	-- 댓글 번호(pk)
	peanut_no 	number 			not null,		-- 게시글 번호(fk)
	writer		varchar2(20)	not null,		-- 댓글 작성자
	content		varchar2(600)	not null,		-- 댓글 내용
	regdate		date			not null,		-- 작성일
	ip			varchar2(40)	null,			-- IP
	ref			number			not null,		-- 참조번호
	ref_level	number			not null,		-- 참조레벨
	del			char(1)			not null,		-- 삭제여부
	foreign key (peanut_no) references pn_peanuts(peanut_no)
);

-- 팔로우 테이블 생성
create table pn_follow (
	active 	varchar2(20),						-- 내가 팔로우 한 사람
	passive varchar2(20),						-- 나를 팔로우 한 사람
	primary key (active, passive),
	foreign key (active) references pn_member(m_id),
	foreign key (passive) references pn_member(m_id)
);

-- 차단 테이블 생성
create table pn_block (
	active 	varchar2(20),						-- 내가 차단 한 사람
	passive varchar2(20),						-- 나를 차단 한 사람
	primary key (active, passive),
	foreign key (active) references pn_member(m_id),
	foreign key (passive) references pn_member(m_id)
);

-- 북마크 테이블 생성
create table pn_bookmark (
	peanut_no 	number,							-- 게시글 번호
	bm_user 	varchar2(20),					-- 북마크 유저
	primary key (peanut_no, bm_user),
	foreign key (peanut_no) references pn_peanuts(peanut_no),
	foreign key (bm_user) references pn_member(m_id)
);

-- 알림 테이블 생성
create table pn_notice (
	peanut_no 		number,						-- 게시글 번호
	reply_no 		number,						-- 댓글 번호
	notice_user 	varchar2(20),				-- 알림대상
	primary key (peanut_no, reply_no, notice_user),
	foreign key (peanut_no) references pn_peanuts(peanut_no),
	foreign key (reply_no) references pn_replies(reply_no),
	foreign key (notice_user) references pn_member(m_id)
);

-- 쪽지 테이블 생성
create table pn_message (
	message_no	number			primary key,	-- 쪽지 번호(pk)
	sender		varchar2(20)	not null,		-- 보내는 사람(fk)
	receiver	varchar2(20)	not null,		-- 받는 사람(fk)
	content		varchar2(600)	not null,		-- 내용
	ip			varchar2(20)	not null,		-- ip
	reg_date	date			not null,		-- 받은 시간
	checked		char(1)			not null,		-- 확인 여부
	del			char(1)			not null,		-- 삭제 여부
	foreign key (sender) references pn_member(m_id),
	foreign key (receiver) references pn_member(m_id)
);

-- 시퀀스 생성
drop SEQUENCE peanut_no_seq;
create SEQUENCE peanut_no_seq;



select * from pn_member;
select * from pn_member where m_id='k2';
select * from pn_master;
select * from pn_peanuts;
select * from pn_replies;
select * from pn_follow;
select * from pn_block;
select * from pn_bookmark;
select * from pn_notice;
select * from pn_message;

delete PN_FOLLOW; 
insert into pn_follow values ('k1', 'k2');
insert into pn_follow values ('k1', 'k3');
insert into pn_member values ('k1', '1','탁','강','k1@k.com','010-1111-1111',null,sysdate,'n',null,null); 