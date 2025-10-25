select * from reviewBoardCmt;
desc reviewBoardCmt;
delete from reviewBoardCmt;
select count(*) from reviewBoardCmt where rvb_cmt_del = 'n' and rvb_id = 713;
select * from reviewBoardCmt where rvb_cmt_del = 'n' and rvb_id = 713 order by rvb_cmt_date desc;
------------------------------------------------------------------------------------------------------------------
SELECT * --해당 게시판에 대한 리스트 가져오기
    FROM (
        SELECT reviewBoardCmt.*, ROW_NUMBER() OVER (ORDER BY rvb_cmt_date DESC, rvb_cmt_id desc) AS rnum
        FROM reviewBoardCmt
        WHERE rvb_cmt_del = 'n' and rvb_id = 1003
    )
WHERE rnum BETWEEN 1 AND 9999;

SELECT rnum - 1 --해당 게시판에 댓글 인덱스 가져오기
    FROM (
        SELECT reviewBoardCmt.*, ROW_NUMBER() OVER (ORDER BY rvb_cmt_date DESC, rvb_cmt_id desc) AS rnum
        FROM reviewBoardCmt
        WHERE rvb_cmt_del = 'n' and rvb_id = 1003
    )where rvb_cmt_id = 329;

SELECT * --유저 아이디에 대한 리스트 가져오기
    FROM (
        SELECT reviewBoardCmt.*, ROW_NUMBER() OVER (ORDER BY rvb_cmt_date DESC, rvb_cmt_id desc) AS rnum
        FROM reviewBoardCmt
        WHERE rvb_cmt_del = 'n' and user_id = 'userId1'
    )
WHERE rnum BETWEEN 1 AND 9999;
--------------------------------------------------------------------------------------------------------------------
UPDATE reviewBoardCmt
SET rvb_cmt_del = 'y'
WHERE rvb_cmt_id IN (
    SELECT rvb_cmt_id
    FROM reviewBoardCmt
    WHERE rvb_id = 724
);
