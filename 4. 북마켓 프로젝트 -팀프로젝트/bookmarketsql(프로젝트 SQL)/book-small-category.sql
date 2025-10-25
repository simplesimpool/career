select * from BookSmallCategory;
desc BookSmallCategory;
---------------------------------------------------------------------국내
insert into BookSmallCategory values (1, 1, '만화');--만화
insert into BookSmallCategory values (2, 1, '소설');--소설
insert into BookSmallCategory values (3, 1, '경제');--경제
insert into BookSmallCategory values (4, 1, '정치');--정치
insert into BookSmallCategory values (5, 1, '어린이');--어린이
----------------------------------------------------------------------국외
insert into BookSmallCategory values (6, 2, '영어');--영어
insert into BookSmallCategory values (7, 2, '일본어');--일본
insert into BookSmallCategory values (8, 2, '중국어');--중국
insert into BookSmallCategory values (9, 2, '기타');--기타
------------------------------------------------------------------------ebook
insert into BookSmallCategory values (10, 3, '과학');--과학
insert into BookSmallCategory values (11, 3, '로맨스');--로맨스
insert into BookSmallCategory values (12, 3, '헬스');--헬스
insert into BookSmallCategory values (13, 3, '역사');--역사
insert into BookSmallCategory values (14, 3, '요리');--요리

update BookSmallCategory set bsc_name = '만화' where bsc_id = 1;
update BookSmallCategory set bsc_name = '소설' where bsc_id = 2;
update BookSmallCategory set bsc_name = '경제' where bsc_id = 3;
update BookSmallCategory set bsc_name = '정치' where bsc_id = 4;
update BookSmallCategory set bsc_name = '어린이' where bsc_id = 5;
update BookSmallCategory set bsc_name = '영어' where bsc_id = 6;
update BookSmallCategory set bsc_name = '일본' where bsc_id = 7;
update BookSmallCategory set bsc_name = '중국' where bsc_id = 8;
update BookSmallCategory set bsc_name = '기타' where bsc_id = 9;
update BookSmallCategory set bsc_name = '과학' where bsc_id = 10;
update BookSmallCategory set bsc_name = '로맨스' where bsc_id = 11;
update BookSmallCategory set bsc_name = '헬스' where bsc_id = 12;
update BookSmallCategory set bsc_name = '역사' where bsc_id = 13;
update BookSmallCategory set bsc_name = '요리' where bsc_id = 14;
---------------------------------------------------------------------