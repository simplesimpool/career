select * from BookRecommendation;
delete from BookRecommendation;
------------------------------------------------------------------------------------------------------------------------
select * from BookRecommendation --유저아이디,책아이디, 년,월,일에 대한 데이터 가져오기
where rcd_date like to_date('2025-04-07', 'YYYY-MM-DD')
and user_id = 'userId1'
and book_id = 616;
-------------------------------------------------------------------------------------------------------------------------
insert into BookRecommendation values ((select count(*) from BookRecommendation) + 1, 
'userId1', 616, TO_DATE('2025-04-05 15:30:45', 'YYYY-MM-DD HH24:MI:SS'));
insert into BookRecommendation values ((select count(*) from BookRecommendation) + 1,
'userId1', 616, TO_DATE('2025-04-06 15:30:45', 'YYYY-MM-DD HH24:MI:SS'));
insert into BookRecommendation values ((select count(*) from BookRecommendation) + 1,
'userId1', 616, TO_DATE('2025-04-07 15:30:45', 'YYYY-MM-DD HH24:MI:SS'));