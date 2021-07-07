package org.mp.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.inject.Inject;

import javax.servlet.http.HttpServletRequest;
import org.mp.service.ReservationService;
import org.mp.service.RestDetailService;
import org.mp.service.RestService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Controller
@RequestMapping("/reserve/*")
@AllArgsConstructor
public class ReservationController {

	@Inject
	private ReservationService service;
	private RestService service2;
   private RestDetailService service3;
	
	
	@GetMapping("/list")
	public ModelAndView List(@RequestParam("restId") Long restId,@RequestParam("roomId") Long roomId,
			@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,ModelAndView mav,HttpServletRequest request) {
		mav.setViewName("roomReserve");
		mav.addObject("vo", service2.detailRest(restId));
        mav.addObject("room", service3.roomRestDetail(roomId));
        log.info(startDate);
        mav.addObject("startDate",startDate);
        mav.addObject("endDate",endDate);
       
		return mav;
	}
   
	@RequestMapping("kakaopay.cls")
	@ResponseBody
	public String kakaopay() {
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready"); //주소정의 = https://호스트(도메인)/POST(맵핑주소)
			HttpURLConnection conn = (HttpURLConnection) address.openConnection(); //서버연결을 위해 필요
			conn.setRequestMethod("POST"); // 통신방식이 POST 
			conn.setRequestProperty("Authorization", "KakaoAK 02b574146e39dedbace92c38d2f3bf30"); //인증을 위해 필요
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); //컨텐츠타입 정의
			conn.setDoOutput(true); // DoOutput은 연결을 통해 서버를 통해 전해줄게 있는지 여부에 따라 설정 DoInput은 디폴트값이 true
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200"
					+ "&vat_amount=200&tax_free_amount=0&approval_url=https://developers.kakao.com/success&fail_url=https://developers.kakao.com/fail&cancel_url=https://developers.kakao.com/cancel";
			OutputStream outstream = conn.getOutputStream();
			DataOutputStream dataoutstream = new DataOutputStream(outstream); //데이터를 줘야하기 때문에 dataoutputstrem사용
			dataoutstream.writeBytes(param); // 바이트로 알아서 형변환을 하기 위해 (input스트림 , output스트림은 바이트형식으로 받아야함)
			dataoutstream.close();
			
			int resultcode = conn.getResponseCode(); //결과번호를 int로 받기 위해 
			
			InputStream instream;
			if(resultcode ==200) {
				instream = conn.getInputStream();
			}else {
				instream = conn.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(instream); 
			BufferedReader buffer = new BufferedReader(reader); //형변환을 위해 사용 하지만 bufferredReader의 원래 목적은 그게아님
			return buffer.readLine();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
	
	
	/*
	 * @GetMapping("/roomInsert") public void regist() {
	 * 
	 * }
	 * 
	 * @PostMapping("/roomInsert") public String regist(ReservationVO
	 * reser, @RequestParam("restId") Long restId, RedirectAttributes rttr) throws
	 * Exception {
	 * 
	 * service.regist(reser);
	 * 
	 * return "roomInsert";
	 * 
	 * }
	 */
	
}
