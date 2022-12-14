package com.kh.md.academy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.md.academy.service.AcademyService;
import com.kh.md.academy.vo.CategoryVo;
import com.kh.md.academy.vo.ClassVo;
import com.kh.md.academy.vo.CurriculumVo;
import com.kh.md.academy.vo.StudentVo;
import com.kh.md.common.FileUploader;
import com.kh.md.common.PageVo;
import com.kh.md.common.Pagination;
import com.kh.md.member.vo.MemberVo;

@Controller
@RequestMapping("academy")
public class AcademyController {
	
	private final AcademyService service;
	
	@Autowired
	public AcademyController(AcademyService service) {
		this.service = service;
	}

//화면 보여주기-----------------------------------------
	@GetMapping("roll/{pno}")
	public String roll(Model model, HttpSession session, @PathVariable int pno, @RequestParam(value="categoryNo", required=false) String categoryNo, 
															@RequestParam(value="keyword", required=false) String keyword) {
		
		//로그인한 멤버가 강사의 강의 조회
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		if(loginMember != null) {
			String memberNo = loginMember.getNo();
			
			List<ClassVo> classByInstructor = service.selectClassByInstructor(memberNo);
			
			if(classByInstructor != null) {
				
				model.addAttribute("classByInstructor", classByInstructor);
			}else {
				System.out.println("classByInstructor == null!");
			}
		}else {
			System.out.println("로그인멤버 null!");
		}
					
		//검색창의 카테고리 조회해오기
		List<CategoryVo> categoryList = service.showCategory();

		Map<String,String> map = new HashMap<String, String>();
		map.put("no", categoryNo);
		map.put("keyword", keyword);
		
		//# of total class
		int totalCount = service.countTotalClass(map);
		
		PageVo pvo = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<ClassVo> classList = service.selectClassList(pvo, map);
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("classList", classList);
		model.addAttribute("pvo", pvo);
		model.addAttribute("keyword", keyword);
		
		return "academy/roll";
	}
	
	//ajax - 수강생 가져오기
	@GetMapping("my/{cno}")
	@ResponseBody
	public List<StudentVo> getMyEnrolledStudents(@PathVariable int cno) {
		
		System.out.println("ajax요청받음!");
		List<StudentVo> svo = service.selectEnrolledStudent(cno);
		return svo;
	}
	//ajax - 수강생 입실시각 입력하기
	@PostMapping("time")
	@ResponseBody
	public String inputTime(String studentNo , String classNo /* @RequestParam Map<String, String> inputMap */) {
		Gson gson = new Gson();
		
			System.out.println("두번째 ajax요청받음!");
		
		String[] studentNoArr = gson.fromJson(studentNo, String[].class);
		
			for (int i = 0; i < studentNoArr.length; i++) {
				System.out.println(i + "번째 인덱스값 : " + studentNoArr[i]);
			}
		
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		
		for(int i = 0; i < studentNoArr.length; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("studentNo", studentNoArr[i]);
			map.put("classNo", classNo);
			list.add(map);
		}
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println("리스트 내용 : " + list.get(i));
		}
		
		int result = service.insertTime(list);
			System.out.println(result);
		
		if(result == -1) {
			return "checkedStudents";
		}else{
			return "0";
			
		}
		
	}
	
	@GetMapping("roll/detail/{cno}")
	public String rollDetail(Model model, @PathVariable int cno) {
		
		List<StudentVo> svo = service.selectEnrolledStudent(cno);
		ClassVo cvo = service.selectOneClass(cno);
		
		model.addAttribute("svo", svo);
		model.addAttribute("cvo", cvo);
		return "academy/roll-detail";
	}
	
	@GetMapping("roll/detail/edit")
	public String rollDetailEdit() {
		return "academy/roll-detail-edit";
	}
	
	@GetMapping("search/{pno}")
	public String search(Model model, @PathVariable int pno, @RequestParam(value="searchBy", required=false) String search, 
																@RequestParam(value="keyword", required=false) String keyword) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("keyword", keyword);
		
		int totalCount = service.countTotalStd(map);
		
		PageVo pvo = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<StudentVo> stdList = service.showStudentList(pvo, map);
		
		model.addAttribute("stdList", stdList);
		model.addAttribute("pvo", pvo);
		model.addAttribute("search", search);
		model.addAttribute("keyword", keyword);
		return "academy/search";
	}
	
	@GetMapping("search/detail/{no}")
	public String searchDetail(@PathVariable String no, Model model) {
		//디비가서 수강생 한명 조회(no)
		StudentVo svo = service.selectOneStudent(no);
		
		model.addAttribute("svo", svo);
		return "academy/search-detail";
	}
	
	@GetMapping("search/detail/edit/{no}")
	public String searchDetailEdit(@PathVariable String no, Model model) {
		//디비가서 수강생 한명 조회(no)
		StudentVo svo = service.selectOneStudent(no);
		
		model.addAttribute("svo", svo);
		return "academy/search-detail-edit";
	}
	
	@GetMapping("addStd")
	public String addStudent(Model model) {
 		//모달창에 넘겨줄 모든 클래스 리스트 가져오기
// 		List<ClassVo> classList = service.selectClassList();
// 		model.addAttribute("classList", classList);
		return "academy/add-student";
	}
	
	//커리큘럼 조회(전체 클래스 리스트) 페이지 보여주기 + 검색
	@GetMapping("curriculum/{pno}")
	public String curriculum(Model model, @PathVariable int pno, @RequestParam(value="search",required=false) String cNo, 
																	@RequestParam(value="keyword",required=false) String keyword) {
		//검색창의 카테고리 조회해오기
		List<CategoryVo> categoryList = service.showCategory();

		Map<String,String> map = new HashMap<String, String>();
		map.put("no", cNo);
		map.put("keyword", keyword);

		
		//# of total class
		int totalCount = service.countTotalClass(map);
		
		PageVo pvo = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<ClassVo> classList = service.selectClassList(pvo, map);
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("classList", classList);
		model.addAttribute("pvo", pvo);
		model.addAttribute("keyword", keyword);
		
		return "academy/curriculum";
	}
	
	
	//ajax로 전체 클래스 리스트 보여주기
	@GetMapping("classList/{pno}")
	@ResponseBody
	public Map showClasList(@PathVariable int pno, @RequestParam(value="search",required=false) String cNo, @RequestParam(value="keyword",required=false) String keyword) {
		Map map = new HashMap<Integer, String>();
		map.put("no", cNo);
		map.put("keyword", keyword);
		
		int totalCount = service.countTotalClass(map);
		
		PageVo pvo = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<ClassVo> classList = service.selectClassList(pvo, map);
		
		Map voMap = new HashMap<List<ClassVo>, PageVo>();
		voMap.put("classList", classList);
		voMap.put("pvo", pvo);
		
		return voMap;
	}
	
	@GetMapping("addCurr")
	public String addCurriculum(Model model) {
		//카테고리 목록 넘겨주면서 화면 보여주기
		List<CategoryVo> category = service.showCategory();
		List<MemberVo> member = service.showMember();
		
		model.addAttribute("category", category);
		model.addAttribute("member", member);
		return "academy/add-curriculum";
	}
	
	@GetMapping("curriculum/detail/{cno}")
	public String curriculumDetail(Model model, @PathVariable int cno) {
		//클래스, 커리큘럼 및 학생 조회하기(cno)
		ClassVo cvo = service.selectOneClass(cno);
		List<CurriculumVo> curVo = service.selectCurriculumList(cno);
		List<StudentVo> svo = service.selectEnrolledStudent(cno);
		
		if(curVo != null) {
			model.addAttribute("cvo", cvo);
			model.addAttribute("curVo", curVo);
			model.addAttribute("svo", svo);
			return "academy/curriculum-detail";
		}else {
			return "error/error-page";
		}
		
	}
//--------------------------------------------------
	
	//수강생 추가(인서트) 하기
 	@PostMapping("addStd")
 	public String addStudent(Model model, StudentVo vo, HttpServletRequest req) {
 		
 		if(vo.getF() != null && !vo.getF().isEmpty()) {
 			String savePath = req.getServletContext().getRealPath("/resources/upload/profile/studentProfile/");
 	 		String changeName = FileUploader.uploadFile(vo.getF(),savePath);
 	 		vo.setProfile(changeName);
 		}

 		
 		int result = service.insertStudent(vo);
 		if(result == 1) {
 			model.addAttribute("msg", "수강생 정보가 입력되었습니다.");
 			return"academy/search";
 		}else {
 			return"error/errorPage";
 		}
 		
 	}
 	
 	//수강생 정보 수정
 	@PostMapping("search/detail/edit/{no}")
 	public String searchDetailEdit(Model model, StudentVo vo, HttpServletRequest req) {
 		
 		if(vo.getF() != null && !vo.getF().isEmpty()) {
 			String savePath = req.getServletContext().getRealPath("/resources/upload/profile/studentProfile/");
 			String changeName = FileUploader.uploadFile(vo.getF(),savePath);
 			vo.setProfile(changeName);
 		}
 		
 		int result = service.updateStudent(vo);
 		System.out.println("업데이트 결과 : " + result);
 		
 		if(result == 1) {
 			model.addAttribute("msg", "수강생 정보가 업데이트 되었습니다.");
 			return "redirect:/academy/search/detail/{no}";
 		}else {
 			return "error/errorPage";
 		}
 		
 	}
	
	//커리큘럼 추가(인서트) 하기
	@PostMapping("addCurr")
	public String addCurriculum(Model model, HttpServletRequest req, ClassVo vo, CurriculumVo cvo) {
		
		if(vo.getF() != null && !vo.getF().isEmpty()) {
 			String savePath = req.getServletContext().getRealPath("/resources/upload/profile/classProfile/");
 	 		String changeName = FileUploader.uploadFile(vo.getF(),savePath);
 	 		vo.setFileName(changeName);
 		}
		
		int classInsert = service.insertClass(vo);
 		
		cvo.convertToList();
		int curInsert = service.insertCurriculum(cvo);
		
		System.out.println("클래스 인서트 결과:"+classInsert);
		System.out.println("커리큘럼 인서트 결과:"+curInsert);
		
		if(classInsert * curInsert == -1) {
			model.addAttribute("msg", "새로운 커리큘럼이 생성되었습니다.");
			return "academy/curriculum";
		}else {
			return "error/errorPage";
		}
		
	}
	
	
}//class
