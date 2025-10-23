package model;

import java.sql.Date;

public class ReviewBoard {
	private int rvb_id;
	private String user_id;
	private String rvb_title;
	private String rvb_content;
	private Date rvb_reg_date;
	private int rvb_view_cnt;
	private int rvb_like_cnt;
	private String rvb_del;
	private String rvb_category;

	public String getRvb_category() {
		return rvb_category;
	}

	public void setRvb_category(String rvb_category) {
		this.rvb_category = rvb_category;
	}

	public int getRvb_id() {
		return rvb_id;
	}

	public void setRvb_id(int rvb_id) {
		this.rvb_id = rvb_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRvb_title() {
		return rvb_title;
	}

	public void setRvb_title(String rvb_title) {
		this.rvb_title = rvb_title;
	}

	public String getRvb_content() {
		return rvb_content;
	}

	public void setRvb_content(String rvb_content) {
		this.rvb_content = rvb_content;
	}

	public Date getRvb_reg_date() {
		return rvb_reg_date;
	}

	public void setRvb_reg_date(Date rvb_reg_date) {
		this.rvb_reg_date = rvb_reg_date;
	}

	public int getRvb_view_cnt() {
		return rvb_view_cnt;
	}

	public void setRvb_view_cnt(int rvb_view_cnt) {
		this.rvb_view_cnt = rvb_view_cnt;
	}

	public int getRvb_like_cnt() {
		return rvb_like_cnt;
	}

	public void setRvb_like_cnt(int rvb_like_cnt) {
		this.rvb_like_cnt = rvb_like_cnt;
	}

	public String getRvb_del() {
		return rvb_del;
	}

	public void setRvb_del(String rvb_del) {
		this.rvb_del = rvb_del;
	}

}
