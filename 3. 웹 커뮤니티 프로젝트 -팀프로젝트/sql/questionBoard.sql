select * from questionBoard;
select * from questionBoard order by qsb_reg_date desc;
select count(*) from questionBoard where qsb_del = 'n';
select count(*) from questionBoard where qsb_del = 'n' and user_id = 'admin';
select * from questionBoard where qsb_id = 1;
desc questionBoard;
delete from questionBoard;
---------------------------------------------------------------------------------------------------------------
select * from ( --�������׸� ��������
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from questionBoard where qsb_del = 'n' and user_id = 'admin' order by qsb_reg_date desc, qsb_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from ( --�ֽż����� ��������
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from questionBoard where qsb_del = 'n' and user_id = 'admin' order by qsb_reg_date desc, qsb_id desc)
            union all
            select * from (select * from questionBoard where qsb_del = 'n' and user_id != 'admin' order by qsb_reg_date desc, qsb_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from (--�������̵�� ����Ʈ ��������
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from questionBoard where qsb_del = 'n' and user_id = 'admin' order by qsb_reg_date desc, qsb_id desc)
            union all
            select * from (select * from questionBoard where qsb_del = 'n' and user_id != 'admin' order by qsb_reg_date desc, qsb_id desc)
        )
    ) f_qry where user_id = 'userId1'
)where rnum between 1 and 9999;--�ֽż����� ��������
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
insert into questionBoard values(qsb_seq.nextval, 'admin', '����������1', '�����ڳ���1', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'admin', '����������2', '�����ڳ���2', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'admin', '����������3', '�����ڳ���3', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'admin', '����������4', '�����ڳ���4', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'admin', '����������5', '�����ڳ���5', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId1', 'qsbTitle1', 'qsbContent1', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId2', 'qsbTitle2', 'qsbContent2', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId3', 'qsbTitle3', 'qsbContent3', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId4', 'qsbTitle4', 'qsbContent4', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId5', 'qsbTitle5', 'qsbContent5', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId6', 'qsbTitle6', 'qsbContent6', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId7', 'qsbTitle7', 'qsbContent7', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId8', 'qsbTitle8', 'qsbContent8', sysdate, 0, 'n', 'qsb');
insert into questionBoard values(qsb_seq.nextval, 'userId9', 'qsbTitle9', 'qsbContent9', sysdate, 0, 'n', 'qsb');
