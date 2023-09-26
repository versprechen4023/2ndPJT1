package ems.icemile.service;

import ems.icemile.dto.MemberDTO;

public interface MemberService {
	
	// 사원 추가
	public boolean memberInsert(MemberDTO memberDTO);
	
	// 로그인
	public MemberDTO userCheck(MemberDTO memberDTO);
	
	// 사원 정보 얻기
	public MemberDTO getMemberInfo(String emp_num);
}
