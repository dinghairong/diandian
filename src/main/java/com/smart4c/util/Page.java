package com.smart4c.util;

public class Page {
	int pageSize;
	int curPageNo;
	String orderBy;
	String order; // ASC/DESC
	boolean _search;
	boolean _edit;
	boolean _add;
	boolean _delete;
	String filters;
	int id;
	
	public interface OrderByCB{
		public String getOrderBy(String f);
	}
	public interface LeftJoinCB{
		public String getLeftJoin(boolean _search, String orderBy, String filters);
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurPageNo() {
		if (curPageNo < 1) {
			curPageNo = 1;
		}
		return curPageNo;
	}
	public void setCurPageNo(int curPageNo) {
		this.curPageNo = curPageNo;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public String getOrderByString(OrderByCB cb) {
		return cb.getOrderBy(orderBy);
	}
	public String getLeftJoinString(LeftJoinCB cb) {
		return cb.getLeftJoin(_search, orderBy, filters);
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	
	public long getPageCount(long totalRecords) {
		long pageCount = totalRecords / pageSize;
		if (totalRecords % pageSize != 0) {
			pageCount += 1;
		}
		return pageCount;
	}
	public boolean get_search() {
		return _search;
	}
	public void set_search(boolean _search) {
		this._search = _search;
	}
	public String getFilters() {
		return filters;
	}
	public void setFilters(String filters) {
		this.filters = filters;
	}
	public boolean is_edit() {
		return _edit;
	}
	public void set_edit(boolean _edit) {
		this._edit = _edit;
	}
	public boolean is_add() {
		return _add;
	}
	public void set_add(boolean _add) {
		this._add = _add;
	}
	public boolean is_delete() {
		return _delete;
	}
	public void set_delete(boolean _delete) {
		this._delete = _delete;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
