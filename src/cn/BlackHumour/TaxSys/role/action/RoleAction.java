package cn.BlackHumour.TaxSys.role.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.BlackHumour.TaxSys.core.action.BaseAction;
import cn.BlackHumour.TaxSys.privilege.entity.Privilege;
import cn.BlackHumour.TaxSys.privilege.service.PrivilegeService;
import cn.BlackHumour.TaxSys.role.entity.Role;
import cn.BlackHumour.TaxSys.role.service.RoleService;

/**
 * 
 * 
 * 
 */

@Controller
@RequestMapping("/role")
public class RoleAction extends BaseAction<Role>{
	
	@Resource
	private RoleService roleService;
	
	@Resource
	private PrivilegeService privilegeService;
	
	private String listUrl = "forward:/role/list.action"; 
	
	
	@RequestMapping("/list")
	public String list(String rName, Model model) {
		//List<Role> roles = roleService.selectAll();
		if(rName==null) {
			rName="";
		}
		rName = "%"+rName+"%";
		List<Role> roles = roleService.selectByKey(rName);
		System.out.println(roles);
		if(roles.size()==0) {
			if(rName!=null) {
				model.addAttribute("tip","对不起，未查询到结果，请重新查询");
			} else {
				model.addAttribute("tip","对不起，目前没有记录！！！");
			}
		}
		model.addAttribute("roles",roles);
		return "forward:/base/goURL/role/list.action";
	}
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------增删改-----------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	
	@RequestMapping("/insert")
	public String insert(Role role) {
		try {
			 List<String> pCodes = getPCodes(role);
			// System.out.println(pCodes+"++++++++++++++++++++++++++++++"+role.getrName());
			 if(pCodes.size()>0) {
				 roleService.insertRelation(role.getrId(),pCodes);
			 }
			roleService.insert(role);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listUrl;
	}
	
	@RequestMapping("/delete")
	public String delete(String rId) {
		if(rId!=null) {
			roleService.delete(rId);
			roleService.deleteRelation(rId);
		}
		return listUrl;
	}
	
	@RequestMapping("/deleteAll")
	public String delete(String[] deletedRoles) {
		if(deletedRoles.length>0) {
			roleService.DeleteAll(deletedRoles);
			for (String rId : deletedRoles) {
				roleService.deleteRelation(rId);
			}
		}
		return listUrl;
	}
	
	@RequestMapping("/update")
	public String update(Role role) {
		roleService.update(role);
		roleService.deleteRelation(role.getrId());
		List<String> pCodes = getPCodes(role);
		if(pCodes.size()>0) {
			 roleService.insertRelation(role.getrId(),pCodes);
		 }
		return listUrl;
	}
	
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------存储所需数据并转到页面-----------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	@RequestMapping("/add") 
	public String add(Model model) {
		List<Privilege> privileges = privilegeService.selectAll();
		model.addAttribute("privileges",privileges);
		return "forward:/base/goURL/role/insert.action";
	}
	
	@RequestMapping("/edit")
	public String edit(String rId,Model model) {
		Role editedRole = roleService.select(rId);
		model.addAttribute("editedRole",editedRole);
		List<Privilege> privileges = privilegeService.selectAll();
		model.addAttribute("privileges",privileges);
		return "forward:/base/goURL/role/update.action";
	}
	

	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------AJAX异步-----------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	
	//异步反转uState属性
	@RequestMapping(value="/ajaxReverseEffect",produces="text/plain; charset=utf-8")
	public @ResponseBody 
	String ajaxReverseEffect(String rId, Boolean rState,HttpServletResponse response) {
		Role role = roleService.select(rId);
		role.setrState(!rState);
		return super.ajaxReverseState(rState, role, roleService, "有效","无效");
	}
	
	
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------静态方法-----------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	
	private static List<String> getPCodes(Role role) {
		 List<Privilege> privileges = role.getPrivileges();
		 List<String> pCodes = new ArrayList<String>();
		 for (Privilege privilege : privileges) {
			 if(privilege.getpCode()!=null) {
				 pCodes.add(privilege.getpCode());
			 }
		}
		return pCodes;
	}
	
	
}
