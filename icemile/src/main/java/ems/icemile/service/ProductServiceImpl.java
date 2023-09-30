package ems.icemile.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.ProductDAOImpl;
import ems.icemile.dto.ProductAllDTO;
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
}
