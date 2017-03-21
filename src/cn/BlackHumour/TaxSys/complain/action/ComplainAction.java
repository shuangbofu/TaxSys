package cn.BlackHumour.TaxSys.complain.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.BlackHumour.TaxSys.complain.entity.Complain;
import cn.BlackHumour.TaxSys.complain.service.ComplainService;
import cn.BlackHumour.TaxSys.core.action.BaseAction;
import cn.BlackHumour.TaxSys.core.entity.Page;
import cn.BlackHumour.TaxSys.core.service.BaseService;
import cn.BlackHumour.TaxSys.reply.entity.Reply;
import cn.BlackHumour.TaxSys.reply.service.ReplyService;

/**
 * 
 * 
 * 
 */
@Controller
@RequestMapping("/complain")
public class ComplainAction extends BaseAction<Complain>{
	
	@Resource
	private ComplainService complainService;
	
	@Resource
	private ReplyService replyService;
	
	@RequestMapping("/list")
	public String list(Complain complain, Page<Complain> page,String command,Model model, HttpSession session ) {
		model.addAttribute("states",Complain.COMPLAIN_STATE_MAP);
		page.setKeyEntity(complain);
		//System.out.println("complain---------------"+complain);
		return super.list("complain", complainService, command, page, model, session);
	}
	
	
	@RequestMapping("deal")
	public String deal(String cId,Model model) {
		Complain complain = complainService.select(cId);
		model.addAttribute("complain",complain);
		model.addAttribute("states",Complain.COMPLAIN_STATE_MAP);
		//System.out.println("----------------"+complain.getcContent());
		//System.out.println("----------------"+complain);
		List<Reply> replies = replyService.selectAll();
		model.addAttribute("replies",replies);
		//model.addAttribute("replyTime",new Date());
		return "forward:/base/goURL/complain/deal.action";
	}
	
	@RequestMapping("/statistic")
	public String statistic() {
		
		
		return "forward:/base/goURL/complain/annualStatisticChart.action";
	}
	
	
}
