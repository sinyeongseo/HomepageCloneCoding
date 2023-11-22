package com.spring.solinsystem.join;

import com.spring.solinsystem.dto.MemberDTO;

public interface JoinService {
	public void register(MemberDTO dto) throws Exception;
	
	public int idCheck(String input_id) throws Exception;
}
