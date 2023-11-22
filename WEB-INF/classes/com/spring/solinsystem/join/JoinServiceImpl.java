package com.spring.solinsystem.join;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.solinsystem.dao.MemberDAO;
import com.spring.solinsystem.dto.MemberDTO;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Inject MemberDAO dao;
	
	@Override
	public void register(MemberDTO dto) throws Exception {
		dao.register(dto);
	}
	
	@Override
	public int idCheck(String input_id) throws Exception{
		return dao.idCheck(input_id);
	}
	
}