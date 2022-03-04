package egovframework.example.homie.home.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.homie.home.service.impl.MainServiceImpl;
import egovframework.example.homie.util.KakaoAPI;



@Controller
public class MainController {
	@Autowired
	private MainServiceImpl mainService;
	
	@Autowired
	private KakaoAPI kakaoService;
	
	@RequestMapping(value="/home.do")
	public String home(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		return "main/home";
		
	}
	
	@RequestMapping(value="/backhome.do")
	public String backhome(Map<String, Object> params,HttpServletRequest req, HttpServletResponse resp, HttpSession session, ModelMap model) {
		
		//게시판 리스트
//		model.addAttribute("noticeList", mainService.getNoticeList(params));
		return "back/backhome";
	}
	
	@RequestMapping(value="/login.do")
	public String login(@RequestParam("code") String code, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		System.out.println("code : " + code);
		String token = kakaoService.getAccessToken(code);
		System.out.println("controller-token : " + token);
		
		Map<String, Object> userInfo = kakaoService.getKakaoInfo(token);
		if(userInfo.get("email") != null){
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("userName", userInfo.get("nickName"));
			session.setAttribute("accessToken", token);
		}
		
		return "redirect: /backhome.do";
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		// 토큰 챙겨
		String token = (String) session.getAttribute("accessToken");
		
		// 카카오 로그아웃 
		String id = kakaoService.kakaoLogout(token);
		System.out.println("카카오 로그아웃");
		
		//세션종료
		session.invalidate();
		System.out.println("세션 종료");
		return "redirect: /backhome.do";
	}

}
