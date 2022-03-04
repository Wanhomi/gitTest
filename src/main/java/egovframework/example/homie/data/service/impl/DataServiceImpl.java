package egovframework.example.homie.data.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.fabric.xmlrpc.base.Data;

import egovframework.example.homie.data.service.DataService;
import egovframework.example.homie.data.service.DataVO;

@Service
public class DataServiceImpl implements DataService{
	@Autowired
	private DataMapper mapper;

	@Override
	public int setUploadFile(Map<String, Object> uploadFileInfo) {
		return mapper.setUploadFile(uploadFileInfo);
	}

	@Override
	public int setData(DataVO vo) {
		return mapper.setData(vo);
	}

	@Override
	public List<Map<String, Object>> getDataList(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.getDataList(params);
	}

	@Override
	public int getDataListCnt() {
		// TODO Auto-generated method stub
		return mapper.getDataListCnt();
	}

	@Override
	public Map<String, Object> getDataInfo(int dataId) {
		// TODO Auto-generated method stub
		return mapper.getDataInfo(dataId);
	}

	@Override
	public List<Map<String, Object>> getDataFailInfo(int dataId) {
		// TODO Auto-generated method stub
		return mapper.getDataFailInfo(dataId);
	}
	
}
