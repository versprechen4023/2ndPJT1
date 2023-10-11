package ems.icemile.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.ProductDAOImpl;
import ems.icemile.dto.MemberDTO;
import ems.icemile.dto.ProductAllDTO;
import ems.icemile.dto.ProductDTO;
import ems.icemile.dto.ProductInsertDTO;
import ems.icemile.dto.RawMaterialDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService {
	
	@Inject //DAO 의존성 주입
	private ProductDAOImpl productDAO;
	
	@Override
	public List<ProductAllDTO> getProductList() {
		
		log.debug("겟 프로덕트 리스트 서비스");
		
		return productDAO.getProductList();
	}
	
	@Override
	public boolean productInsert(ProductInsertDTO productInsertDTO) {
		
		log.debug("프로덕트 인서트 서비스");
		// 번호 부여를 위한 변수 선언
		String getNum = productDAO.getNewProductId(productInsertDTO);
		
		int idNum = 0;
		
		// DB에 데이터가없다면 초기값(1)이되고
		if(getNum == null) {
			idNum = 1;
		// 아니라면 +1을 더한다
		} else {
			idNum = Integer.parseInt(getNum.replaceAll("[^0-9]", ""))+1;
		}
		
		// 숫자를 4자리 문자열로 포맷팅하고, 앞에 0을 채우기
		String numStr = String.format("%04d", idNum);
		
		// 고유 번호 저장
		productInsertDTO.setProd_code(productInsertDTO.getType()+numStr);
		
		log.debug("프로덕트 테스트 출력" + productInsertDTO.toString());
		
		return productDAO.productInsert(productInsertDTO);
	}
	
	@Override
	public boolean productUpdate(ProductInsertDTO ProductInsertDTO) {
		
		log.debug("프로덕트 업데이트 서비스");
		
		// 원자재인지 완제품인지 구분한다
		ProductInsertDTO.setType(ProductInsertDTO.getProd_code().substring(0,1));
		
		return productDAO.productUpdate(ProductInsertDTO);
	}
	
	@Override
	public boolean productDelete(List<Map<String, String>> codeAndTypeList) {
		
		log.debug("프로덕트 딜리트 서비스");
		
		return productDAO.productDelete(codeAndTypeList);
	}
	
	@Override
	public List<ProductAllDTO> productSearch(HashMap<String, Object> json) {

		log.debug("프로덕트 서치 서비스");
		
		return productDAO.productSearch(json);
	}
	
	@Override
	public boolean searchProName(String prod_name) {

		log.debug("서치 프로 네임 서비스");
		
		return productDAO.searchProName(prod_name);
	}
	
	@Override
	public List<RawMaterialDTO> getRawList() {

		log.debug("getRawList 서비스");
		
		return productDAO.getRawList();
	}
	
	@Override
	public List<RawMaterialDTO> rowSearch(HashMap<String, Object> json) {
		
		log.debug("rowSearch 서비스");
		
		return productDAO.rowSearch(json);
	}
	
	@Override
	public List<ProductDTO> getProductListPopUp() {
		
		log.debug("겟 프로덕트 리스트 팝업 서비스");
		
		return productDAO.getProductListPopUp();
	}
}
