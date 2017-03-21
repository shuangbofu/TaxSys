package cn.BlackHumour.TaxSys.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.BlackHumour.TaxSys.core.service.impl.BaseServiceImpl;
import cn.BlackHumour.TaxSys.user.dao.UserMapper;
import cn.BlackHumour.TaxSys.user.entity.User;
import cn.BlackHumour.TaxSys.user.service.UserService;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User selectByAccountAndId(User user) {
		return userMapper.selectByAccountAndId(user);
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return userMapper.login(user);
	}
	

	/*@Override
	public int insert(User user) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.insert(user);
	}

	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return userMapper.update(user);
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return userMapper.delete(id);
	}

	@Override
	public List<User> selectPageList(Page<User> page) {
		return userMapper.selectPageList(page);
	}

	@Override
	public Integer selectRecordsCount() {
		return userMapper.selectRecordsCount();
	}

	@Override
	public User select(int id) {
		// TODO Auto-generated method stub
		return userMapper.select(id);
	}*/

}
