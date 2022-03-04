package egovframework.example.homie.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoAPI {
	
	public String getAccessToken (String code){
		String _accessToken = "";
		String _refreshToken ="";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try{
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// POST 요청을 위해 기본값이  false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=51aa1d8c55eba611152e5413a0980f03");
            sb.append("&redirect_uri=http://localhost/login.do");
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();
            
            // 결과 코드가 200이라면 성공 
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기 
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null){
				   result += line ;
			}
			System.out.println("response body :" + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			_accessToken = element.getAsJsonObject().get("access_token").getAsString();
			_refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
			
			System.out.println("_accessToken : "+ _accessToken);
			System.out.println("_refreshToken : "+ _refreshToken);
			
			br.close();
			bw.close();
		}catch (Exception e) {
			e.printStackTrace();
// TODO: handle exception
		}
		return _accessToken;
	}
	
	public Map<String, Object> getKakaoInfo(String accessToken){
		Map<String, Object> _userInfo = new HashMap<String, Object>();
		String reqUrl = "https://kapi.kakao.com/v2/user/me";
		HttpURLConnection conn = null;
		
		try{
			URL url = new URL(reqUrl);
			
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");;
			conn.setRequestProperty("AUthorization", "Bearer "+accessToken);
			conn.setDoOutput(true);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : "+ responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null){
				result += line;
			}
			System.out.println("response body : "+ result);
			
			// 받는데이터를 parser를 통해 json 으로 받는 역할
			JsonParser parser = new JsonParser();
			
			// parser를 통해 json 으로 받을때 보통 Element형태로 받는다. 
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String nickName = properties.getAsJsonObject().get("nickname").getAsString();
			String profileImage = properties.getAsJsonObject().get("profile_image").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			
			_userInfo.put("nickName", nickName);
			_userInfo.put("profileImage", profileImage);
			_userInfo.put("email", email);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return _userInfo;
	}
	
	public String kakaoLogout(String accessToken){
	/*
		POST /v1/user/logout HTTP/1.1
		Host: kapi.kakao.com
		Authorization: Bearer {ACCESS_TOKEN}
	*/
		String logoutId = "";
		String reqUrl = "https://kapi.kakao.com/v1/user/logout";
		HttpURLConnection conn = null;
		try{
			URL url = new URL(reqUrl);
			conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " +accessToken );
			conn.setDoOutput(true);
			
			int resultCode = conn.getResponseCode();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
					
			while((line = br.readLine()) != null){
				result += line;
			}
			System.out.println("KakaoLogoutID : " + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			logoutId = element.getAsJsonObject().get("id").getAsString();
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return logoutId;
	}
}
