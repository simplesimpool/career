select * from reviewBoardCmt;
desc reviewBoardCmt;
delete from reviewBoardCmt;
select count(*) from reviewBoardCmt where rvb_cmt_del = 'n' and rvb_id = 713;
select * from reviewBoardCmt where rvb_cmt_del = 'n' and rvb_id = 713 order by rvb_cmt_date desc;
------------------------------------------------------------------------------------------------------------------
SELECT * --�ش� �Խ��ǿ� ���� ����Ʈ ��������
    FROM (
        SELECT reviewBoardCmt.*, ROW_NUMBER() OVER (ORDER BY rvb_cmt_date DESC, rvb_cmt_id desc) AS rnum
        FROM reviewBoardCmt
        WHERE rvb_cmt_del = 'n' and rvb_id = 1003
    )
WHERE rnum BETWEEN 1 AND 9999;

SELECT rnum - 1 --�ش� �Խ��ǿ� ��� �ε��� ��������
    FROM (
        SELECT reviewBoardCmt.*, ROW_NUMBER() OVER (ORDER BY rvb_cmt_date DESC, rvb_cmt_id desc) AS rnum
        FROM reviewBoardCmt
        WHERE rvb_cmt_del = 'n' and rvb_id = 1003
    )where rvb_cmt_id = 329;

SELECT * --���� ���̵� ���� ����Ʈ ��������
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
