package ems.icemile.service;

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
	public boolean branchInsert(SellDTO sellDTO){
		
		log.debug("서비스 | 지점 인서트");
		//고유 번호 부여
		sellDTO.setBranch_code(Integer.toString(sellDAO.getNewBranchCode()));
		
		return sellDAO.branchInsert(sellDTO);
	}
	

	@Override
	public List<SellDTO> getBranchList() {
		
		log.debug("서비스 | 지점 목록 가져오기");
		
		return sellDAO.getBranchList();
	}


	@Override
	public SellDTO getBranchInfo(String branch_code) {
		log.debug("서비스 | 지점 정보 가져오기");
		return sellDAO.getBranchInfo(branch_code);
	}


	
	
	
}
