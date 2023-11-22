package com.spring.solinsystem.dto;

import java.util.Date;



public class ContactDTO {
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
	public String getMb_mail() {
		return mb_mail;
	}
	public void setMb_mail(String mb_mail) {
		this.mb_mail = mb_mail;
	}
	public String getMb_message() {
		return mb_message;
	}
	public void setMb_message(String mb_message) {
		this.mb_message = mb_message;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getCt_num() {
		return ct_num;
	}
	public void setCt_num(int ct_num) {
		this.ct_num = ct_num;
	}
	public boolean isCt_check() {
		return ct_check;
	}
	public void setCt_check(boolean ct_check) {
		this.ct_check = ct_check;
	}
	public Date getCt_postdate() {
		return ct_postdate;
	}
	public void setCt_postdate(Date ct_postdate) {
		this.ct_postdate = ct_postdate;
	}





	private String mb_phone;
	private String mb_name;
	private String mb_mail;
    private String mb_message;
	private String mb_id;
	private int ct_num;
	private boolean ct_check;
	private Date ct_postdate;
	
}
