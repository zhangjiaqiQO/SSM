package cn.com.shopuser.pojo;

/**
 * 前台用户的pojo类
 */
public class ShopUser {

	private Integer uid;
	private String username;
	private String password;
	private String nickname;
	private String email;
	private String telephone;
	private String address;
	private String sex;
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	@Override
	public String toString() {
		return "ShopUser [uid=" + uid + ", username=" + username + ", password=" + password + ", nickname=" + nickname
				+ ", email=" + email + ", telephone=" + telephone + ", address=" + address + ", sex=" + sex + "]";
	}
	
}
