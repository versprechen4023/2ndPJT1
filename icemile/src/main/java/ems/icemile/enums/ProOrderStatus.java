package ems.icemile.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

// 수주의 상태를 당담하는 이넘 클래스
@Getter
@AllArgsConstructor
public enum ProOrderStatus {
	대기(1, "대기중"), 생산중(2, "생산중"), 생산완료(3, "생산완료"), 납품완료(4, "납품완료");
	
	private final int num;
    private final String name;
    
    // 숫자에 따른 수주상태명을 반환한다
    public static ProOrderStatus fromNumber(int num) {
        for (ProOrderStatus prolOrderStatus : values()) {
            if (prolOrderStatus.num == num) {
                return prolOrderStatus;
            }
        }
        return null;
    }
    
    // 수주상태명에 따른 숫자를 반환한다
    public static ProOrderStatus fromName(String name) {
        for (ProOrderStatus prolOrderStatus : values()) {
            if (prolOrderStatus.name.equals(name)) {
                return prolOrderStatus;
            }
        }
        return null;
    }
}
