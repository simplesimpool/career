select * from freeBoard;
select * from freeBoard order by frb_reg_date desc;
select count(*) from freeBoard where frb_del = 'n';
select count(*) from freeBoard where frb_del = 'n' and user_id = 'admin';
select count(*) from freeBoard where frb_del = 'n' and user_id = 'userId1';
select * from freeBoard where frb_id = 252;
desc freeBoard;
delete from freeBoard;
----------------------------------------------------------------------------------------------------------------------
SELECT * 
    FROM (
        SELECT freeBoard.*, ROW_NUMBER() OVER (ORDER BY frb_reg_date DESC, frb_id desc) AS rnum
        FROM freeBoard
        WHERE frb_del = 'n'
    ) 
WHERE rnum BETWEEN 1 AND 9999;
-----------------------------------------------------------------------------------------------------------------------
select * from ( --공지사항 쿼리
    select f_qry.*, rownum as rnum from (
        select * from (
            select * from (select * from freeBoard where frb_del = 'n' and user_id = 'admin' order by frb_reg_date desc, frb_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from ( --공지사항 포함 쿼리
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from freeBoard where frb_del = 'n' and user_id = 'admin' order by frb_reg_date desc, frb_id desc)
            union all
            select * from (select * from freeBoard where frb_del = 'n' and user_id != 'admin' order by frb_reg_date desc, frb_id desc)
        )
    ) f_qry
)where rnum between 1 and 9999;

select * from (--유저아이디로 리스트 가져오기
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from freeBoard where frb_del = 'n' and user_id = 'admin' order by frb_reg_date desc, frb_id desc)
            union all
            select * from (select * from freeBoard where frb_del = 'n' and user_id != 'admin' order by frb_reg_date desc, frb_id desc)
        )
    ) f_qry where user_id = 'userId1'
)where rnum between 1 and 9999;
---------------------------------------------------------------------------------------------------------------------------
select rnum - 1 from (
    select f_qry.*, rownum as rnum
    from (
        select * from (
            select * from (select * from freeBoard where frb_del = 'n' and user_id = 'admin' order by frb_reg_date desc, frb_id desc)
            union all
            select * from (select * from freeBoard where frb_del = 'n' and user_id != 'admin' order by frb_reg_date desc, frb_id desc)
        )
    ) f_qry
)where frb_id = 773;
-----------------------------------------------------------------------------------------------------------------------
insert into freeBoard values(frb_seq.nextval, 'userId1', 'frbTitle1', 'frbContent1', sysdate, 0, 'n', 'frb');
insert into freeBoard values(frb_seq.nextval, 'userId2', 'frbTitle2', 'frbContent2', sysdate, 0, 'n', 'frb');
insert into freeBoard values(frb_seq.nextval, 'userId3', 'frbTitle3', 'frbContent3', sysdate, 0, 'n', 'frb');
insert into freeBoard values(frb_seq.nextval, 'userId4', 'frbTitle4', 'frbContent4', sysdate, 0, 'n', 'frb');
insert into freeBoard values(frb_seq.nextval, 'userId5', 'frbTitle5', 'frbContent5', sysdate, 0, 'n', 'frb');
insert into freeBoard values(frb_seq.nextval, 'userId6', 'frbTitle6', 'frbContent6', sysdate, 0, 'n', 'frb');
insert into freeBoard values(frb_seq.nextval, 'userId7', 'frbTitle7', 'frbContent7', sysdate, 0, 'n', 'frb');
insert into freeBoard values(frb_seq.nextval, 'userId8', 'frbTitle8', 'frbContent8', sysdate, 0, 'n', 'frb');
insert into freeBoard values(frb_seq.nextval, 'userId9', 'frbTitle9', 'frbContent9', sysdate, 0, 'n', 'frb');
