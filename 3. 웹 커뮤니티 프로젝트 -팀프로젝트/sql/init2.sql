CREATE TABLE questionBoardCmt2 (
	qsb_cmt2_id	number	NOT NULL,	
	user_id	varchar2(20)	NOT NULL,
	qsb_id	number	NOT NULL,	
	qsb_cmt_id	number	NOT NULL,	
	qsb_cmt2_title	varchar2(20)	NOT NULL,
	qsb_cmt2_reply	varchar2(500)	NOT NULL,
	qsb_cmt2_date	date	NOT NULL,
	qsb_cmt2_del	char(1)	NOT NULL,	
	qsb_cmt2_level	number	NOT NULL,	
	qsb_cmt2_parent_id	number	NOT NULL,	
	qsb_cmt2_category	varchar2(20)	NOT NULL	
);

ALTER TABLE questionBoardCmt2 ADD CONSTRAINT PK_QUESTIONBOARDCMT2 PRIMARY KEY (
	qsb_cmt2_id
);

ALTER TABLE questionBoardCmt2 ADD CONSTRAINT FK_users_TO_questionBoardCmt2_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE questionBoardCmt2 ADD CONSTRAINT FK_questionBoard_TO_questionBoardCmt2_1 FOREIGN KEY (
	qsb_id
)
REFERENCES questionBoard (
	qsb_id
);

ALTER TABLE questionBoardCmt2 ADD CONSTRAINT FK_questionBoardCmt_TO_questionBoardCmt2_1 FOREIGN KEY (
	qsb_cmt_id
)
REFERENCES questionBoardCmt (
	qsb_cmt_id
);