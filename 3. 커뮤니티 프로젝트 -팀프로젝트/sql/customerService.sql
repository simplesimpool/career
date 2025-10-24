select * from customerService;
select * from customerService order by cs_reg_date desc, cs_id desc;
desc customerService;
delete from customerService;
select count(*) from customerService where cs_del = 'n';
select count(*) from customerService where user_id = 'admin' and cs_del = 'n';
select count(*) from customerService where user_id = 'admin' and cs_level = 0 and cs_del = 'n';
select count(*) from customerService where user_id = 'admin' and cs_level > 0 and cs_del = 'n';
select count(*) from customerService where user_id != 'admin' and cs_del = 'n';
---------------------------------------------------------------------------------------------------------------------
insert into customerService values(cs_seq.nextval, 'userId2', '�׽�Ʈ1', '�׽�Ʈ����1', sysdate, 0, 'n', 0, -1, 'cs');
select count(*) from customerService;
select * from customerService where user_id = 'admin';
ALTER TABLE customerService MODIFY cs_title VARCHAR2(60);
ALTER TABLE customerService MODIFY cs_content VARCHAR2(2400);
----------------------------------------------------------------------------------------------------------------------
SELECT *
FROM (
    SELECT t.*, ROWNUM AS rnum
    FROM (
        SELECT * 
        FROM customerService 
        WHERE cs_del = 'n' 
        ORDER BY cs_reg_date desc
    ) t
    START WITH cs_parent_id = -1
    CONNECT BY PRIOR cs_id = cs_parent_id
    ORDER SIBLINGS BY cs_reg_date desc
) WHERE rnum BETWEEN 1 AND 9999;
----------------------------------------------------------------------------------------------------------------------
select * from ( -- �亯 ����
    select f_qry.*, rownum as rnum from (
        SELECT * FROM (
            SELECT * FROM customerService
            WHERE user_id = 'admin' AND cs_level > 0 AND cs_del = 'n'
            ORDER BY cs_reg_date DESC, cs_id DESC
        )
    )f_qry
)where rnum between 1 and 9999;

select * from ( -- �������� ����
    select f_qry.*, rownum as rnum from (
        SELECT * FROM (
            SELECT * FROM customerService
            WHERE user_id = 'admin' AND cs_level = 0 AND cs_del = 'n'
            ORDER BY cs_reg_date DESC, cs_id DESC
        )
    )f_qry
)where rnum between 1 and 9999;

select * from ( -- �������� ���� ����
    select f_qry.*, rownum as rnum from (
        SELECT * FROM (
            SELECT * FROM customerService
            WHERE user_id = 'admin' AND cs_level = 0 AND cs_del = 'n'
            ORDER BY cs_reg_date DESC, cs_id DESC
        )
        UNION ALL
        select * from (
            SELECT * FROM customerService 
            where not (user_id = 'admin' and cs_level = 0) and cs_del = 'n'
            START WITH cs_parent_id = -1  -- �θ� ID�� �������� ����
            CONNECT BY PRIOR CS_ID = CS_PARENT_ID  -- �θ�-�ڽ� ���� ����
            ORDER SIBLINGS BY cs_reg_date DESC, cs_id DESC  -- ���� �������� ��¥ ������ ����
        )
    )f_qry
)where rnum between 1 and 9999;

select * from ( -- �������̵�� ����Ʈ ��������
    select f_qry.*, rownum as rnum from (
        SELECT * FROM (
            SELECT * FROM customerService
            WHERE user_id = 'admin' AND cs_level = 0 AND cs_del = 'n'
            ORDER BY cs_reg_date DESC, cs_id DESC
        )
        UNION ALL
        select * from (
            SELECT * FROM customerService 
            where not (user_id = 'admin' and cs_level = 0) and cs_del = 'n'
            START WITH cs_parent_id = -1  -- �θ� ID�� �������� ����
            CONNECT BY PRIOR CS_ID = CS_PARENT_ID  -- �θ�-�ڽ� ���� ����
            ORDER SIBLINGS BY cs_reg_date DESC, cs_id DESC  -- ���� �������� ��¥ ������ ����
        )
    )f_qry where user_id = 'userId1'
)where rnum between 1 and 9999;

select rnum - 1 from ( -- �ε��� ��������
    select f_qry.*, rownum as rnum from (
        SELECT * FROM (
            SELECT * FROM customerService
            WHERE user_id = 'admin' AND cs_level = 0 AND cs_del = 'n'
            ORDER BY cs_reg_date DESC, cs_id DESC
        )
        UNION ALL
        select * from (
            SELECT * FROM customerService 
            where not (user_id = 'admin' and cs_level = 0) and cs_del = 'n'
            START WITH cs_parent_id = -1  -- �θ� ID�� �������� ����
            CONNECT BY PRIOR CS_ID = CS_PARENT_ID  -- �θ�-�ڽ� ���� ����
            ORDER SIBLINGS BY cs_reg_date DESC, cs_id DESC  -- ���� �������� ��¥ ������ ����
        )
    )f_qry
)where cs_id = 3473;
-----------------------------------------------------------------------------------------------------------------------------
UPDATE customerService
SET cs_del = 'y'
WHERE cs_id IN (
    SELECT cs_id
    FROM customerService
    START WITH cs_id = 1510  -- ��Ʈ ��带 ���� (�ֻ��� ������)
    CONNECT BY PRIOR cs_id = cs_parent_id  -- �θ�-�ڽ� ���踦 ����
);

DECLARE
  v_start_num NUMBER := 1; -- ���� ��
  v_end_num NUMBER := 234;  -- ���� ��
BEGIN
  FOR i IN v_start_num..v_end_num LOOP
   insert into customerService values(
   cs_seq.nextval, 
   'userId1', 'csTitle' || i, 'csContent' || i, sysdate, 0, 'n', 0, -1, 'cs');
  END LOOP;
  COMMIT; -- Ʈ����� Ŀ��
END;
--------------------------------------------------------------------------------------------------------------------