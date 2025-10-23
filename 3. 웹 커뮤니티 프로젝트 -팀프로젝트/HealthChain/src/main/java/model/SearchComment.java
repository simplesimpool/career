package model;

import java.sql.Date;

public class SearchComment {
	private int cmt_id;
	private String user_id;
	private String board_id;
	private String cmt_reply;
	private Date cmt_date;
	private String cmt_del;
	private String cmt_category;

	public String getCmt_reply() {
		return cmt_reply;
	}

	public void setCmt_reply(String cmt_reply) {
		this.cmt_reply = cmt_reply;
	}

	public int getCmt_id() {
		return cmt_id;
	}

	public void setCmt_id(int cmt_id) {
		this.cmt_id = cmt_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public Date getCmt_date() {
		return cmt_date;
	}

	public void setCmt_date(Date cmt_date) {
		this.cmt_date = cmt_date;
	}

	public String getCmt_del() {
		return cmt_del;
	}

	public void setCmt_del(String cmt_del) {
		this.cmt_del = cmt_del;
	}

	public String getCmt_category() {
		return cmt_category;
	}

	public void setCmt_category(String cmt_category) {
		this.cmt_category = cmt_category;
	}
}
