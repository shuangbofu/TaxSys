package cn.BlackHumour.TaxSys.core.action;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.BlackHumour.TaxSys.core.entity.Page;
import cn.BlackHumour.TaxSys.core.service.BaseService;
import cn.BlackHumour.TaxSys.user.service.UserService;


@Controller
@RequestMapping("/base")
public class BaseAction<T> {
	
	@Resource
	ServletContext applicationContext;
	
	@Autowired
	protected UserService userService;
	
	@RequestMapping("/goURL/{folder}/{file}")
	public String goURL(@PathVariable String folder, @PathVariable String file) {
		System.out.println("goURL.folder|file===" + folder+"/"+file);
		return "forward:/WEB-INF/jsp/"+folder+"/"+file+".jsp";
	}
	
	public String list(String fileString,BaseService<T> baseService, String command, Page<T> page, Model model, HttpSession session) {
		//--------------------------------现在------------------------------------------------------
		if(page.getCurrentPage()==null||"".equals(page.getCurrentPage())) {
			page.setCurrentPage(1);
		}
		if("search".equals(command)) {
			//page.setKey("%"+page.getKey()+"%");
		} else if(command==null) {
			//page.setKey(null);
			//page.setKeyField(null);
		} else {
			page.setKey("%"+page.getKey()+"%");
			page  = (Page<T>) session.getAttribute("page");
			if("next".equals(command)) {
				if(page.getCurrentPage()==page.getPageCount()) {
					model.addAttribute("tip","已经到最后一页！！！");
					page.setCurrentPage(page.getPageCount()-1);
				}
				page.setCurrentPage(page.getCurrentPage()+1);
			} else if("previous".equals(command)) {
				if(page.getCurrentPage()==1) {
					page.setCurrentPage(2);
					model.addAttribute("tip","已经是第一页了！！！");
				}
				page.setCurrentPage(page.getCurrentPage()-1);
			} else if("home".equals(command)) {
				page.setCurrentPage(1);
			} else if("end".equals(command)) {
				page.setCurrentPage(page.getPageCount());
			}
		}
		page.setPageData(baseService.selectPageList(page));
		//System.out.println("---------------------------------------------------"+baseService.selectPageList(page));
		page.setTotalRecordsCount(baseService.selectRecordsCount(page));
		if(page.getPageData().size()==0) {
			if(page.getKeyEntity()!=null) {
				model.addAttribute("tip","对不起，未查询到结果，请重新查询");
			} else {
				model.addAttribute("tip","对不起，目前没有记录！！！");
			}
		}
		session.setAttribute("page", page);
		
		return "forward:/base/goURL/"+fileString+"/list.action";
	}
	
	//删除单个用户
	public String delete(String id,BaseService<T> baseService,String listUrl) {
		if(id!=null) {
			baseService.delete(id);
		}
		return listUrl;
	}
	//删除多个用户
	public String deleteAll(String[] deletedArray,BaseService<T> baseService,String listUrl) {
		if(deletedArray.length>0) {
			baseService.DeleteAll(deletedArray);
		}
		return listUrl;
	}
	//异步反转state属性
	public @ResponseBody 
	String ajaxReverseState(Boolean state,T t,BaseService<T> baseService,String... stateStrings ) {
		baseService.update(t);
		String stateString = stateStrings[0];
		if(state) {
			stateString = stateStrings[1];
		}
		return stateString;
	}
}
