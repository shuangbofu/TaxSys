package cn.BlackHumour.TaxSys.core.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.org.apache.bcel.internal.generic.NEW;

import cn.BlackHumour.TaxSys.core.entity.Admin;
import cn.BlackHumour.TaxSys.core.service.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminAction {
	@Resource
	private AdminService adminService;
	
	@RequestMapping("/login")
	public String login(@ModelAttribute Admin admin,HttpSession session,Model model) {
		try {
			System.out.println(admin+"=====================");
			Admin ad = adminService.login(admin);
			if(ad!=null) {
				session.setAttribute("admin", ad);
				return "forward:/main.jsp";
			} else {
				model.addAttribute("msg","用户名或密码错误！");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "forward:/login.jsp";
	}
	
	@RequestMapping("/admin_input") 
	public String inputAdmin(Model model) {
		Admin newAdmin = new Admin();
		model.addAttribute("admin",newAdmin);
		
		return "forward:/login.jsp";
	}
	
	@RequestMapping("/insert")
	public String insert(Admin admin,Model model) { 
		System.out.println("--action.insert:"+admin);
		try {
			adminService.insert(admin);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("admin",admin);
		return "forward:/main.jsp";
	}
}
