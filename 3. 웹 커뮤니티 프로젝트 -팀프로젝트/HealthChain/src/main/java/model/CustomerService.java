package model;

import java.sql.Date;

public class CustomerService {
	private int cs_id;
	private String user_id;
	private String cs_title;
	private String cs_content;
	private Date cs_reg_date;
	private int cs_view_cnt;
	private String cs_del;
	private int cs_level;
	private int cs_parent_id;
	private String cs_category;

	public String getCs_category() {
		return cs_category;
	}

	public void setCs_category(String cs_category) {
		this.cs_category = cs_category;
	}

	public int getCs_id() {
		return cs_id;
	}

	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCs_title() {
		return cs_title;
	}

	public void setCs_title(String cs_title) {
		this.cs_title = cs_title;
	}

	public String getCs_content() {
		return cs_content;
	}

	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}

	public Date getCs_reg_date() {
		return cs_reg_date;
	}

	public void setCs_reg_date(Date cs_reg_date) {
		this.cs_reg_date = cs_reg_date;
	}

	public int getCs_view_cnt() {
		return cs_view_cnt;
	}

	public void setCs_view_cnt(int cs_view_cnt) {
		this.cs_view_cnt = cs_view_cnt;
	}

	public String getCs_del() {
		return cs_del;
	}

	public void setCs_del(String cs_del) {
		this.cs_del = cs_del;
	}

	public int getCs_level() {
		return cs_level;
	}

	public void setCs_level(int cs_level) {
		this.cs_level = cs_level;
	}

	public int getCs_parent_id() {
		return cs_parent_id;
	}

	public void setCs_parent_id(int cs_parent_id) {
		this.cs_parent_id = cs_parent_id;
	}
}
