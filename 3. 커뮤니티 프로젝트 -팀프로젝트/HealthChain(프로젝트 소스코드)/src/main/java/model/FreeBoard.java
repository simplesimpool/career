package model;

import java.sql.Date;

public class FreeBoard {
	private int frb_id;
	private String user_id;
	private String frb_title;
	private String frb_content;
	private Date frb_reg_date;
	private int frb_view_cnt;
	private String frb_del;
	private String frb_category;

	public String getFrb_category() {
		return frb_category;
	}

	public void setFrb_category(String frb_category) {
		this.frb_category = frb_category;
	}

	public int getFrb_id() {
		return frb_id;
	}

	public void setFrb_id(int frb_id) {
		this.frb_id = frb_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFrb_title() {
		return frb_title;
	}

	public void setFrb_title(String frb_title) {
		this.frb_title = frb_title;
	}

	public String getFrb_content() {
		return frb_content;
	}

	public void setFrb_content(String frb_content) {
		this.frb_content = frb_content;
	}

	public Date getFrb_reg_date() {
		return frb_reg_date;
	}

	public void setFrb_reg_date(Date frb_reg_date) {
		this.frb_reg_date = frb_reg_date;
	}

	public int getFrb_view_cnt() {
		return frb_view_cnt;
	}

	public void setFrb_view_cnt(int frb_view_cnt) {
		this.frb_view_cnt = frb_view_cnt;
	}

	public String getFrb_del() {
		return frb_del;
	}

	public void setFrb_del(String frb_del) {
		this.frb_del = frb_del;
	}
}
