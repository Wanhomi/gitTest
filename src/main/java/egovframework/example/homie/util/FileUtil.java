package egovframework.example.homie.util;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUtil {
	// 파일 업로드
	public Map<String,Object> uploadFile(MultipartFile uploadFile){
		Map<String, Object> map = new HashMap<String, Object>();
		
		String fileName= null;
		if(!uploadFile.isEmpty()){
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			fileName = uuid+"."+ext;
			map.put("fileName", fileName);
			map.put("originalFileName", originalFileName);
			try {
				uploadFile.transferTo(new File("D:\\homieFileData\\"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
		
	}
}
