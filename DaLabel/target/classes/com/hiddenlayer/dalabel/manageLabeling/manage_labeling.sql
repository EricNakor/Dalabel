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
	project_category varchar2(500 char) not null,
	project_progress char(1) not null,
	project_bundle_no number(8) not null,
	constraint project_requestor2 foreign key (project_requestor)
	references member(user_id) on delete cascade,
	constraint project_file_no foreign key (project_bundle_no)
	references databundle(bundle_no)
)

select * from LABELING_PROJECT

select * from LABELING_DONE

drop table labeling_project cascade constraint purge
drop sequence labeling_project_seq
create sequence labeling_project_seq

select * from data

select * from labeling_project

insert into labeling_done values(50, '4b50ad61-7a9d-4cfb-947d-e5d6f89dfaac_00000001.jpg', 'test111', '')

update labeling_project set project_access_level = 30 where project_title = 'absd'

select * from labeling_done

create table data(
	data_name varchar2(58 char),
	data_where number(8),
	data_activation char(1) not null,
	constraint data_pk primary key(data_where, data_name)
)

update data set data_activation = '1' where data_where = '22'

select * from data
select * from LABELING_DO



select * from LABELING_PROJECT
select * from labeling_done

baba 카테고리 '{type:"button",info:["버튼1", "개", "고양이", "car"]}'로 업데이트좀ㅈ 해봐
update labeling_project set project_category = '{type:"button",info:["버튼1", "개", "고양이", "car"]}' where project_title = 'baba'



create table labeling_do (
	dolabel_user varchar2(15 char),
	dolabel_project_no number(8),
	dolabel_state char(1),
	dolabel_score number(3, 2),
	constraint want_labeling_pk primary key(dolabel_user, dolabel_project_no)
)

create table labeling_done (
	project_no number(8) not null,
	data_no varchar2(58 char) not null,
	worked_by varchar2(15 char) not null,
	label varchar2(300 char) not null,
	constraint done_project_no foreign key (project_no) 
	references labeling_project(project_no) on delete cascade,
	constraint done_worked_by foreign key (worked_by) 
	references member(user_id) on delete cascade
)

insert into labeling_do values('test123', 49, 1, null)

select * from labeling_do where dolabel_user = 'test12'

drop table want_do_labeling cascade constraint purge

CREATE INDEX idx_want_project on want_do_labeling (want_project_no)

select bitor(2,4) from dual

CREATE FUNCTION BOR(x IN NUMBER, y IN NUMBER) RETURN NUMBER AS
BEGIN
RETURN x + y - bitand(x,y);
END;

select data_name from data where data_where = 105 and data_name like '%1.%'

delete data where data_where = 67

select * from data

select * from labeling_project

select data_name
from data
where data_where = 70
and substr(data_name, instr(data_name, '_') + 1, instr(data_name, '.')
- INSTR(data_name, '_') - 1) = 3

select data_name from data where data_where = 70

select bundle_folder_name from databundle where bundle_no = (select project_bundle_no from labeling_project where project_no = 183)

insert into labeling_done values(183, 'aaa8cfca-55ed-4c39-8b78-3b90296bb2e0_00000003.jpg', 'test111', '잠봉')

select * from dataBundle
select * from labeling_done
