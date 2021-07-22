package org.mp.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MainCriteria {
	private int pageNum;	//페이지 번호
	private int amount;		//한 페이지에 출력되는 데이터 수

	public MainCriteria() {
		this(1, 5);
	}

	public MainCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
  
	
	  //여러개의 파라미터들을 연결하여 URL형태로 만들어주는 기능 
		public String getListLink() {
	  UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			  .queryParam("pageNum", this.getPageNum()) 
			  .queryParam("amount", this.getAmount()); 
			 
	  return builder.toUriString(); 
			  }
	 
}
