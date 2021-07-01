package org.mp.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;	//페이지 번호
	private int amount;		//한 페이지에 출력되는 데이터 수

	private String type; 
	private String keyword;


	public String[] getTypeArr() { 
		return type == null? new String[] {} : type.split(""); //검색조건을 배열로 처리 
	}

	public Criteria() {
		this(1, 3);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	
	  //여러개의 파라미터들을 연결하여 URL형태로 만들어주는 기능 
		public String getListLink() {
	  UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			  .queryParam("pageNum", this.getPageNum()) 
			  .queryParam("amount", this.getAmount()) 
			  .queryParam("type", this.getType()) 
			  .queryParam("keyword", this.getKeyword()); 
	  return builder.toUriString(); 
			  }
	 
}
