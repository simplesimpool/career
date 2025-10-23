select * from questionBoardCmt;
select * from questionBoardCmt where qsb_cmt_del = 'n' and qsb_id = 510 order by qsb_cmt_date desc;
select count(*) from questionBoardCmt where qsb_cmt_del = 'n' and qsb_id = 510;
desc questionBoardCmt;
delete from questionBoardCmt;
select count(*) from questionBoardCmt where qsb_cmt_del = 'n' and qsb_id = 510;
--------------------------------------------------------------------------------------
SELECT * --해당게시판에 대한 답변글 가져오기
    FROM (
        SELECT questionBoardCmt.*, ROW_NUMBER() OVER (ORDER BY qsb_cmt_date DESC, qsb_cmt_id desc) AS rnum
        FROM questionBoardCmt
        WHERE qsb_cmt_del = 'n' and qsb_id = 758
    )
WHERE rnum BETWEEN 1 AND 9999;

SELECT rnum - 1 --해당게시판에 대한 답변글 인덱스 가져오기
    FROM (
        SELECT questionBoardCmt.*, ROW_NUMBER() OVER (ORDER BY qsb_cmt_date DESC, qsb_cmt_id desc) AS rnum
        FROM questionBoardCmt
        WHERE qsb_cmt_del = 'n' and qsb_id = 774
    )where qsb_cmt_id = 1495;
-----------------------------------------------------------------------------------------------
UPDATE questionBoardCmt
SET qsb_cmt_del = 'y'
WHERE qsb_cmt_id IN (
    SELECT qsb_cmt_id
    FROM questionBoardCmt
    WHERE qsb_id = 1410
);