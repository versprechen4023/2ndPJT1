package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.SellDAOImpl;
import ems.icemile.dto.SellDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SellServiceImpl implements SellService{

	@Inject //DAO 의존성 주입
	private SellDAOImpl sellDAO;
	
	@Override
	public boolean branchReg(SellDTO sellDTO){
		
		log.debug("서비스 | 지점 인서트");
		//고유 번호 부여
		sellDTO.setBranch_code(Integer.toString(sellDAO.getNewBranchCode()));
		
		return sellDAO.branchReg(sellDTO);
	}
	

	@Override
	public List<SellDTO> getBranchList() {
		
		log.debug("서비스 | 지점 목록 가져오기");
		
		return sellDAO.getBranchList();
	}

	@Override
	public SellDTO getbranchInfo(String branch_code) {
		log.debug("서비스 | 지점 수정 페이지 지점 정보 가져오기");
		return sellDAO.getBranchInfo(branch_code);
	}

	@Override
	public boolean branchUpdate(SellDTO sellDTO) {
		log.debug("서비스 | 지점 수정 넘기기");
		
		return sellDAO.branchUpdate(sellDTO);
	}
	@Override
	public boolean branchDelete(String branch_code) {
		log.debug("서비스 | 지점삭제");
		
		return sellDAO.branchDelete(branch_code);
	}

	@Override
	public List<SellDTO> branchSearch(HashMap<String, Object> json) {
		log.debug("서비스 | 지점 검색 기능");
		
		return sellDAO.branchSearch(json);
	}
//
//	@Override
//	public SellDTO getManagerInfo(String emp_num) {
//		log.debug("서비스 | 담당자 정보 가져오기");
//
//		return sellDAO.managerInfo(emp_num);
//	}
	
	
}
