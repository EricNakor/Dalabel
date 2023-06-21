-- DB table > dto > mapper > ...
-- 게시글 수정, 댓글기능 > 완료 시 > 복붙해서 공지 (댓글 x)
-- QNA > 플랫폼, 라벨링 > 

create table board(
	board_id number(8) not null primary key,
	board_category varchar2(20) not null,
	board_writer varchar2(15 char) references member(user_id),
	board_title varchar2(60) not null,
	board_content varchar2(600) not null,
	board_regist date default sysdate not null,
	board_edit date default sysdate not null,
	board_delete number(1) not null,
	constraint post_writer 
		foreign key (board_writer)
		references member(user_id)
		on delete cascade );

create sequence board_seq start with 1 increment by 1;

select * from board
--insert into board (board_id, board_writer, board_category, board_title, board_content, board_delete, board_regist, board_edit) values(board_seq.nextval, 'wasd', 'board', 'test', 'test', 0, sysdate, sysdate)

create table post_comment(
	comment_id number(8) not null primary key,
	inherit_post number(8) references board(board_id),
	comment_writer varchar2(15 char) references member(user_id),
	comment_content varchar2(600) not null,
	comment_regist date default sysdate not null,
	comment_edit date default sysdate not null,
	comment_delete number(1) not null
);

create table post_comment(
	comment_id number(8) not null primary key,
	inherit_post number(8) not null,
	comment_writer varchar2(15 char) not null,
	comment_content varchar2(600) not null,
	comment_regist date default sysdate not null,
	comment_edit date default sysdate not null,
	comment_delete number(1) not null,
	constraint b_comment
		foreign key(inherit_post) references board(board_id)
		on delete cascade,
	foreign key(comment_writer) references member(user_id)
);

select * from post_comment;

drop table post_comment cascade constraints purge;
drop sequence post_comment_seq;

create sequence post_comment_seq;

create table reply(
	reply_id number(8) primary key,
	inherit_comment number(8) not null,
	reply_writer varchar2(15 char) not null,
	reply_content varchar2(600) not null,
	reply_regist date not null,
	reply_edit date not null,
	reply_delete number(1) not null,
	foreign key(inherit_comment) references post_comment(comment_id),
	foreign key(reply_writer) references member(user_id)
);

create sequence reply_seq;

select * from reply;

drop table reply cascade constraints purge;
drop sequence reply_seq cascade constraints purge;

create table reply(
	inherit_comment number(8) references post_comment(comment_id),
	reply_writer varchar2(15 char) references member(user_id),
	reply_content varchar2(600) not null,
	comment_regist date default sysdate not null,
	comment_edit date default sysdate not null	
);


--select board_id, board_category, user_id, board_title, board_content, board_file, board_regist
--from  board order by board_regist desc;


create table comment_reply (
	comment_id number(8) not null primary key,
	inherit_post number(8) not null,
	cr_depth number(1) not null,
	cr_parent_id number(8) not null,
	cr_writer varchar2(15 char) not null,
	cr_content varchar2(600) not null,
	cr_regist date not null,
	cr_edit date not null,
	constraint b_c
		foreign key(inherit_post) references board(board_id)
		on delete cascade
);

create sequence comment_reply_seq;