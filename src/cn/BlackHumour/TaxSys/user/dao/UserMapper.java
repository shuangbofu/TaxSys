package cn.BlackHumour.TaxSys.user.dao;
import cn.BlackHumour.TaxSys.core.dao.BaseMapper;
import cn.BlackHumour.TaxSys.user.entity.User;


public interface UserMapper extends BaseMapper<User> {
	
	public User selectByAccountAndId(User user);
	
	//登录
	public User login(User user);
}