select * from reviewBoard;
desc reviewBoard;
delete from reviewBoard;
select count(*) from reviewBoard where rvb_del = 'n';
select count(*) from reviewBoard where rvb_del = 'n' and user_id = 'admin';
select * from reviewBoard where rvb_id = 702;
------------------------------------------------------------------------------------------------------------------------------
select * from ( --�������׸� ��������
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from reviewboard where rvb_del = 'n' and user_id = 'admin' order by rvb_reg_date desc, rvb_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from ( --�ֽż����� ��������
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from reviewboard where rvb_del = 'n' and user_id = 'admin' order by rvb_reg_date desc, rvb_id desc)
            union all
            select * from (select * from reviewboard where rvb_del = 'n' and user_id != 'admin' order by rvb_reg_date desc, rvb_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from (--�������̵�� ����Ʈ ��������
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from reviewboard where rvb_del = 'n' and user_id = 'admin' order by rvb_reg_date desc, rvb_id desc)
            union all
            select * from (select * from reviewboard where rvb_del = 'n' and user_id != 'admin' order by rvb_reg_date desc, rvb_id desc)
        )
    ) f_qry where user_id = 'userId1'
)where rnum between 1 and 9999;

select * from ( --��õ������ ��������
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from reviewboard where rvb_del = 'n' and user_id = 'admin' order by rvb_reg_date desc, rvb_id desc)
            union all
            select * from (select * from reviewboard where rvb_del = 'n' and user_id != 'admin' order by rvb_like_cnt desc, rvb_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;
-------------------------------------------------------------------------------------------------------------------------------
select rnum - 1 from (
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from reviewboard where rvb_del = 'n' and user_id = 'admin' order by rvb_reg_date desc, rvb_id desc)
            union all
            select * from (select * from reviewboard where rvb_del = 'n' and user_id != 'admin' order by rvb_reg_date desc, rvb_id desc)
        )
    ) f_qry
)where rvb_id = 999;--�ֽż����� �ε��� ��ȯ

select rnum - 1 from (
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from reviewboard where rvb_del = 'n' and user_id = 'admin' order by rvb_reg_date desc, rvb_id desc)
            union all
            select * from (select * from reviewboard where rvb_del = 'n' and user_id != 'admin' order by rvb_like_cnt desc, rvb_id desc)
        )
    ) f_qry
)where rvb_id = 999;--��õ������ �ε��� ��ȯ
-----------------------------------------------------------------------------------------------------------------------------
insert into reviewBoard values(rvb_seq.nextval, 'userId1', 'rvbTitle1', 'rvbContent1', sysdate, 0, 0, 'n', 'rvb');
insert into reviewBoard values(rvb_seq.nextval, 'userId2', 'rvbTitle2', 'rvbContent2', sysdate, 0, 0, 'n', 'rvb');
insert into reviewBoard values(rvb_seq.nextval, 'userId3', 'rvbTitle3', 'rvbContent3', sysdate, 0, 0, 'n', 'rvb');
insert into reviewBoard values(rvb_seq.nextval, 'userId4', 'rvbTitle4', 'rvbContent4', sysdate, 0, 0, 'n', 'rvb');
insert into reviewBoard values(rvb_seq.nextval, 'userId5', 'rvbTitle5', 'rvbContent5', sysdate, 0, 0, 'n', 'rvb');
insert into reviewBoard values(rvb_seq.nextval, 'userId6', 'rvbTitle6', 'rvbContent6', sysdate, 0, 0, 'n', 'rvb');
insert into reviewBoard values(rvb_seq.nextval, 'userId7', 'rvbTitle7', 'rvbContent7', sysdate, 0, 0, 'n', 'rvb');
insert into reviewBoard values(rvb_seq.nextval, 'userId8', 'rvbTitle8', 'rvbContent8', sysdate, 0, 0, 'n', 'rvb');
insert into reviewBoard values(rvb_seq.nextval, 'userId9', 'rvbTitle9', 'rvbContent9', sysdate, 0, 0, 'n', 'rvb');
---------------------------------------------------------------------------------------------------------------------------
UPDATE reviewBoard SET rvb_like_cnt = 10 WHERE rvb_id = 203;

DECLARE
  v_start_num NUMBER := 1; -- ���� ��
  v_end_num NUMBER := 234;  -- ���� ��
BEGIN
  FOR i IN v_start_num..v_end_num LOOP
    insert into reviewBoard values(
        rvb_seq.nextval, 
        'admin', 
        'rvbNotice' || i, 
        'rvbNoticeContent' || i, 
        sysdate, 
        0, 
        0, 
        'n', 
        'rvb');
  END LOOP;
  COMMIT; -- Ʈ����� Ŀ��
END;
/
