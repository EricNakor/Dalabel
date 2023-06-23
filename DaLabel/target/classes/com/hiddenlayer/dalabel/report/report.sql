create table report(
	report_no number(8) primary key,
	report_by varchar2(15 char) not null, -- user_id
	report_content varchar2(600 char) not null,
	report_data varchar2(58 char) not null, -- data_name
	report_project_no number(8) not null,-- porject_no
	report_date date default sysdate not null,
	foreign key (report_by) references member(user_id)
	);
	
create sequence report_seq start with 1 increment by 1;
drop sequence report_seq
drop table report
select * from report


select * from report where report_data = #{report_data}

select * from report
where report_project_no in (
	select project_no
	from labeling_project
	where project_requestor='test12'  and project_bundle_no=92
)

select *from labeling_project
where project_requestor='qwer1234'  and project_no=215

select * from labeling_project where project_no=215

select * from databundle

select data_name from Data where data_where=92

select * from report
insert into report(report_no, report_by, report_content, report_data, report_project_no, report_date)
		values(report_seq.nextval, 'qwer1234', '신고2', '  0653d567-2d27-46b0-95b5-b7e8c1099112_00000015.jpg', 197, sysdate)
		
select * from labeling_project
select * from data
		
select report_no , report_by , report_content , report_data , report_project_no , report_date from report
left join data
on report_project_no = data_where and data_name = report_data
where data_activation=0
and  report_project_no in (
	select project_no
	from labeling_project
	where project_requestor='client' and project_bundle_no=232
	)
	and report_no>0
	
select report_no , report_by , report_content , report_data , report_project_no , report_date from report
	where  report_project_no in (
		select project_no
		from labeling_project
		where project_requestor='client' and project_bundle_no=122
	)
	and report_no>0

select * from dataBundle
	
select * from data
select * from report

select report_no , report_by , report_content , report_data , report_project_no , report_date from
	(select report_no , report_by , report_content , report_data , report_project_no , report_date from report
	where  report_project_no in (
		select project_no
		from labeling_project
		where project_requestor='client' and project_bundle_no=122
	)
	and report_no>0
	)
left join data
on data_where = 122 and data_name = report_data
where data_activation=1