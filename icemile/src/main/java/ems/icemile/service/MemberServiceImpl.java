package ems.icemile.service;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import ems.icemile.dao.MemberDAOImpl;
import ems.icemile.dto.MemberDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
	
	@Inject //DAO 의존성 주입
	private MemberDAOImpl memberDAO;
	@Inject // 비밀번호 암호화 및 검증을 위한 의존성 주입
	private PasswordEncoder passwordEncoder;
	
	@Override
	public boolean memberInsert(MemberDTO memberDTO) {
		
		log.debug("멤버 인서트");
		
		// 유저가 입력한 비밀번호 암호화
		memberDTO.setPass(passwordEncoder.encode(memberDTO.getPass()));
		
		return memberDAO.memberInsert(memberDTO);
	}
	
	@Override
	public boolean userCheck(MemberDTO memberDTO){
		
		log.debug("유저 체크");
		// DB에서 아이디 가져오기
		MemberDTO fromDB = memberDAO.userCheck(memberDTO);
		
		// 비밀번호가 있다면 일치여부 확인
		if(fromDB != null && fromDB.getId() != null) {
			return passwordEncoder.matches(memberDTO.getPass(), fromDB.getPass());
		} else {
		// 아이디 없으면 false 반환
			return false;
		}
	}
}
