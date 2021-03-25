-- 테이블 삭제
DROP table pn_member CASCADE CONSTRAINTS;
DROP table pn_peanuts CASCADE CONSTRAINTS;
DROP table pn_replies CASCADE CONSTRAINTS;
DROP table pn_follow CASCADE CONSTRAINTS;
DROP table pn_block CASCADE CONSTRAINTS;
DROP table pn_bookmark CASCADE CONSTRAINTS;
DROP table pn_notice CASCADE CONSTRAINTS;

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
	rep_target	varchar2(20)	,				-- 댓글의 대상 id(fk) 
	writer		varchar2(20)	not null,		-- 댓글 작성자(fk)
	content		varchar2(600)	not null,		-- 댓글 내용
	regdate		date			not null,		-- 작성일
	ip			varchar2(40)	null,			-- IP
	ref			number			not null,		-- 참조번호
	ref_level	number			not null,		-- 참조레벨
	del			char(1)			not null,		-- 삭제여부
	foreign key (peanut_no) references pn_peanuts(peanut_no),
	foreign key (rep_target) references pn_member(m_id),
	foreign key (writer) references pn_member(m_id)
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
	notice_no	number			primary key,	-- 알림번호(pk)
	active		varchar2(20),					-- 알림 생성자(fk)
	passive 	varchar2(20),					-- 알림 수신자(fk)
	n_type		varchar2(10)	not null,		-- 알림 타입
	peanut_no	number,							-- 리넛알림일 경우 피넛번호(fk)
	reply_no	number,							-- 댓글알림일 경우 댓글번호(fk)
	regdate		date			not null,		-- 알림 생성일
	read		char(1)			not null,		-- 알림 수신여부
	foreign key (active) references pn_member(m_id),
	foreign key (passive) references pn_member(m_id),
	foreign key (peanut_no) references pn_peanuts(peanut_no),
	foreign key (reply_no) references pn_replies(reply_no)
);
	


-- 시퀀스 생성
	-- 피넛 넘버 시퀀스
drop SEQUENCE peanut_no_seq;
create SEQUENCE peanut_no_seq;

	-- 댓글 넘버 시퀀스
drop SEQUENCE reply_no_seq;
create SEQUENCE reply_no_seq;

	-- 알림 넘버 시퀀스
drop SEQUENCE notice_no_seq;
create SEQUENCE notice_no_seq;

-- 트리거 생성
	-- 차단 등록 시 작동할 기능 트리거
	-- 차단 시 상호 팔로우 해제, 상호 리넛, 상호 북마크 해제, 상호 알림 삭제
create or replace trigger block_trig
    before insert on pn_block
    for each row
begin
    delete pn_follow where (active = :new.active and passive = :new.passive) or (active = :new.passive and passive = :new.active);    
    update pn_peanuts set del = 'y' where (writer = :new.active and renut in (select peanut_no from pn_peanuts where writer = :new.passive))
        or (writer = :new.passive and renut in (select peanut_no from pn_peanuts where writer = :new.active));
    delete pn_bookmark where (peanut_no in (select peanut_no from pn_peanuts where writer = :new.passive) and bm_user = :new.active)
        or (peanut_no in (select peanut_no from pn_peanuts where writer = :new.active) and bm_user = :new.passive);
    delete pn_notice where (active = :new.active and passive = :new.passive) or (active = :new.passive and passive = :new.active);
end;
/

	-- 리넛 등록 시 작동할 트리거
	-- 피넛이 등록됐을때, 그것이 리넛이었을 경우 작동
	-- 리넛일 경우 원본 피넛 작성자를 조회해 원본 작성자에게 리넛알림 보냄
	-- 자기 자신의 피넛을 리넛한 경우엔 작동하지 않음
create or replace trigger renut_trig
    before insert on pn_peanuts
    for each row
declare
    rn_writer varchar2(20);
begin
    if :new.renut is not null then
        select writer into rn_writer from pn_peanuts where peanut_no = :new.renut;
        if :new.writer != rn_writer then
            insert into pn_notice values(notice_no_seq.nextval, :new.writer, rn_writer, 'renut', :new.renut, null, sysdate, 'n');
        end if;
    end if;
end;
/

	-- 리넛 취소 시 작동할 트리거
	-- 피넛 수정기능이 없기때문에 pn_peanuts 테이블에서 update 쿼리가 실행되는 경우는 피넛삭제 or 리넛취소 뿐
	-- 삭제처리하는 피넛이 리넛인 경우에 이 트리거가 발동해 해당 리넛으로 인한 알림이 미독상태인 경우 삭제
create or replace trigger cancel_rn_trig
    after update on pn_peanuts
    for each row
begin
    if :new.renut is not null then        
        delete pn_notice where read = 'n' and active = :new.writer and peanut_no = :new.renut;
    end if;
end;
/

	-- 팔로우 시 작동할 트리거
	-- 팔로우 당한 사람에게 알림 추가	
create or replace trigger follow_trig
    after insert on pn_follow
    for each row
begin
    insert into pn_notice values(notice_no_seq.nextval, :new.active, :new.passive, 'follow', null, null, sysdate, 'n');
end;
/

	-- 언팔로우 시 작동할 트리거
	-- 언팔로우 당한 사람이 아직 팔로우 알림을 읽지 않은 경우 알림 삭제
create or replace trigger unfollow_trig
    after delete on pn_follow
    for each row
begin
    delete pn_notice where read = 'n' and active = :old.active and passive = :old.passive;
end;
/

	-- 댓글 등록 시 작동할 트리거
	-- 자신에게 쓴 댓글에선 작동하지 않음
	-- 댓글의 대상에게 알림 추가
create or replace trigger reply_trig
    after insert on pn_replies
    for each row
begin
    if :new.writer != :new.rep_target then
        insert into pn_notice values(notice_no_seq.nextval, :new.writer, :new.rep_target, 'reply', null, :new.reply_no, sysdate, 'n');
    end if;
end;
/

	-- 댓글 삭제 시 작동할 트리거
	-- pn_replies 에서 update가 작동하는 경우는 삭제 뿐
	-- 해당 댓글의 알림을 상대가 아직 읽지 않은 경우 알림 삭제
create or replace trigger del_reply_trig
    after update on pn_replies
    for each row
begin
    delete pn_notice where read = 'n' and reply_no = :old.reply_no;
end;
/

	-- 회원탈퇴시 작동할 트리거
	-- 작성한 모든 피넛 삭제처리
	-- 자신의 피넛을 리넛한 게시물도 전부 삭제처리
	-- 자신에 대한 팔로우, 북마크 해제
	-- 자신이 작성한 댓글 모두 삭제 처리
create or replace trigger member_del_trig
    before update on pn_member
    for each row
begin
    if :new.m_del = 'y' then
        update pn_peanuts set del = 'y' where writer = :new.m_id or renut in (select peanut_no from pn_peanuts where writer = :new.m_id);
        delete pn_follow where active = :new.m_id or passive = :new.m_id;
        delete pn_bookmark where bm_user = :new.m_id;
        delete pn_block where active = :new.m_id or passive = :new.m_id;
        update pn_replies set del = 'y' where writer = :new.m_id;
    end if;
end;
/
