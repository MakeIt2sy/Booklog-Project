package com.booklog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booklog.service.QnaCodeService;
import com.booklog.service.QnaReplyService;
import com.booklog.service.QnaService;
import com.vos.web.MemberVo;
import com.vos.web.QnaCriteria;
import com.vos.web.QnaPageMakerDTO;
import com.vos.web.QnaReplyVo;
import com.vos.web.QnaCodeVo;
import com.vos.web.QnaVO;
import com.vos.web.ReturnVo;

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	@Autowired
	private QnaCodeService qnaCodeService;
	@Autowired
	private QnaReplyService qnaReplyService;
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	

	@GetMapping("/list") public String qnaList(Model model,QnaCriteria cri) {
		logger.info("RequestMethod[GET] : /qna/list");
		
		model.addAttribute("qnaList", qnaService.selectQnaListPaging(cri));
		
		int total = qnaService.getTotal();
		
		QnaPageMakerDTO pageMake = new QnaPageMakerDTO(cri,total); 
		
		model.addAttribute("pageMaker", pageMake);
		return "/qna/list";
		
	}
	
	@GetMapping("/enroll")
	public String qnaEnroll(HttpServletRequest request, Model model) {
		logger.info("RequestMethod[GET] : /qna/enroll");
		
		HttpSession session = request.getSession();
		Object object = session.getAttribute("login");
		if (object != null && object.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) object;
			model.addAttribute("loginVo", loginVo);		
		}
		
		List<QnaCodeVo> qnaCodeList = qnaCodeService.selectQnaCodeList(); 
		model.addAttribute("qnaCodeList", qnaCodeList);
		
		return "/qna/enroll";
	}
	
	
	  @PostMapping("/enrollAjax.do") 
	 public @ResponseBody ReturnVo qnaEnrollAjax(HttpServletRequest request, QnaVO qnavo) {
		  logger.info("RequestAjaxMethod[POST] : /qna/QnaEnrollAjax");
		  
		
			HttpSession session = request.getSession();
			Object object = session.getAttribute("login");
			if (object != null && object.getClass().getSimpleName().equals("MemberVo")){
				MemberVo loginVo = (MemberVo)object;
				
				qnavo.setQnaWriter(Integer.parseInt(loginVo.getUserno()));
				qnavo.setQnaWriterNickname(loginVo.getUsernickname());
				String content = qnavo.getQnaContent();
				content = content.replace("\r\n","<br>");
				qnavo.setQnaContent(content);
				
				if(qnavo.getQnaIsPublic()==null) {
					qnavo.setQnaIsPublic("true");
				}
				
				 int insertResult = 0; String message = "";
				  
				  insertResult = qnaService.insertQna(qnavo);
				  
				  System.out.println( insertResult);
				  if(insertResult ==1) {
					  message = "????????? ?????????????????????."; 
				      return new ReturnVo("YES",message,null); 
				  }else {
					  message = "????????? ???????????? ???????????????."; 
				     return new ReturnVo("NO",message,null); }
			}else {
			     String message = "?????? ????????? ???????????? ????????????. ???????????? ??????????????????"; 
			     return new ReturnVo("NO",message,null);
			}
			
		 
    }
	 
	
	  @PostMapping(path="/qnaPwChck.do" ,produces = "application/json ;charset=utf8") 
	  public @ResponseBody ReturnVo qnaPasswordCheck(@RequestParam(value = "qnaNo") int qnaNo,@RequestParam(value = "qnaPassword") String qnaPassword,HttpServletRequest request) {
	    //????????? ??????		  
		  if(qnaPassword == "") {
			  HttpSession session = request.getSession();
				Object object = session.getAttribute("login");
				if (object != null && object.getClass().getSimpleName().equals("MemberVo")){
					MemberVo loginVo = (MemberVo)object;
					String userRole = loginVo.getUserrole();
					
					if(userRole.equals("0")){
				    return new ReturnVo("YES","????????? ???????????????.",null);
					}else {
						 return new ReturnVo("NO","???????????? ????????????.",null);
					}
				}
		  }
		  

		  QnaVO qnaVo = new QnaVO();
		  qnaVo.setQnaNo(qnaNo);
		  qnaVo.setQnaPassword(qnaPassword);
	  
		  QnaVO qna = qnaService.selectQnaWithPassword(qnaVo);
	   
		  if(qna != null) {
			  return new ReturnVo("YES","??????????????? ???????????????.",null);
		  }else {
			  return new ReturnVo("NO","??????????????? ???????????? ????????????.",null);
		  }
	   
	  }
	  
	  
	  
	 @GetMapping("/view") 
	  public String qnaView(HttpServletRequest request,QnaVO qna,Model model) {
		 logger.info("RequestMethod[GET] : /qna/view");
		 
			HttpSession session = request.getSession();
			Object object = session.getAttribute("login");
			if (object != null && object.getClass().getSimpleName().equals("MemberVo")){
				MemberVo loginVo = (MemberVo) object;
				model.addAttribute("loginVo", loginVo);		
			}
		 
		 QnaVO qnaVo = qnaService.selectQna(qna);
		 List<QnaReplyVo> qnaReplyList = qnaReplyService.selectQnaReplyList(qnaVo);
		 model.addAttribute("qnaVo", qnaVo);
		 model.addAttribute("qnaReplyList", qnaReplyList);
		 
			 return "/qna/view";

	 }
	

	@PostMapping("/modify")
	public String qnaModify(QnaVO qna, Model model) {
		logger.info("RequestMethod[GET] : /qna/modify");
	
		
		QnaVO qnaVo = qnaService.selectQna(qna);
		
		model.addAttribute("qnaVo",qnaVo );
		
		List<QnaCodeVo> qnaCodeList = qnaCodeService.selectQnaCodeList();
		model.addAttribute("qnaCodeList", qnaCodeList);
		
		return "/qna/modify";
		
	}
	 
	
	@PostMapping(path="/modifyAjax.do" ,produces = "application/json ;charset=utf8")
	public @ResponseBody ReturnVo qnaModifyAjax(HttpServletRequest request, QnaVO qnavo) {
		
		 logger.info("RequestAjaxMethod[POST] : /qna/qnaModifyAjax");
				
				if(qnavo.getQnaIsPublic()==null) {
					qnavo.setQnaIsPublic("true");
				}
						
				 int updateResult = 0; String message = "";
				  
				  updateResult = qnaService.updateQna(qnavo);
				  
				  System.out.println(updateResult);
				  if(updateResult ==1) {
					  message = "????????? ?????????????????????."; 
				      return new ReturnVo("YES",message,null); 
				  }else {
					  message = "????????? ???????????? ???????????????. ?????? ??? ??? ?????? ??? ??????????????????."; 
				     return new ReturnVo("NO",message,null); }
		
	}
	
	@PostMapping("/delete.do")
	public @ResponseBody ReturnVo qnaDeleteAjax(HttpServletRequest request, QnaVO qnaVo) {
		
		int deleteResult = 0; String message="";
		
		deleteResult = qnaService.deleteQna(qnaVo);
		
		if(deleteResult ==1) {
			message = "?????????????????????.";
			return new ReturnVo("YES",message,null);
		}else {
			message = "???????????? ???????????????. ?????? ??? ??? ?????? ??? ??????????????????.";
			return new ReturnVo("NO",message,null); 
		}
	
	}
	
	@PostMapping(path="/replyEnrollAjax.do"  ,produces = "application/json ;charset=utf8")
	public @ResponseBody ReturnVo qnaReplyEnrollAjax(HttpServletRequest request, QnaReplyVo qnaReplyVo) {
			
		int insertResult =0; String message="";
		
		insertResult = qnaReplyService.insertQnaReply(qnaReplyVo);
		
		if(insertResult ==1) {
			message = "?????????????????????.";
			return new ReturnVo("YES",message,null);
		}else {
			message = "???????????? ???????????????. ?????? ??? ??? ?????? ??? ??????????????????.";
			return new ReturnVo("NO",message,null);
		}
	
		
	
	}

	@PostMapping("/deleteReplyAjax.do")
	public @ResponseBody ReturnVo qnaReplyDeleteAjax(QnaReplyVo qnaReplyVo) {
		
		int deleteResult = 0; String message="";
		
		deleteResult = qnaReplyService.deleteQnaReply(qnaReplyVo);
		
		if(deleteResult ==1) {
			message = "?????????????????????.";
			return new ReturnVo("YES",message,null);
		}else {
			message = "???????????? ???????????????. ?????? ??? ??? ?????? ??? ??????????????????.";
			return new ReturnVo("NO",message,null); 
		}
	
	}

}
