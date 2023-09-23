package ems.icemile.service;

import ems.icemile.dto.MemberDTO;

public interface MemberService {
	
	// 사원 추가
	public boolean memberInsert(MemberDTO memberDTO);
	
	// 로그인
	public boolean userCheck(MemberDTO memberDTO);
}
