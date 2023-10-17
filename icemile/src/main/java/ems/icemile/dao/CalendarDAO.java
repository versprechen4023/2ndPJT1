package ems.icemile.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.CalendarDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class CalendarDAO {

	// 마이바티스 객체 의존성 주입
		@Inject 
		private SqlSession sqlSession;
		
		// 네임스페이스 사용을 위한 변수 선언
		@Inject
		private static final String namespace = "ems.icemile.mappers.CalendarMapper.";

		public List<CalendarDTO> calendarList() {
			log.debug("DAO| 캘린더 리스트 ");
			return sqlSession.selectList("mes.icemile.mappers.CalendarMapper.calendarList");
		}

		
}
