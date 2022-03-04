package egovframework.example.homie.data.service;

import java.util.List;
import java.util.Map;

public interface DataService {

	Object getDataInfo = null;

	int setUploadFile(Map<String, Object> uploadFileInfo);
	
	int setData(DataVO vo);

	List<Map<String, Object>> getDataList(Map<String, Object> params);

	int getDataListCnt();

	Map<String, Object> getDataInfo(int dataId);

	List<Map<String, Object>> getDataFailInfo(int dataId);
	
}
