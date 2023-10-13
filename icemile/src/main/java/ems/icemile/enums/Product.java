package ems.icemile.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

// 완제품 종류를 담당하는 이넘 클래스
@Getter
@AllArgsConstructor
public enum Product {
	바나나(1, "바나나아이스크림"), 딸기(2, "딸기아이스크림"), 포도(3, "포도아이스크림"), 사과(4, "사과아이스크림");
	
	private final int num;
    private final String name;
    
    // 숫자에 따른 완제품명을 반환한다
    public static Product fromNumber(int num) {
        for (Product product : values()) {
            if (product.num == num) {
                return product;
            }
        }
        return null;
    }
    
    // 완제품명에 따른 숫자를 반환한다
    public static Product fromName(String name) {
        for (Product product : values()) {
            if (product.name.equals(name)) {
                return product;
            }
        }
        return null;
    }
}
