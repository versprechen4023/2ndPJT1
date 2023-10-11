package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.ResultDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class HeadDAOImpl implements HeadDAO{

	@Inject // 마이바티스 객체 의존성 주입
	private SqlSession sqlSession;
	
	// 네임 스페이스 사용을 위한 변수 선언
		private static final String namespace = "ems.icemile.mappers.headMapper.";

		public List<ResultDTO> getResultList() {
			log.debug("DAO| getResultList");
			return sqlSession.selectList(namespace+"getResultList");
		}

		public List<ResultDTO> resultSearch(HashMap<String, Object> json) {
			log.debug("DAO| 실적 검색");
			return sqlSession.selectList(namespace+"resultSearch", json);
		}
}
