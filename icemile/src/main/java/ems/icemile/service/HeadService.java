package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import ems.icemile.dto.ResultDTO;

public interface HeadService {

	// 생산 실적 테이블 가져오기 
	List<ResultDTO> getResultList();

	// 실적검색
	List<ResultDTO> resultSearch(HashMap<String, Object> json);

}
