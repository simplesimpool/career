CREATE TABLE Board 
(
    board_id NUMBER NOT NULL,
    board_name VARCHAR2(1000) NOT NULL,
    board_visit_cnt NUMBER DEFAULT 0 NOT NULL,
    board_cre_date DATE NOT NULL
);

CREATE TABLE Post 
(
    post_id NUMBER NOT NULL,
    board_id NUMBER NOT NULL,
    user_id VARCHAR2(1000) NOT NULL,
    p_del_code NUMBER DEFAULT NULL NULL,
    admin_id VARCHAR2(1000) NULL,
    post_title VARCHAR2(1000) NOT NULL,
    post_view_cnt NUMBER DEFAULT 0 NOT NULL,
    post_cre_date DATE NOT NULL,
    post_del_date DATE NULL
);

CREATE TABLE PostContent
(
    p_cont_id NUMBER NOT NULL,
    post_id NUMBER NOT NULL,
    p_first_cont VARCHAR2(4000) NOT NULL,
    p_sec_cont VARCHAR2(4000) NULL,
    p_third_cont VARCHAR2(4000) NULL,
    p_fourth_cont VARCHAR2(4000) NULL,
    p_fifth_cont VARCHAR2(4000) NULL
);

CREATE TABLE PostDelete
(
    p_del_code NUMBER NOT NULL,
    p_del_reason VARCHAR2(1000) NOT NULL
);

CREATE TABLE Users
(
    user_id VARCHAR2(1000) NOT NULL,
    user_pw VARCHAR2(1000) NOT NULL,
    user_reg_date DATE NOT NULL
);

CREATE TABLE PostComment
(
    p_cmt_id NUMBER NOT NULL,
    post_id NUMBER NOT NULL,
    user_id VARCHAR2(1000) NOT NULL,
    p_cmt_re_p_id NUMBER NULL,
    p_cmt_nest_p_id NUMBER NULL,
    p_cmt_nest_lvl NUMBER DEFAULT 1 NOT NULL,
    p_cmt_cont VARCHAR2(1000) NOT NULL,
    p_cmt_cre_date DATE NOT NULL
);

CREATE TABLE PostMultiPart
(
    p_file_id NUMBER NOT NULL,
    post_id NUMBER NOT NULL,
    p_ori_file_name VARCHAR2(1000) NOT NULL,
    p_new_file_name VARCHAR2(1000) NOT NULL,
    p_file_loc VARCHAR2(1000) NOT NULL,
    p_file_format VARCHAR2(1000) NOT NULL,
    p_file_cre_date DATE NOT NULL
);

CREATE TABLE Administrator
(
    admin_id VARCHAR2(1000) NOT NULL,
    admin_pw VARCHAR2(1000) NOT NULL,
    admin_name VARCHAR2(1000) NOT NULL,
    admin_reg_date DATE NOT NULL
);


ALTER TABLE Board ADD CONSTRAINT Board_pk PRIMARY KEY (board_id);
ALTER TABLE Post ADD CONSTRAINT Post_pk PRIMARY KEY (post_id);
ALTER TABLE PostContent ADD CONSTRAINT PostContent_pk PRIMARY KEY (p_cont_id);
ALTER TABLE PostDelete ADD CONSTRAINT PostDelete_pk PRIMARY KEY (p_del_code);
ALTER TABLE Users ADD CONSTRAINT Users_pk PRIMARY KEY (user_id);
ALTER TABLE PostComment ADD CONSTRAINT PostComment_pk PRIMARY KEY (p_cmt_id);
ALTER TABLE PostMultipart ADD CONSTRAINT PostMultipart_pk PRIMARY KEY (p_file_id);
ALTER TABLE Administrator ADD CONSTRAINT Administrator_pk PRIMARY KEY (admin_id);

ALTER TABLE Post ADD CONSTRAINT fk_post_board_id FOREIGN KEY(board_id) REFERENCES Board(board_id);
ALTER TABLE Post ADD CONSTRAINT fk_post_user_id FOREIGN KEY(user_id) REFERENCES Users(user_id);
ALTER TABLE Post ADD CONSTRAINT fk_post_p_del_code FOREIGN KEY(p_del_code) REFERENCES PostDelete(p_del_code);
ALTER TABLE Post ADD CONSTRAINT fk_post_admin_id FOREIGN KEY(admin_id) REFERENCES Administrator(admin_id);
ALTER TABLE PostContent ADD CONSTRAINT fk_post_content_post_id FOREIGN KEY(post_id) REFERENCES Post(post_id);
ALTER TABLE PostComment ADD CONSTRAINT fk_post_comment_post_id FOREIGN KEY(post_id) REFERENCES Post(post_id);
ALTER TABLE PostComment ADD CONSTRAINT fk_post_comment_user_id FOREIGN KEY(user_id) REFERENCES Users(user_id);
ALTER TABLE PostComment ADD CONSTRAINT fk_post_comment_p_cmt_re_p_id FOREIGN KEY(p_cmt_re_p_id) REFERENCES PostComment(p_cmt_id);
ALTER TABLE PostComment ADD CONSTRAINT fk_post_comment_p_cmt_nest_p_id FOREIGN KEY(p_cmt_nest_p_id) REFERENCES PostComment(p_cmt_id);
ALTER TABLE PostMultipart ADD CONSTRAINT fk_post_multipart_post_id FOREIGN KEY(post_id) REFERENCES Post(post_id);

CREATE INDEX idx_post_user_id ON Post(user_id);
CREATE INDEX idx_post_content_post_id ON PostContent(post_id);
CREATE INDEX idx_post_comment_post_id ON PostComment(post_id);
CREATE INDEX idx_post_comment_user_id ON PostComment(user_id);
CREATE INDEX idx_post_comment_p_cmt_re_p_id ON PostComment(p_cmt_re_p_id);
CREATE INDEX idx_post_comment_p_cmt_nest_p_id ON PostComment(p_cmt_nest_p_id);
CREATE INDEX idx_post_multipart_post_id ON PostMultipart(post_id);

INSERT INTO Board (board_id, board_name, board_visit_cnt, board_cre_date) VALUES (1, '�Խ���1', 10, SYSDATE);
INSERT INTO Board (board_id, board_name, board_visit_cnt, board_cre_date) VALUES (2, '�Խ���2', 20, SYSDATE);
INSERT INTO Board (board_id, board_name, board_visit_cnt, board_cre_date) VALUES (3, '�Խ���3', 30, SYSDATE);
INSERT INTO Users (user_id, user_pw, user_reg_date) VALUES ('userId1', 1, SYSDATE);
INSERT INTO Users (user_id, user_pw, user_reg_date) VALUES ('userId2', 2, SYSDATE);
INSERT INTO Users (user_id, user_pw, user_reg_date) VALUES ('userId3', 3, SYSDATE);
INSERT INTO Administrator (admin_id, admin_pw, admin_name, admin_reg_date) VALUES ('adminId1', 1, 'adminName1', SYSDATE);
INSERT INTO Administrator (admin_id, admin_pw, admin_name, admin_reg_date) VALUES ('adminId2', 2, 'adminName2', SYSDATE);
INSERT INTO Administrator (admin_id, admin_pw, admin_name, admin_reg_date) VALUES ('adminId3', 3, 'adminName3', SYSDATE);
INSERT INTO PostDelete (p_del_code, p_del_reason) VALUES (1, '����/����');
INSERT INTO PostDelete (p_del_code, p_del_reason) VALUES (2, '���/��ġ');
INSERT INTO PostDelete (p_del_code, p_del_reason) VALUES (3, '���/�弳');
INSERT INTO PostDelete (p_del_code, p_del_reason) VALUES (4, '���/����');
INSERT INTO PostDelete (p_del_code, p_del_reason) VALUES (5, '���/��Ÿ');
INSERT INTO Post (post_id, board_id, user_id, p_del_code, admin_id, post_title, post_view_cnt, post_cre_date, post_del_date)
VALUES (1, 1, 'userId1', NULL, NULL, '�Խ���1-�Խñ�1', 0, SYSDATE, NULL);
INSERT INTO Post (post_id, board_id, user_id, p_del_code, admin_id, post_title, post_view_cnt, post_cre_date, post_del_date)
VALUES (2, 1, 'userId2', NULL, NULL, '�Խ���1-�Խñ�2', 0, SYSDATE, NULL);
INSERT INTO Post (post_id, board_id, user_id, p_del_code, admin_id, post_title, post_view_cnt, post_cre_date, post_del_date)
VALUES (3, 1, 'userId3', NULL, NULL, '�Խ���1-�Խñ�3', 0, SYSDATE, NULL);
INSERT INTO Post (post_id, board_id, user_id, p_del_code, admin_id, post_title, post_view_cnt, post_cre_date, post_del_date)
VALUES (4, 2, 'userId1', NULL, NULL, '�Խ���2-�Խñ�1', 0, SYSDATE, NULL);
INSERT INTO Post (post_id, board_id, user_id, p_del_code, admin_id, post_title, post_view_cnt, post_cre_date, post_del_date)
VALUES (5, 2, 'userId2', NULL, NULL, '�Խ���2-�Խñ�2', 0, SYSDATE, NULL);
INSERT INTO Post (post_id, board_id, user_id, p_del_code, admin_id, post_title, post_view_cnt, post_cre_date, post_del_date)
VALUES (6, 2, 'userId3', NULL, NULL, '�Խ���2-�Խñ�3', 0, SYSDATE, NULL);
INSERT INTO Post (post_id, board_id, user_id, p_del_code, admin_id, post_title, post_view_cnt, post_cre_date, post_del_date)
VALUES (7, 3, 'userId1', NULL, NULL, '�Խ���3-�Խñ�1', 0, SYSDATE, NULL);
INSERT INTO Post (post_id, board_id, user_id, p_del_code, admin_id, post_title, post_view_cnt, post_cre_date, post_del_date)
VALUES (8, 3, 'userId2', NULL, NULL, '�Խ���3-�Խñ�2', 0, SYSDATE, NULL);
INSERT INTO Post (post_id, board_id, user_id, p_del_code, admin_id, post_title, post_view_cnt, post_cre_date, post_del_date)
VALUES (9, 3, 'userId3', NULL, NULL, '�Խ���3-�Խñ�3', 0, SYSDATE, NULL);
INSERT INTO PostContent (p_cont_id, post_id, p_first_cont, p_sec_cont, p_third_cont, p_fourth_cont, p_fifth_cont)
VALUES (1, 1, '�Խ���1-�Խñ�1-����', NULL, NULL, NULL, NULL);
INSERT INTO PostContent (p_cont_id, post_id, p_first_cont, p_sec_cont, p_third_cont, p_fourth_cont, p_fifth_cont)
VALUES (2, 2, '�Խ���1-�Խñ�2-����', NULL, NULL, NULL, NULL);
INSERT INTO PostContent (p_cont_id, post_id, p_first_cont, p_sec_cont, p_third_cont, p_fourth_cont, p_fifth_cont)
VALUES (3, 3, '�Խ���1-�Խñ�3-����', NULL, NULL, NULL, NULL);
INSERT INTO PostContent (p_cont_id, post_id, p_first_cont, p_sec_cont, p_third_cont, p_fourth_cont, p_fifth_cont)
VALUES (4, 4, '�Խ���2-�Խñ�1-����', NULL, NULL, NULL, NULL);
INSERT INTO PostContent (p_cont_id, post_id, p_first_cont, p_sec_cont, p_third_cont, p_fourth_cont, p_fifth_cont)
VALUES (5, 5, '�Խ���2-�Խñ�2-����', NULL, NULL, NULL, NULL);
INSERT INTO PostContent (p_cont_id, post_id, p_first_cont, p_sec_cont, p_third_cont, p_fourth_cont, p_fifth_cont)
VALUES (6, 6, '�Խ���2-�Խñ�3-����', NULL, NULL, NULL, NULL);
INSERT INTO PostContent (p_cont_id, post_id, p_first_cont, p_sec_cont, p_third_cont, p_fourth_cont, p_fifth_cont)
VALUES (7, 7, '�Խ���3-�Խñ�1-����', NULL, NULL, NULL, NULL);
INSERT INTO PostContent (p_cont_id, post_id, p_first_cont, p_sec_cont, p_third_cont, p_fourth_cont, p_fifth_cont)
VALUES (8, 8, '�Խ���3-�Խñ�2-����', NULL, NULL, NULL, NULL);
INSERT INTO PostContent (p_cont_id, post_id, p_first_cont, p_sec_cont, p_third_cont, p_fourth_cont, p_fifth_cont)
VALUES (9, 9, '�Խ���3-�Խñ�3-����', NULL, NULL, NULL, NULL);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (1, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���1', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (2, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���2', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (3, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���3', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (4, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���4', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (5, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���5', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (6, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���6', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (7, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���7', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (8, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���8', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (9, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���9', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (10, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���10', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (11, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���11', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (12, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���12', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (13, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���13', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (14, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���14', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (15, 5, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�2-���15', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (16, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���1', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (17, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���2', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (18, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���3', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (19, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���4', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (20, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���5', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (21, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���6', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (22, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���7', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (23, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���8', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (24, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���9', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (25, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���10', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (26, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���11', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (27, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���12', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (28, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���13', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (29, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���14', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (30, 5, 'userId2', NULL, 5, 2, '�Խ���2-�Խñ�2-���5-���15', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (31, 5, 'userId1', 20, 5, 2, '�Խ���2-�Խñ�2-���5-���5-�亯1', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (32, 5, 'userId1', 20, 5, 2, '�Խ���2-�Խñ�2-���5-���5-�亯2', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (33, 5, 'userId1', 20, 5, 2, '�Խ���2-�Խñ�2-���5-���5-�亯3', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (34, 5, 'userId1', 20, 5, 2, '�Խ���2-�Խñ�2-���5-���5-�亯4', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (35, 5, 'userId1', 20, 5, 2, '�Խ���2-�Խñ�2-���5-���5-�亯5', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (36, 6, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�3-���1', SYSDATE);
INSERT INTO PostComment(p_cmt_id, post_id, user_id, p_cmt_re_p_id, p_cmt_nest_p_id, p_cmt_nest_lvl, p_cmt_cont, p_cmt_cre_date)
VALUES (37, 6, 'userId1', NULL, NULL, 1, '�Խ���2-�Խñ�3-���2', SYSDATE);
INSERT INTO PostMultipart (p_file_id, post_id, p_ori_file_name, p_new_file_name, p_file_loc, p_file_format, p_file_cre_date)
VALUES (1, 5, '�Խ���2-�Խñ�2-����1', '�Խ���2-�Խñ�2-����1', '�Խ���2-�Խñ�2-����1��ġ', 'img', SYSDATE);
INSERT INTO PostMultipart (p_file_id, post_id, p_ori_file_name, p_new_file_name, p_file_loc, p_file_format, p_file_cre_date)
VALUES (2, 5, '�Խ���2-�Խñ�2-����2', '�Խ���2-�Խñ�2-����2', '�Խ���2-�Խñ�2-����2��ġ', 'img', SYSDATE);

--SELECT * FROM Board;
--SELECT * FROM Users;
--SELECT * FROM Administrator;
--SELECT * FROM PostDelete;
--SELECT * FROM Post;
--SELECT * FROM PostContent;
--SELECT * FROM PostComment;
--SELECT * FROM PostMultipart;

--DROP TABLE Board;
--DROP TABLE Post;
--DROP TABLE PostContent;
--DROP TABLE PostDelete;
--DROP TABLE Users;
--DROP TABLE PostComment;
--DROP TABLE PostMultipart;
--DROP TABLE Administrator;
