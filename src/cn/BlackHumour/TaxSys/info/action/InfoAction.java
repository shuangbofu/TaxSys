package cn.BlackHumour.TaxSys.info.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.BlackHumour.TaxSys.core.action.BaseAction;
import cn.BlackHumour.TaxSys.core.entity.Page;
import cn.BlackHumour.TaxSys.info.entity.Info;
import cn.BlackHumour.TaxSys.info.service.InfoService;

/**
 * 
 * 
 * 
 */
@Controller
@RequestMapping("/info")
public class InfoAction extends BaseAction<Info>{
	/**
	 * 自定义类型转换器
	 */
	@InitBinder()
	protected void initBinder(HttpServletRequest request,ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(
				Date.class, 
				new CustomDateEditor(
						new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"), 
						true
				)
		);
	}
	
	private static String listUrl = "forward:/info/list.action";
	
	@Resource
	private InfoService infoService;
	
	@RequestMapping("/list")
	public String list(Info info, String command,HttpSession session, Page<Info> page, Model model) {
		model.addAttribute("types",Info.INFO_TYPE_MAP);
		page.setKeyEntity(info);
		return super.list("info", infoService, command, page, model, session);
	}
	
	
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------增删改查-----------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	@RequestMapping("/insert")
	public String insert(Info info,HttpServletRequest request) {
		try {
			String iCreator = request.getParameter("iCreator");
			System.out.println("================"+iCreator);
			System.out.println("---------------"+info);
			infoService.insert(info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listUrl;
	}
	
	//删除单个用户
	@RequestMapping("/delete")
	public String delete(String iId) {
		return super.delete(iId, infoService, listUrl);
	}
	
	
	//删除多个用户
	@RequestMapping("/deleteAll")
	public String deleteAll(String[] deletedInfo) {
		return super.deleteAll(deletedInfo, infoService, listUrl);
	}
	
	//保存修改
	@RequestMapping("/update")
	public String update(Info info) {
		infoService.update(info);
		return listUrl;
	}
	
	
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------存储所需数据并转到页面-----------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	
	@RequestMapping("/add")
	public String add(Model model,HttpSession session) {
		
		Date date = new Date();
		Map<String, String> infoTypes = Info.INFO_TYPE_MAP;
		model.addAttribute("iCreatetime",date);
		session.setAttribute("infoTypes",infoTypes);
		return "forward:/base/goURL/info/insert.action";
	}
	
	
	//进入编辑用户页面
		@RequestMapping("/edit")
		public String edit(String iId,Model model) {
			Date date = new Date();
			model.addAttribute("iCreatetime",date);
			Info editedInfo = infoService.select(iId);
			System.out.println("=============="+editedInfo);
			model.addAttribute("editedInfo",editedInfo);
			
			return "forward:/base/goURL/info/update.action";
		}
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------AJAX异步-----------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	
	
	//异步反转iState属性
	@RequestMapping(value="/ajaxReverseState",produces="text/plain; charset=utf-8")
	public @ResponseBody 
	String ajaxReverseState(String iId, Boolean iState) {
		Info info = infoService.select(iId);
		info.setiState(!iState);
		return super.ajaxReverseState(iState, info, infoService, "停用","发布");
	}
}
