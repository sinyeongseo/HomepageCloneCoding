package com.spring.solinsystem.table;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.solinsystem.dto.CommentDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.dto.TableDTO;
import com.spring.solinsystem.login.LoginService;
import com.spring.solinsystem.util.Criteria;
import com.spring.solinsystem.util.PageMaker;

@Controller
public class TableController {
	@Inject
	TableService service;
	@Inject
	LoginService loginservice;

	@RequestMapping(value="/tables.do") //게시판의 모든 정보를 가져옴
    public ModelAndView tables(@RequestParam(name ="mb_id", required = false) String mb_id,HttpSession session, Model model,Criteria cri) {
		//Criteria 객체를 사용하여 페이지 번호와 페이지당 보여줄 게시글 수를 알아낸다.
		ModelAndView mav = new ModelAndView();
        // 세션에서 필요한 값을 가져옴
        
        String mb_img = (String) session.getAttribute("mb_img");
        
        // 세션 정보를 JSP 페이지로 전달
        model.addAttribute("mb_id", mb_id);
        model.addAttribute("mb_img", mb_img);
        //PageMaker() 객체를 생성한다.
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);//page와 perPageNum을 셋팅해준다
        pageMaker.setTotalCount(service.countTableList()); //총 게시글 수를 셋팅해준다.

        List<TableDTO> result = service.getList(cri);
        MemberDTO member = loginservice.getUserByUserId(mb_id);
        mav.setViewName("/solin/tables");
        mav.addObject("list", result);
        mav.addObject("pageMaker", pageMaker); //셋팅된 pageMaker에는 페이징을 위한 
        									//버튼의 값들이 들어있고 modelandview를 통해서 jsp에 넘겨준다.
        mav.addObject("member",member);
        return mav; // JSP 페이지의 이름
    }
	
	
	
	@GetMapping(value="/tableview.do") //게시판 상세 보기
	public ModelAndView view(TableDTO dto) {
		ModelAndView mav = new ModelAndView();
		service.viewService(dto);
		service.commentcount(dto);
		TableDTO tableContent= service.getContent(dto);
		
		TableDTO tb_writer = service.getwriter(dto);
		MemberDTO mb_role = service.gettablerole(tb_writer.getTb_writer());
	
		mav.setViewName("/solin/tablesview");
		mav.addObject("tableContent",tableContent);
		mav.addObject("tablerole", (mb_role != null) ? mb_role.getMb_role() : "member");
		
		return mav;
	}
	
	
	@RequestMapping(value="/tableswrite.do") //게시판 쓰기 페이지로 넘어감
	public String tableswrite() {
		
		return "/solin/tableswrite";
	}
	
	@RequestMapping(value="/tableswriteservice.do") //게시판 쓰기 서비스 실행 
	public String saveTable(TableDTO dto) {		
		service.writeService(dto);
		

		return "redirect:/tables.do";
	}
	
	@RequestMapping(value="tablepwck.do")
	public String tablepwCheck(HttpServletRequest request,Model model) {
		String tb_num = request.getParameter("tb_num");
		String action = request.getParameter("action");
		System.out.println("talepwck 페이지 넘어갈때"+action);
		model.addAttribute("tb_num", tb_num);
		model.addAttribute("action",action);
		
		return "/solin/tablepwck";
	}
	
	
	  @PostMapping(value="/tablechkService.do")
	  @ResponseBody 
	  public String editpwcheck(@RequestBody Map<String, String> requestData,HttpServletRequest request) throws Exception { 
		  TableDTO dto = new TableDTO();
		  
		  String action = requestData.get("action");
	      String tb_pwd = requestData.get("tb_pwd");
	      int tb_num = Integer.parseInt(requestData.get("tb_num")); 
		
		  dto.setTb_pwd(tb_pwd);
		  dto.setTb_num(tb_num);
		  int result= service.tbpwCheck(dto);
  
		  
		  if(result != 0)
		  	{ return "{\"result\": \"success\", \"action\": \"" + action + "\"}"; }// JSON 형식으로 실패 응답 반환 
		  else 
		  	{ return "{\"result\": \"fail\"}";  }
  
	 }
	  
	  @PostMapping(value="/removeService.do")
	  @ResponseBody 
	  public Map<String, String> removeserice(@RequestBody Map<String, String> requestData, RedirectAttributes rttr) {
		
		  TableDTO dto = new TableDTO();
		  int tb_num = Integer.parseInt(requestData.get("tb_num"));
		  
		  dto.setTb_num(tb_num);
		  service.deleteService(dto);
		  Map<String, String> response = new HashMap<>();
		  response.put("url", "/tables.do"); 
		  response.put("message", "삭제되었습니다. 목록으로 이동합니다.");
		  
		  return response;
	  }
	  
	  
	  @RequestMapping(value="/tablesedit.do")
	  public String tablesedit(@RequestParam(name="postNumber")int tb_num ,Model model) {
		  model.addAttribute("tb_num", tb_num);
		  return "/solin/tablesedit";
	  }
	  
	  @RequestMapping(value="/editService.do", method=RequestMethod.POST)
	  public String editserice(TableDTO dto, RedirectAttributes rttr) {		
		  service.editService(dto);
		  
		  int editresult = 0;
		  rttr.addFlashAttribute("editresult", editresult);
		  
		  return "redirect:/tables.do";
	  }
	  
	  @RequestMapping(value="likeservice.do")
	  public ModelAndView likeservice(@RequestParam(name="tb_like")int tb_like,@RequestParam(name="tb_num")int tb_num) {
		  TableDTO dto = new TableDTO();
		 
		  dto.setTb_like(tb_like);
		  dto.setTb_num(tb_num);
		  
		  ModelAndView mav = new ModelAndView();
		  service.likeService(dto);
		  TableDTO tableContent= service.getContent(dto);
		  mav.setViewName("/solin/tablesview");
		  mav.addObject("tableContent",tableContent);


		  return mav;
	  }
	  
	  
	  @RequestMapping(value="searchService.do")
	  public ModelAndView searchService(TableDTO dto) {
		 
		  ModelAndView mav = new ModelAndView();
		  List<TableDTO> result= service.searchService(dto);
		  mav.setViewName("/solin/tables");
	      mav.addObject("list", result);

		  
		  return mav;
	  }
	  
	  @RequestMapping(value = "/commentservice.do")
	  public String commentService(
	          @RequestParam(name = "tb_num") int tb_num,
	          @RequestParam(name = "co_writer", required = false) String co_writer,
	          @RequestParam(name = "co_content") String co_content,
	          RedirectAttributes redirectAttributes) {
	      CommentDTO commentdto = new CommentDTO();
	      commentdto.setCo_content(co_content);
	      commentdto.setTb_num(tb_num);
	      commentdto.setCo_writer(co_writer);
	      
	      TableDTO dto = new TableDTO();
	      dto.setTb_num(tb_num);
	      service.commentService(commentdto);
	      service.commentcount(dto);

	      // 리디렉션 시에 파라미터를 전달하기 위해 RedirectAttributes를 사용합니다.
	      redirectAttributes.addAttribute("tb_num", tb_num);

	      return "redirect:/tableview.do";
	  }

	  @RequestMapping(value="/getCommentList.do")
	  @ResponseBody
	  public List<CommentDTO> getCommnetList(@RequestParam("tb_num") int tb_num){
		  CommentDTO dto = new CommentDTO();
		  dto.setTb_num(tb_num);
		  return service.getCommentList(dto);
	  }
}
