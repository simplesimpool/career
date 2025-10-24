--1 페이지당 10개씩 가져오는 걸 전제로 함.

--load nest level 1 comments
SELECT * FROM PostComment WHERE post_id = 5 AND p_cmt_nest_p_id IS NULL AND ROWNUM <= 10;
-------------------------------------------------------------------------------------------
--load nest level 2 comments
SELECT lvl_1_cmt.* FROM (SELECT * FROM PostComment WHERE p_cmt_nest_p_id = 1) lvl_1_cmt
WHERE ROWNUM <= 10
START WITH p_cmt_re_p_id IS NULL
CONNECT BY PRIOR p_cmt_id = p_cmt_re_p_id
ORDER SIBLINGS BY p_cmt_id ASC;
SELECT lvl_1_cmt.* FROM (SELECT * FROM PostComment WHERE p_cmt_nest_p_id = 2) lvl_1_cmt
WHERE ROWNUM <= 10
START WITH p_cmt_re_p_id IS NULL
CONNECT BY PRIOR p_cmt_id = p_cmt_re_p_id
ORDER SIBLINGS BY p_cmt_id ASC;
SELECT lvl_1_cmt.* FROM (SELECT * FROM PostComment WHERE p_cmt_nest_p_id = 3) lvl_1_cmt
WHERE ROWNUM <= 10
START WITH p_cmt_re_p_id IS NULL
CONNECT BY PRIOR p_cmt_id = p_cmt_re_p_id
ORDER SIBLINGS BY p_cmt_id ASC;
SELECT lvl_1_cmt.* FROM (SELECT * FROM PostComment WHERE p_cmt_nest_p_id = 4) lvl_1_cmt
WHERE ROWNUM <= 10
START WITH p_cmt_re_p_id IS NULL
CONNECT BY PRIOR p_cmt_id = p_cmt_re_p_id
ORDER SIBLINGS BY p_cmt_id ASC;
SELECT lvl_1_cmt.* FROM (SELECT * FROM PostComment WHERE p_cmt_nest_p_id = 5) lvl_1_cmt
WHERE ROWNUM <= 10
START WITH p_cmt_re_p_id IS NULL
CONNECT BY PRIOR p_cmt_id = p_cmt_re_p_id
ORDER SIBLINGS BY p_cmt_id ASC;
SELECT lvl_1_cmt.* FROM (SELECT * FROM PostComment WHERE p_cmt_nest_p_id = 6) lvl_1_cmt
WHERE ROWNUM <= 10
START WITH p_cmt_re_p_id IS NULL
CONNECT BY PRIOR p_cmt_id = p_cmt_re_p_id
ORDER SIBLINGS BY p_cmt_id ASC;
SELECT lvl_1_cmt.* FROM (SELECT * FROM PostComment WHERE p_cmt_nest_p_id = 7) lvl_1_cmt
WHERE ROWNUM <= 10
START WITH p_cmt_re_p_id IS NULL
CONNECT BY PRIOR p_cmt_id = p_cmt_re_p_id
ORDER SIBLINGS BY p_cmt_id ASC;
SELECT lvl_1_cmt.* FROM (SELECT * FROM PostComment WHERE p_cmt_nest_p_id = 8) lvl_1_cmt
WHERE ROWNUM <= 10
START WITH p_cmt_re_p_id IS NULL
CONNECT BY PRIOR p_cmt_id = p_cmt_re_p_id
ORDER SIBLINGS BY p_cmt_id ASC;
SELECT lvl_1_cmt.* FROM (SELECT * FROM PostComment WHERE p_cmt_nest_p_id = 9) lvl_1_cmt
WHERE ROWNUM <= 10
START WITH p_cmt_re_p_id IS NULL
CONNECT BY PRIOR p_cmt_id = p_cmt_re_p_id
ORDER SIBLINGS BY p_cmt_id ASC;
SELECT lvl_1_cmt.* FROM (SELECT * FROM PostComment WHERE p_cmt_nest_p_id = 10) lvl_1_cmt
WHERE ROWNUM <= 10
START WITH p_cmt_re_p_id IS NULL
CONNECT BY PRIOR p_cmt_id = p_cmt_re_p_id
ORDER SIBLINGS BY p_cmt_id ASC;
-------------------------------------------------------------------------------------------
--load nest level 2 comments by using list
SELECT lvl_1_cmt.*, ROWNUM FROM (SELECT * FROM PostComment WHERE p_cmt_nest_p_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)) lvl_1_cmt
WHERE ROWNUM <= 10
START WITH p_cmt_re_p_id IS NULL
CONNECT BY PRIOR p_cmt_id = p_cmt_re_p_id
ORDER SIBLINGS BY p_cmt_id ASC;