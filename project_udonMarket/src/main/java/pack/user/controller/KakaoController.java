package pack.user.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoController {
	
/*	@RequestMapping("/udon/kakaologin")
	public @ResponseBody String kakaologin(String code) {
		RestTemplate rt = new RestTemplate();
		//HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "48774eb3f2a00392a94dd9d1f6bb3068");
		params.add("redirect_uri", "http://localhost:8088/udon/kakaologin");
		params.add("code", code);
		
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		org.springframework.http.HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest =
				new org.springframework.http.HttpEntity<>(params,headers);
		
		//Http 요청하기 - Post 방식 그리고 response 변수와 응답받음
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class);
		return response.getBody();
	}*/
	private final static String K_CLIENT_ID = "48774eb3f2a00392a94dd9d1f6bb3068"; // 이런식으로 REDIRECT_URI를 써넣는다.
	private final static String K_REDIRECT_URI = "http://localhost:8088/udon/kakaologin";

	public static String getAuthorizationUrl(HttpSession session) {
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri="
				+ K_REDIRECT_URI + "&response_type=code";
		return kakaoUrl;
	}

	public static JsonNode getAccessToken(String autorize_code) {

		final String RequestUrl = "https://kauth.kakao.com/oauth/token";

		final List<BasicNameValuePair> postParams = new ArrayList<BasicNameValuePair>();

		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));

		postParams.add(new BasicNameValuePair("client_id", "48774eb3f2a00392a94dd9d1f6bb3068")); //REST API 

		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8088/udon/kakaologin")); //내가 설정해놓은 REDIRECT_URI

		postParams.add(new BasicNameValuePair("code", autorize_code));

		final HttpClient client = HttpClientBuilder.create().build();

		final HttpPost post = new HttpPost(RequestUrl);

		JsonNode returnNode = null;

		try {

			post.setEntity(new UrlEncodedFormEntity(postParams));

			final HttpResponse response = client.execute(post);

			ObjectMapper mapper = new ObjectMapper();

			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
			return returnNode;
		} catch (ClientProtocolException e) {

			e.printStackTrace();
			return returnNode;
		} catch (IOException e) {

			e.printStackTrace();
			return returnNode;
		} finally {

		}

		return returnNode;

	}

	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		post.addHeader("Authorization", "Bearer " + accessToken);
		JsonNode returnNode = null;
		try {
			final HttpResponse response = client.execute(post); 
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (ClientProtocolException e) {
			e.printStackTrace();
			return returnNode;
		} catch (IOException e) {
			e.printStackTrace();
			return returnNode;
		} finally {
	
		}
		return returnNode;
	}
}
