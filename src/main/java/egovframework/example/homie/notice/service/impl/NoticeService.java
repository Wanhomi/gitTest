package egovframework.example.homie.notice.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.homie.notice.service.NoticeVO;
import egovframework.example.homie.util.FileUtil;

@Service
public class NoticeService {
	
	@Resource(name = "noticeMapper")
	private NoticeMapper mapper;
	
	@Autowired
	private FileUtil fileService;
	
	public int setNoticeBoard(NoticeVO vo) {
		mapper.setNoticeBoard(vo);	
		return vo.getNoticeId();
	}

	public void setFileInfo(Map<String, Object> params) {
		
		mapper.setFileInfo(params);
		
	}

	public List<Map<String, Object>> getNoticeBoardList(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.getNoticeBoardList(params);
	}

	public int getNoticeBoardCnt() {
		// TODO Auto-generated method stub
		return mapper.getNoticeBoardCnt();
	}

	public NoticeVO getNoticeBoardInfo(int noticeId) {
		// TODO Auto-generated method stub
		return mapper.getNoticeBoardInfo(noticeId);
	}

	public List<Map<String,Object>> getNoticeCommentList(int noticeId) {
		// TODO Auto-generated method stub
		return mapper.getNoticeCommentList(noticeId);
	}

	public String setNoticeComment(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.setNoticeComment(params);
	}

	public int deleteNoticeBoard(int noticeId) {
		// TODO Auto-generated method stub
		return mapper.deleteNoticeBoard(noticeId);
	}

	public int updateNoticeBoard(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.updateNoticeBoard(params);
	}
	
}
