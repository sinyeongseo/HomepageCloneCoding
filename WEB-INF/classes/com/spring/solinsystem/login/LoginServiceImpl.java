package com.spring.solinsystem.login;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.solinsystem.dao.MemberDAO;
import com.spring.solinsystem.dto.MemberDTO;

@Service
public class LoginServiceImpl implements LoginService{
	@Inject
	MemberDAO dao;
	
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception{
		return dao.login(dto);
	}
	
	@Override
	public MemberDTO idSearch(MemberDTO dto) throws Exception{
		return dao.idSearch(dto);
	}
	
	@Override
	public MemberDTO pwSearch(MemberDTO dto) throws Exception{
		return dao.pwSearch(dto);
	}
	@Override
	public MemberDTO getUserByUserId(String MemberId){
		return dao.getUserByUserId(MemberId);
	}
}
