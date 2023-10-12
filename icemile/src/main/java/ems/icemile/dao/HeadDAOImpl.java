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

		@Override
		public List<ResultDTO> getResultList() {
			log.debug("DAO| getResultList");
//			Object resultDTO = sqlSession.selectList(namespace+"getResultList");
//			log.debug("DAO 되냐 "+resultDTO);
			return sqlSession.selectList(namespace+"getResultList");
//			return null;
		}

		@Override
		public List<ResultDTO> resultSearch(HashMap<String, Object> json) {
			log.debug("DAO| 실적 검색");
			return sqlSession.selectList(namespace+"resultSearch", json);
		}

		@Override
		public String getNewRSCode() {
			log.debug("DAO| 실적 코드 부여");
			return sqlSession.selectOne(namespace+"getNewRSCode");
		}

		@Override
		public boolean resultInsert(ResultDTO resultDTO) {
			log.debug("DAO| 실적 추가");
			return sqlSession.insert(namespace+"resultInsert",resultDTO) > 0;

		}

		@Override
		public boolean resultUpdate(ResultDTO resultDTO) {
			log.debug("DAO| 실적 수정");			
			return sqlSession.update(namespace+"resultUpdate",resultDTO) > 0;
		}
}
