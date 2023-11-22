package com.spring.solinsystem.dao;

import java.util.List;
import java.util.Map;

import com.spring.solinsystem.dto.MemberDTO;

public interface MyPageDAO {
	public void editService(MemberDTO dto) throws Exception;
	
	public void deleteService(MemberDTO dto) throws Exception;

	public int pwCheck(String login_pw);
	
	public void pweditService(MemberDTO dto) throws Exception;
	
	public int updateProfile(Map<String,Object>map);
	
	public String selectProfile(String mb_id);

}