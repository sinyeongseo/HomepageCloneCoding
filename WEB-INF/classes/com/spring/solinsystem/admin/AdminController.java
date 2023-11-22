package com.spring.solinsystem.admin;

import java.util.List;
import java.util.Optional;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.solinsystem.dto.CommentDTO;
import com.spring.solinsystem.dto.ContactDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.dto.TableDTO;
import com.spring.solinsystem.util.Criteria;
import com.spring.solinsystem.util.PageMaker;

@Controller
public class AdminController {
	@Inject
	AdminService service;
	
	
	@RequestMapping(value = "/admin")
	public String adminstart() {
		
		return "admin/adminlogin";
	}

	
	@RequestMapping(value="/admin/index.do")
	public String adminindex() {
		return "admin/adminindex"; 
	}
	
	@GetMapping(value="/admin/login.do")
	public String adminlogin(MemberDTO dto, Model model) {
		int loginresult = service.adminlogin(dto);
		String message = "";
		
		if(loginresult > 0) {
			message = "관리자님 로그인 되었습니다. 관리자 페이지로 이동합니다 ..";
			model.addAttribute("message", message);
			
			return "admin/adminindex"; 
		}
		
		message = "아이디 또는 비밀번호가 잘못되었습니다.";
		model.addAttribute("message", message);
		
		return "/admin/adminlogin";
	}
	
	@PostMapping(value="/admin/login.do")
	public String adminloginpost(MemberDTO dto, Model model) {
		int loginresult = service.adminlogin(dto);
		String message = "";
		
		if(loginresult > 0) {
			message = "관리자님 로그인 되었습니다.";
			model.addAttribute("message", message);
			
			return "admin/adminindex"; 
		}
		
		message = "아이디 또는 비밀번호가 잘못되었습니다.";
		model.addAttribute("message", message);
		
		return "/admin/adminlogin";
	}
	
	@RequestMapping(value="/admin/logout.do")
	public String adminlogout(Model model) {
		String logoutmessage = "로그아웃 되었습니다. 로그인 페이지로 이동합니다..";
		
		model.addAttribute("logoutmessage", logoutmessage);
		return "/admin/adminlogin";
	}
	
	@RequestMapping(value="/admin/contact.do")
	public ModelAndView admincontact(Model model, Criteria cri) {
		ModelAndView mav = new ModelAndView();
		
		PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.countContactList());
        
        List<ContactDTO> result = service.getContactList(cri);
        mav.setViewName("/admin/Contacttable");
        mav.addObject("list", result);
        mav.addObject("pageMaker", pageMaker);
        
        return mav;
	}
	
	@RequestMapping(value="/admin/member.do")
	public ModelAndView adminmember(Model model, Criteria cri) {
		ModelAndView mav = new ModelAndView();
		
		PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.countMemberList());
        
        List<MemberDTO> result = service.getMemberList(cri);
        mav.setViewName("/admin/Membertable");
        mav.addObject("list", result);
        mav.addObject("pageMaker", pageMaker);
        
        
        return mav; // JSP 페이지의 이름
	}

	
	@RequestMapping(value="/admin/notice.do")
	public ModelAndView adminnotice(Model model, Criteria cri) {
		ModelAndView mav = new ModelAndView();
		
		PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.countNoticeList());
        
        List<TableDTO> result = service.getNoticeList(cri);
        mav.setViewName("/admin/Noticetable");
        mav.addObject("list", result);
        mav.addObject("pageMaker", pageMaker);
        
        
        return mav; // JSP 페이지의 이름
	}
	
	@RequestMapping(value="/admin/noticewrite.do")
	public String noticewrite() {	
		
		return "/admin/noticewrite";
	}
	
	@RequestMapping(value="/admin/noticeservice.do")
	public String noticeservice(TableDTO dto, Model model){

		service.noticeservice(dto);
		
		
		model.addAttribute("message", "공지사항이 등록되었습니다.");
		return "redirect:/admin/notice.do";
	}
	@RequestMapping(value="/admin/mbsearchService.do")
	public ModelAndView mbsearchService(MemberDTO dto) {
		System.out.println("member검색 기능 ...");
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> result = service.mbsearchService(dto);
		mav.setViewName("/admin/Membertable");
		mav.addObject("list",result);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/ctsearchService.do")
	public ModelAndView ctsearchService(ContactDTO dto) {
		System.out.println("contact 검색 기능 ...");
		ModelAndView mav = new ModelAndView();
		List<ContactDTO> result = service.ctsearchService(dto);
		mav.setViewName("/admin/Contacttable");
		mav.addObject("list",result);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/ntsearchService.do")
	public ModelAndView ntsearchService(TableDTO dto) {
		System.out.println("table 검색 기능 ...");
		ModelAndView mav = new ModelAndView();
		List<TableDTO> result = service.ntsearchService(dto);
		System.out.println("넘어온 list"+ result);
		mav.setViewName("/admin/Noticetable");
		mav.addObject("list",result);
		
		return mav;
	}
	
	
	 @GetMapping(value="/admin/mbview.do")
	 public ModelAndView mbview(MemberDTO dto) {
		 ModelAndView mav = new ModelAndView();
		 MemberDTO tableContent= service.getmbContent(dto);
		 List<CommentDTO> mbcommentContent = service.getcommentContent(dto);
		 List<ContactDTO> mbcontactContent = service.getcontactContent(dto);
		 List<TableDTO> mbtableContent = service.gettableContent(dto);
		
		 mav.setViewName("/admin/memberview");
	     mav.addObject("MemberContent",tableContent);
	     mav.addObject("CommentContent",mbcommentContent);
	     mav.addObject("ContactContent",mbcontactContent);
	     mav.addObject("TableContent",mbtableContent);
	     
	  return mav; 
	}
	 

	@RequestMapping(value="/admin/memberremove.do")
	public String memberremove(@RequestParam("mb_id") String mb_id, RedirectAttributes redirectAttributes) {
	    System.out.println("admin member 삭제");
	    service.deleteMember(mb_id);
	    
	    redirectAttributes.addFlashAttribute("message", "회원이 삭제되었습니다.");
	    
	    return "redirect:/admin/member.do"; // 이동할 URL을 반환
	}
	
	 @RequestMapping(value="/admin/ctview.do")
	 public ModelAndView ctview(ContactDTO dto) {
		 ModelAndView mav = new ModelAndView();
		 ContactDTO tableContent= service.getctContent(dto);
	  
	     mav.setViewName("/admin/contactview");
	     mav.addObject("ContactContent",tableContent);
	  
	  return mav; 
	}
	 
	@RequestMapping(value="/admin/contactremove.do")
	public String contactremove(@RequestParam("ct_num") int ct_num, RedirectAttributes redirectAttributes) {
	    System.out.println("admin contact 삭제");
	    service.deleteContact(ct_num);
	    
	    redirectAttributes.addFlashAttribute("message", "기술문의가 삭제되었습니다.");
	    
	    return "redirect:/admin/contact.do"; // 이동할 URL을 반환
	}
	
	 @GetMapping(value="/admin/ntview.do")
	 public ModelAndView ntview(TableDTO dto) {
		 ModelAndView mav = new ModelAndView();
		 TableDTO tableContent= service.getntContent(dto);
		 CommentDTO ct = new CommentDTO();
		 ct.setTb_num(dto.getTb_num());
		 
		 List<CommentDTO> commentContent = service.getcoContent(ct);
		 System.out.println("list 내역" + commentContent);
	     mav.setViewName("/admin/noticeview");
	     mav.addObject("NoticeContent",tableContent);
	     mav.addObject("CommentContent",commentContent);
	  
	  return mav; 
	}
	 
	@RequestMapping(value="/admin/noticeremove.do")
	public String noticeremove(@RequestParam("tb_num") int tb_num, RedirectAttributes redirectAttributes) {
	    System.out.println("admin notice 삭제");
	    service.deleteNotice(tb_num);
	    
	    redirectAttributes.addFlashAttribute("message", "게시물이 삭제되었습니다.");
	    
	    return "redirect:/admin/notice.do"; // 이동할 URL을 반환
	}
	
	@RequestMapping(value="/admin/commentdelete.do")
	public String commentdelete(@RequestParam("co_no")int co_no,  @RequestParam("tb_num") int tb_num,
			RedirectAttributes redirectAttributes) {
		service.deleteComment(co_no);
		
		redirectAttributes.addFlashAttribute("message", "댓글이 삭제되었습니다.");
		return "redirect:/admin/ntview.do?tb_num=" + tb_num;
	}
	
	@RequestMapping(value="/admin/contactcheck.do")
	public String contactcheck(@RequestParam("ct_num")int ct_num, RedirectAttributes redirectAttributes) {
		service.contactcheck(ct_num);
		
		redirectAttributes.addFlashAttribute("message", "처리 완료되었습니다.");
		return "redirect:/admin/contact.do";
	}
	
	@RequestMapping(value="/admin/contactcheckno.do")
	public String contactcheckno(@RequestParam("ct_num")int ct_num, RedirectAttributes redirectAttributes) {
		service.contactcheckno(ct_num);
		
		redirectAttributes.addFlashAttribute("message", "대기처리 되었습니다.");
		return "redirect:/admin/contact.do";
	}
	
	@RequestMapping(value="/admin/dashboard.do")
	public String dashboardex(@RequestParam(name="years", required=false, defaultValue = "2023") String year, Model model) {
		System.out.println("Years 넘어온 값: "+ year);
	    int TotalMemCount = Optional.ofNullable(service.getTotalMemCount(year)).orElse(0);
	    int TotalNotCount = Optional.ofNullable(service.getTotalNotCount(year)).orElse(0);
	    float ConCountvalue = Optional.ofNullable(service.getTotalConCount(year)).orElse((float) 0);
	    float TotalConCount = Optional.ofNullable(ConCountvalue).map(v -> (float) Math.round(v * 10.0) / 10.0f).orElse(0f);
	    int TotalComCount = Optional.ofNullable(service.getTotalComCount(year)).orElse(0);

	    int JanCount = Optional.ofNullable(service.getJanCount(year)).orElse(0);
	    int FebCount = Optional.ofNullable(service.getFebCount(year)).orElse(0);
	    int MarCount = Optional.ofNullable(service.getMarCount(year)).orElse(0);
	    int AprCount = Optional.ofNullable(service.getAprCount(year)).orElse(0);
	    int MayCount = Optional.ofNullable(service.getMayCount(year)).orElse(0);
	    int JunCount = Optional.ofNullable(service.getJunCount(year)).orElse(0);
	    int JulCount = Optional.ofNullable(service.getJulCount(year)).orElse(0);
	    int AugCount = Optional.ofNullable(service.getAugCount(year)).orElse(0);
	    int SepCount = Optional.ofNullable(service.getSepCount(year)).orElse(0);
	    int OctCount = Optional.ofNullable(service.getOctCount(year)).orElse(0);
	    int NovCount = Optional.ofNullable(service.getNovCount(year)).orElse(0);
	    int DecCount = Optional.ofNullable(service.getDecCount(year)).orElse(0);

	    int mJanCount = Optional.ofNullable(service.getmJanCount(year)).orElse(0);
	    int mFebCount = Optional.ofNullable(service.getmFebCount(year)).orElse(0);
	    int mMarCount = Optional.ofNullable(service.getmMarCount(year)).orElse(0);
	    int mAprCount = Optional.ofNullable(service.getmAprCount(year)).orElse(0);
	    int mMayCount = Optional.ofNullable(service.getmMayCount(year)).orElse(0);
	    int mJunCount = Optional.ofNullable(service.getmJunCount(year)).orElse(0);
	    int mJulCount = Optional.ofNullable(service.getmJulCount(year)).orElse(0);
	    int mAugCount = Optional.ofNullable(service.getmAugCount(year)).orElse(0);
	    int mSepCount = Optional.ofNullable(service.getmSepCount(year)).orElse(0);
	    int mOctCount = Optional.ofNullable(service.getmOctCount(year)).orElse(0);
	    int mNovCount = Optional.ofNullable(service.getmNovCount(year)).orElse(0);
	    int mDecCount = Optional.ofNullable(service.getmDecCount(year)).orElse(0);

	    int MemCount = Optional.ofNullable(service.getMemCount(year)).orElse(0);
	    int NoCount = Optional.ofNullable(service.getNoCount(year)).orElse(0);

	    model.addAttribute("TotalMemCount", TotalMemCount);
	    model.addAttribute("TotalNotCount", TotalNotCount);
	    model.addAttribute("TotalConCount", TotalConCount);
	    model.addAttribute("TotalComCount", TotalComCount);

	    model.addAttribute("JanCount", JanCount);
	    model.addAttribute("FebCount", FebCount);
	    model.addAttribute("MarCount", MarCount);
	    model.addAttribute("AprCount", AprCount);
	    model.addAttribute("MayCount", MayCount);
	    model.addAttribute("JunCount", JunCount);
	    model.addAttribute("JulCount", JulCount);
	    model.addAttribute("AugCount", AugCount);
	    model.addAttribute("SepCount", SepCount);
	    model.addAttribute("OctCount", OctCount);
	    model.addAttribute("NovCount", NovCount);
	    model.addAttribute("DecCount", DecCount);

	    model.addAttribute("mJanCount", mJanCount);
	    model.addAttribute("mFebCount", mFebCount);
	    model.addAttribute("mMarCount", mMarCount);
	    model.addAttribute("mAprCount", mAprCount);
	    model.addAttribute("mMayCount", mMayCount);
	    model.addAttribute("mJunCount", mJunCount);
	    model.addAttribute("mJulCount", mJulCount);
	    model.addAttribute("mAugCount", mAugCount);
	    model.addAttribute("mSepCount", mSepCount);
	    model.addAttribute("mOctCount", mOctCount);
	    model.addAttribute("mNovCount", mNovCount);
	    model.addAttribute("mDecCount", mDecCount);

	    model.addAttribute("MemCount", MemCount);
	    model.addAttribute("NoCount", NoCount);

	    model.addAttribute("selectedYear", year);
	    return "/admin/dashboard";
	}


}
