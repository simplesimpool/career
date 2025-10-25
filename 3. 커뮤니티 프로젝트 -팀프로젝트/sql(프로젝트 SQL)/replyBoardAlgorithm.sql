create table testBoard1
(
    id number primary key,
    writer varchar2(100) not null,
    content varchar2(100) not null,
    lvl number not null,
    parent_id number not null,
    reg_date date not null
);

select * from testBoard1 order by id desc, lvl asc, reg_date desc;
desc testBoard1;
delete from testBoard1;
-----------------------------------------------------------------------------------------------
insert into testBoard1 values (1, 'writer1', 'content1', 0, -1, sysdate);
insert into testBoard1 values (2, 'writer2', 'content2', 0, -1, sysdate);
insert into testBoard1 values (3, 'writer3', 'content3', 0, -1, sysdate);
insert into testBoard1 values (4, 'writer4', 'content4', 0, -1, sysdate);
insert into testBoard1 values (5, 'writer5', 'content5', 0, -1, sysdate);
insert into testBoard1 values (6, 'writer6', 'content6', 0, -1, sysdate);
insert into testBoard1 values (7, 'writer7', 'content7', 0, -1, sysdate);
insert into testBoard1 values (8, 'writer8', 'content8', 0, -1, sysdate);
insert into testBoard1 values (9, 'writer9', 'content9', 0, -1, sysdate);
insert into testBoard1 values (10, 'writer10', 'content10', 0, -1, sysdate);
-----------------------------------------------------------------------------------------------
--reply to id == 5
select * from testBoard1 order by id desc, lvl asc, reg_date desc;
delete from testBoard1;

update testBoard1 set id = id + 1 where id >= 10;
update testBoard1 set parent_id = parent_id + 1 where parent_id = 10;
update testBoard1 set parent_id = parent_id + 1 where lvl > 0 and lvl < 10;
insert into testBoard1 values (10, 'writer5-3-3-2', 'content5-3-3-2', 3, 10 + 1, sysdate);
