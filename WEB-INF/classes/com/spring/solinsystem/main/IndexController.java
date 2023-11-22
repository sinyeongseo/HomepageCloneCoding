package com.spring.solinsystem.main;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.login.LoginService;

@Controller
public class IndexController {
	@Inject
	LoginService service;
	
	@GetMapping(value="/") //메인 페이지로 이동
	public String index(HttpServletRequest request, @CookieValue(name = "mb_id", required = false) String memberId,
	        @RequestParam(name = "message", required = false) String message,
	        @RequestParam(name = "mb_img", required = false) String mb_img,
	        Model model) {
	    HttpSession session = request.getSession();

	    // 쿠키에서 memberId가 있는 경우 세션에 값을 설정
	    if (memberId != null && !memberId.isEmpty()) {
	        // memberId를 사용하여 사용자 정보를 데이터베이스 또는 저장소에서 가져온다고 가정
	        MemberDTO user = service.getUserByUserId(memberId);

	        if (user != null) {
	            // 세션에 사용자 정보 설정
	            session.setAttribute("mb_id", user.getMb_id());
	            session.setAttribute("mb_name", user.getMb_name());
	            session.setAttribute("mb_mail", user.getMb_mail());
	            session.setAttribute("mb_phone", user.getMb_phone());
	            session.setAttribute("mb_img", user.getMb_img());
	            session.setAttribute("mb_regdate", user.getMb_regdate());
	        }
	        
	    }
       
        return "/solin/index";
	}

	@RequestMapping(value="/login.do") //로그인 페이지로 이동
	public String Login() {
		
		return "/solin/login";
	}
	
	@RequestMapping(value="/join.do") //회원가입 페이지로 이동
	public String Join() {
		return "/solin/join";
	}
	@RequestMapping(value="/notice.do") //자유 게시판으로 이동
	public String notice() {
		return "/solin/notice";
	}
	@RequestMapping(value="/mypage.do") //회원 정보 수정 페이지로 이동
	public String EditMe(@RequestParam(name = "message", required = false) String message,
			@RequestParam(name = "mb_id", required = false) String mb_id,
	        Model model) {
		
		MemberDTO memberresult = service.getUserByUserId(mb_id);
	    model.addAttribute("message", message);
	    model.addAttribute("memberresult", memberresult);
		return "/solin/mypage"; // mypage.jsp 또는 원하는 뷰 이름으로 변경
	}
	
}
