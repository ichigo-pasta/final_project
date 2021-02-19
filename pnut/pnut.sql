-- 테이블 삭제
DROP table pn_member CASCADE CONSTRAINTS;
-- 회원 테이블 생성
create table pn_member (
	m_id		varchar2(20)	primary key,	-- 회원 ID
	m_pw		varchar2(20)	not null,	-- 회원 비밀번호
	m_name		varchar2(20)	not null,	-- 회원 이름
	m_email		varchar2(20)	not null,	-- 회원 이메일
	m_tel		varchar2(20)	not null,	-- 회원 전화번호
	m_regdate	date			not null,	-- 가입일
	m_del		char(1)			not null,	-- 탈퇴여부
	m_profile   varchar2(80),	-- 사진 파일명 uuid로 길게 생성, 파일명만 데이터베이스에 넣기
	m_bg 		varchar2(80)    -- 배경사진 파일명
);

select * from pn_member;
select * from pn_member where m_id='k2';


insert into pn_member values ('k1', '1','탁','k1@k.com','010-1111-1111',sysdate,'n',null,null); 
