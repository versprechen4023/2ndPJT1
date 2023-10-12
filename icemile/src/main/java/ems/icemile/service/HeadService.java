package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import ems.icemile.dto.ResultDTO;

public interface HeadService {

	// 생산 실적 테이블 가져오기 
	public List<ResultDTO> getResultList();

	// 실적검색
	public List<ResultDTO> resultSearch(HashMap<String, Object> json);

	// 실적 추가
	public boolean resultInsert(ResultDTO resultDTO);

	// 실적 수정
	public boolean resultUpdate(ResultDTO resultDTO);

}
