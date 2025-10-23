package model;

import java.sql.Date;

public class QuestionBoardCmt {
	private int qsb_cmt_id;
	private String user_id;
	private int qsb_id;
	private String qsb_cmt_reply;
	private Date qsb_cmt_date;
	private String qsb_cmt_del;
	private String qsb_cmt_category;

	public String getQsb_cmt_category() {
		return qsb_cmt_category;
	}

	public void setQsb_cmt_category(String qsb_cmt_category) {
		this.qsb_cmt_category = qsb_cmt_category;
	}

	public int getQsb_cmt_id() {
		return qsb_cmt_id;
	}

	public void setQsb_cmt_id(int qsb_cmt_id) {
		this.qsb_cmt_id = qsb_cmt_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getQsb_id() {
		return qsb_id;
	}

	public void setQsb_id(int qsb_id) {
		this.qsb_id = qsb_id;
	}

	public String getQsb_cmt_reply() {
		return qsb_cmt_reply;
	}

	public void setQsb_cmt_reply(String qsb_cmt_reply) {
		this.qsb_cmt_reply = qsb_cmt_reply;
	}

	public Date getQsb_cmt_date() {
		return qsb_cmt_date;
	}

	public void setQsb_cmt_date(Date qsb_cmt_date) {
		this.qsb_cmt_date = qsb_cmt_date;
	}

	public String getQsb_cmt_del() {
		return qsb_cmt_del;
	}

	public void setQsb_cmt_del(String qsb_cmt_del) {
		this.qsb_cmt_del = qsb_cmt_del;
	}

}
