package org.mp.service;

import org.mp.mapper.AdAuthMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class AdAuthServiceImpl implements AdAuthService {
	
	@Setter
	private AdAuthMapper mapper;

	@Override
	public int memUpdate(String userId, String authority) {
		return mapper.memUpdate(userId, authority);
	}
	
}
