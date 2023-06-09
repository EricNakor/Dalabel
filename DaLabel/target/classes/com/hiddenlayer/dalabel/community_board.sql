create table board(
	board_id number not null,
	board_category varcha2(20) not null,
	user_id varchar2(15 char) references member(user_id)
--	제목, 내용은 넉넉잡았음
	board_title varchar2(60) not null,
	board_content varchar2(600) not null,
	board_file varchar2(100 char),
	board_regist date default sysdate not null,
	board_edit date default sysdate not null,
	-- 0이 현재 노출 되는거, 1이 삭제한거
	board_delete number(1) not null,
	constraint board_pk primary key (board_id)
);

create sequence board_seq start with 1 increment by 1;

create table comment(
	comment_id number not null,
	board_id number references board(board_id),
	user_id varchar2(15 char) references member(user_id),
	comment_content varchar2(600) not null,
	comment_regist date default sysdate not null,
	comment_edit date default sysdate not null,
	comment_delete number(1) not null,
	constraint comment_pk primary key (comment_id)
);

create sequence comment_seq;

--select*
--from comment
--where board_id = 11



create table reply(
	comment_id number references comment(comment_id),
	user_id varchar2(15 char) references member(user_id),
	reply_content varchar2(600) not null,
	comment_regist date default sysdate not null,
	comment_edit date default sysdate not null	
);


--select board_id, board_category, user_id, board_title, board_content, board_file, board_regist
--from  board order by board_regist desc;



