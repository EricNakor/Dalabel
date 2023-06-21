create table report(
	report_no number(8) primary key,
	report_by varchar2(15 char) not null, -- user_id
	report_content varchar2(600 char) not null,
	report_data varchar2(58 char) not null, -- data_name
	report_date date default sysdate not null,
	foreign key (report_by) references member(user_id)
	);
	
create sequence report_seq start with 1 increment by 1;
drop sequence rport_seq
select * from report