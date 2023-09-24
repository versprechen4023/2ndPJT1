package ems.icemile.service;

import java.text.SimpleDateFormat;

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
		// 멤버 고유 번호 부여
		memberDTO.setId(Integer.toString(memberDAO.getNewMemberId()));
		// 생일로 초기 비밀번호 설정
		// yyMMdd의 방식 지정 예시 : 1996-05-02 -> 960502 replace함수로 -를 모두 삭제하고 앞의 2자리인 19를 제외하고 비밀번호에 재저장
		memberDTO.setPass(memberDTO.getBirthdate().replaceAll("-", "").substring(2));
		
		// 관리자가 입력한 권한 2진수화
		memberDTO.setPermission(Integer.toBinaryString(Integer.parseInt(memberDTO.getPermission())));
		
		// 관리자가 입력한(날짜) 비밀번호 암호화
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
