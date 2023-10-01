package ems.icemile.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.ProductDAOImpl;
import ems.icemile.dto.ProductAllDTO;
import ems.icemile.dto.ProductInsertDTO;
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
		int idNum = productDAO.getNewProductId(productInsertDTO);
		
		// 숫자를 4자리 문자열로 포맷팅하고, 앞에 0을 채우기
		String numStr = String.format("%04d", idNum);
		
		// 고유 번호 저장
		productInsertDTO.setProd_code(productInsertDTO.getType()+numStr);
		
		log.debug("프로덕트 테스트 출력" + productInsertDTO.toString());
		
		return productDAO.productInsert(productInsertDTO);
	}
}
