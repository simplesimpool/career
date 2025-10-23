select * from mediInfoBoard order by mib_reg_date desc;
desc mediInfoBoard;
select * from mediInfoBoard where mib_id = 1;
select count(*) from mediInfoBoard where mib_del = 'n';
select count(*) from mediInfoBoard where mib_del = 'n' and user_id = 'admin';
delete from mediInfoBoard;
----------------------------------------------------------------------------------------------------------------------------
select * from ( --공지사항만 가져오기
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from mediInfoboard where mib_del = 'n' and user_id = 'admin' order by mib_reg_date desc, mib_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from ( --최신순으로 가져오기
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from mediInfoboard where mib_del = 'n' and user_id = 'admin' order by mib_reg_date desc, mib_id desc)
            union all
            select * from (select * from mediInfoboard where mib_del = 'n' and user_id != 'admin' order by mib_reg_date desc, mib_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from (--유저아이디로 리스트 가져오기
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
insert into mediInfoBoard values(mib_seq.nextval, 'admin', '관리자제목1', '관리자내용1', sysdate, 0, 'n', 'mib');
insert into mediInfoBoard values(mib_seq.nextval, 'admin', '관리자제목2', '관리자내용2', sysdate, 0, 'n', 'mib');
insert into mediInfoBoard values(mib_seq.nextval, 'admin', '관리자제목3', '관리자내용3', sysdate, 0, 'n', 'mib');
insert into mediInfoBoard values(mib_seq.nextval, 'admin', '관리자제목4', '관리자내용4', sysdate, 0, 'n', 'mib');
insert into mediInfoBoard values(mib_seq.nextval, 'admin', '관리자제목5', '관리자내용5', sysdate, 0, 'n', 'mib');