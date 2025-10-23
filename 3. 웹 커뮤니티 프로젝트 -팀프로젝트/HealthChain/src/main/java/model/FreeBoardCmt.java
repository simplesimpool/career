package model;

import java.sql.Date;

public class FreeBoardCmt {
	private int frb_cmt_id;
	private String user_id;
	private int frb_id;
	private String frb_cmt_reply;
	private Date frb_cmt_date;
	private String frb_cmt_del;
	private String frb_cmt_category;

	public String getFrb_cmt_category() {
		return frb_cmt_category;
	}

	public void setFrb_cmt_category(String frb_cmt_category) {
		this.frb_cmt_category = frb_cmt_category;
	}

	public int getFrb_cmt_id() {
		return frb_cmt_id;
	}

	public void setFrb_cmt_id(int frb_cmt_id) {
		this.frb_cmt_id = frb_cmt_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getFrb_id() {
		return frb_id;
	}

	public void setFrb_id(int frb_id) {
		this.frb_id = frb_id;
	}

	public String getFrb_cmt_reply() {
		return frb_cmt_reply;
	}

	public void setFrb_cmt_reply(String frb_cmt_reply) {
		this.frb_cmt_reply = frb_cmt_reply;
	}

	public Date getFrb_cmt_date() {
		return frb_cmt_date;
	}

	public void setFrb_cmt_date(Date frb_cmt_date) {
		this.frb_cmt_date = frb_cmt_date;
	}

	public String getFrb_cmt_del() {
		return frb_cmt_del;
	}

	public void setFrb_cmt_del(String frb_cmt_del) {
		this.frb_cmt_del = frb_cmt_del;
	}

}
