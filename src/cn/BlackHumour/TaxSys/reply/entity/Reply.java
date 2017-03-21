package cn.BlackHumour.TaxSys.reply.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import cn.BlackHumour.TaxSys.complain.entity.Complain;
import cn.BlackHumour.TaxSys.dept.entity.Dept;

public class Reply implements Serializable {


	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", cId=" + cId + ", replyEr="
				+ replyEr + ", replyDept=" + replyDept + ", replyTime="
				+ replyTime + ", replyContent=" + replyContent + ", complain="
				+ complain + "]";
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -6908184328097839716L;

	private String replyId = UUID.randomUUID().toString();

    private String cId;

    private String replyEr;

    private Dept replyDept;

    private Date replyTime;

    private String replyContent;
    
    private Complain complain;
    
    public Complain getComplain() {
		return complain;
	}

	public void setComplain(Complain complain) {
		this.complain = complain;
	}

	public String getReplyId() {
        return replyId;
    }

    public void setReplyId(String replyId) {
        this.replyId = replyId == null ? null : replyId.trim();
    }

    public String getcId() {
        return cId;
    }

    public void setcId(String cId) {
        this.cId = cId == null ? null : cId.trim();
    }

    public String getReplyEr() {
        return replyEr;
    }

    public void setReplyEr(String replyEr) {
        this.replyEr = replyEr == null ? null : replyEr.trim();
    }

 

    public Dept getReplyDept() {
		return replyDept;
	}

	public void setReplyDept(Dept replyDept) {
		this.replyDept = replyDept;
	}

	public Date getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent == null ? null : replyContent.trim();
    }
}