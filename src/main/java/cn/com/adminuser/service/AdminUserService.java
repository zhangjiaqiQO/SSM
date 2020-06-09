package cn.com.adminuser.service;

import java.util.List;

import cn.com.adminuser.pojo.AdminUser;

public interface AdminUserService {

	AdminUser selectAdminUser(AdminUser adminUser);

	List<AdminUser> selectAllAdminUser(int start);

	AdminUser selectAdminUserByUid(int uid);

	void editAdminUser(AdminUser adminUser);

	void deleteAdminUserByUid(int uid);

	void addAdminUser(AdminUser adminUser);


}
