package com.spring.solinsystem.join;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.protobuf.TextFormat.ParseException;
import com.spring.solinsystem.dto.MemberDTO;

@Controller
public class JoinController { //회원 가입 관련하여 service 해결하는 class
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@Inject
	JoinService service;

	@RequestMapping(value = "/joinservice.do")
	public String postRegister(MemberDTO dto) throws Exception {
		System.out.println("회원가입이 실행됩니댜.");
		service.register(dto);
		
		return "/solin/login";
	}
	
	@RequestMapping(value="idCheck.do")
	@ResponseBody
	public String idcheck(@RequestBody String input) throws Exception {
		System.out.println("id check ...");
		
		
	    JSONParser parser = new JSONParser();
		JSONObject obj = null;
		obj = (JSONObject) parser.parse(input);
		    
		String input_id = (String) obj.get("input_id");
		
		System.out.println(input_id);
		int result= service.idCheck(input_id);
		
		System.out.println("결과값 : "
				+ "" + result);
		
		if(result != 0) {		
			  return "{\"result\": \"fail\"}"; // JSON 형식으로 실패 응답 반환
        } else {
            return "{\"result\": \"success\"}"; // JSON 형식으로 성공 응답 반환
        }
	}
}
