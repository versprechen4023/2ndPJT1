package ems.icemile.dao;

import ems.icemile.dto.MemberDTO;

public interface MemberDAO {
	
	// 사원 추가
	public boolean memberInsert(MemberDTO memberDTO);
	
	// 로그인 관련
	public MemberDTO userCheck(MemberDTO memberDTO);
	
	
}
