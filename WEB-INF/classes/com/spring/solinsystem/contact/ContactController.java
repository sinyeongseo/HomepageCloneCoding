package com.spring.solinsystem.contact;

import java.net.URLEncoder;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.solinsystem.dto.ContactDTO;

@Controller
public class ContactController {
	
	 @Inject
	 ContactService service;
	 
	@RequestMapping(value="/index.do")
	public String Index() {
		return "/solin/index";	
	}
	@RequestMapping(value="/contact.do")
	public String Contact(ContactDTO dto) throws Exception {
		System.out.println("넘어온 값:"+ dto);
		service.contact(dto);
		
		 String message = "문의 등록이 완료되었습니다.";
		 String encodedMessage = URLEncoder.encode(message, "UTF-8");
		 
		 return "redirect:/?message=" + encodedMessage;
	}
	@RequestMapping(value="/contactafter.do")
	public String ContactAfter(ContactDTO dto) throws Exception {
		System.out.println("넘어온 값:"+ dto);
		service.contact(dto);
		
		 String message = "문의 등록이 완료되었습니다.";
		 String encodedMessage = URLEncoder.encode(message, "UTF-8");
		 
		 return "redirect:/?message=" + encodedMessage;
	}
}
