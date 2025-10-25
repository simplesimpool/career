package model;

import java.sql.Date;

public class MediInfoBoard {
	private int mib_id;
	private String user_id;
	private String mib_title;
	private String mib_content;
	private Date mib_reg_date;
	private int mib_view_cnt;
	private String mib_del;
	private String mib_category;

	public String getMib_category() {
		return mib_category;
	}

	public void setMib_category(String mib_category) {
		this.mib_category = mib_category;
	}

	public int getMib_id() {
		return mib_id;
	}

	public void setMib_id(int mib_id) {
		this.mib_id = mib_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getMib_title() {
		return mib_title;
	}

	public void setMib_title(String mib_title) {
		this.mib_title = mib_title;
	}

	public String getMib_content() {
		return mib_content;
	}

	public void setMib_content(String mib_content) {
		this.mib_content = mib_content;
	}

	public Date getMib_reg_date() {
		return mib_reg_date;
	}

	public void setMib_reg_date(Date mib_reg_date) {
		this.mib_reg_date = mib_reg_date;
	}

	public int getMib_view_cnt() {
		return mib_view_cnt;
	}

	public void setMib_view_cnt(int mib_view_cnt) {
		this.mib_view_cnt = mib_view_cnt;
	}

	public String getMib_del() {
		return mib_del;
	}

	public void setMib_del(String mib_del) {
		this.mib_del = mib_del;
	}
}
