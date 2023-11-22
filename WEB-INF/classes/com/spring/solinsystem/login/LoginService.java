package com.spring.solinsystem.login;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.solinsystem.dto.MemberDTO;


public interface LoginService {
	public MemberDTO login(MemberDTO dto) throws Exception;
	
	public MemberDTO idSearch(MemberDTO dto) throws Exception;
	
	
	public MemberDTO pwSearch(MemberDTO dto) throws Exception;
	
	public MemberDTO getUserByUserId(String MemberId);

	
}
