package egovframework.example.homie.data.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.homie.data.service.DataVO;
import egovframework.example.homie.notice.service.NoticeVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface DataMapper {

	int setUploadFile(Map<String, Object> uploadFileInfo);

	int setData(DataVO vo);

	List<Map<String, Object>> getDataList(Map<String, Object> params);

	int getDataListCnt();

	Map<String, Object> getDataInfo(int dataId);

	List<Map<String, Object>> getDataFailInfo(int dataId);
	 
}
