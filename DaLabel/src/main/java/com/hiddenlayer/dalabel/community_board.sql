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

create table post_comment(
	comment_id number(8) not null primary key,
	inherit_post number(8) references board(board_id),
	comment_writer varchar2(15 char) references member(user_id),
	comment_content varchar2(600) not null,
	comment_regist date default sysdate not null,
	comment_edit date default sysdate not null,
	comment_delete number(1) not null
);

create sequence post_comment_seq;


create table reply(
	inherit_comment number(8) references post_comment(comment_id),
	reply_writer varchar2(15 char) references member(user_id),
	reply_content varchar2(600) not null,
	comment_regist date default sysdate not null,
	comment_edit date default sysdate not null	
);
