package com.goodmonitoring.controller;

import javax.annotation.Resource;
//import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodmonitoring.service.ApplydataService;
import com.goodmonitoring.service.IndustryCategoryService;
import com.goodmonitoring.service.TargetService;
import com.goodmonitoring.service.UserService;
import com.goodmonitoring.vo.ApplydataVO;
import com.goodmonitoring.vo.UserVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*") //views �� ����
@AllArgsConstructor
public class UserController {

	@Resource(name="targetService")
	private TargetService targetservice;

	@Resource(name="industrycategoryService")
	private IndustryCategoryService industrycategoryservice;
	
	@Resource(name="userService")
    private UserService userService;
	
	@Resource(name="applydataService")
	private ApplydataService applydataService;
	
	//분야, 대상의 전체 목록을 가져온다
		@GetMapping("/write")
		public void tilist(Model model) {
			model.addAttribute("listTarget", targetservice.getList());
			model.addAttribute("listIndustryCategory", industrycategoryservice.getList());
		}
	
	
	@RequestMapping(value="/userJoin",method=RequestMethod.GET)
	public void getUserJoin() throws Exception {	
		
	}

	//sign post ���
	//ȸ�������ϱ�
	@RequestMapping(value="/userJoin", method=RequestMethod.POST)
	public String postUserJoin(UserVO userVO) throws Exception {

	
		userService.insert(userVO);
		
		ApplydataVO applyvo = new ApplydataVO();
	
		
		//applydataService.insertuserjoin(userVO);
		
		//�α��� ȭ������
		return "redirect:/user/LoginForm";
	}

	//로그인 페이지 띄우기
	@RequestMapping(value="/LoginForm", method=RequestMethod.GET)
	public void signupGET(UserVO userVO, Model model) throws Exception {
		
	}
	
	// 로그인 처리
		@RequestMapping(value="/LoginForm", method=RequestMethod.POST)
		public String uloginPOST(@RequestParam("USR_ID") String USR_ID, 
				@RequestParam("USR_PASS") String USR_PASS, 
				
				HttpSession session, RedirectAttributes reAttr) throws Exception {
			
			log.info("login start...");
			log.info("id : " + USR_ID);
			
			 if (session.getAttribute("user") != null ){
		        // 기존에 login이란 세션 값이 존재한다면
		        session.removeAttribute("user"); // 기존값을 제거해 준다.
		     }
			 
			 //개인회원 등급은 1
			int GRADE = 1;
			// 비밀번호 암호화
				// String encryPw = PwSha256.encrypt(u_pw);
			         	         
		    // 로그인이 성공하면 OwnerVO(ovo) 객체를 반환함.
			UserVO userVO = userService.loginuser(USR_ID, USR_ID, GRADE);
		         
		    if ( userVO != null ){ // 로그인 성공
		    	System.out.println(userVO.getUSR_EMAIL());
		        session.setAttribute("user", userVO); // 세션에 login인이란 이름으로 OwnerVO 객체를 저장.
		    	reAttr.addFlashAttribute("result","LoginSeccess");
		        return "redirect:/board/list"; // 로그인 성공시 게시글 목록페이지로 바로 이동
	//맞춤모집정보 리스트로 이동하도록 수정필요@@@
		    }else { // 로그인에 실패한 경우
		    	reAttr.addFlashAttribute("result","LoginFail");
		        return "redirect:/user/LoginForm"; // 로그인 폼으로 다시 가도록 함
		    }
		          
		}
		
		@RequestMapping(value="/logout")
		public ModelAndView logout(HttpSession session) {
			
		        session.invalidate(); // 기존값을 제거해 준다.
		     	
			  ModelAndView mav = new ModelAndView("redirect:/board/list");
		        return mav;
		}
	/**@RequestMapping(value="/signup",method=RequestMethod.GET)
	public void signup() {	
		logger.debug("join~~");
		}**/

	/**	//@Inject
	@Autowired 
	private UserService userService;


	//@Resource(name="userService")
	//private UserService userservice;








	//���̵� �ߺ� �˻�
	@Autowired
	private UserService userservice;

	//@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	@ResponseBody //����� �����Ҷ� �ش� �޼ҵ带 ȣ���� �Լ��� ������ž�Կ� ���� ��ü����

	public int idCheck(@RequestParam("USRID") String USRID) {

		return userservice.idCheck(USRID);
	}


	//�α���
	//@RequestMapping(value = "/usrlogin", method = RequestMethod.POST)
		public String usrlogin(UserVO uservo, HttpServletRequest req, RedirectAttributes rttr) {
		logger.info("post usrlogin");

		HttpSession session = req.getSession();
		UserVO usrlogin = userService.usrlogin(uservo);

		if(usrlogin == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("user", usrlogin);
		}

		return "redirect:/";
	}

	//�α׾ƿ�
	@RequestMapping(value = "/usrlogout", method = RequestMethod.GET)
	public String usrlogout(HttpSession session) {

		session.invalidate();

		return "redirect:/";
	}**/

} 
