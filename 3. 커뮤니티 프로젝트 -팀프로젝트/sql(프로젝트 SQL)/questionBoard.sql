select * from questionBoard;
select * from questionBoard order by qsb_reg_date desc;
select count(*) from questionBoard where qsb_del = 'n';
select count(*) from questionBoard where qsb_del = 'n' and user_id = 'admin';
select * from questionBoard where qsb_id = 1;
desc questionBoard;
delete from questionBoard;
---------------------------------------------------------------------------------------------------------------
select * from ( --공지사항만 가져오기
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from questionBoard where qsb_del = 'n' and user_id = 'admin' order by qsb_reg_date desc, qsb_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from ( --최신순으로 가져오기
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from questionBoard where qsb_del = 'n' and user_id = 'admin' order by qsb_reg_date desc, qsb_id desc)
            union all
            select * from (select * from questionBoard where qsb_del = 'n' and user_id != 'admin' order by qsb_reg_date desc, qsb_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from (--유저아이디로 리스트 가져오기
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from questionBoard where qsb_del = 'n' and user_id = 'admin' order by qsb_reg_date desc, qsb_id desc)
            union all
            select * from (select * from questionBoard where qsb_del = 'n' and user_id != 'admin' order by qsb_reg_date desc, qsb_id desc)
        )
    ) f_qry where user_id = 'userId1'
)where rnum between 1 and 9999;--최신순으로 가져오기
-----------------------------------------------------------------------------------------------------------------------------
select rnum - 1 from (
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from questionBoard where qsb_del = 'n' and user_id = 'admin' order by qsb_reg_date desc, qsb_id desc)
            union all
            select * from (select * from questionBoard where qsb_del = 'n' and user_id != 'admin' order by qsb_reg_date desc, qsb_id desc)
        )
    ) f_qry
)where qsb_id = 592;
-----------------------------------------------------------------------------------------------------------------------------
insert into questionBoard values(qsb_seq.nextval, 'admin', '관리자제목1', '관리자내용1', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'admin', '관리자제목2', '관리자내용2', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'admin', '관리자제목3', '관리자내용3', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'admin', '관리자제목4', '관리자내용4', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'admin', '관리자제목5', '관리자내용5', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId1', 'qsbTitle1', 'qsbContent1', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId2', 'qsbTitle2', 'qsbContent2', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId3', 'qsbTitle3', 'qsbContent3', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId4', 'qsbTitle4', 'qsbContent4', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId5', 'qsbTitle5', 'qsbContent5', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId6', 'qsbTitle6', 'qsbContent6', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId7', 'qsbTitle7', 'qsbContent7', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId8', 'qsbTitle8', 'qsbContent8', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId9', 'qsbTitle9', 'qsbContent9', sysdate, 0, 'n', 'qsb');
