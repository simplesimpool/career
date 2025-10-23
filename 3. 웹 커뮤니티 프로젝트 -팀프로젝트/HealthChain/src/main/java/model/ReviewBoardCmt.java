package model;

import java.sql.Date;

public class ReviewBoardCmt {
	private int rvb_cmt_id;
	private String user_id;
	private int rvb_id;
	private String rvb_cmt_reply;
	private Date rvb_cmt_date;
	private String rvb_cmt_del;
	private String rvb_cmt_category;

	public String getRvb_cmt_category() {
		return rvb_cmt_category;
	}

	public void setRvb_cmt_category(String rvb_cmt_category) {
		this.rvb_cmt_category = rvb_cmt_category;
	}

	public int getRvb_cmt_id() {
		return rvb_cmt_id;
	}

	public void setRvb_cmt_id(int rvb_cmt_id) {
		this.rvb_cmt_id = rvb_cmt_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getRvb_id() {
		return rvb_id;
	}

	public void setRvb_id(int rvb_id) {
		this.rvb_id = rvb_id;
	}

	public String getRvb_cmt_reply() {
		return rvb_cmt_reply;
	}

	public void setRvb_cmt_reply(String rvb_cmt_reply) {
		this.rvb_cmt_reply = rvb_cmt_reply;
	}

	public Date getRvb_cmt_date() {
		return rvb_cmt_date;
	}

	public void setRvb_cmt_date(Date rvb_cmt_date) {
		this.rvb_cmt_date = rvb_cmt_date;
	}

	public String getRvb_cmt_del() {
		return rvb_cmt_del;
	}

	public void setRvb_cmt_del(String rvb_cmt_del) {
		this.rvb_cmt_del = rvb_cmt_del;
	}

}
