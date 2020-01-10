package com.goodmonitoring.controller;

import javax.annotation.Resource;
//import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodmonitoring.service.CompanyService;
import com.goodmonitoring.vo.CompanyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/m/company/*") 
@AllArgsConstructor
public class m_CompanyController {


	@Resource(name="companyService")
    private CompanyService companyService;
	
	
	@RequestMapping(value="/companyJoin",method=RequestMethod.GET)
	public void getCompanyJoin() throws Exception {	
		
	}

	//sign post
	@RequestMapping(value="/companyJoin", method=RequestMethod.POST)
	public String postCompanyJoin(CompanyVO companyVO) throws Exception {

	
		companyService.insert(companyVO);

		//�α��� ȭ������
		return "redirect:/m/company/companyLoginForm";
	}
	
	//로그인 페이지 띄우기
		@RequestMapping(value="/companyLoginForm", method=RequestMethod.GET)
		public void signupGET() throws Exception {
			
		}

		// 로그인 처리
				@RequestMapping(value="/companyLoginForm", method=RequestMethod.POST)
				public String cloginPOST(@RequestParam("C_ID") String C_ID, 
						@RequestParam("C_PASS") String C_PASS, 
						
						HttpSession session, RedirectAttributes reAttr) throws Exception {
					
					log.info("login start...");
					log.info("id : " + C_ID);
					
					 if (session.getAttribute("company") != null ){
				        // 기존에 login이란 세션 값이 존재한다면
				        session.removeAttribute("company"); // 기존값을 제거해 준다.
				     }
					 
					 //기업회원 등급은 2
					int GRADE = 2;
					// 비밀번호 암호화
						// String encryPw = PwSha256.encrypt(u_pw);
					         	         
				    // 로그인이 성공하면 객체를 반환함.
					CompanyVO companyVO = companyService.loginCompany(C_ID, C_PASS, GRADE);
				         
				    if ( companyVO != null ){ // 로그인 성공
				    	System.out.println(companyVO.getC_EMAIL());
				        session.setAttribute("company", companyVO); // 세션에 company란 이름으로 VO 객체를 저장.
				        session.setAttribute("C_ID", companyVO.getC_ID()); // vo값이 단일로 안불러와져서 단일로 전송

				    	reAttr.addFlashAttribute("result","LoginSeccess");
				        return "redirect:/m/board/list?pageNum=1&amount=10"; // 로그인 성공시 게시글 목록페이지로 바로 이동
			//맞춤모집정보 리스트로 이동하도록 수정필요@@@
				    }else { // 로그인에 실패한 경우
				    	reAttr.addFlashAttribute("result","LoginFail");
				        return "redirect:/m/company/companyLoginForm"; // 로그인 폼으로 다시 가도록 함
				    }
				          
				}

} 
