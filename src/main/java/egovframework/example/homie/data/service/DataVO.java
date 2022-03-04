package egovframework.example.homie.data.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DataVO {
	
	private int dataId;
	private String userId;
	private String dataTitle;
	private String createDate;
	private String modifiyDate;
	
	private List<MultipartFile> uploadFile;
	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getDataId() {
		return dataId;
	}
	public void setDataId(int dataId) {
		this.dataId = dataId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDataTitle() {
		return dataTitle;
	}
	public void setDataTitle(String dataTitle) {
		this.dataTitle = dataTitle;
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
	
}
