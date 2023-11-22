package com.spring.solinsystem.dto;

import java.util.Date;

public class TableDTO {
	private int tb_num;
	private String tb_title;
	private String tb_writer;
	private String tb_content;
	private Date tb_postdate;
	private int tb_comment;
	private int tb_visit;
	private int tb_like;
	private String tb_pwd;
	
	public int getTb_comment() {
		return tb_comment;
	}
	public void setTb_comment(int tb_comment) {
		this.tb_comment = tb_comment;
	}
	public String getTb_pwd() {
		return tb_pwd;
	}
	public void setTb_pwd(String tb_pwd) {
		this.tb_pwd = tb_pwd;
	}
	public int getTb_num() {
		return tb_num;
	}
	public void setTb_num(int tb_num) {
		this.tb_num = tb_num;
	}
	public String getTb_title() {
		return tb_title;
	}
	public void setTb_title(String tb_title) {
		this.tb_title = tb_title;
	}
	public String getTb_writer() {
		return tb_writer;
	}
	public void setTb_writer(String tb_writer) {
		this.tb_writer = tb_writer;
	}
	public String getTb_content() {
		return tb_content;
	}
	public void setTb_content(String tb_content) {
		this.tb_content = tb_content;
	}
	public Date getTb_postdate() {
		return tb_postdate;
	}
	public void setTb_postdate(Date tb_postdate) {
		this.tb_postdate = tb_postdate;
	}
	public int getTb_visit() {
		return tb_visit;
	}
	public void setTb_visit(int tb_visit) {
		this.tb_visit = tb_visit;
	}
	public int getTb_like() {
		return tb_like;
	}
	public void setTb_like(int tb_like) {
		this.tb_like = tb_like;
	}
}
