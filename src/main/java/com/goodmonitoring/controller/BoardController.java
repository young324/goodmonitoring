package com.goodmonitoring.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodmonitoring.service.ApplydataService;
import com.goodmonitoring.service.BoardService;
import com.goodmonitoring.service.IndustryCategoryService;
import com.goodmonitoring.service.LikeService;
import com.goodmonitoring.service.TargetService;
import com.goodmonitoring.vo.ApplydataVO;
import com.goodmonitoring.vo.BoardVO;
import com.goodmonitoring.vo.CompanyVO;
import com.goodmonitoring.vo.LikeVO;
import com.goodmonitoring.vo.UserVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	@Resource(name="boardService")
	private BoardService service;

	@Resource(name="targetService")
	private TargetService targetservice;

	@Resource(name="industrycategoryService")
	private IndustryCategoryService industrycategoryservice;

	@Resource(name="likeService")
	private LikeService likeService;

	@Resource(name="applydataService")
	private ApplydataService applydataService;



	//회원가입 선택폼
	@GetMapping("/Joinselect")
	public void Joinselect() {
	}

	//로그인 선택폼
	@GetMapping("/Loginselect")
	public void Loginselect() {

	}

	//분야, 대상의 전체 목록을 가져온다
	@GetMapping("/write")
	public void tilist(Model model) {
		model.addAttribute("listTarget", targetservice.getList());
		model.addAttribute("listIndustryCategory", industrycategoryservice.getList());
	}

	

	//전체 목록을 가져온다
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	//이달의 모집정보 페이지 폼
	@GetMapping("/graphmoniter3")
	public void graphmoniter(Model model, HttpServletRequest httpRequest) {
		//가장많은 업종과 그 업종에서 가장많은 대상
		model.addAttribute("MostCategory", service.getmostcate());
		model.addAttribute("MostTarget", service.getmosttarget());
		
		//대상별 모집정보 개수
		model.addAttribute("ilban", service.countTarget("일반모니터"));
		model.addAttribute("deahak", service.countTarget("대학생모니터"));
		model.addAttribute("jubu", service.countTarget("주부모니터"));
		model.addAttribute("global", service.countTarget("글로벌모니터"));
		model.addAttribute("senior", service.countTarget("시니어모니터"));
		
		//이달의 모집정보 개수
		model.addAttribute("countboard",service.countboard());
		
		//모든 업종,대상 리스트
		model.addAttribute("listTarget", targetservice.getList());
		model.addAttribute("listIndustryCategory", industrycategoryservice.getList());
		//model.addAttribute("MostTarget", service.countIC());
	}
	
	@GetMapping("/fitlistJoin")
	public String fitlistJoin(Model model, HttpServletRequest httpRequest) {
		log.info("fitlistJoin");
		
		if( httpRequest.getSession().getAttribute("user") !=null) {
			int USR_NO = ((UserVO) httpRequest.getSession().getAttribute("user")).getUSR_NO();//유저 번호 가져오기
			model.addAttribute("MostCategory", service.getmostcate());
			model.addAttribute("MostTarget", service.getmosttarget());
			if(0 == applydataService.applyisext(USR_NO)) {//한번이라도 지원한적 없으면 가입할때 선택한 업종에 대해서만
				model.addAttribute("list", service.getjoinfitlist(USR_NO));
			}else {//지원한적 있으면 업종과 회사명에 대해서
				return "redirect:/board/fitlistuser";//내게 알맞은 모집정보 페이지로 보냄
			}
		}
		return null;
	}
	
	//지원내역이 있을때 보여주는 맞춤모집정보페이지
	@GetMapping("/fitlistuser")
	public void fitlistuser(Model model, HttpServletRequest httpRequest) {
		log.info("fitlistuser");
		if( httpRequest.getSession().getAttribute("user") !=null) {
			int USR_NO = ((UserVO) httpRequest.getSession().getAttribute("user")).getUSR_NO();
			model.addAttribute("C_NAME", applydataService.getlatelycname(USR_NO));
			model.addAttribute("MostCategory", service.getmostcate());
			model.addAttribute("MostTarget", service.getmosttarget());
			
			String I_C = industrycategoryservice.getcate(applydataService.getfitcategory(USR_NO));//가장 최근,많이 지원한 업종의 코드
				
			model.addAttribute("list", service.getfitcatelist(I_C));
		}
	}
	
	//회사명과 일치하는거만 보여주는 페이지
	@GetMapping("/fitlistC_NAME")
	public void fitlistC_NAME(Model model, HttpServletRequest httpRequest) {
		log.info("fitlistC_NAME");
		if( httpRequest.getSession().getAttribute("user") !=null) {
			int USR_NO = ((UserVO) httpRequest.getSession().getAttribute("user")).getUSR_NO();
			model.addAttribute("MostCategory", service.getmostcate());
			model.addAttribute("MostTarget", service.getmosttarget());
			String C_NAME = applydataService.getlatelycname(USR_NO);//최근 지원한 회사명
			model.addAttribute("C_NAME", C_NAME);

			model.addAttribute("list", service.getC_NAMElist(C_NAME));
		}
	}
	
	//체크박스 검색
	@ResponseBody
	@RequestMapping(value = "/boardSearchList", method = RequestMethod.POST, produces = "application/json")

	public void boardSearchList(Model model, HttpServletRequest httpRequest) {
		
		String targetList = (httpRequest.getParameter("lists"));
		BoardVO boardvo = new BoardVO();
		boardvo.setTARGET(targetList);
		model.addAttribute("list", service.boardSearchList(boardvo));
		
		
		
	}
	
	//게시물 등록처리
	@PostMapping("/write")
	public String write(BoardVO boardvo, RedirectAttributes rttr, 
			@RequestParam(value = "onlinearry[]", required=false) List<String> valueArr
			) throws Exception {
		log.info("write: " + boardvo);

		service.write(boardvo);
		//addAttribute는 리다이렉트시 파라미터도 넘겨진다.
		//addFlashAttribute는 리다이렉트시 세션을 통해 전달하므로 ? 뒤에 파라미터가 안 보인다.


		rttr.addFlashAttribute("result", boardvo.getBOARD_NO());
		return "redirect:/board/list";		
	}


	//게시물 읽기	
	//BOARD_NO을 좀 더 명시적으로 처리하는 @RequestParam을 이용해서 지정
	//화면으로 해당 번호의 게시물을 전달해야 하므로 Model파라미터
	@GetMapping("/read")
	public void readShow(@RequestParam("BOARD_NO") int BOARD_NO, Model model, HttpServletRequest httpRequest) {
		log.info("/read");

		model.addAttribute("board", service.readShow(BOARD_NO));

		if( httpRequest.getSession().getAttribute("user") !=null) {//개인회원으로 로그인했을때
			int USR_NO = ((UserVO) httpRequest.getSession().getAttribute("user")).getUSR_NO();//유저 번호 가져오기

			LikeVO likevo = new LikeVO();
			likevo.setBOARD_NO(BOARD_NO);
			likevo.setUSR_NO(USR_NO);

			//1이면  추천내역 존재, 0이면 추천내역 없음
			//like라는 이름으로 추천여부를 날림
			model.addAttribute("like",likeService.getBoardLike(likevo));
			model.addAttribute("USR_NO",USR_NO);


			//지원여부
			ApplydataVO applydatavo = new ApplydataVO();
			applydatavo.setBOARD_NO(BOARD_NO);
			applydatavo.setUSR_NO(USR_NO);

			model.addAttribute("ck",applydataService.getBoardApply(applydatavo));
			model.addAttribute("USR_NO",USR_NO);

		}

		if( httpRequest.getSession().getAttribute("company") !=null) {//기업회원으로 로그인했을때
			int C_NO = ((CompanyVO) httpRequest.getSession().getAttribute("company")).getC_NO();//기업 회원번호 가져오기


			model.addAttribute("C_NO",C_NO);
		}	
	}

	//게시물 추천
	@ResponseBody
	@RequestMapping(value = "/like", method = RequestMethod.POST, produces = "application/json")
	public int like(HttpServletRequest httpRequest) throws Exception {

		int like = Integer.parseInt(httpRequest.getParameter("like"));//null??
		int BOARD_NO = Integer.parseInt(httpRequest.getParameter("BOARD_NO"));
		int USR_NO = Integer.parseInt(httpRequest.getParameter("USR_NO"));

		LikeVO LikeVO = new LikeVO();

		LikeVO.setBOARD_NO(BOARD_NO);
		LikeVO.setUSR_NO(USR_NO);

		System.out.println(like);
		if(like >=1) {
			likeService.deleteBoardLike(LikeVO);
			service.recommendcountM(BOARD_NO);//추천수 감소
			like = 0;
		} else {
			likeService.insertlike(LikeVO);
			service.recommendcount(BOARD_NO);//추천수 증가
			like = 1;
		}		
		return like;
	}

	//지원하기
	@ResponseBody
	@RequestMapping(value = "/apply", method = RequestMethod.POST, produces = "application/json")
	public int apply(HttpServletRequest httpRequest) throws Exception {

		int ck = Integer.parseInt(httpRequest.getParameter("ck"));
		int BOARD_NO = Integer.parseInt(httpRequest.getParameter("BOARD_NO"));
		int USR_NO = Integer.parseInt(httpRequest.getParameter("USR_NO"));
		
		int INTEREST_CATEGORY_CODE = industrycategoryservice.getcatecode(httpRequest.getParameter("INTEREST_CATEGORY"));
		String C_NAME = httpRequest.getParameter("C_NAME");
		
		ApplydataVO ApplydataVO = new ApplydataVO();

		ApplydataVO.setBOARD_NO(BOARD_NO);
		ApplydataVO.setUSR_NO(USR_NO);
		ApplydataVO.setINTEREST_CATEGORY_CODE(INTEREST_CATEGORY_CODE);
		ApplydataVO.setC_NAME(C_NAME);

		
		System.out.println(ck);//1 = 지원내역있음
		if(ck >=1) {//지원한적 있으면 내역추가 x	
		} else {
			applydataService.insert(ApplydataVO);
		}		
		return ck;
	}


	//게시물 수정
	@PostMapping("/modify")
	public String modify(BoardVO boardvo, RedirectAttributes rttr) {
		log.info("modify: " + boardvo);

		if(service.modify(boardvo)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list";
	}




	//게시물 삭제
	public String remove(@RequestParam("BOARD_NO") int BOARD_NO, RedirectAttributes rttr) {
		log.info("remove....." + BOARD_NO);

		if(service.remove(BOARD_NO)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list";
	}




}
