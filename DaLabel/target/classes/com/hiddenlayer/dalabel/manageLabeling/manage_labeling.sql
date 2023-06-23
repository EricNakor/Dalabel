create table databundle(
	bundle_no number(8) primary key,
	bundle_uploader varchar2(15 char) not null,
	bundle_uploaded_filename varchar2(100 char) not null,
	bundle_data_type varchar2(5 char) not null,
	bundle_descript varchar2(100 char) not null,
	bundle_unzip number(1) not null,
	bundle_folder_name varchar2(100 char) not null,
	bundle_file_count number(8) not null,
	constraint bundle_requestor foreign key (bundle_uploader)
	references member(user_id) on delete cascade
)
CREATE INDEX idx_bundle_upload ON databundle (bundle_uploader, bundle_uploaded_filename);

drop sequence databundle_seq
create sequence databundle_seq

select * from databundle

drop table databundle cascade constraint purge

create table labeling_project (
	project_no number(8) primary key,
	project_title varchar2(100 char) not null,
	project_requestor varchar2(15 char) not null,
	project_access_level number(2) not null,
	project_guide varchar2(2000 char) not null,
	project_how number(2) not null,
	project_category varchar2(2000 char) not null,
	project_progress char(1) not null,
	project_bundle_no number(8) not null,
	constraint project_requestor2 foreign key (project_requestor)
	references member(user_id) on delete cascade
)

select * from LABELING_PROJECT

select * from LABELING_DONE

drop table labeling_project cascade constraint purge
drop sequence labeling_project_seq
create sequence labeling_project_seq

select * from data

select * from labeling_project

insert into labeling_done values(198, '83441816-12b0-454d-9cf8-9172b2445735_00000002.jpg', 'test12', '안녕')

update labeling_project set project_access_level = 30 where project_title = 'absd'

select * from labeling_done

create table data(
	data_name varchar2(58 char),
	data_where number(8),
	data_activation char(1) not null,
	constraint data_where2 foreign key (data_where)
)

update data set data_activation = '1' where data_where = '22'

select * from data
select * from LABELING_DO



select * from LABELING_PROJECT
select * from labeling_done

update labeling_project set project_category = '{type:"button",info:["버튼1", "개", "고양이", "car"]}' where project_title = 'baba'



create table labeling_do (
	dolabel_user varchar2(15 char),
	dolabel_project_no number(8),
	dolabel_state char(1),
	dolabel_score number(3, 2),
	constraint want_labeling_pk primary key(dolabel_user, dolabel_project_no)
)

create table labeling_done (
	labeling_done_no number(8) primary key,
	project_no number(8) not null,
	data_no varchar2(58 char) not null,
	worked_by varchar2(15 char) not null,
	label varchar2(300 char) not null,
	constraint done_project_no foreign key (project_no) 
	references labeling_project(project_no) on delete cascade,
	constraint done_worked_by foreign key (worked_by) 
	references member(user_id) on delete cascade
)

create sequence labeling_done_seq

create table labeling_result (
	project_no number(8) not null,
	data_no varchar2(58) not null,
	label_result varchar2(300 char) not null
)

select * from labeling_result

select * from labeling_project

update labeling_project set project_progress = 1;

drop table labeling_result cascade constraint purge

CREATE FUNCTION BOR(x IN NUMBER, y IN NUMBER) RETURN NUMBER AS
BEGIN
RETURN x + y - bitand(x,y);
END;

