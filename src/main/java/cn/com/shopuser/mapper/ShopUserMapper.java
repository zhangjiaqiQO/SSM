package cn.com.shopuser.mapper;

import cn.com.shopuser.pojo.ShopUser;

public interface ShopUserMapper {

	// 注册用户
	public void insert( ShopUser shopUser );

	// Ajax检验用户名时候否重复
	public ShopUser selectByUsername(ShopUser shopUser);

	// 查找指定用户名和密码的用户
	public ShopUser selectByUsernameAndPassword(ShopUser shopUser);
	
}
