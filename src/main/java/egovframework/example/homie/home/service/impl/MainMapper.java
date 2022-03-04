package egovframework.example.homie.home.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mainMapper")
public interface MainMapper {

	List<Map<String, Object>> getNoticeList(Map<String, Object> params);
	
}
