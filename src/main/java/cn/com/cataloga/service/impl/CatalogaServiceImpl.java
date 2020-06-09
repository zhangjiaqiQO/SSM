package cn.com.cataloga.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.cataloga.mapper.CatalogaMapper;
import cn.com.cataloga.pojo.Cataloga;
import cn.com.cataloga.service.CatalogaService;

@Service
public class CatalogaServiceImpl implements CatalogaService{

	@Autowired
	CatalogaMapper catalogaMapper;

	// 查询所有一级分类
	public List<Cataloga> selectAll() {
		return catalogaMapper.selectAll();
	}

	@Override
	public Cataloga selectCatalogaByCaid(int caid) {
		return catalogaMapper.selectCatalogaByCaid( caid );
	}

	@Override
	public void editCataloga(Cataloga cataloga) {
		catalogaMapper.editCataloga( cataloga );
	}

	@Override
	public void deleteCatalogaByCaid(int caid) {
		catalogaMapper.deleteCatalogaByCaid( caid );
	}

	@Override
	public void addCataloga(Cataloga cataloga) {
		catalogaMapper.addCataloga( cataloga );
	}
	
	
	
}
