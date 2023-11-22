package com.spring.solinsystem.dto;

import java.util.Date;


public class MemberDTO {
	private String mb_id;
	private String mb_pw;
	private String mb_newpw;
	private String mb_phone;
	private String mb_name;
	private String mb_mail;
	private Date mb_regdate;
	private String mb_img;
	private String mb_role;
	
	public String getMb_role() {
		return mb_role;
	}
	public void setMb_role(String mb_role) {
		this.mb_role = mb_role;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public Date getMb_regdate() {
		return mb_regdate;
	}
	public void setMb_regdate(Date mb_regdate) {
		this.mb_regdate = mb_regdate;
	}
	public String getMb_mail() {
		return mb_mail;
	}
	public void setMb_mail(String mb_mail) {
		this.mb_mail = mb_mail;
	}
	public String getMb_img() {
		return mb_img;
	}
	public void setMb_img(String mb_img) {
		this.mb_img = mb_img;
	}
	public String getMb_newpw() {
		return mb_newpw;
	}
	public void setMb_newpw(String mb_newpw) {
		this.mb_newpw = mb_newpw;
	}
	
	
	
}
