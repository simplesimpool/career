select * from mediInfoBoard order by mib_reg_date desc;
desc mediInfoBoard;
select * from mediInfoBoard where mib_id = 1;
select count(*) from mediInfoBoard where mib_del = 'n';
select count(*) from mediInfoBoard where mib_del = 'n' and user_id = 'admin';
delete from mediInfoBoard;
----------------------------------------------------------------------------------------------------------------------------
select * from ( --�������׸� ��������
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from mediInfoboard where mib_del = 'n' and user_id = 'admin' order by mib_reg_date desc, mib_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from ( --�ֽż����� ��������
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from mediInfoboard where mib_del = 'n' and user_id = 'admin' order by mib_reg_date desc, mib_id desc)
            union all
            select * from (select * from mediInfoboard where mib_del = 'n' and user_id != 'admin' order by mib_reg_date desc, mib_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from (--�������̵�� ����Ʈ ��������
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from mediInfoboard where mib_del = 'n' and user_id = 'admin' order by mib_reg_date desc, mib_id desc)
            union all
            select * from (select * from mediInfoboard where mib_del = 'n' and user_id != 'admin' order by mib_reg_date desc, mib_id desc)
        )
    ) f_qry where user_id = 'userId1'
)where rnum between 1 and 9999;
---------------------------------------------------------------------------------------------------------------------------
select rnum - 1 from (
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from mediInfoboard where mib_del = 'n' and user_id = 'admin' order by mib_reg_date desc, mib_id desc)
            union all
            select * from (select * from mediInfoboard where mib_del = 'n' and user_id != 'admin' order by mib_reg_date desc, mib_id desc)
        )
    ) f_qry
)where mib_id = 763;
----------------------------------------------------------------------------------------------------------------------------
insert into mediInfoBoard values(mib_seq.nextval, 'admin', '����������1', '�����ڳ���1', sysdate, 0, 'n', 'mib');
insert into mediInfoBoard values(mib_seq.nextval, 'admin', '����������2', '�����ڳ���2', sysdate, 0, 'n', 'mib');
insert into mediInfoBoard values(mib_seq.nextval, 'admin', '����������3', '�����ڳ���3', sysdate, 0, 'n', 'mib');
insert into mediInfoBoard values(mib_seq.nextval, 'admin', '����������4', '�����ڳ���4', sysdate, 0, 'n', 'mib');
insert into mediInfoBoard values(mib_seq.nextval, 'admin', '����������5', '�����ڳ���5', sysdate, 0, 'n', 'mib');