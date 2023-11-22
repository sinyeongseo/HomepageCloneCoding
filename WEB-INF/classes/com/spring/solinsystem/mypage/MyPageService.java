package com.spring.solinsystem.mypage;

import java.io.IOException;
import java.util.Map;

import com.spring.solinsystem.dto.MemberDTO;

public interface MyPageService {

	void editService(MemberDTO dto) throws Exception;
	
	void deleteService(MemberDTO dto)throws Exception;
	
    int pwCheck(String login_pw) throws Exception;
	
	void pweditService(MemberDTO dto) throws Exception;
    
    int updateProfile(Map<String, Object> map) throws IOException;
    
    String selectProfile(String mb_id) throws Exception;
}
