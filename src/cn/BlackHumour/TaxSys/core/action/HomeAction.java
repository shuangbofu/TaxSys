package cn.BlackHumour.TaxSys.core.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.BlackHumour.TaxSys.privilege.entity.Privilege;
import cn.BlackHumour.TaxSys.role.service.RoleService;
import cn.BlackHumour.TaxSys.user.entity.User;
import cn.BlackHumour.TaxSys.user.service.UserService;

/**
 * 
 * 
 * 
 */
@Controller
@RequestMapping("/home")
public class HomeAction {
	
	@Resource
	private RoleService roleService;
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/index")
	public String home(HttpSession session,Model model) {
	/*	User loginUser = (User) session.getAttribute("loginUser");
		System.out.println(loginUser.getuRole());
		List<Privilege> privileges = roleService.getPrivileges(loginUser.getuRole());
		System.out.println(privileges+"========================");
		model.addAttribute("privileges",privileges);*/
//		 privilegeService.select(loginUser.getuRole().getrId());
		
		
		User loginUser = (User) session.getAttribute("loginUser");
		User newUser = userService.select(loginUser.getuId());
		List<Privilege> newPrivileges = roleService.getPrivileges(loginUser.getuRole());
		session.setAttribute("loginUser", newUser);
		session.setAttribute("privileges", newPrivileges);
		
		//System.out.println("---------------------"+newUser.getuRole());
		//System.out.println("====================="+newPrivileges);
		return "forward:/WEB-INF/jsp/home/home.jsp";
	}
}
