package cn.BlackHumour.TaxSys.role.service;
import java.util.List;

import cn.BlackHumour.TaxSys.core.service.BaseService;
import cn.BlackHumour.TaxSys.privilege.entity.Privilege;
import cn.BlackHumour.TaxSys.role.entity.Role;

/**
 * 
 * 
 * 
 */
public interface RoleService extends BaseService<Role> {
	public List<Privilege> getPrivileges(Role role);
}
