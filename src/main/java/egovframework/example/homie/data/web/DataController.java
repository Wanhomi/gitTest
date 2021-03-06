package egovframework.example.homie.data.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.homie.data.service.DataService;
import egovframework.example.homie.data.service.DataVO;
import egovframework.example.homie.util.FileUtil;

@Controller
@RequestMapping(value = "/data")
public class DataController {
	@Autowired
	private DataService dataService;
	
	@Autowired
	private FileUtil fileService;
	
	@RequestMapping(value="/index.do")
	public String dataIndex(HttpServletRequest req, HttpServletResponse resp, HttpSession session, ModelMap model){
		
		return "back/data/data";
	}
	@RequestMapping(value="/dataDetail.do")
	public String dataDetail(@RequestParam(value="dataId") int dataId, HttpServletRequest req, HttpServletResponse resp, HttpSession session, ModelMap model){
		
		model.addAttribute("dataInfo", dataService.getDataInfo(dataId));
		model.addAttribute("dataFileInfo",dataService.getDataFailInfo(dataId));
		return "back/data/dataDetail";
	}
	@RequestMapping(value="/createData.do")
	public String createData(HttpServletRequest req, HttpServletResponse resp, HttpSession session, ModelMap model){
		
		return "back/data/dataInsert";
	}
	@RequestMapping(value="/submitData.do")
	public String setData( MultipartHttpServletRequest multiRequest, HttpServletRequest req, HttpServletResponse resp, HttpSession session, ModelMap model, DataVO vo){
		
		vo.setUserId(session.getAttribute("userId").toString());
		
		int resultData = dataService.setData(vo);
		
		// mapper ?????? selectKey ???????????? : ?????????????????? vo?????? keyProperty="dataId" ????????? ???????????? ?????? ????????? ????????? ???????????? ????????? ?????? vo??? ?????? ?????????
		int dataId = vo.getDataId();
		for(int i=0; i<vo.getUploadFile().size(); i++){
			if(vo.getUploadFile().get(i).getSize() > 1){
				 Map<String, Object> uploadFileInfo = fileService.uploadFile(vo.getUploadFile().get(i));
				 uploadFileInfo.put("dataId", dataId);
				 model.addAttribute("uploadFileResult", dataService.setUploadFile(uploadFileInfo));
			}
		}
		
		return "redirect:/backhome.do";
	}
	
	@RequestMapping(value="/dataList.do")
	@ResponseBody
	public Map<String, Object> dataList(@RequestParam Map<String, Object> params){
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("totCnt", dataService.getDataListCnt());
		map.put("dataList", dataService.getDataList(params));
		
		return map;
	}
}
