package gd.fintech.lms.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.admin.service.AdminIndexService;
import gd.fintech.lms.vo.Manager;

@Controller
public class AdminIndexController {
	@Autowired private AdminIndexService adminIndexService;
	
	private static final Logger log = LoggerFactory.getLogger(AdminIndexController.class);
	
	@GetMapping("/auth/admin/index/{currentPage}")
	public String index(Model model, HttpSession session,
						@PathVariable(name="currentPage") int currentPage,
						Manager managerSearch) {
		
		// 한 페이지에 표시할 데이터 수
		int rowPerPage = 10;
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		// 운영자 리스트 출력
		
		if(managerSearch != null) {
			if(managerSearch.getManagerPosition()=="") {
				managerSearch.setManagerPosition(null);
			}
			if(managerSearch.getManagerName()=="") {
				managerSearch.setManagerName(null);
			}
		}
		
		
			
		List<Manager> managerList = adminIndexService.getManagerList(beginRow, rowPerPage, managerSearch);
		int totalCount = adminIndexService.getManagerCount(managerSearch);
	
		
		log.debug(managerList.toString());
		
		// 페이징 코드
		// 전체 데이터 수

		
		int lastPage = totalCount / rowPerPage;
		
		// 10 미만의 개수의 데이터가 있는 페이지를 표시
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		
		// 내비게이션에 표시할 페이지 수
		int navPerPage = 10;
		
		// 내비게이션 첫번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;	
		
		// 내비게이션 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1;
		
		// 10으로 나누어 떨어지는 경우 처리하는 코드
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		// 현재 페이지에 대한 이전 페이지
		int prePage;
		if (currentPage > 10) {
			prePage = currentPage - (currentPage % navPerPage) + 1 - 10;
		} else {
			prePage = 1;
		}
		
		// 현재 페이지에 대한 다음 페이지
		int nextPage = currentPage - (currentPage % navPerPage) + 1 + 10;
		if (nextPage > lastPage) {
			nextPage = lastPage;
		}
		
		model.addAttribute("managerList",managerList);
		model.addAttribute("managerSearch", managerSearch);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		return "auth/admin/index";
	}
	
	
}
