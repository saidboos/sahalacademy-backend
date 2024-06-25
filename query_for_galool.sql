
use _ga;
use thub;


select * from _ga_user_types;
select * from _ga_courses;
insert into _ga_user_types(type) values('student');
call sp_ga_courses('UUID10000001');

update _ga_courses set cdesc = 'Complete Java Course' where id = 1;


select * from _ga_users;
update _ga_users set em = 'aydrus@gmail.com' where uuid = 'UUID10000003';
update _ga_courses set cimg = 'https://galool.net/img/videoediting.png' where cuid = 'CUID10000002';
select * from ga_student_courses;

insert into ga_student_courses(suid, cuid) values ('UUID10000004','CUID10000002');


call sp_ga_user_register('Shaakir', 'Abdinaasir', 'shakir@gmail.com', 'test', '1133', '3');
call sp__ga_user_login('boos@gmail.com','test');
call sp_ga_create_course('UUID10000001','Graphic Designing','20','description','imga');
call sp_ga_student_courses('UUID10000003');
call sp_ga_upload_video('CUID10000001','Syntx of  Lessffon','https://www.youtube.com/watch?v=k8l1loq7Tr8&t=4s');
call sp_ga_videos('CUID10000001');



select * from _ga_videos;


update _ga_videos set vurl = 'https://www.youtube.com/embed/Nea_nlpiYQs?rel=0&modestbranding=1' where id = 1;

delete from _ga_videos where id = 8;





