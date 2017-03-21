package cn.BlackHumour.TaxSys.core.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.BlackHumour.TaxSys.core.dao.AdminMapper;
import cn.BlackHumour.TaxSys.core.entity.Admin;
import cn.BlackHumour.TaxSys.core.service.AdminService;



@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public Admin login(Admin admin) throws Exception {
		// TODO Auto-generated method stub
		return adminMapper.login(admin);
	}
	
	@Override
	public int insert(Admin admin) throws Exception {
		int i = 0;
		i = adminMapper.insert(admin);
		return i;
	}

}
