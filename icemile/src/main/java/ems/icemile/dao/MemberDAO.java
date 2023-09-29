package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;

import ems.icemile.dto.MemberDTO;

public interface MemberDAO {
	
	// 사원 고유 번호 얻기
	public int getNewMemberId();
	
	// 사원 추가
	public boolean memberInsert(MemberDTO memberDTO);
	
	// 로그인 관련
	public MemberDTO userCheck(MemberDTO memberDTO);
	
	// 사원 정보 얻기
	public MemberDTO getMemberInfo(String emp_num);
	
	// 사원 리스트 정보 얻기
	public List<MemberDTO> getMemberList();
	
	// 사원 삭제
	public boolean memberDelete(String emp_num);
	
	// 사원 검색
	public List<MemberDTO> memberSearch(HashMap<String, Object> json);
	
	// 사원 정보 수정
	public boolean memberUpdate(MemberDTO memberDTO);
	
}
