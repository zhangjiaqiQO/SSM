package cn.com.catalogb.pojo;

public class Catalogb {

	private int cbid;
	private String cbname;
	private int caid;
	
	public int getCbid() {
		return cbid;
	}
	public void setCbid(int cbid) {
		this.cbid = cbid;
	}
	public String getCbname() {
		return cbname;
	}
	public void setCbname(String cbname) {
		this.cbname = cbname;
	}
	public int getCaid() {
		return caid;
	}
	public void setCaid(int caid) {
		this.caid = caid;
	}
	@Override
	public String toString() {
		return "Catalogb [cbid=" + cbid + ", cbname=" + cbname + ", caid=" + caid + "]";
	}
	
}
