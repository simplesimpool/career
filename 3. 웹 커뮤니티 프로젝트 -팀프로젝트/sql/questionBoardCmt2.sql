select * from questionBoardCmt2;
select * from questionBoardCmt2 order by qsb_cmt2_date desc;
delete from questionBoardCmt2;
desc questionBoardCmt2;
select count(*) from questionBoardCmt2 where qsb_cmt2_del = 'n' and qsb_id = 510 and qsb_cmt_id = 1174;
-------------------------------------------------------------------------------------------------------------------
select * from (
    select f_qry.*, rownum as rnum from (
        SELECT * FROM questionBoardCmt2
        where qsb_cmt2_del = 'n' and qsb_id = 758 and qsb_cmt_id = 1497
        START WITH qsb_cmt2_parent_id = -1
        CONNECT BY PRIOR qsb_cmt2_id = qsb_cmt2_parent_id 
        ORDER SIBLINGS BY qsb_cmt2_date DESC, qsb_cmt2_id DESC 
    )f_qry
)where rnum between 1 and 9999;

select rnum - 1 from ( --�ش� �Խ��ǰ� �ش� cmt������ cmt2 �ε��� ��������
    select f_qry.*, rownum as rnum from (
        SELECT * FROM questionBoardCmt2
        where qsb_cmt2_del = 'n' and qsb_id = 758 and qsb_cmt_id = 1497
        START WITH qsb_cmt2_parent_id = -1
        CONNECT BY PRIOR qsb_cmt2_id = qsb_cmt2_parent_id 
        ORDER SIBLINGS BY qsb_cmt2_date DESC, qsb_cmt2_id DESC 
    )f_qry
)where qsb_cmt2_id = 1252;
----------------------------------------------------------------------------------------------------------------------
UPDATE questionBoardCmt2
SET qsb_cmt2_del = 'y'
WHERE qsb_cmt2_id IN (
    SELECT qsb_cmt2_id
    FROM questionBoardCmt2
    WHERE qsb_cmt_id = 1410
);

UPDATE questionBoardCmt2
SET qsb_cmt2_del = 'y'
WHERE qsb_cmt2_id IN (
    SELECT qsb_cmt2_id
    FROM questionBoardCmt2
    WHERE qsb_id = 1410
);

UPDATE questionBoardCmt2
SET qsb_cmt2_del = 'y'
WHERE qsb_cmt2_id IN (
    SELECT qsb_cmt2_id
    FROM questionBoardCmt2
    START WITH qsb_cmt2_id = 911  -- ��Ʈ ��带 ���� (�ֻ��� ������)
    CONNECT BY PRIOR qsb_cmt2_id = qsb_cmt2_parent_id  -- �θ�-�ڽ� ���踦 ����
);
-------------------------------------------------------------------------------------------------------------------------
insert into questionBoardCmt2 values(qsb_cmt2_seq.nextval, 'userId1', 510, 1174, '�׽�Ʈ1', sysdate, 'n', 0, -1, 'qsb_cmt2');
insert into questionBoardCmt2 values(qsb_cmt2_seq.nextval, 'userId1', 510, 1175, '�׽�Ʈ2', sysdate, 'n', 0, -1, 'qsb_cmt2');