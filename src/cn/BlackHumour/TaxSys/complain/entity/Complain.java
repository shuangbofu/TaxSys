package cn.BlackHumour.TaxSys.complain.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import cn.BlackHumour.TaxSys.dept.entity.Dept;
import cn.BlackHumour.TaxSys.reply.entity.Reply;

public class Complain implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 3448986065653498012L;

	public static String COMPLAIN_STATE_UNDONE = "0";
	public static String COMPLAIN_STATE_DONE = "1";
	public static String COMPLAIN_STATE_INVALID = "2";
	public static Map<String, String> COMPLAIN_STATE_MAP;
	static {
		COMPLAIN_STATE_MAP = new HashMap<String, String>();
		COMPLAIN_STATE_MAP.put(COMPLAIN_STATE_UNDONE, "待受理");
		COMPLAIN_STATE_MAP.put(COMPLAIN_STATE_DONE, "已受理");
		COMPLAIN_STATE_MAP.put(COMPLAIN_STATE_INVALID, "已失效");
	}

	@Override
	public String toString() {
		return "Complain [cId=" + cId + ", cCompany=" + cCompany + ", cMobile="
				+ cMobile + ", cState=" + cState + ", cIsnm=" + cIsnm
				+ ", cTime=" + cTime + ", cTitle=" + cTitle + ", cToname="
				+ cToname + ", cTodept=" + cTodept + ", cName=" + cName
				+ ", cContent=" + cContent + ", replies=" + replies
				+ ", cReplyCount=" + cReplyCount + "]";
	}

	private String cId = UUID.randomUUID().toString();

    private String cCompany;

    private String cMobile;

    private String cState;

    private Boolean cIsnm;

    private Date cTime;

    private String cTitle;

    private String cToname;

    private Dept cTodept;

    private String cName;

    private String cContent;
    
    private List<Reply> replies;
    
    private Integer cReplyCount = 0;
    
    public Integer getcReplyCount() {
		return cReplyCount;
	}

	public void setcReplyCount(Integer cReplyCount) {
		this.cReplyCount = cReplyCount;
	}

	public List<Reply> getReplies() {
		return replies;
	}

	public void setReplies(List<Reply> replies) {
		this.replies = replies;
	}

	public String getcId() {
        return cId;
    }

    public void setcId(String cId) {
        this.cId = cId == null ? null : cId.trim();
    }

    public String getcCompany() {
        return cCompany;
    }

    public void setcCompany(String cCompany) {
        this.cCompany = cCompany == null ? null : cCompany.trim();
    }

    public String getcMobile() {
        return cMobile;
    }

    public void setcMobile(String cMobile) {
        this.cMobile = cMobile == null ? null : cMobile.trim();
    }

    public String getcState() {
        return cState;
    }

    public void setcState(String cState) {
        this.cState = cState == null ? null : cState.trim();
    }

    public Boolean getcIsnm() {
        return cIsnm;
    }

    public void setcIsnm(Boolean cIsnm) {
        this.cIsnm = cIsnm;
    }

    public Date getcTime() {
        return cTime;
    }

    public void setcTime(Date cTime) {
        this.cTime = cTime;
    }

    public String getcTitle() {
        return cTitle;
    }

    public void setcTitle(String cTitle) {
        this.cTitle = cTitle == null ? null : cTitle.trim();
    }

    public String getcToname() {
        return cToname;
    }

    public void setcToname(String cToname) {
        this.cToname = cToname == null ? null : cToname.trim();
    }

 

    public Dept getcTodept() {
		return cTodept;
	}

	public void setcTodept(Dept cTodept) {
		this.cTodept = cTodept;
	}

	public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public String getcContent() {
        return cContent;
    }

    public void setcContent(String cContent) {
        this.cContent = cContent == null ? null : cContent.trim();
    }
}