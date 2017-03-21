package cn.BlackHumour.TaxSys.core.dao;

import java.util.List;

import cn.BlackHumour.TaxSys.core.entity.Page;


public interface BaseMapper<T> {
	
	//新增单个对象
	public int insert(T entity);
	
	//根据主键更新单个对象
	public int update(T entity);
	
	//根据主键删除单个对象
	public int delete(String id);
	
	//根据主键查询单个对象
	public T select(String id);
	
	//查询所有对象列表
	public List<T> selectAll();
	
	//根据关键字查询对象列表
	public List<T> selectByKey(String key);
	
	//分页查询对象列表
	public List<T> selectPageList(Page<T> page);
	
	//查询所有对象数量
	public Integer selectRecordsCount(Page<T> page);
	
	//根据主键数组批量删除
	public int deleteAll(String[] ids);
	
	//插入两张表之间的关系
	public int insertRelation(String id, List<String> list);
	
	//删除两张表之间的关系
	public int deleteRelation(String id);
}
