package gd.fintech.lms.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagerChartController {
	// 통계 Index
	@GetMapping("/auth/manager/chart/chartIndex")
	public String chartIndex(Model model) {
		return "/auth/manager/chart/chartIndex";
	}
	
	// chart1
	@GetMapping("/auth/manager/chart/chart1")
	public String chart1(Model model) {
		return "/auth/manager/chart/chart1";
	}
	
	// chart2
	@GetMapping("/auth/manager/chart/chart2")
	public String chart2(Model model) {
		return "/auth/manager/chart/chart2";
	}
	
	// chart3
	@GetMapping("/auth/manager/chart/chart3")
	public String chart3(Model model) {
		return "/auth/manager/chart/chart3";
	}
	
	// chart4
	@GetMapping("/auth/manager/chart/chart4")
	public String chart4(Model model) {
		return "/auth/manager/chart/chart4";
	}
	
	// chart5
	@GetMapping("/auth/manager/chart/chart5")
	public String chart5(Model model) {
		return "/auth/manager/chart/chart5";
	}
	
	// chart6
	@GetMapping("/auth/manager/chart/chart6")
	public String chart6(Model model) {
		return "/auth/manager/chart/chart6";
	}
	
	// chart7
	@GetMapping("/auth/manager/chart/chart7")
	public String chart7(Model model) {
		return "/auth/manager/chart/chart7";
	}
	
	// chart8
	@GetMapping("/auth/manager/chart/chart8")
	public String chart8(Model model) {
		return "/auth/manager/chart/chart8";
	}
	
	// chart9
	@GetMapping("/auth/manager/chart/chart9")
	public String chart9(Model model) {
		return "/auth/manager/chart/chart9";
	}
	
	// chart10
	@GetMapping("/auth/manager/chart/chart10")
	public String chart10(Model model) {
		return "/auth/manager/chart/chart10";
	}
	
	// chart11
	@GetMapping("/auth/manager/chart/chart11")
	public String chart11(Model model) {
		return "/auth/manager/chart/chart11";
	}
	
	// chart12
	@GetMapping("/auth/manager/chart/chart12")
	public String chart12(Model model) {
		return "/auth/manager/chart/chart12";
	}
	
	// chart13
	@GetMapping("/auth/manager/chart/chart13")
	public String chart13(Model model) {
		return "/auth/manager/chart/chart13";
	}
	
	// chart14
	@GetMapping("/auth/manager/chart/chart14")
	public String chart14(Model model) {
		return "/auth/manager/chart/chart14";
	}
	
	// chart15
	@GetMapping("/auth/manager/chart/chart15")
	public String chart15(Model model) {
		return "/auth/manager/chart/chart15";
	}
}
