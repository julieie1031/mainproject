package org.mp.service;

import java.net.URI;
import java.net.URISyntaxException;

import javax.inject.Inject;

import org.mp.domain.KakaoPayApprovalVO;
import org.mp.domain.KakaoPayReadyVO;
import org.mp.domain.ReservationVO;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.extern.java.Log;

@Service
@Log
public class KakaoPay {
	
private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    private String roomtotal;
    private String dogType;
    private String endDate;
    private String restName;
    private String roomPeople;
    private String restPhone;
    private String startDate;
    private String userId;
    private int dogNumber;
    private Long restId;
    private String roomName;
    
    @Inject
	private ReservationService service;
    
    public String kakaoPayReady(ReservationVO reser) {
 
        RestTemplate restTemplate = new RestTemplate();
        roomtotal = reser.getRoomPrice()+"";
        dogType = reser.getDogType();
        endDate = reser.getEndDate();
        restName = reser.getRestName();
        restPhone = reser.getRestPhone();
        roomPeople = reser.getRoomPeople();
        startDate =reser.getStartDate();
        userId =reser.getUserId();
        dogNumber = reser.getDogNumber();
        restId = reser.getRestId();
        roomName = reser.getRoomName();
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK 02b574146e39dedbace92c38d2f3bf30");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("item_name", reser.getRoomName());
        params.add("quantity", "1");
        params.add("total_amount", roomtotal);
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8080/reserve/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8080/reserve/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/reserve/kakaoPaySuccessFail");
//        params.add("dogType", reser.getDogType());
//        params.add("endDate", reser.getEndDate());
//        params.add("restName", reser.getRestName());
//        params.add("restPhone", reser.getRestPhone());
//        params.add("roomPeople", reser.getRoomPeople());
//        params.add("startDate", reser.getStartDate());
//        params.add("userId", reser.getUserId());
//        params.add("dogNumber", reser.getDogNumber()+"");
//        params.add("restId", reser.getRestId()+"");

 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("" + kakaoPayReadyVO);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
    	 
        log.info("KakaoPayInfoVO............................................");
        log.info("-----------------------------");
        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK 02b574146e39dedbace92c38d2f3bf30");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("pg_token", pg_token);
        params.add("total_amount", roomtotal);
 
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
            
            try {
				ReservationVO reser = new ReservationVO();
		        reser.setDogType(dogType);
		        reser.setEndDate(endDate);
		        reser.setRestName(restName);
		        reser.setRestPhone(restPhone);
		        reser.setRoomPeople(roomPeople);
		        reser.setRoomName(roomName);
		        reser.setStartDate(startDate);
		        reser.setUserId(userId);
		        reser.setDogNumber(dogNumber);
		        reser.setRestId(restId);
		        reser.setRoomPrice(Integer.parseInt(roomtotal));
				service.regist(reser);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
    

}
