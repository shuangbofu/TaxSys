package cn.BlackHumour.TaxSys.core.service;

import cn.BlackHumour.TaxSys.core.entity.Admin;

public interface AdminService {
	public Admin login(Admin admin) throws Exception; 
	public int insert(Admin admin) throws Exception; 
}
