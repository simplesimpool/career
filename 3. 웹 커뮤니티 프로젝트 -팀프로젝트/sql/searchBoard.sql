select f_qry.*, rownum as rnum from (--전체 검색
    select * from (
            select * from (
                select frb_id id, user_id, frb_title title, frb_content content,
                frb_reg_date reg_date, frb_view_cnt view_cnt, frb_del del, frb_category category 
                from (select * from freeBoard where frb_del = 'n' and user_id != 'admin' order by frb_reg_date desc, frb_id desc)
                union all
                select cs_id, user_id, cs_title, cs_content, cs_reg_date, cs_view_cnt, cs_del, cs_category
                from (select * from customerService where cs_del = 'n' and user_id != 'admin' order by cs_reg_date desc, cs_id desc)
                union all
                select mib_id, user_id, mib_title, mib_content, mib_reg_date, mib_view_cnt, mib_del, mib_category
                from (select * from mediInfoBoard where mib_del = 'n' and user_id != 'admin' order by mib_reg_date desc, mib_id desc)
                union all
                select qsb_id, user_id, qsb_title, qsb_content, qsb_reg_date, qsb_view_cnt, qsb_del, qsb_category
                from (select * from questionBoard where qsb_del = 'n' and user_id != 'admin' order by qsb_reg_date desc, qsb_id desc)
                union all
                select rvb_id, user_id, rvb_title, rvb_content, rvb_reg_date, rvb_view_cnt, rvb_del, rvb_category
                from (select * from reviewBoard where rvb_del = 'n' and user_id != 'admin' order by rvb_reg_date desc, rvb_id desc)
            )
        )
)f_qry;
---------------------------------------------------------------------------------------------------------------------------
select f_qry.*, rownum as rnum from (--제목+내용 전체 검색
    select * from (
            select * from (
                select frb_id id, user_id, frb_title title, frb_content content,
                frb_reg_date reg_date, frb_view_cnt view_cnt, frb_del del, frb_category category 
                from (select * from freeBoard where frb_del = 'n' and user_id != 'admin' order by frb_reg_date desc, frb_id desc)
                union all
                select cs_id, user_id, cs_title, cs_content, cs_reg_date, cs_view_cnt, cs_del, cs_category
                from (select * from customerService where cs_del = 'n' and user_id != 'admin' order by cs_reg_date desc, cs_id desc)
                union all
                select mib_id, user_id, mib_title, mib_content, mib_reg_date, mib_view_cnt, mib_del, mib_category
                from (select * from mediInfoBoard where mib_del = 'n' and user_id != 'admin' order by mib_reg_date desc, mib_id desc)
                union all
                select qsb_id, user_id, qsb_title, qsb_content, qsb_reg_date, qsb_view_cnt, qsb_del, qsb_category
                from (select * from questionBoard where qsb_del = 'n' and user_id != 'admin' order by qsb_reg_date desc, qsb_id desc)
                union all
                select rvb_id, user_id, rvb_title, rvb_content, rvb_reg_date, rvb_view_cnt, rvb_del, rvb_category
                from (select * from reviewBoard where rvb_del = 'n' and user_id != 'admin' order by rvb_reg_date desc, rvb_id desc)
            )
        )
)f_qry where title like '%' || 'frb' || '%' or content like '%' || 'frb' || '%';
----------------------------------------------------------------------------------------------------------------------------
select count(*) from ( --제목 + 내용으로 total
    select * from (
            select * from (
                select frb_id id, user_id, frb_title title, frb_content content,
                frb_reg_date reg_date, frb_view_cnt view_cnt, frb_del del, frb_category category 
                from (select * from freeBoard where frb_del = 'n' and user_id != 'admin' order by frb_reg_date desc, frb_id desc)
                union all
                select cs_id, user_id, cs_title, cs_content, cs_reg_date, cs_view_cnt, cs_del, cs_category
                from (select * from customerService where cs_del = 'n' and user_id != 'admin' order by cs_reg_date desc, cs_id desc)
                union all
                select mib_id, user_id, mib_title, mib_content, mib_reg_date, mib_view_cnt, mib_del, mib_category
                from (select * from mediInfoBoard where mib_del = 'n' and user_id != 'admin' order by mib_reg_date desc, mib_id desc)
                union all
                select qsb_id, user_id, qsb_title, qsb_content, qsb_reg_date, qsb_view_cnt, qsb_del, qsb_category
                from (select * from questionBoard where qsb_del = 'n' and user_id != 'admin' order by qsb_reg_date desc, qsb_id desc)
                union all
                select rvb_id, user_id, rvb_title, rvb_content, rvb_reg_date, rvb_view_cnt, rvb_del, rvb_category
                from (select * from reviewBoard where rvb_del = 'n' and user_id != 'admin' order by rvb_reg_date desc, rvb_id desc)
            )
        )
)f_qry where title like '%' || 'frb' || '%' or content like '%' || 'frb' || '%';

select count(*) from (--유저 아이디로 total
    select * from (
            select * from (
                select frb_id id, user_id, frb_title title, frb_content content,
                frb_reg_date reg_date, frb_view_cnt view_cnt, frb_del del, frb_category category 
                from (select * from freeBoard where frb_del = 'n' and user_id != 'admin' order by frb_reg_date desc, frb_id desc)
                union all
                select cs_id, user_id, cs_title, cs_content, cs_reg_date, cs_view_cnt, cs_del, cs_category
                from (select * from customerService where cs_del = 'n' and user_id != 'admin' order by cs_reg_date desc, cs_id desc)
                union all
                select mib_id, user_id, mib_title, mib_content, mib_reg_date, mib_view_cnt, mib_del, mib_category
                from (select * from mediInfoBoard where mib_del = 'n' and user_id != 'admin' order by mib_reg_date desc, mib_id desc)
                union all
                select qsb_id, user_id, qsb_title, qsb_content, qsb_reg_date, qsb_view_cnt, qsb_del, qsb_category
                from (select * from questionBoard where qsb_del = 'n' and user_id != 'admin' order by qsb_reg_date desc, qsb_id desc)
                union all
                select rvb_id, user_id, rvb_title, rvb_content, rvb_reg_date, rvb_view_cnt, rvb_del, rvb_category
                from (select * from reviewBoard where rvb_del = 'n' and user_id != 'admin' order by rvb_reg_date desc, rvb_id desc)
            )
        )
)f_qry where user_id = 'userId2';

select count(*) from (--전체 공지사항 갯수 가져오기
    select * from (
            select * from (
                select frb_id id, user_id, frb_title title, frb_content content,
                frb_reg_date reg_date, frb_view_cnt view_cnt, frb_del del, frb_category category 
                from (select * from freeBoard where frb_del = 'n' and user_id = 'admin' order by frb_reg_date desc, frb_id desc)
                union all
                select cs_id, user_id, cs_title, cs_content, cs_reg_date, cs_view_cnt, cs_del, cs_category
                from (select * from customerService where cs_del = 'n' and user_id = 'admin' and cs_level = 0 order by cs_reg_date desc, cs_id desc)
                union all
                select mib_id, user_id, mib_title, mib_content, mib_reg_date, mib_view_cnt, mib_del, mib_category
                from (select * from mediInfoBoard where mib_del = 'n' and user_id = 'admin' order by mib_reg_date desc, mib_id desc)
                union all
                select qsb_id, user_id, qsb_title, qsb_content, qsb_reg_date, qsb_view_cnt, qsb_del, qsb_category
                from (select * from questionBoard where qsb_del = 'n' and user_id = 'admin' order by qsb_reg_date desc, qsb_id desc)
                union all
                select rvb_id, user_id, rvb_title, rvb_content, rvb_reg_date, rvb_view_cnt, rvb_del, rvb_category
                from (select * from reviewBoard where rvb_del = 'n' and user_id = 'admin' order by rvb_reg_date desc, rvb_id desc)
            )
        )
)f_qry;
----------------------------------------------------------------------------------------------------------------------------
select * from( --제목 + 내용 리스트 가져오기
    select f_qry.*, rownum as rnum from (
        select * from (
                select * from (
                    select frb_id id, user_id, frb_title title, frb_content content,
                    frb_reg_date reg_date, frb_view_cnt view_cnt, frb_del del, frb_category category 
                    from (select * from freeBoard where frb_del = 'n' and user_id != 'admin' order by frb_reg_date desc, frb_id desc)
                    union all
                    select cs_id, user_id, cs_title, cs_content, cs_reg_date, cs_view_cnt, cs_del, cs_category
                    from (select * from customerService where cs_del = 'n' and user_id != 'admin' order by cs_reg_date desc, cs_id desc)
                    union all
                    select mib_id, user_id, mib_title, mib_content, mib_reg_date, mib_view_cnt, mib_del, mib_category
                    from (select * from mediInfoBoard where mib_del = 'n' and user_id != 'admin' order by mib_reg_date desc, mib_id desc)
                    union all
                    select qsb_id, user_id, qsb_title, qsb_content, qsb_reg_date, qsb_view_cnt, qsb_del, qsb_category
                    from (select * from questionBoard where qsb_del = 'n' and user_id != 'admin' order by qsb_reg_date desc, qsb_id desc)
                    union all
                    select rvb_id, user_id, rvb_title, rvb_content, rvb_reg_date, rvb_view_cnt, rvb_del, rvb_category
                    from (select * from reviewBoard where rvb_del = 'n' and user_id != 'admin' order by rvb_reg_date desc, rvb_id desc)
                )
            )
    )f_qry where (title like '%' || 'cs' || '%' or content like '%' || 'cs' || '%')
)where rnum between 1 and 9999;

select * from( --유저 아이디로 리스트 가져오기
    select f_qry.*, rownum as rnum from (
        select * from (
                select * from (
                    select frb_id id, user_id, frb_title title, frb_content content,
                    frb_reg_date reg_date, frb_view_cnt view_cnt, frb_del del, frb_category category 
                    from (select * from freeBoard where frb_del = 'n' and user_id != 'admin' order by frb_reg_date desc, frb_id desc)
                    union all
                    select cs_id, user_id, cs_title, cs_content, cs_reg_date, cs_view_cnt, cs_del, cs_category
                    from (select * from customerService where cs_del = 'n' and user_id != 'admin' order by cs_reg_date desc, cs_id desc)
                    union all
                    select mib_id, user_id, mib_title, mib_content, mib_reg_date, mib_view_cnt, mib_del, mib_category
                    from (select * from mediInfoBoard where mib_del = 'n' and user_id != 'admin' order by mib_reg_date desc, mib_id desc)
                    union all
                    select qsb_id, user_id, qsb_title, qsb_content, qsb_reg_date, qsb_view_cnt, qsb_del, qsb_category
                    from (select * from questionBoard where qsb_del = 'n' and user_id != 'admin' order by qsb_reg_date desc, qsb_id desc)
                    union all
                    select rvb_id, user_id, rvb_title, rvb_content, rvb_reg_date, rvb_view_cnt, rvb_del, rvb_category
                    from (select * from reviewBoard where rvb_del = 'n' and user_id != 'admin' order by rvb_reg_date desc, rvb_id desc)
                )
            )
    )f_qry where (user_id = 'userId3')
)where rnum between 1 and 9999;

select * from( --공지사항 리스트 가져오기
    select f_qry.*, rownum as rnum from (
        select * from (
                select * from (
                    select frb_id id, user_id, frb_title title, frb_content content,
                    frb_reg_date reg_date, frb_view_cnt view_cnt, frb_del del, frb_category category 
                    from (select * from freeBoard where frb_del = 'n' and user_id = 'admin' order by frb_reg_date desc, frb_id desc)
                    union all
                    select cs_id, user_id, cs_title, cs_content, cs_reg_date, cs_view_cnt, cs_del, cs_category
                    from (select * from customerService where cs_del = 'n' and user_id = 'admin' and cs_level = 0 order by cs_reg_date desc, cs_id desc)
                    union all
                    select mib_id, user_id, mib_title, mib_content, mib_reg_date, mib_view_cnt, mib_del, mib_category
                    from (select * from mediInfoBoard where mib_del = 'n' and user_id = 'admin' order by mib_reg_date desc, mib_id desc)
                    union all
                    select qsb_id, user_id, qsb_title, qsb_content, qsb_reg_date, qsb_view_cnt, qsb_del, qsb_category
                    from (select * from questionBoard where qsb_del = 'n' and user_id = 'admin' order by qsb_reg_date desc, qsb_id desc)
                    union all
                    select rvb_id, user_id, rvb_title, rvb_content, rvb_reg_date, rvb_view_cnt, rvb_del, rvb_category
                    from (select * from reviewBoard where rvb_del = 'n' and user_id = 'admin' order by rvb_reg_date desc, rvb_id desc)
                )
            )
    )f_qry
)where rnum between 1 and 9999;