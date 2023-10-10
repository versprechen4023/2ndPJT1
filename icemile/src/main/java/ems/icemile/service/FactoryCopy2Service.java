package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import ems.icemile.dto.WorkOrderDTO;



public interface FactoryCopy2Service {
	
	// 작업 지시 리스트 가져오기
	public List<WorkOrderDTO> workOrderList();
	
	// 작업 지시 추가
	public void workOrderAdd(WorkOrderDTO workOrderDTO);
	
	// 작업 지시 정보 얻기
	public WorkOrderDTO getWorkOrderInfo(String work_code);

	// 작업 지시 수정
	public void workOrderUpdate(WorkOrderDTO workOrderDTO);
	
	// 작업 지시 삭제
	boolean workOrderDelete(String work_code);
	
	// 작업 지시 검색
	public List<WorkOrderDTO> workOrderSearch(HashMap<String, Object> json);
	
	
}
