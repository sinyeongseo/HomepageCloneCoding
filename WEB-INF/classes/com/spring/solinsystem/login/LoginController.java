package com.spring.solinsystem.login;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.solinsystem.dto.MemberDTO;

@Controller
public class LoginController { //login 관련하여 service 해결 해주는 class
	@Inject
	LoginService service;
	
	@GetMapping(value="/getsession.do")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getSessionInfo(HttpSession session) {
	    Map<String, Object> sessionInfo = new HashMap<>();
	    sessionInfo.put("mbId", session.getAttribute("login"));
	    return ResponseEntity.ok(sessionInfo);
	}
	
	//id 찾기 화면
	@RequestMapping(value="/idsearch.do")
	public String idSearch() {
		
		return "/solin/idsearch";
	}
	
	//id 찾기
	@RequestMapping(value="/idsearchservice.do", method=RequestMethod.POST)
	public ModelAndView idSearchService(MemberDTO dto) throws Exception {
		ModelAndView modelandview = new ModelAndView();
			
		System.out.println(dto);
		MemberDTO result = service.idSearch(dto);
		System.out.println("넘어온 결과:"+ result);
		
		  if (result == null) {
		        // 넘어온 결과가 null인 경우
		        modelandview.setViewName("idsearchrs"); // 알림창을 띄우지 않고 결과 페이지로 이동
		    } else {
		        // 넘어온 결과가 null이 아닌 경우
		        modelandview.addObject("mb_name", dto.getMb_name());
		        modelandview.addObject("mb_id", result.getMb_id());
		        modelandview.addObject("mb_regdate", result.getMb_regdate());
		        modelandview.setViewName("/solin/idsearchrs");
		    }
		
		return modelandview;
		
	}
	
	//pw 찾기 화면 
	@RequestMapping(value="/pwsearch.do")
	public String pwSearch() {
		
		return "/solin/pwsearch";
	}
	
	//pw 찾기
	@RequestMapping(value="/pwsearchservice.do", method=RequestMethod.POST)
	public ModelAndView pwSearchService(MemberDTO dto) throws Exception {
		ModelAndView modelandview = new ModelAndView();
			
		System.out.println(dto);
		MemberDTO result = service.pwSearch(dto);
		System.out.println("넘어온 결과:"+ result);
		
		if (result == null) {
	        // 넘어온 결과가 null인 경우
	        modelandview.setViewName("pwsearchrs"); // 알림창을 띄우지 않고 결과 페이지로 이동
	    } else {
		modelandview .addObject("mb_name",dto.getMb_name());
		modelandview .addObject("mb_pw",result.getMb_pw());
		modelandview .addObject("mb_regdate",result.getMb_regdate());
		modelandview .setViewName("/solin/pwsearchrs");
	    }
		
		return modelandview;
	}
	
	//로그인 로직 구현
	@RequestMapping(value="loginservice.do", method = RequestMethod.POST)
	public String login(MemberDTO dto, HttpServletRequest request, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		System.out.println("post login");
		
		HttpSession session = request.getSession();
		MemberDTO login = service.login(dto);
	
		
		System.out.println(login);
		if(login == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/login.do";   
        }
		session.setAttribute("login", login.getMb_id());
		session.setAttribute("mb_id", login.getMb_id());
		session.setAttribute("mb_name", login.getMb_name());
	    session.setAttribute("mb_mail", login.getMb_mail());
		session.setAttribute("mb_phone", login.getMb_phone());
		session.setAttribute("mb_img", login.getMb_img());
		session.setAttribute("mb_regdate", login.getMb_regdate());
        //로그인 후 로그인되었습니다 알림창을 띄우기 위해 있는 코드
        int redirect = 0;
        rttr.addFlashAttribute("result", redirect);

        
        return "redirect:/";
	}
	
	@RequestMapping(value = "/keeploginservice.do")
	public String keeploginservice(MemberDTO dto, HttpServletRequest request,RedirectAttributes rttr, HttpServletResponse response) throws Exception {
	    MemberDTO login = service.login(dto);
	    HttpSession session = request.getSession();
	    if (login == null) {
	        // 로그인 실패 처리
	        return "redirect:/login.do";
	    }
	    int redirect = 0;
        rttr.addFlashAttribute("result", redirect);
        
        session.setAttribute("mb_id", login.getMb_id());
		session.setAttribute("mb_name", login.getMb_name());
	    session.setAttribute("mb_mail", login.getMb_mail());
		session.setAttribute("mb_phone", login.getMb_phone());
		session.setAttribute("mb_img", login.getMb_img());
		session.setAttribute("mb_regdate", login.getMb_regdate());
	    // 쿠키에 로그인 정보 저장
		int sessionTimeoutInSeconds = 60 * 60 * 24 * 7; // 7일
		session.setMaxInactiveInterval(sessionTimeoutInSeconds);
	    Cookie idCookie = new Cookie("mb_id", login.getMb_id());
	    idCookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유지 기간 (예: 7일)
	    response.addCookie(idCookie);

	    return "redirect:/";
	}
	
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
	    HttpSession session = request.getSession(false); // 현재 세션이 없으면 새로 생성하지 않도록 false로 설정

	    if (session != null) {
	        session.invalidate(); // 세션 무효화
	    }

	    int logoutresult = 0;
	    expiredCookie(response, "mb_id");
	    rttr.addFlashAttribute("logoutresult", logoutresult);

	    return "redirect:/";
	}

	private void expiredCookie(HttpServletResponse response, String cookieName) {
	    Cookie cookie = new Cookie(cookieName, null);
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);
	}
	
	   //세션 체크 해주는 메소드
	   @GetMapping(value = "/checksession.do", produces="application/json")
	    @ResponseBody
	    public Map<String, Object> checkSession(HttpServletRequest request) {
	        Map<String, Object> response = new HashMap<>();
	        System.out.println("sessioncheck....");
	        HttpSession session = request.getSession(false);
	        System.out.println("세션 정보"+session);
	        if (session == null) {
	            response.put("sessionExpired", true);
	        } else {
	            response.put("sessionExpired", false);
	        }
	        
	        return response;
	    }
	    
}