package egovframework.example.homie.home.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;




@Service("mainService")
public class MainServiceImpl  {
	
	@Resource(name = "mainMapper")
	private MainMapper mapper;

	public List<Map<String, Object>> getNoticeList(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.getNoticeList(params);
	}
	
	
}
