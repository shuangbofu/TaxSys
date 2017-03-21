package cn.BlackHumour.TaxSys.reply.action;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.BlackHumour.TaxSys.complain.entity.Complain;
import cn.BlackHumour.TaxSys.complain.service.ComplainService;
import cn.BlackHumour.TaxSys.reply.entity.Reply;
import cn.BlackHumour.TaxSys.reply.service.ReplyService;

/**
 * 
 * 
 * 
 */
@Controller
@RequestMapping("/reply")
public class ReplyAction {
	
	@Resource
	private ComplainService complainService;
	
	@Resource
	private ReplyService replyService;
	
	@RequestMapping("insert")
	public String insert(Reply reply) {
		System.out.println("--------------------"+reply);
		Complain complain = complainService.select(reply.getcId());
		try {
			Date date = new Date();
			/*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			format.format(date);*/
			reply.setReplyTime(date);
			if(replyService.insert(reply)>0) {
				complain.setcState("1");
				System.out.println("之前----------------------"+complain.getcReplyCount());
				complain.setcReplyCount(complain.getcReplyCount()+1);
				complainService.update(complain);
				System.out.println("之后----------------------"+complain.getcReplyCount());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "forward:/complain/list.action";
	}
}
