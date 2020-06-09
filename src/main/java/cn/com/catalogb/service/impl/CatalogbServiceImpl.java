package cn.com.catalogb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.catalogb.mapper.CatalogbMapper;
import cn.com.catalogb.pojo.Catalogb;
import cn.com.catalogb.service.CatalogbService;

@Service
public class CatalogbServiceImpl implements CatalogbService{

	@Autowired
	CatalogbMapper catalogbMapper;

	public List<Catalogb> selectAll() {
		return catalogbMapper.selectAll();
	}

	@Override
	public Catalogb selectCatalogbByCbid(int cbid) {
		return catalogbMapper.selectCatalogbByCbid( cbid );
	}
	
	@Override
	public void editCatalogb(Catalogb catalogb) {
		catalogbMapper.editCatalogb( catalogb );
	}

	@Override
	public void deleteCatalogbByCbid(int cbid) {
		catalogbMapper.deleteCatalogbByCbid( cbid );
	}

	@Override
	public void addCatalogb(Catalogb catalogb) {
		catalogbMapper.addCatalogb( catalogb );
	}



	
}
