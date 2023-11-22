package com.spring.solinsystem.mypage;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.login.LoginService;
@Controller
public class MyPageController {
	@Inject
	MyPageService service;
	@Inject
	LoginService logservice;
	
	@RequestMapping(value="/editme.do")
	public String editme(@RequestParam(name ="mb_id", required = false) String mb_id,
	        Model model) {
		MemberDTO memberresult = logservice.getUserByUserId(mb_id);
		System.out.println("memberresult 값" + memberresult);
	    model.addAttribute("memberresult", memberresult);
	    
		return "/solin/editme";
	}
	

	 
	@RequestMapping(value="/delete.do")
	public String deleteService(MemberDTO dto,HttpSession session, RedirectAttributes ra,HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		service.deleteService(dto);
		session = request.getSession(false); // 현재 세션이 없으면 새로 생성하지 않도록 false로 설정
		 if (session != null) {
		        session.invalidate(); // 세션 무효화
		    }
		  // 쿠키 만료 처리
	    expiredCookie(response, "mb_id");

	    // 삭제 메시지를 request 객체에 저장
	  
	    ra.addFlashAttribute("deleteMessage", "계정이 성공적으로 삭제되었습니다.");
		return "redirect:/"; 
	}
	private void expiredCookie(HttpServletResponse response, String cookieName) {
	    Cookie cookie = new Cookie(cookieName, null);
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);
	}
	
	
	@RequestMapping(value="/editpw.do")
	public String editepw() throws Exception{
		return "/solin/editpw";
	}
	
	
	@RequestMapping(value="/editpwService.do")
	@ResponseBody
	public String editpwcheck(@RequestBody String input) throws Exception {
		System.out.println("pw check ...");
		
		
	    JSONParser parser = new JSONParser();
		JSONObject obj = null;
		obj = (JSONObject) parser.parse(input);
		    
		String login_pw = (String) obj.get("login_pw");
		
		System.out.println(login_pw);
		int result= service.pwCheck(login_pw);
		
		System.out.println("결과값 : "
				+ "" + result);
		
		if(result != 0) {		
			  return "{\"result\": \"fail\"}"; // JSON 형식으로 실패 응답 반환
        } else {
            return "{\"result\": \"success\"}"; // JSON 형식으로 성공 응답 반환
        }
	}
	@RequestMapping(value="editservice.do")
	public String editService(@RequestParam(name ="mb_id", required = false) String mb_id, MemberDTO dto, Model model) throws Exception {
		
		service.editService(dto);
		
		model.addAttribute("message", "회원 정보 수정이 완료되었습니다.");
	
		
		return "redirect:/mypage.do?mb_id=" + mb_id;
	}
	
	@RequestMapping(value="/pweditservice.do")
	public String pweditService(@RequestParam(name ="mb_id", required = false) String mb_id, MemberDTO dto, Model model) throws Exception {
		
		
		service.pweditService(dto);
		
		model.addAttribute("message", "비밀번호 수정이 완료되었습니다.");
		
		return "redirect:/mypage.do?mb_id=" + mb_id;
	}
	
	@PostMapping(value="/modifyimage.do")
	public String updateProfile(@RequestParam("uploadImage")MultipartFile uploadImage,
			@RequestParam("memberId") String mb_id,
			HttpServletRequest req, RedirectAttributes ra, MemberDTO dto) throws Exception {
		System.out.println(mb_id);
		System.out.println(uploadImage);
		Map<String,Object> map = new HashMap<>();
		//웹 접근 경로
		String webPath="/resources/img/";
		//서버 저장 폴더 경로
		String folderPath= req.getSession().getServletContext().getRealPath(webPath);
		System.out.println("서버 저장  폴더 경로" + folderPath);
		map.put("webPath", webPath);
		map.put("folderPath", folderPath);
		map.put("uploadImage", uploadImage);
		map.put("mb_id", mb_id);
		
		int result = service.updateProfile(map);
		String mb_img = service.selectProfile(mb_id);
		System.out.println("mb_img 값은" +mb_img);
		String message = null;
		System.out.println("result 값" + result);
		if(result > 0) {
			message = "프로필 이미지가 변경되었습니다.";
			//더 있음
		}else {
			message ="프로필 이미지 변경 실패";
		}
		ra.addFlashAttribute("message",message);
		
		return "redirect:/mypage.do?message=" + URLEncoder.encode(message, "UTF-8") + "&mb_id=" + mb_id;
	}
}

