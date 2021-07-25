package org.mp.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CriteriaTip {
	private int pageNum;	
	private int amount;		
	private String type; 
	private String keyword;


	public String[] getTypeArr() { 
		return type == null? new String[] {} : type.split("");  //node 걸림 확인
	}
	public CriteriaTip(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public CriteriaTip() {
		this(1, 6);
	}


		public String getListLink() {
	  UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			  .queryParam("pageNum", this.getPageNum()) 
			  .queryParam("amount", this.getAmount()) 
			  .queryParam("type", this.getType()) 
			  .queryParam("keyword", this.getKeyword()); 
	  return builder.toUriString(); 
			  }
	 
}
