package egovframework.example.homie.notice.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.homie.notice.service.NoticeVO;
import egovframework.example.homie.notice.service.impl.NoticeService;
import egovframework.example.homie.util.FileUtil;
import egovframework.example.homie.util.KakaoAPI;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private KakaoAPI kakaoService; 
	
	@Autowired
	private FileUtil fileService;
	
	@RequestMapping(value="/createBoard.do")
	public String moveNoticeBoard(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		return "back/notice/noticeBoard";
	}
	
	@RequestMapping(value="/submitBoard.do", method = RequestMethod.POST)
	public String submitBoard(@ModelAttribute("NoticeVO") NoticeVO vo, HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		String userId = (String) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		
		vo.setUserId(userId);
		vo.setUserName(userName);
		
		int result = noticeService.setNoticeBoard(vo);
		
		return "redirect:/backhome.do";
	}
	
	@RequestMapping(value = "/noticeDetail.do")
	public String noticeDetail(@RequestParam("noticeId") int noticeId, HttpServletRequest req, HttpServletResponse resp, HttpSession session, ModelMap model){
		
		NoticeVO vo = noticeService.getNoticeBoardInfo(noticeId);
		
		model.addAttribute("noticeBoardInfo", vo);
		return "back/notice/noticeBoardDetail";
	}
	
	@RequestMapping(value="/noticeCommentList.do")
	@ResponseBody
	public Map<String, Object> noticeCommentList(@RequestParam("noticeId") int noticeId){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("commentList", noticeService.getNoticeCommentList(noticeId));
		return map; 
	}
	
	@RequestMapping(value = "/noticeBoardList.do")
	@ResponseBody
	public Map<String, Object> noticeBoardList(@RequestParam Map<String, Object> params, HttpServletRequest req, HttpServletResponse resp, ModelMap model){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("noticeBoardList", noticeService.getNoticeBoardList(params));		
		map.put("totCnt", noticeService.getNoticeBoardCnt());
		
		return map;
	}
	
	@RequestMapping(value = "/setNoticeComment.do")
	@ResponseBody
	public Map<String, Object> setNoticeComment(@RequestParam Map<String,Object> params, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		String userId = (String) session.getAttribute("userId");
		params.put("userId", userId);
		
		map.put("result", noticeService.setNoticeComment(params));
		
		return map; 
		
	}
	
	@RequestMapping(value = "/deleteNoticeBoard.do")
	public String deleteNoticeBoard(@RequestParam(value="noticeId")int noticeId,ModelMap model){
			
		int result = noticeService.deleteNoticeBoard(noticeId);
		model.addAttribute("result", result);
		return "redirect:/backhome.do";
	}
	
	@RequestMapping(value="/updateNoticeBoard.do")
	public String updateNoticeBoard(@RequestParam Map<String,Object> params, HttpSession session,ModelMap model ){
		
		Object noticeId = params.get("noticeId");
		 
		int result = noticeService.updateNoticeBoard(params);
		
		return "redirect:/notice/noticeDetail.do?noticeId="+noticeId;
	}
}
















