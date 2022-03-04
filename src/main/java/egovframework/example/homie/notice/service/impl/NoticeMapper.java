package egovframework.example.homie.notice.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.homie.notice.service.NoticeVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("noticeMapper")
public interface NoticeMapper {

	int setNoticeBoard(NoticeVO vo);

	void setFileInfo(Map<String, Object> param);

	List<Map<String, Object>> getNoticeBoardList(Map<String, Object> params);

	int getNoticeBoardCnt();

	NoticeVO getNoticeBoardInfo(int noticeId);

	List<Map<String, Object>> getNoticeCommentList(int noticeId);

	String setNoticeComment(Map<String, Object> params);

	int deleteNoticeBoard(int noticeId);

	int updateNoticeBoard(Map<String, Object> params);
	
}
