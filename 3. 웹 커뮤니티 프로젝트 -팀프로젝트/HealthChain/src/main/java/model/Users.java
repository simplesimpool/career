package model;

import java.sql.Date;

public class Users {
	private String user_id;
	private String dr_lic_code;
	private String user_pw;
	private String user_name;
	private String user_tel;
	private String user_addr;
	private String user_del;
	private String user_nickname;
	private String user_email;
	private Date user_reg_date;
	private String user_activity;

	public String getUser_activity() {
		return user_activity;
	}

	public void setUser_activity(String user_activity) {
		this.user_activity = user_activity;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public Date getUser_reg_date() {
		return user_reg_date;
	}

	public void setUser_reg_date(Date user_reg_date) {
		this.user_reg_date = user_reg_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getDr_lic_code() {
		return dr_lic_code;
	}

	public void setDr_lic_code(String dr_lic_code) {
		this.dr_lic_code = dr_lic_code;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_del() {
		return user_del;
	}

	public void setUser_del(String user_del) {
		this.user_del = user_del;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

}
