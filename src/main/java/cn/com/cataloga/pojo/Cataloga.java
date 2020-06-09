package cn.com.cataloga.pojo;

public class Cataloga {

	private int caid;
	private String caname;
	
	public int getCaid() {
		return caid;
	}
	public void setCaid(int caid) {
		this.caid = caid;
	}
	public String getCaname() {
		return caname;
	}
	public void setCaname(String caname) {
		this.caname = caname;
	}
	@Override
	public String toString() {
		return "Categorya [caid=" + caid + ", caname=" + caname + "]";
	}
	
}
