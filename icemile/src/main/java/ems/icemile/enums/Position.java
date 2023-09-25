package ems.icemile.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

// 직급을 담당하는 이넘 클래스
@Getter
@AllArgsConstructor
public enum Position {
	사원(1, "사원"), 대리(2, "대리"), 과장(3, "과장"), 차장(4, "차장"), 부장(5, "부장");

    private final int num;
    private final String name;
    
    // 숫자에 따른 직급명을 반환한다
    public static Position fromNumber(int num) {
        for (Position position : values()) {
            if (position.num == num) {
                return position;
            }
        }
        return null;
    }
    
    // 직급명에 따른 숫자를 반환한다
    public static Position fromName(String name) {
        for (Position position : values()) {
            if (position.name.equals(name)) {
                return position;
            }
        }
        return null;
    }

}
