package ems.icemile.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

//원재자 종류를 담당하는 이넘 클래스
@Getter
@AllArgsConstructor
public enum RawMaterial {
	우유(1, "우유"), 크림(2, "크림"), 파우더(3, "파우더"), 조미료(4, "조미료"), 포장(5, "포장");
	
	private final int num;
    private final String name;
    
    // 숫자에 따른 원자재명을 반환한다
    public static RawMaterial fromNumber(int num) {
        for (RawMaterial rawMaterial : values()) {
            if (rawMaterial.num == num) {
                return rawMaterial;
            }
        }
        return null;
    }
    
    // 원자재명에 따른 숫자를 반환한다
    public static RawMaterial fromName(String name) {
        for (RawMaterial rawMaterial : values()) {
            if (rawMaterial.name.equals(name)) {
                return rawMaterial;
            }
        }
        return null;
    }
}
