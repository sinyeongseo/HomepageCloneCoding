package com.spring.solinsystem.dto;

import java.util.Date;

public class CommentDTO {
	private int co_no;
	private int tb_num;
	private String co_writer;
	private String co_content;
	private Date co_date;
	
	public int getCo_no() {
		return co_no;
	}
	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}
	public int getTb_num() {
		return tb_num;
	}
	public void setTb_num(int tb_num) {
		this.tb_num = tb_num;
	}
	public String getCo_writer() {
		return co_writer;
	}
	public void setCo_writer(String co_writer) {
		this.co_writer = co_writer;
	}
	public String getCo_content() {
		return co_content;
	}
	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}
	public Date getCo_date() {
		return co_date;
	}
	public void setCo_date(Date co_date) {
		this.co_date = co_date;
	}
	
}
