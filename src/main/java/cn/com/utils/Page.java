package cn.com.utils;

public class Page {

	private int localPage;	// 当前页数
	private int totalPage;	// 总页数
	private int totalCount;	// 总记录数
	private int limit;		// 每页记录数
	private int cid;		// 当前分页所属的一级或二级分类
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getLocalPage() {
		return localPage;
	}
	public void setLocalPage(int localPage) {
		this.localPage = localPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	@Override
	public String toString() {
		return "Page [localPage=" + localPage + ", totalPage=" + totalPage + ", totalCount=" + totalCount + ", limit="
				+ limit + ", cid=" + cid + "]";
	}
	
	
}
