package cn.BlackHumour.TaxSys.core.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * 
 * 
 */
public class Page<T> implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7248448295647773978L;
	
	/*@Override
	public String toString() {
		return "Page [currentPageIndex=" + currentPageIndex + ", pageSize="
				+ pageSize + ", totalRecordsCount=" + totalRecordsCount
				+ ", start=" + start + ", pageCount=" + pageCount + "]";
	}
	
	 * 总记录数
	 * 当前页
	 * 每页数
	 * 开始记录数
	 * 
	 
	//当前页
	private Integer currentPageIndex;
	//每页数
	private Integer pageSize=10;
	//总记录数
	private Integer totalRecordsCount;
	//开始记录数
	private Integer start;
	//页数
	private Integer pageCount;
	//结束记录数
	private Integer end;
	
	
	public Integer getEnd() {
		return start+pageSize;
	}
	public Integer getPageCount() {
		if(totalRecordsCount%pageSize>0) {
			return (int) Math.ceil(totalRecordsCount/pageSize);
		} else {
			
		}
		//System.out.println((int) (totalRecordsCount/pageSize+Math.ceil(totalRecordsCount%pageSize)));
		//System.out.println(totalRecordsCount/pageSize+"-------------------");
		//System.out.println(totalRecordsCount%pageSize+"_++________________");
		//System.out.println(totalRecordsCount+":::::::"+pageSize);
		return (int) (totalRecordsCount/pageSize+Math.ceil(totalRecordsCount%pageSize));
		//return 10;
	}
	public Integer getCurrentPageIndex() {
		return currentPageIndex;
	}
	public void setCurrentPageIndex(Integer currentPageIndex) {
		this.currentPageIndex = currentPageIndex;
	}
	public Integer getPageSize() {
		return 10;
	}
	public Integer getTotalRecordsCount() {
		return totalRecordsCount;
	}
	public void setTotalRecordsCount(Integer totalRecordsCount) {
		this.totalRecordsCount = totalRecordsCount;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}*/
	
	
	
	
	//当前页，默认显示第一行
	private Integer currentPage = 1;


	
	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", startIndex="
				+ startIndex + ", pageSize=" + pageSize
				+ ", totalRecordsCount=" + totalRecordsCount + ", pageCount="
				+ pageCount + ", pageData=" + pageData + ", key=" + key
				+ ", keyEntity=" + keyEntity + ", keyField=" + keyField + "]";
	}
	//开始下标
	private Integer startIndex;
	
	//每页显示的行数（查询返回的行数），默认每页显示6行
	private Integer pageSize = 6;
	
	//总记录数
	private Integer totalRecordsCount;
	
	//总页数  = (总记录数/每页显示的行数) +1
	private Integer pageCount;
	
	//分页查询到的数据
	private List<T> pageData;
	
	//查询所需要的关键字
	private String key;
	
	//关键字实体对象
	private T keyEntity;
	public T getKeyEntity() {
		return keyEntity;
	}
	public void setKeyEntity(T keyEntity) {
		this.keyEntity = keyEntity;
	}
	//关键字字段类型
	private String keyField;
	
	
	public String getKeyField() {
		return keyField;
	}
	public void setKeyField(String keyField) {
		this.keyField = keyField;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalRecordsCount() {
		return totalRecordsCount;
	}
	public void setTotalRecordsCount(Integer totalRecordsCount) {
		this.totalRecordsCount = totalRecordsCount;
	}
	public Integer getPageCount() {
		pageCount = totalRecordsCount / pageSize;
		if(totalRecordsCount % pageSize !=0) {
			pageCount +=1;
		}
		return pageCount;
	}
	public Integer getStartIndex() {
		return (currentPage-1)*pageSize;
	}
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	public List<T> getPageData() {
		return pageData;
	}
	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}
}
