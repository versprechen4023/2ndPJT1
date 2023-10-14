package ems.icemile.dao;

import java.util.HashMap;
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
	public String getNewMemberId() {
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
	
	@Override
	public List<MemberDTO> memberSearch(HashMap<String, Object> json) {
		
		log.debug("멤버 서치 DAO 도달");
		
		return sqlSession.selectList(namespace+"memberSearch", json);
	}
	
	@Override
	public boolean memberUpdate(MemberDTO memberDTO) {
		
		log.debug("멤버 업데이트 DAO 도달");
		
		return sqlSession.update(namespace+"memberUpdate",memberDTO) > 0;
	}
	
	@Override
	public boolean updatePassword(MemberDTO memberDTO) {
		
		log.debug("업데이트 패스워드 DAO 도달");
		
		return sqlSession.update(namespace+"updatePassword",memberDTO) > 0;
	}
	
	@Override
	public boolean searchEmail(String email) {

		log.debug("searchEmail DAO 도달");
		
		String result = sqlSession.selectOne(namespace+"searchEmail", email);
		
		return (result == null) ? false : true;
	}
	
	@Override
	public boolean searchPhone(String phone_num) {
		
		log.debug("searchEmail DAO 도달");
		
		String result = sqlSession.selectOne(namespace+"searchPhone", phone_num);
	
		return (result == null) ? false : true;
	}

	@Override
	public MemberDTO getmanagerInfo(String emp_num) {
		log.debug("getmanagerInfo DAO 도달");
		return sqlSession.selectOne(namespace+"getmanagerInfo", emp_num);
	}
	
	@Override
	public boolean memberReset(MemberDTO memberDTO) {
		
		log.debug("memberReset DAO 도달");
		
		return sqlSession.update(namespace+"memberReset", memberDTO) > 0;
	}
	
	
}
