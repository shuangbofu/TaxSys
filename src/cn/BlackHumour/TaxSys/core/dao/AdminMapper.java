package cn.BlackHumour.TaxSys.core.dao;
import cn.BlackHumour.TaxSys.core.entity.Admin;

public interface AdminMapper extends BaseMapper<Admin>{
	public Admin login(Admin admin); 
}
