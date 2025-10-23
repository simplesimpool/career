insert into doctorLicense values('111111');
insert into doctorLicense values('222222');
insert into doctorLicense values('333333');
insert into doctorLicense values('444444');
insert into doctorLicense values('555555');
insert into doctorLicense values('666666');
insert into doctorLicense values('777777');
insert into doctorLicense values('888888');
insert into doctorLicense values('999999');
---------------------------------------------------------------------------------------------------------------
select * from doctorLicense;
select * from doctorLicense order by dr_lic_code desc;
desc doctorLicense;
---------------------------------------------------------------------------------------------------------------
--DECLARE
--  v_start_num NUMBER := 10000; -- 시작 값
--  v_end_num NUMBER := 99999;  -- 종료 값
--BEGIN
--  FOR i IN v_start_num..v_end_num LOOP
--    insert into doctorLicense values('0' || i);
--  END LOOP;
--  COMMIT; -- 트랜잭션 커밋
--END;