package cn.com.cataloga.service;

import java.util.List;

import cn.com.cataloga.pojo.Cataloga;

public interface CatalogaService {

	List<Cataloga> selectAll();

	Cataloga selectCatalogaByCaid(int caid);

	void editCataloga(Cataloga cataloga);

	void deleteCatalogaByCaid(int caid);

	void addCataloga(Cataloga cataloga);

}
