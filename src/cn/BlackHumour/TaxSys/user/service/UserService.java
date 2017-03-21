package cn.BlackHumour.TaxSys.user.service;

import cn.BlackHumour.TaxSys.core.service.BaseService;
import cn.BlackHumour.TaxSys.user.entity.User;

public interface UserService extends BaseService<User>{
	/*//新增单个对象
	public int insert(User user) throws Exception;
	
	//根据主键更新单个对象
	public int update(User user);
	
	//根据主键删除单个对象
	public int delete(int uId);
	
	//分页查询对象列表(包括有关键字查询）
	public List<User> selectPageList(Page<User> page); 
	
	//返回所有对象数量
	public Integer selectRecordsCount();
	
	//根据主键查询单个对象
	public User select(int uId);
	*/
	
	
	
	
	
	
	//查询所有对象列表
	//public List<User> selectAll();
	
	//根据关键字查询对象列表
	//public List<User> selectBykey(String key);
	
	//校验账号
	public User selectByAccountAndId(User user);
	
	//登录
	public User login(User user);
}
