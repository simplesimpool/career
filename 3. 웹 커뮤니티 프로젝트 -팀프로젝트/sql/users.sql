insert into users values
('userId1', null, '1', 'userName1', '010-1111-1111', 'userAddr1', 'n', 'nickName1', sysdate, 'email1@naver.com', 'n');
insert into users values
('userId2', '111111', '2', 'userName2', '010-2222-2222', 'userAddr2', 'n', 'nickName2', sysdate, 'email2@naver.com', 'n');
insert into users values
('userId3', null, '3', 'userName3', '010-3333-3333', 'userAddr3', 'n', 'nickName3', sysdate, 'email3@naver.com', 'n');
insert into users values
('userId4', '222222', '4', 'userName4', '010-4444-4444', 'userAddr4', 'n', 'nickName4', sysdate, 'email4@naver.com', 'n');
insert into users values
('userId5', null, '5', 'userName5', '010-5555-5555', 'userAddr5', 'n', 'nickName5', sysdate, 'email5@naver.com', 'n');
insert into users values
('userId6', '333333', '6', 'userName6', '010-6666-6666', 'userAddr6', 'n', 'nickName6', sysdate, 'email6@naver.com', 'n');
insert into users values
('userId7', null, '7', 'userName7', '010-7777-7777', 'userAddr7', 'n', 'nickName7', sysdate, 'email7@naver.com', 'n');
insert into users values
('userId8', '444444', '8', 'userName8', '010-8888-8888', 'userAddr8', 'n', 'nickName8', sysdate, 'email8@naver.com', 'n');
insert into users values
('userId9', null, '9', 'userName9', '010-9999-9999', 'userAddr9', 'n', 'nickName9', sysdate, 'email9@naver.com', 'n');
insert into users values
('admin', null, '9999', 'adminName', '010-1234-5678', 'adminAddr', 'n', '관리자', sysdate, 'admin@naver.com', 'n');
insert into users values
('userId505', '000505', '505', 'userName505', 
'userTel505', 'userAddr505', 'n', 'nickName505', sysdate, 'email505@naver.com', 'n');
-------------------------------------------------------------------------------------------------------------------------------
select * from users;
select * from users where user_id != 'admin' order by user_reg_date desc, user_id desc;
desc users;

select count(*) from users --전체 회원 갯수
where user_del = 'n' and user_id != 'admin';
select count(*) from users  --전체 일반회원 갯수
where dr_lic_code is null and user_del = 'n' and user_id != 'admin';
select count(*) from users --전체 의사회원 갯수
where dr_lic_code is not null and user_del = 'n' and user_id != 'admin';
select count(*) from users --전체 탈퇴회원 갯수
where user_del = 'y' and user_id != 'admin';

SELECT * --전체 회원 리스트
    FROM (
        SELECT users.*, ROW_NUMBER() OVER (ORDER BY user_reg_date DESC, user_id DESC) AS rnum
        FROM users
        WHERE user_del = 'n' and user_id != 'admin'
    )
WHERE rnum BETWEEN 1 AND 9999;

SELECT * --전체 일반회원 리스트
    FROM (
        SELECT users.*, ROW_NUMBER() OVER (ORDER BY user_reg_date DESC, user_id DESC) AS rnum
        FROM users
        where dr_lic_code is null and user_del = 'n' and user_id != 'admin'
    )
WHERE rnum BETWEEN 1 AND 9999;

SELECT * --전체 의사회원 리스트
    FROM (
        SELECT users.*, ROW_NUMBER() OVER (ORDER BY user_reg_date DESC, user_id DESC) AS rnum
        FROM users
        where dr_lic_code is not null and user_del = 'n' and user_id != 'admin'
    )
WHERE rnum BETWEEN 1 AND 9999;

SELECT * --전체 탈퇴회원 리스트
    FROM (
        SELECT users.*, ROW_NUMBER() OVER (ORDER BY user_reg_date DESC, user_id DESC) AS rnum
        FROM users
        where user_del = 'y' and user_id != 'admin'
    )
WHERE rnum BETWEEN 1 AND 9999;

delete from users;
delete from users where user_id = 'userId505';

desc users;
-------------------------------------------------------------------------------------------------------------------------
SELECT CHAR_LENGTH
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'USERS'  -- 테이블명 대문자
AND COLUMN_NAME = 'USER_NAME';  -- 컬럼명 대문자
------------------------------------------------------------------------------------------------------------------------
--DECLARE
--  v_start_num NUMBER := 501; -- 시작 값
--  v_end_num NUMBER := 999;  -- 종료 값
--BEGIN
--  FOR i IN v_start_num..v_end_num LOOP
--    insert into users 
--    values ('userId' || i, null, '' || i, 'userName' || i, 'userTel' || i, 
--            'userAddr' || i, 'n', 'nickName' || i, sysdate, 'email' || i || '@naver.com', 'n');
--  END LOOP;
--  COMMIT; -- 트랜잭션 커밋
--END;

DECLARE
  v_start_num NUMBER := 10; -- 시작 값
  v_end_num NUMBER := 999;  -- 종료 값
BEGIN
  FOR i IN v_start_num..v_end_num LOOP
    delete from users where user_id = 'userId' || i;
  END LOOP;
  COMMIT; -- 트랜잭션 커밋
END;
/

update users set 
user_activity = 'y'
where user_id = 'userId500';
------------------------------------------------------------------------------------------------------------------------------