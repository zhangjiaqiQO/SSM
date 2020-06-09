package cn.com.adminuser.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.adminuser.mapper.AdminUserMapper;
import cn.com.adminuser.pojo.AdminUser;
import cn.com.adminuser.service.AdminUserService;

@Service
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired
	AdminUserMapper adminUserMapper;

	@Override
	public AdminUser selectAdminUser(AdminUser adminUser) {
		return adminUserMapper.selectAdminUser( adminUser );
	}

	@Override
	public List<AdminUser> selectAllAdminUser(int start) {
		return adminUserMapper.selectAllAdminUser( start );
	}

	@Override
	public AdminUser selectAdminUserByUid(int uid) {
		return adminUserMapper.selectAdminUserByUid( uid );
	}

	@Override
	public void editAdminUser(AdminUser adminUser) {
		adminUserMapper.editAdminUser( adminUser );
	}

	@Override
	public void deleteAdminUserByUid(int uid) {
		adminUserMapper.deleteAdminUserByUid( uid );
	}

	@Override
	public void addAdminUser(AdminUser adminUser) {
		adminUserMapper.addAdminUser( adminUser );
	}
	

}
