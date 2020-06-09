package cn.com.catalogb.mapper;

import java.util.List;

import cn.com.catalogb.pojo.Catalogb;

public interface CatalogbMapper {

	// 查询所有二级分类
	public List<Catalogb> selectAll();

	public Catalogb selectCatalogbByCbid(int cbid);

	public void editCatalogb(Catalogb catalogb);

	public void deleteCatalogbByCbid(int cbid);

	public void addCatalogb(Catalogb catalogb);


	
}
