select count(*) from (--유저 아이디로 total
    select * from (
            select * from (
                select frb_cmt_id as cmt_id, user_id, frb_id as board_id, frb_cmt_reply as cmt_reply, frb_cmt_date as cmt_date,
                frb_cmt_del as cmt_del, frb_cmt_category as cmt_category
                from (select * from freeBoardCmt where frb_cmt_del = 'n' and user_id != 'admin' order by frb_cmt_date desc, frb_cmt_id desc)
                union all
                select rvb_cmt_id as cmt_id, user_id, rvb_id as board_id, rvb_cmt_reply as cmt_reply, rvb_cmt_date as cmt_date,
                rvb_cmt_del as cmt_del, rvb_cmt_category as cmt_category
                from (select * from reviewBoardCmt where rvb_cmt_del = 'n' and user_id != 'admin' order by rvb_cmt_date desc, rvb_cmt_id desc)
                union all 
                select qsb_cmt_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt_reply as cmt_reply, qsb_cmt_date as cmt_date,
                qsb_cmt_del as cmt_del, qsb_cmt_category as cmt_category
                from (select * from questionBoardCmt where qsb_cmt_del = 'n' and user_id != 'admin' order by qsb_cmt_date desc, qsb_cmt_id desc)
                union all
                select qsb_cmt2_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt2_reply as cmt_reply, qsb_cmt2_date as cmt_date,
                qsb_cmt2_del as cmt_del, qsb_cmt2_category as cmt_category
                from (select * from questionBoardCmt2 where qsb_cmt2_del = 'n' and user_id != 'admin' order by qsb_cmt2_date desc, qsb_cmt2_id desc)
            )
        )
)f_qry where user_id = 'userId1';

select count(*) from (--유저 아이디로 질문게시판 total
    select * from (
            select * from (
                select qsb_cmt_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt_reply as cmt_reply, qsb_cmt_date as cmt_date,
                qsb_cmt_del as cmt_del, qsb_cmt_category as cmt_category
                from (select * from questionBoardCmt where qsb_cmt_del = 'n' and user_id != 'admin' order by qsb_cmt_date desc, qsb_cmt_id desc)
                union all
                select qsb_cmt2_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt2_reply as cmt_reply, qsb_cmt2_date as cmt_date,
                qsb_cmt2_del as cmt_del, qsb_cmt2_category as cmt_category
                from (select * from questionBoardCmt2 where qsb_cmt2_del = 'n' and user_id != 'admin' order by qsb_cmt2_date desc, qsb_cmt2_id desc)
            )
        )
)f_qry where user_id = 'userId1';
-----------------------------------------------------------------------------------------------------------------------------
select f_qry.*, rownum as rnum from (--전체 검색
    select * from (
            select * from (
                select frb_cmt_id as cmt_id, user_id, frb_id as board_id, frb_cmt_reply as cmt_reply, frb_cmt_date as cmt_date,
                frb_cmt_del as cmt_del, frb_cmt_category as cmt_category
                from (select * from freeBoardCmt where frb_cmt_del = 'n' and user_id != 'admin' order by frb_cmt_date desc, frb_cmt_id desc)
                union all
                select rvb_cmt_id as cmt_id, user_id, rvb_id as board_id, rvb_cmt_reply as cmt_reply, rvb_cmt_date as cmt_date,
                rvb_cmt_del as cmt_del, rvb_cmt_category as cmt_category
                from (select * from reviewBoardCmt where rvb_cmt_del = 'n' and user_id != 'admin' order by rvb_cmt_date desc, rvb_cmt_id desc)
                union all 
                select qsb_cmt_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt_reply as cmt_reply, qsb_cmt_date as cmt_date,
                qsb_cmt_del as cmt_del, qsb_cmt_category as cmt_category
                from (select * from questionBoardCmt where qsb_cmt_del = 'n' and user_id != 'admin' order by qsb_cmt_date desc, qsb_cmt_id desc)
                union all
                select qsb_cmt2_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt2_reply as cmt_reply, qsb_cmt2_date as cmt_date,
                qsb_cmt2_del as cmt_del, qsb_cmt2_category as cmt_category
                from (select * from questionBoardCmt2 where qsb_cmt2_del = 'n' and user_id != 'admin' order by qsb_cmt2_date desc, qsb_cmt2_id desc)
            )
        )
)f_qry;

select f_qry.*, rownum as rnum from (--cmt_id로 검색
    select * from (
            select * from (
                select frb_cmt_id as cmt_id, user_id, frb_id as board_id, frb_cmt_reply as cmt_reply, frb_cmt_date as cmt_date,
                frb_cmt_del as cmt_del, frb_cmt_category as cmt_category
                from (select * from freeBoardCmt where frb_cmt_del = 'n' and user_id != 'admin' order by frb_cmt_date desc, frb_cmt_id desc)
                union all
                select rvb_cmt_id as cmt_id, user_id, rvb_id as board_id, rvb_cmt_reply as cmt_reply, rvb_cmt_date as cmt_date,
                rvb_cmt_del as cmt_del, rvb_cmt_category as cmt_category
                from (select * from reviewBoardCmt where rvb_cmt_del = 'n' and user_id != 'admin' order by rvb_cmt_date desc, rvb_cmt_id desc)
                union all 
                select qsb_cmt_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt_reply as cmt_reply, qsb_cmt_date as cmt_date,
                qsb_cmt_del as cmt_del, qsb_cmt_category as cmt_category
                from (select * from questionBoardCmt where qsb_cmt_del = 'n' and user_id != 'admin' order by qsb_cmt_date desc, qsb_cmt_id desc)
                union all
                select qsb_cmt2_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt2_reply as cmt_reply, qsb_cmt2_date as cmt_date,
                qsb_cmt2_del as cmt_del, qsb_cmt2_category as cmt_category
                from (select * from questionBoardCmt2 where qsb_cmt2_del = 'n' and user_id != 'admin' order by qsb_cmt2_date desc, qsb_cmt2_id desc)
            )
        )
)f_qry where cmt_id = '4689';

select * from(
    select f_qry.*, rownum as rnum from (--유저 아이디로 리스트 가져오기
        select * from (
                select * from (
                    select frb_cmt_id as cmt_id, user_id, frb_id as board_id, frb_cmt_reply as cmt_reply, frb_cmt_date as cmt_date,
                    frb_cmt_del as cmt_del, frb_cmt_category as cmt_category
                    from (select * from freeBoardCmt where frb_cmt_del = 'n' and user_id != 'admin' order by frb_cmt_date desc, frb_cmt_id desc)
                    union all
                    select rvb_cmt_id as cmt_id, user_id, rvb_id as board_id, rvb_cmt_reply as cmt_reply, rvb_cmt_date as cmt_date,
                    rvb_cmt_del as cmt_del, rvb_cmt_category as cmt_category
                    from (select * from reviewBoardCmt where rvb_cmt_del = 'n' and user_id != 'admin' order by rvb_cmt_date desc, rvb_cmt_id desc)
                    union all 
                    select qsb_cmt_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt_reply as cmt_reply, qsb_cmt_date as cmt_date,
                    qsb_cmt_del as cmt_del, qsb_cmt_category as cmt_category
                    from (select * from questionBoardCmt where qsb_cmt_del = 'n' and user_id != 'admin' order by qsb_cmt_date desc, qsb_cmt_id desc)
                    union all
                    select qsb_cmt2_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt2_reply as cmt_reply, qsb_cmt2_date as cmt_date,
                    qsb_cmt2_del as cmt_del, qsb_cmt2_category as cmt_category
                    from (select * from questionBoardCmt2 where qsb_cmt2_del = 'n' and user_id != 'admin' order by qsb_cmt2_date desc, qsb_cmt2_id desc)
                )
            )
    )f_qry where user_id = 'userId4'
)where rnum between 1 and 9999;

select * from(--유저 아이디로 질문게시판 댓글 전체 리스트 가져오기
    select f_qry.*, rownum as rnum from (
        select * from (
                select * from (
                    select qsb_cmt_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt_reply as cmt_reply, qsb_cmt_date as cmt_date,
                    qsb_cmt_del as cmt_del, qsb_cmt_category as cmt_category
                    from (select * from questionBoardCmt where qsb_cmt_del = 'n' and user_id != 'admin' order by qsb_cmt_date desc, qsb_cmt_id desc)
                    union all
                    select qsb_cmt2_id as cmt_id, user_id, qsb_id as board_id, qsb_cmt2_reply as cmt_reply, qsb_cmt2_date as cmt_date,
                    qsb_cmt2_del as cmt_del, qsb_cmt2_category as cmt_category
                    from (select * from questionBoardCmt2 where qsb_cmt2_del = 'n' and user_id != 'admin' order by qsb_cmt2_date desc, qsb_cmt2_id desc)
                )
            )
    )f_qry where user_id = 'userId4'
)where rnum between 1 and 9999;