package com.goodmonitoring.controller;
 
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
import com.goodmonitoring.service.FileUploadService;
import com.goodmonitoring.service.IndustryCategoryService;
import com.goodmonitoring.service.LikeService;
import com.goodmonitoring.service.TargetService;
import com.goodmonitoring.vo.ApplydataVO;
import com.goodmonitoring.vo.BoardFileVO;
import com.goodmonitoring.vo.BoardVO;
import com.goodmonitoring.vo.CompanyVO;
import com.goodmonitoring.vo.Criteria;
import com.goodmonitoring.vo.LikeVO;
import com.goodmonitoring.vo.PageDTO;
import com.goodmonitoring.vo.TargetVO;
import com.goodmonitoring.vo.UserVO;
import com.mysql.cj.core.util.StringUtils;

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
	
	@Autowired
	private FileUploadService fileUploadService;

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

	/*
	 * //전체 목록을 가져온다
	 * 
	 * @GetMapping("/list") public void list(Model model) { log.info("list");
	 * model.addAttribute("list", service.getList()); }
	 */
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {
		log.info("list");
		model.addAttribute("list", service.getList(new Criteria((cri.getPageNum()-1)*cri.getAmount(),cri.getAmount())));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
	}
	@GetMapping("/main")
	public void mainlist(Criteria cri,Model model) {
		log.info("DeadlineList");
		model.addAttribute("RecommendList", service.RecommendList());
		model.addAttribute("DeadlineList", service.DeadlineList());
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
	}

	@GetMapping("/monthlylist")
	public void monthlylist() {}
	
	//이달의 모집정보 페이지 폼
	@GetMapping("/graphmoniter")
	public void graphmoniter(Model model, HttpServletRequest httpRequest) {
		//가장많은 업종과 그 업종에서 가장많은 대상
		model.addAttribute("MostCategory", service.getmostcate());
		model.addAttribute("MostTarget", service.getmosttarget());
		
		model.addAttribute("list", service.getmonthlyList());

		 ArrayList<TargetVO> targetList =  (ArrayList<TargetVO>) targetservice.getList();
		//대상별 모집정보 개수
		model.addAttribute("ilban", service.countTarget(targetList.get(0)));
		model.addAttribute("deahak", service.countTarget(targetList.get(1)));
		model.addAttribute("jubu", service.countTarget(targetList.get(2)));
		model.addAttribute("global", service.countTarget(targetList.get(3)));
		model.addAttribute("senior", service.countTarget(targetList.get(4)));
		
		//이달의 모집정보 개수
		model.addAttribute("countboard",service.countboard());
		
		//모든 업종,대상 리스트
		model.addAttribute("listTarget", targetservice.getList());
		model.addAttribute("listIndustryCategory", industrycategoryservice.getList());
		model.addAttribute("ICcount", industrycategoryservice.ICcount());
		model.addAttribute("listIndustryCategory", industrycategoryservice.getList());
		
		model.addAttribute("btn",0);
		
		//일반모니터의 업종별 개수, 모집정보 수 / 기본으로 보여줄 데이터
		model.addAttribute("all_IC_count", service.countTarget(targetList.get(0)));
		for(int i=0; i < targetservice.TGcount(); i++)
		{	
			String T = "target" + i;
			model.addAttribute(T, service.countTarget(targetList.get(i)));
		}
		// 이번달 특정대상의 업종별 모집정보 수 리스트
		model.addAttribute("countICbyTG", service.countICbyTG(targetList.get(0)));
	}

	//대상별 이달의 모집정보 데이터
		@ResponseBody
		@RequestMapping(value = "/monthly", method = RequestMethod.POST, produces = "application/json")
		public List<BoardVO> monthly(Model model,HttpServletRequest httpRequest) throws Exception {

			//int btn = Integer.parseInt(httpRequest.getParameter("btn"));

			
			int list_size = industrycategoryservice.ICcount();//업종개수 + 1 >> 뿌려줄 데이터 개수
			int[] arr = new int[list_size + 1];//ajax로 보내줄 arrylist
			
			//int all_IC_count = 0;
			String btnname = httpRequest.getParameter("btnname");
			
			TargetVO targetvo = new TargetVO();
			targetvo.setTARGET(btnname);
			 
			List<BoardVO> list =  new ArrayList<BoardVO>();
			
			if(btnname != null) {
				System.out.println(btnname);
			//	all_IC_count = service.countTarget(targetvo);

			//	arr[0] = all_IC_count;
				
				list = service.countICbyTG(targetvo);
				for(int i=0; i<industrycategoryservice.ICcount() + 1; i++) {
					
				}
				//btn = 1
			}
			else {
				//btn = 0;
			}
			
			return list;
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
		@Transactional
		@PostMapping("/write")
		public String write(BoardVO boardvo, RedirectAttributes rttr,  
				BoardFileVO boardFileVO,HttpServletRequest request) throws Exception{
			log.info("write: " + boardvo);
			
			//날짜 string 으로 입력 처리되기 String 변수에 데이터 입력
			boardvo.dateStringConverte();
			service.write(boardvo);
		
			/**
			 * 첨부파일 등록처리
			 */
			String uploadPath = request.getSession().getServletContext().getRealPath("/")+"uploads"+ File.separator+"board" + File.separator;		
			String fileUrlPath = "uploads/board";
			
			boardFileVO.setBOARD_NO(boardvo.getBOARD_NO());
			log.info(" 등록된 번호 : " + boardvo.getBOARD_NO());		
			fileUploadService.fileUploadAction(boardFileVO, uploadPath, fileUrlPath);		
			
			rttr.addFlashAttribute("result", boardvo.getBOARD_NO());
			return "redirect:/board/list";
		}


	//게시물 읽기	
	//BOARD_NO을 좀 더 명시적으로 처리하는 @RequestParam을 이용해서 지정
	//화면으로 해당 번호의 게시물을 전달해야 하므로 Model파라미터
	@GetMapping("/read")
	public void readShow(@RequestParam("BOARD_NO") int BOARD_NO, Model model, HttpServletRequest httpRequest) throws Exception {
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
		
		//이미지 불러오기 FILE_PATH

		model.addAttribute("FILE_PATH",fileUploadService.img_path(BOARD_NO));
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

	
	//파일 삭제
		@PostMapping("/fileDelete")
		@ResponseBody
		public String fileDelete(@RequestParam Map<String, Object> map, HttpServletRequest request ) throws Exception{
			BoardFileVO boardFileVO =fileUploadService.boardGetByFileInfo(map);	
			if(boardFileVO!=null && !StringUtils.isNullOrEmpty(boardFileVO.getFILE_PATH())) {
				String path = request.getSession().getServletContext().getRealPath("/")+boardFileVO.getFILE_PATH().replace('/', File.separatorChar);
				
				File file=new File(path);
				if(file.exists()) {
					file.delete();		
					//DB 에서 삭제
					fileUploadService.fileDelete(map);			
					return "success";
				}
			}
			return "error";
		}

	


}
