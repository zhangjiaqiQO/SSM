package cn.com.shopuser.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.shopuser.mapper.ShopUserMapper;
import cn.com.shopuser.pojo.ShopUser;
import cn.com.shopuser.service.ShopUserService;


@Service
public class ShopUserServiceImpl implements ShopUserService {

	@Autowired
	ShopUserMapper shopUserMapper;
	
	// 注册用户
	public boolean insertShopUser(ShopUser shopUser) {
		try {
			shopUserMapper.insert(shopUser);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	// Ajax校验用户名是否重复
	public ShopUser checkUsername(ShopUser shopUser) {
		return shopUserMapper.selectByUsername( shopUser );
	}

	@Override
	public ShopUser shopUser_login(ShopUser shopUser) {
		return shopUserMapper.selectByUsernameAndPassword( shopUser );
	}
	

}
