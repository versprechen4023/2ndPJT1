package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.HeadDAOImpl;
import ems.icemile.dto.ResultDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class HeadServiceImpl implements HeadService{

	@Inject // DAO 의존성 주입
	private HeadDAOImpl headDAO;

	@Override
	public List<ResultDTO> getResultList() {
		log.debug("서비스|getResultList");
		return headDAO.getResultList();
	}

	@Override
	public List<ResultDTO> resultSearch(HashMap<String, Object> json) {
		log.debug("서비스 | 실적 검색 기능");
		return headDAO.resultSearch(json);
	}
	
}
