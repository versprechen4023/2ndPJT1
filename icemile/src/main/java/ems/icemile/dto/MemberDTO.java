package ems.icemile.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	
	// 사원 번호
	private String emp_num;
	// 사원 비밀번호
	private String emp_pw;
	// 사원 이름
	private String emp_name;
	// 사원 생년월일
	private String birthdate;
	// 사원 부서 이름
	private String dept_name;
	// 사원 직급
	private String position;
	// 사원 전화번호
	private String phone_num;
	// 사원 내선번호
	private String hotline;
	// 사원 이메일
	private String email;
	// 사원 주소(우편번호)
	private String emp_post;
	// 사원 주소(상세)
	private String address;
	// 사원 입사일
	private String hire_date;
	// 사원 프로필사진명
	private String profilepic;
	// 권한
	private String emp_role;

}
