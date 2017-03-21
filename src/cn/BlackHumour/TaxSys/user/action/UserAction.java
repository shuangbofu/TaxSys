package cn.BlackHumour.TaxSys.user.action;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.BlackHumour.TaxSys.complain.entity.Complain;
import cn.BlackHumour.TaxSys.core.action.BaseAction;
import cn.BlackHumour.TaxSys.core.entity.Page;
import cn.BlackHumour.TaxSys.dept.entity.Dept;
import cn.BlackHumour.TaxSys.dept.service.DeptService;
import cn.BlackHumour.TaxSys.privilege.entity.Privilege;
import cn.BlackHumour.TaxSys.role.entity.Role;
import cn.BlackHumour.TaxSys.role.service.RoleService;
import cn.BlackHumour.TaxSys.user.entity.User;
import cn.BlackHumour.TaxSys.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserAction extends BaseAction<User>{
	
	
	private static String listUrl = "forward:/user/list.action";
	private String url = "";
	
	@Resource
	private UserService userService;
	
	@Resource
	private DeptService deptService;
	
	@Resource
	private RoleService roleService;
	
	
	//展示列表（有关键字和无关键字查询后展示列表）
	@RequestMapping("/list")
	public String list(User user, String command, Page<User> page, Model model, HttpSession session) {
		List<Dept> depts = deptService.selectAll();
		model.addAttribute("depts",depts);
		page.setKeyEntity(user);
		return super.list("user",userService,command, page, model, session);
	};
	
	
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------增删改查-----------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	//插入一个用户（insert）
	@RequestMapping("/insert")
	public String insert(User user,Model model,HttpServletRequest request) {
		try {
			if(user!=null) {
				User userSame = userService.selectByAccountAndId(user);
				if(userSame!=null) {
					model.addAttribute("tip","该账号已经存在，请重新修改后保存");
					url = "forward:/base/goURL/user/insert.action";
				} else {
					url = listUrl;
					uploadHeadImg(user,request);
					userService.insert(user);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}
	
	//删除单个用户（delete）
	@RequestMapping("/delete")
	public String delete(String uId) {
		return super.delete(uId, userService, listUrl);
	}
	
	//删除多个选中的用户（deleteAll）
	@RequestMapping("/deleteAll")
	public String deleteAll(String[] deletedUsers) {
		return super.deleteAll(deletedUsers, userService, listUrl);
	}
	
	//保存修改（update）
	@RequestMapping("/update")
	public String update(User user,Model model,HttpServletRequest request) {
		if(user!=null) {
			User userSame = userService.selectByAccountAndId(user);
			if(userSame!=null) {
				model.addAttribute("tip","该账号已经存在，请重新修改后保存");
				model.addAttribute("editedUser",user);
				url = "forward:/base/goURL/user/update.action";
			} else {
				url = listUrl;
				uploadHeadImg(user,request);
				userService.update(user);
			}
		}
		return url;
	}
	
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------存储所需数据并转到页面-----------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	//进入增加用户页面
	@RequestMapping("/add")
	public String add(Model model) {
		List<Dept> depts = deptService.selectAll();
		List<Role> roles = roleService.selectAll();
		model.addAttribute("depts",depts);
		model.addAttribute("roles",roles);
		return "forward:/base/goURL/user/insert.action";
	}
	
	//进入编辑用户页面
	@RequestMapping("/edit")
	public String edit(String uId,Model model) {
		List<Dept> depts = deptService.selectAll();
		List<Role> roles = roleService.selectAll();
		User editedUser = userService.select(uId);
		model.addAttribute("editedUser",editedUser);
		model.addAttribute("depts",depts);
		model.addAttribute("roles",roles);
		return "forward:/base/goURL/user/update.action";
	}
	
	//进入登录页面
	@RequestMapping("/loginIndex")
	public String index(User user,HttpSession session) {
		String url = "";
		if(session.getAttribute("loginUser")==null) {
			url = "forward:/WEB-INF/jsp/login.jsp";
		} else {
			url = "redirect:/home/index.action";
		}
		return url;
	}
	
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------AJAX异步-----------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	//检验账号唯一性
	@RequestMapping(value="/ajaxCheck", produces="text/plain; charset=utf-8")
	public @ResponseBody
	String ajaxCheck(String uId, String uAccount,Model model) {
		User user = new User();
		user.setuAccount(uAccount);
		if(uId!=null) {
			user.setuId(uId);
		}
		User userSame = userService.selectByAccountAndId(user);
		if(userSame!=null) {
			return "该账号已经存在，请重新修改后保存";
		} else {
			return "";
		}
	}
	
	//异步反转uState属性
	@RequestMapping(value="/ajaxReverseEffect",produces="text/plain; charset=utf-8")
	public @ResponseBody 
	String ajaxReverseEffect(String uId, Boolean uState) {
		User user = userService.select(uId);
		user.setuState(!uState);
		return super.ajaxReverseState(uState, user, userService, "未锁定","已锁定");
	}
	
	
	
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------登录和注销---------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	//登录
	@RequestMapping("/login")
	public String login(User user,Model model,HttpSession session) {
		String url = "";
		User loginUser = userService.login(user);
		if(loginUser!=null&&loginUser.getuState()) {
			List<Privilege> privileges = roleService.getPrivileges(loginUser.getuRole());
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("privileges", privileges);
			Log log = LogFactory.getLog(getClass());
			log.info("--------------------------LOGIN----------------------"+new Date()+ "：用户名称为："+loginUser.getuName()+"的用户登录了系统！！！");
			url = "redirect:/home/index.action";
		} else {
			model.addAttribute("user",user);
			model.addAttribute("tip","账号或密码错误！！！");
			if(loginUser!=null) {
				model.addAttribute("tip","对不起，该账号已被管理员锁定，解锁请联系管理员！！！");
			}
			url = "forward:/user/loginIndex.action";
		}
		return url;
	}
	@RequestMapping("/logout")
	public String logOut(HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		session.removeAttribute("loginUser");
		Log log = LogFactory.getLog(getClass());
		log.info("--------------------------LOGOUT----------------------"+new Date()+ "：用户名称为："+loginUser.getuName()+"的用户退出了系统！！！");
		return "redirect:/user/loginIndex.action";
	}
	
	
	
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------头像上传-----------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	
	//头像上传
	public void uploadHeadImg(User user,HttpServletRequest request) {
		if(user.getuHeadImgFile().getOriginalFilename().length()>0) {
			String originalFilename = user.getuHeadImgFile().getOriginalFilename();
			String suff = originalFilename.substring(originalFilename.lastIndexOf("."),originalFilename.length());
			String uHeadImgString = user.getuAccount()+"----"+user.getuId()+suff;
			
			File headImgFile = new File(request.getServletContext().getRealPath("/images/headImg/"),uHeadImgString);
			try {
				user.getuHeadImgFile().transferTo(headImgFile);
				user.setuHeadimg(uHeadImgString);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}