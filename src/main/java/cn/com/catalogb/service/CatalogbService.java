package cn.com.catalogb.service;

import java.util.List;

import cn.com.catalogb.pojo.Catalogb;

public interface CatalogbService {

	List<Catalogb> selectAll();

	Catalogb selectCatalogbByCbid(int cbid);

	void editCatalogb(Catalogb catalogb);

	void deleteCatalogbByCbid(int cbid);

	void addCatalogb(Catalogb catalogb);

}
