package cn.com.shopuser.service;

import cn.com.shopuser.pojo.ShopUser;

public interface ShopUserService {

	boolean insertShopUser(ShopUser shopUser);

	ShopUser checkUsername(ShopUser shopUser);

	ShopUser shopUser_login(ShopUser shopUser);
	
}
