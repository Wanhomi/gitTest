package egovframework.example.homie.notice.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int noticeId;
	private String noticeTitle;
	private String noticeContents;
	private String userId;
	private String userName;
	private String createDate;
	private String modifiyDate;
	private String likeCnt;
	
	public String getNoticeTitle() {
		return noticeTitle;
	}
	
	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getModifiyDate() {
		return modifiyDate;
	}
	public void setModifiyDate(String modifiyDate) {
		this.modifiyDate = modifiyDate;
	}
	public String getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(String likeCnt) {
		this.likeCnt = likeCnt;
	}
	

	
}
