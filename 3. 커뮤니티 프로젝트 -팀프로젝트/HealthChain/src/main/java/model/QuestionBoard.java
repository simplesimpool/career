package model;

import java.sql.Date;

public class QuestionBoard {
	private int qsb_id;
	private String user_id;
	private String qsb_title;
	private String qsb_content;
	private Date qsb_reg_date;
	private int qsb_view_cnt;
	private String qsb_del;
	private String qsb_category;

	public String getQsb_category() {
		return qsb_category;
	}

	public void setQsb_category(String qsb_category) {
		this.qsb_category = qsb_category;
	}

	public int getQsb_id() {
		return qsb_id;
	}

	public void setQsb_id(int qsb_id) {
		this.qsb_id = qsb_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getQsb_title() {
		return qsb_title;
	}

	public void setQsb_title(String qsb_title) {
		this.qsb_title = qsb_title;
	}

	public String getQsb_content() {
		return qsb_content;
	}

	public void setQsb_content(String qsb_content) {
		this.qsb_content = qsb_content;
	}

	public Date getQsb_reg_date() {
		return qsb_reg_date;
	}

	public void setQsb_reg_date(Date qsb_reg_date) {
		this.qsb_reg_date = qsb_reg_date;
	}

	public int getQsb_view_cnt() {
		return qsb_view_cnt;
	}

	public void setQsb_view_cnt(int qsb_view_cnt) {
		this.qsb_view_cnt = qsb_view_cnt;
	}

	public String getQsb_del() {
		return qsb_del;
	}

	public void setQsb_del(String qsb_del) {
		this.qsb_del = qsb_del;
	}

}
