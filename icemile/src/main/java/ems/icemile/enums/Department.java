package ems.icemile.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

// 권한을 담당하는 이넘클래스
@Getter
@AllArgsConstructor
public enum Department {
	
	관리자(0, "관리자"), 인사(1, "인사팀"), 영업(2, "영업팀"), 생산(3, "생산팀"), 물류(4, "물류팀");

    private final int num;
    private final String name;
    
    // 숫자에 따른 부서명을 반환한다
    public static Department fromNumber(int num) {
        for (Department department : values()) {
            if (department.num == num) {
                return department;
            }
        }
        return null;
    }
    
    // 부서명에 따른 숫자를 반환한다
    public static Department fromName(String name) {
        for (Department department : values()) {
            if (department.name.equals(name)) {
                return department;
            }
        }
        return null;
    }
}
