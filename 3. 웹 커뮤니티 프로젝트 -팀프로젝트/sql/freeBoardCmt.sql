select * from freeBoardCmt;
select * from freeBoardCmt where frb_cmt_del = 'n';
select count(*) from freeBoardCmt where frb_cmt_del = 'n' and frb_id = 513;
select * from freeBoardCmt order by frb_cmt_date desc;
select * from freeBoardCmt where frb_cmt_del = 'n' order by frb_cmt_date desc;
select * from freeBoardCmt where frb_cmt_id = 4601;
desc freeBoardCmt;
delete from freeBoardCmt;
update freeBoardCmt set frb_cmt_reply = '20', frb_cmt_del = 'n' where frb_cmt_id = 4601;
--------------------------------------------------------------------------------------------------------------------
SELECT * --해당 게시판에 대한 전체 리스트 가져오기
    FROM (
        SELECT freeBoardCmt.*, ROW_NUMBER() OVER (ORDER BY frb_cmt_date DESC, frb_cmt_id desc) AS rnum
        FROM freeBoardCmt
        WHERE frb_cmt_del = 'n' and frb_id = 785
    )
WHERE rnum BETWEEN 1 AND 9999;

SELECT rnum - 1 --해당 게시판에 대한 댓글의 인덱스 가져오기
    FROM (
        SELECT freeBoardCmt.*, ROW_NUMBER() OVER (ORDER BY frb_cmt_date DESC, frb_cmt_id desc) AS rnum
        FROM freeBoardCmt
        WHERE frb_cmt_del = 'n' and frb_id = 785
    )where frb_cmt_id = 4748;

SELECT * --유저아이디에 대한 전체 리스트 가져오기
    FROM (
        SELECT freeBoardCmt.*, ROW_NUMBER() OVER (ORDER BY frb_cmt_date DESC, frb_cmt_id desc) AS rnum
        FROM freeBoardCmt
        WHERE frb_cmt_del = 'n' and user_id = 'userId1'
    )
WHERE rnum BETWEEN 1 AND 9999;

UPDATE freeBoardCmt
SET frb_cmt_del = 'y'
WHERE frb_cmt_id IN (
    SELECT frb_cmt_id
    FROM freeBoardCmt
    WHERE frb_id = 532
);--트리노드 지우기
-----------------------------------------------------------------------------------------------------------------------
insert into freeBoardCmt values (frb_cmt_seq.nextval, 'userId1', 513, 'frbCmtReply-1', sysdate, 'n', 'frb_cmt');
insert into freeBoardCmt values (frb_cmt_seq.nextval, 'userId2', 513, 'frbCmtReply-2', sysdate, 'n', 'frb_cmt');
insert into freeBoardCmt values (frb_cmt_seq.nextval, 'userId3', 513, 'frbCmtReply-3', sysdate, 'n', 'frb_cmt');
insert into freeBoardCmt values (frb_cmt_seq.nextval, 'userId4', 513, 'frbCmtReply-4', sysdate, 'n', 'frb_cmt');
insert into freeBoardCmt values (frb_cmt_seq.nextval, 'userId5', 513, 'frbCmtReply-5', sysdate, 'n', 'frb_cmt');
insert into freeBoardCmt values (frb_cmt_seq.nextval, 'userId6', 513, 'frbCmtReply-6', sysdate, 'n', 'frb_cmt');
insert into freeBoardCmt values (frb_cmt_seq.nextval, 'userId7', 513, 'frbCmtReply-7', sysdate, 'n', 'frb_cmt');
insert into freeBoardCmt values (frb_cmt_seq.nextval, 'userId8', 513, 'frbCmtReply-8', sysdate, 'n', 'frb_cmt');
insert into freeBoardCmt values (frb_cmt_seq.nextval, 'userId9', 513, 'frbCmtReply-9', sysdate, 'n', 'frb_cmt');
