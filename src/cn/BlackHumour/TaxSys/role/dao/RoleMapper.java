package cn.BlackHumour.TaxSys.role.dao;

import java.util.List;

import cn.BlackHumour.TaxSys.core.dao.BaseMapper;
import cn.BlackHumour.TaxSys.privilege.entity.Privilege;
import cn.BlackHumour.TaxSys.role.entity.Role;

public interface RoleMapper extends BaseMapper<Role> {
	
	public List<Privilege> getPrivileges(Role role);
}