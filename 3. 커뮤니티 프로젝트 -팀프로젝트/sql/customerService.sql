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
insert into customerService values(cs_seq.nextval, 'userId2', '테스트1', '테스트내용1', sysdate, 0, 'n', 0, -1, 'cs');
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
select * from ( -- 답변 쿼리
    select f_qry.*, rownum as rnum from (
        SELECT * FROM (
            SELECT * FROM customerService
            WHERE user_id = 'admin' AND cs_level > 0 AND cs_del = 'n'
            ORDER BY cs_reg_date DESC, cs_id DESC
        )
    )f_qry
)where rnum between 1 and 9999;

select * from ( -- 공지사항 쿼리
    select f_qry.*, rownum as rnum from (
        SELECT * FROM (
            SELECT * FROM customerService
            WHERE user_id = 'admin' AND cs_level = 0 AND cs_del = 'n'
            ORDER BY cs_reg_date DESC, cs_id DESC
        )
    )f_qry
)where rnum between 1 and 9999;

select * from ( -- 공지사항 포함 쿼리
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
            START WITH cs_parent_id = -1  -- 부모 ID를 기준으로 시작
            CONNECT BY PRIOR CS_ID = CS_PARENT_ID  -- 부모-자식 관계 설정
            ORDER SIBLINGS BY cs_reg_date DESC, cs_id DESC  -- 같은 레벨에서 날짜 순으로 정렬
        )
    )f_qry
)where rnum between 1 and 9999;

select * from ( -- 유저아이디로 리스트 가져오기
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
            START WITH cs_parent_id = -1  -- 부모 ID를 기준으로 시작
            CONNECT BY PRIOR CS_ID = CS_PARENT_ID  -- 부모-자식 관계 설정
            ORDER SIBLINGS BY cs_reg_date DESC, cs_id DESC  -- 같은 레벨에서 날짜 순으로 정렬
        )
    )f_qry where user_id = 'userId1'
)where rnum between 1 and 9999;

select rnum - 1 from ( -- 인덱스 가져오기
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
            START WITH cs_parent_id = -1  -- 부모 ID를 기준으로 시작
            CONNECT BY PRIOR CS_ID = CS_PARENT_ID  -- 부모-자식 관계 설정
            ORDER SIBLINGS BY cs_reg_date DESC, cs_id DESC  -- 같은 레벨에서 날짜 순으로 정렬
        )
    )f_qry
)where cs_id = 3473;
-----------------------------------------------------------------------------------------------------------------------------
UPDATE customerService
SET cs_del = 'y'
WHERE cs_id IN (
    SELECT cs_id
    FROM customerService
    START WITH cs_id = 1510  -- 루트 노드를 지정 (최상위 관리자)
    CONNECT BY PRIOR cs_id = cs_parent_id  -- 부모-자식 관계를 정의
);

DECLARE
  v_start_num NUMBER := 1; -- 시작 값
  v_end_num NUMBER := 234;  -- 종료 값
BEGIN
  FOR i IN v_start_num..v_end_num LOOP
   insert into customerService values(
   cs_seq.nextval, 
   'userId1', 'csTitle' || i, 'csContent' || i, sysdate, 0, 'n', 0, -1, 'cs');
  END LOOP;
  COMMIT; -- 트랜잭션 커밋
END;
--------------------------------------------------------------------------------------------------------------------