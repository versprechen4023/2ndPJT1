package ems.icemile.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ems.icemile.dto.MemberDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDAOImpl implements MemberDAO {
	
	@Inject // 마이바티스 객체 의존성 주입
	private SqlSession sqlSession;
	
	// 네임 스페이스 사용을 위한 변수 선언
	private static final String namespace = "mes.icemile.mappers.memberMapper.";
	
	@Override
	public int getNewMemberId() {
		return sqlSession.selectOne(namespace+"getNewMemberId");
	}
	
	@Override
	public boolean memberInsert(MemberDTO memberDTO) {
		log.debug("멤버인서트 DAO 도달");
		return sqlSession.insert(namespace+"memberInsert",memberDTO) > 0;
	}
	
	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		log.debug("유저체크 DAO 도달");
		return sqlSession.selectOne(namespace+"userCheck",memberDTO);
	}
	
	@Override
	public List<MemberDTO> getMemberList() {
		log.debug("겟 멤버 리스트 DAO 도달");
		return sqlSession.selectList(namespace+"userList");
	}
	
	@Override
	public MemberDTO getMemberInfo(String emp_num) {
		
		log.debug("겟 멤버 인포 DAO 도달");
		
		return sqlSession.selectOne(namespace+"getMemberInfo", emp_num);
	}
	
	@Override
	public boolean memberDelete(String emp_num) {
		
		log.debug("멤버 딜리트 DAO 도달");
		
		return sqlSession.delete(namespace+"deleteMember", emp_num) > 0;
	}
	
	
	
}
