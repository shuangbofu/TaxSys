package cn.BlackHumour.TaxSys.core.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping("/nsfwHome")
public class NsfwHomeAction {

	@Resource
	private UserService userService;
	
	@Resource
	private RoleService roleService;
	
	@RequestMapping("/nsfwHome")
	public String nsfwHome() {
		
		return "forward:/WEB-INF/jsp/nsfw/frame.jsp";
	}
	@RequestMapping("/top")
	public String ToTop(HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		User newUser = userService.select(loginUser.getuId());
		List<Privilege> newPrivileges = roleService.getPrivileges(loginUser.getuRole());
		session.setAttribute("loginUser", newUser);
		session.setAttribute("privileges", newPrivileges);
		
		return "forward:/WEB-INF/jsp/nsfw/top.jsp";
	}
	@RequestMapping("/left")
	public String ToLeft() {
		
		return "forward:/WEB-INF/jsp/nsfw/left.jsp";
	}
	
	@RequestMapping("/common/{jspName}")
	public String toCommonJsp(@PathVariable String jspName) {
		
		return "forward:/WEB-INF/jsp/nsfw/common/"+jspName+".jsp";
	}
}
