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

create sequence databundle_seq

CREATE INDEX idx_bundle_upload ON databundle (bundle_uploader, bundle_uploaded_filename);

select * from databundle where bundle_uploader = 'test12' order by bundle_no desc

drop table databundle cascade constraint purge

create table labeling_project (
	project_no number(8) primary key,
	project_title varchar2(100 char) not null,
	project_requestor varchar2(15 char) not null,
	project_access_level number(2) not null,
	project_guide varchar2(1000 char) not null,
	project_how number(2) not null,
	project_category varchar2(500 char) not null,
	project_progress char(1) not null,
	project_bundle_no number(8) not null,
	constraint project_requestor2 foreign key (project_requestor)
	references member(user_id) on delete cascade,
	constraint project_file_no foreign key (project_bundle_no)
	references databundle(bundle_no)
)

create sequence labeling_project_seq

select * from labeling_project

create table data(
	data_name varchar2(15 char),
	data_where number(8),
	data_activation char(1) not null,
	constraint data_pk primary key(data_where, data_name)
)

select * from data

drop table data cascade constraint purge

create table labeling_do (
	dolabel_user varchar2(15 char),
	dolabel_project_no number(8),
	dolabel_state char(1),
	dolabel_score number(3, 2),
	constraint want_labeling_pk primary key(dolabel_user, dolabel_project_no)
)

insert into labeling_do values('t5', 3, 0, null)

select * from labeling_do

drop table want_do_labeling cascade constraint purge

CREATE INDEX idx_want_project on want_do_labeling (want_project_no)

select bitor(2,4) from dual

CREATE FUNCTION BOR(x IN NUMBER, y IN NUMBER) RETURN NUMBER AS
BEGIN
RETURN x + y - bitand(x,y);
END;
