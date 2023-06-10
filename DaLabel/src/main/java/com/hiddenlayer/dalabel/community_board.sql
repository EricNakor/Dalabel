create table board(
	board_id number(8) not null primary key,
	board_category varchar2(20) not null,
	board_writer varchar2(15 char) references member(user_id),
--	제목, 내용은 넉넉잡았음
	board_title varchar2(60) not null,
	board_content varchar2(600) not null,
	board_file varchar2(100 char),
	board_regist date default sysdate not null,
	board_edit date default sysdate not null,
-- 0이 현재 노출 되는거, 1이 삭제한거
	board_delete number(1) not null,
	constraint post_writer 
		foreign key (board_writer)
		references member(user_id)
		on delete cascade );

create sequence board_seq start with 1 increment by 1;



--insert into board 
--value (board_seq.nextval, board_id, board_category, board_writer, board_title, board_content, board_file, sysdate, sysdate, 0)

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

--select*
--from comment
--where board_id = 11



create table reply(
	inherit_comment number(8) references post_comment(comment_id),
	reply_writer varchar2(15 char) references member(user_id),
	reply_content varchar2(600) not null,
	comment_regist date default sysdate not null,
	comment_edit date default sysdate not null	
);


--select board_id, board_category, user_id, board_title, board_content, board_file, board_regist
--from  board order by board_regist desc;