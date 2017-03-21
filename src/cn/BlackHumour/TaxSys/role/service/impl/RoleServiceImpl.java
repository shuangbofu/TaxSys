package cn.BlackHumour.TaxSys.role.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.BlackHumour.TaxSys.core.service.impl.BaseServiceImpl;
import cn.BlackHumour.TaxSys.privilege.entity.Privilege;
import cn.BlackHumour.TaxSys.role.dao.RoleMapper;
import cn.BlackHumour.TaxSys.role.entity.Role;
import cn.BlackHumour.TaxSys.role.service.RoleService;

/**
 * 
 * 
 * 
 */
@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {
	
	@Autowired
	private RoleMapper roleMapper;

	@Override
	public List<Role> selectAll() {
		return roleMapper.selectAll();
	}

	@Override
	public List<Privilege> getPrivileges(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.getPrivileges(role);
	}
}
