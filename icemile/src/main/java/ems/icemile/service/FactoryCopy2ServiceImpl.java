package ems.icemile.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.FactoryCopy2DAOImpl;
import ems.icemile.dao.WareHouseCopyDAOImpl;
import ems.icemile.dto.WorkOrderDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FactoryCopy2ServiceImpl implements FactoryCopy2Service {
	
	// DAO 의존성 주입
	@Inject
	private FactoryCopy2DAOImpl factoryCopy2DAO;
	
	@Inject // 원자재 수정에 의한 DAO 의존성 주입
	private WareHouseCopyDAOImpl wareHouseDAO;

	@Override
	public List<WorkOrderDTO> workOrderList() {
		
		log.debug("작업 지시 리스트 서비스");
		
		return factoryCopy2DAO.workOrderList();
	}

	@Override
	public void workOrderAdd(WorkOrderDTO workOrderDTO) {
		
		log.debug("작업 지시 추가 서비스");
		
		String getCode = factoryCopy2DAO.getWorkCode();
		
		int codeNum = 0;
		
		// DB에 데이터가 없다면 초기값 1 이 되고
		if (getCode == null) {
			codeNum = 1;
		
		// 그것이 아니면 +1을 한다.
		}else {
			codeNum = Integer.parseInt(getCode.replaceAll("[^0-9]", ""))+1;
		}
		
		// 구매처 코드 부여
		workOrderDTO.setWork_code(Integer.toString(codeNum));
		
		
		// 생산 라인으로 작업 지시 추가 시 원자제 재고 수량 감하는 업데이트
		String lCode = workOrderDTO.getLine_name();
		
		log.debug(lCode);
		
		if(lCode.equals("생산 라인")) {
			wareHouseDAO.updateRawSubtract(workOrderDTO);
		}
		
			
		factoryCopy2DAO.workOrderAdd(workOrderDTO);
		
	}
	
	@Override
	public WorkOrderDTO getWorkOrderInfo(String work_code) {
		
		log.debug("작업 지시 정보 가져오기 서비스");
		
		return factoryCopy2DAO.getWorkOrderInfo(work_code);
	}

	@Override
	public void workOrderUpdate(WorkOrderDTO workOrderDTO) {
		
		log.debug("작업 지시 수정 서비스");
		
		factoryCopy2DAO.workOrderUpdate(workOrderDTO);
		
	}
	
	@Override
	public boolean workOrderDelete(String work_code) {
		
		log.debug("작업 지시 삭제 서비스");
		
		return factoryCopy2DAO.workOrderDelete(work_code);
	}
	
	@Override
	public List<WorkOrderDTO> workOrderSearch(HashMap<String, Object> json) {
		
		log.debug("작업 지시 검색 서비스");
		
		return factoryCopy2DAO.workOrderSearch(json);
	}

	@Override
	public void workOrderDone(String work_code) {
		
		log.debug("작업 지시 완료 서비스");
		
		factoryCopy2DAO.workOrderDone(work_code);
		
	}



		
	}
	
	
	

