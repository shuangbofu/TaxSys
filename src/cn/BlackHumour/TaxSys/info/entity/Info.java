package cn.BlackHumour.TaxSys.info.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class Info implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -1906507481775524421L;

	private String iId = UUID.randomUUID().toString();

    public Info() {
		super();
	}
    
    public static String INFO_TYPE_TZGG = "tzgg";
	public static String INFO_TYPE_ZCSD = "zcsd";
	public static String INFO_TYPE_NSZD = "nszd";
	
	public static Map<String, String> INFO_TYPE_MAP;
	static {
		INFO_TYPE_MAP = new HashMap<String, String>();
		INFO_TYPE_MAP.put(INFO_TYPE_TZGG, "通知公告");
		INFO_TYPE_MAP.put(INFO_TYPE_ZCSD, "政策速递");
		INFO_TYPE_MAP.put(INFO_TYPE_NSZD, "纳税指导");
	}
	
	@Override
	public String toString() {
		return "Info [iId=" + iId + ", iType=" + iType + ", iSource=" + iSource
				+ ", iTitle=" + iTitle + ", iContent=" + iContent + ", iMemo="
				+ iMemo + ", iCreator=" + iCreator + ", iCreatetime="
				+ iCreatetime + ", iState=" + iState + "]";
	}

	private String iType;

    private String iSource;

    private String iTitle;

    private String iContent;

    private String iMemo;

    private String iCreator;

    private Date iCreatetime;

    private Boolean iState;

	public String getiId() {
		return iId;
	}

	public void setiId(String iId) {
		this.iId = iId;
	}

	public String getiType() {
		return iType;
	}

	public void setiType(String iType) {
		this.iType = iType;
	}

	public String getiSource() {
		return iSource;
	}

	public void setiSource(String iSource) {
		this.iSource = iSource;
	}

	public String getiTitle() {
		return iTitle;
	}

	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}

	public String getiContent() {
		return iContent;
	}

	public void setiContent(String iContent) {
		this.iContent = iContent;
	}

	public String getiMemo() {
		return iMemo;
	}

	public void setiMemo(String iMemo) {
		this.iMemo = iMemo;
	}

	public String getiCreator() {
		return iCreator;
	}

	public void setiCreator(String iCreator) {
		this.iCreator = iCreator;
	}

	public Date getiCreatetime() {
		return iCreatetime;
	}

	public void setiCreatetime(Date iCreatetime) {
		this.iCreatetime = iCreatetime;
	}

	public Boolean getiState() {
		return iState;
	}

	public void setiState(Boolean iState) {
		this.iState = iState;
	}
}