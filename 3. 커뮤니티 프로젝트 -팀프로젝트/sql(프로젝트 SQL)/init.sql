CREATE TABLE users (
	user_id	varchar2(20)	NOT NULL,
	dr_lic_code	varchar2(20)	NULL,
	user_pw	varchar2(20)	NOT NULL,
	user_name	varchar2(10)	NOT NULL,
	user_tel	varchar2(20)	NOT NULL,
	user_addr	varchar2(50)	NOT NULL,
	user_del	char(1)	NOT NULL,
	user_nickname	varchar2(10)	NOT NULL
);

CREATE TABLE freeBoard (
	frb_id	number	NOT NULL,
	user_id	varchar2(20)	NOT NULL,
	frb_title	varchar2(20)	NOT NULL,
	frb_content	varchar2(500)	NOT NULL,
	frb_reg_date	date	NOT NULL,
	frb_view_cnt	number	NOT NULL,
	frb_del	char(1)	NOT NULL
);

CREATE TABLE doctorLicense (
	dr_lic_code	varchar2(20)	NOT NULL
);

CREATE TABLE freeBoardCmt (
	frb_cmt_id	number	NOT NULL,
	user_id	varchar2(20)	NOT NULL,
	frb_id	number	NOT NULL,
	frb_cmt_reply	varchar2(100)	NOT NULL,
	frb_cmt_date	date	NOT NULL,
	frb_cmt_del	char(1)	NOT NULL
);

CREATE TABLE reviewBoard (
	rvb_id	number	NOT NULL,
	user_id	varchar2(20)	NOT NULL,
	rvb_title	varchar2(20)	NOT NULL,
	rvb_content	varchar2(500)	NOT NULL,
	rvb_reg_date	date	NOT NULL,
	rvb_view_cnt	number	NOT NULL,
	rvb_like_cnt	number	NOT NULL,
	rvb_del	char(1)	NOT NULL
);

CREATE TABLE reviewBoardCmt (
	rvb_cmt_id	number	NOT NULL,
	user_id	varchar2(20)	NOT NULL,
	rvb_id	number	NOT NULL,
	rvb_cmt_reply	varchar2(100)	NOT NULL,
	rvb_cmt_date	date	NOT NULL,
	rvb_cmt_del	char(1)	NOT NULL
);

CREATE TABLE questionBoard (
	qsb_id	number	NOT NULL,
	user_id	varchar2(20)	NOT NULL,
	qsb_title	varchar2(20)	NOT NULL,
	qsb_content	varchar2(500)	NOT NULL,
	qsb_reg_date	date	NOT NULL,
	qsb_view_cnt	number	NOT NULL,
	qsb_del	char(1)	NOT NULL
);

CREATE TABLE questionBoardCmt (
	qsb_cmt_id	number	NOT NULL,
	user_id	varchar2(20)	NOT NULL,
	qsb_id	number	NOT NULL,
	qsb_cmt_title	varchar2(20)	NOT NULL,
	qsb_cmt_reply	varchar2(500)	NOT NULL,
	qsb_cmt_date	date	NOT NULL,
	qsb_cmt_del	char(1)	NOT NULL
);

CREATE TABLE mediInfoBoard (
	mib_id	number	NOT NULL,
	user_id	varchar2(20)	NOT NULL,
	mib_title	varchar2(20)	NOT NULL,
	mib_content	varchar2(500)	NOT NULL,
	mib_reg_date	date	NOT NULL,
	mib_view_cnt	number	NOT NULL,
	mib_del	char(1)	NOT NULL
);

CREATE TABLE customerService (
	cs_id	number	NOT NULL,
	user_id	varchar2(20)	NOT NULL,
	cs_title	varchar2(20)	NOT NULL,
	cs_content	varchar2(500)	NOT NULL,
	cs_reg_date	date	NOT NULL,
	cs_view_cnt	number	NOT NULL,
	cs_del	char(1)	NOT NULL,
	cs_level	number	NOT NULL,
	cs_parent_id	number	NOT NULL
);

ALTER TABLE users ADD CONSTRAINT PK_USERS PRIMARY KEY (
	user_id
);

ALTER TABLE freeBoard ADD CONSTRAINT PK_FREEBOARD PRIMARY KEY (
	frb_id
);

ALTER TABLE doctorLicense ADD CONSTRAINT PK_DOCTORLICENSE PRIMARY KEY (
	dr_lic_code
);

ALTER TABLE freeBoardCmt ADD CONSTRAINT PK_FREEBOARDCMT PRIMARY KEY (
	frb_cmt_id
);

ALTER TABLE reviewBoard ADD CONSTRAINT PK_REVIEWBOARD PRIMARY KEY (
	rvb_id
);

ALTER TABLE reviewBoardCmt ADD CONSTRAINT PK_REVIEWBOARDCMT PRIMARY KEY (
	rvb_cmt_id
);

ALTER TABLE questionBoard ADD CONSTRAINT PK_QUESTIONBOARD PRIMARY KEY (
	qsb_id
);

ALTER TABLE questionBoardCmt ADD CONSTRAINT PK_QUESTIONBOARDCMT PRIMARY KEY (
	qsb_cmt_id
);

ALTER TABLE mediInfoBoard ADD CONSTRAINT PK_MEDIINFOBOARD PRIMARY KEY (
	mib_id
);

ALTER TABLE customerService ADD CONSTRAINT PK_CUSTOMERSERVICE PRIMARY KEY (
	cs_id
);

ALTER TABLE users ADD CONSTRAINT FK_doctorLicense_TO_users_1 FOREIGN KEY (
	dr_lic_code
)
REFERENCES doctorLicense (
	dr_lic_code
);

ALTER TABLE freeBoard ADD CONSTRAINT FK_users_TO_freeBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE freeBoardCmt ADD CONSTRAINT FK_users_TO_freeBoardCmt_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE freeBoardCmt ADD CONSTRAINT FK_freeBoard_TO_freeBoardCmt_1 FOREIGN KEY (
	frb_id
)
REFERENCES freeBoard (
	frb_id
);

ALTER TABLE reviewBoard ADD CONSTRAINT FK_users_TO_reviewBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE reviewBoardCmt ADD CONSTRAINT FK_users_TO_reviewBoardCmt_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE reviewBoardCmt ADD CONSTRAINT FK_reviewBoard_TO_reviewBoardCmt_1 FOREIGN KEY (
	rvb_id
)
REFERENCES reviewBoard (
	rvb_id
);

ALTER TABLE questionBoard ADD CONSTRAINT FK_users_TO_questionBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE questionBoardCmt ADD CONSTRAINT FK_users_TO_questionBoardCmt_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE questionBoardCmt ADD CONSTRAINT FK_questionBoard_TO_questionBoardCmt_1 FOREIGN KEY (
	qsb_id
)
REFERENCES questionBoard (
	qsb_id
);

ALTER TABLE mediInfoBoard ADD CONSTRAINT FK_users_TO_mediInfoBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE customerService ADD CONSTRAINT FK_users_TO_customerService_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

CREATE SEQUENCE cs_seq START WITH 1  INCREMENT BY 1 nocache;
CREATE SEQUENCE frb_seq START WITH 1  INCREMENT BY 1 nocache;
CREATE SEQUENCE frb_cmt_seq START WITH 1  INCREMENT BY 1 nocache;
CREATE SEQUENCE rvb_seq START WITH 1  INCREMENT BY 1 nocache;
CREATE SEQUENCE rvb_cmt_seq START WITH 1  INCREMENT BY 1 nocache;
CREATE SEQUENCE qsb_seq START WITH 1  INCREMENT BY 1 nocache;
CREATE SEQUENCE qsb_cmt_seq START WITH 1  INCREMENT BY 1 nocache;
CREATE SEQUENCE mib_seq START WITH 1  INCREMENT BY 1 nocache;
CREATE SEQUENCE qsb_cmt2_seq START WITH 1  INCREMENT BY 1 nocache;
    