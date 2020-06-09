package cn.com.cataloga.mapper;

import java.util.List;

import cn.com.cataloga.pojo.Cataloga;

public interface CatalogaMapper {

	// 查询所有一级分类
	public List<Cataloga> selectAll();

	public Cataloga selectCatalogaByCaid(int caid);

	public void editCataloga(Cataloga cataloga);

	public void deleteCatalogaByCaid(int caid);

	public void addCataloga(Cataloga cataloga);

}
