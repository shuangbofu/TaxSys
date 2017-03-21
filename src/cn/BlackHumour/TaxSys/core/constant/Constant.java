package cn.BlackHumour.TaxSys.core.constant;

import java.util.HashMap;
import java.util.Map;

/**
 * 系统权限集合
 * 
 * 
 */
public class Constant {
	
	//行政管理
	public static String PRIVILEGE_XZGL = "xzgl";
	//后勤服务
	public static String PRIVILEGE_HQFW = "hqfw";
	//在线学习
	public static String PRIVILEGE_ZXXX = "zxxx";
	//纳税服务
	public static String PRIVILEGE_NSFW = "nsfw";
	//我的空间
	public static String PRIVILEGE_SPACE = "space";
	
	public static Map<String, String> PRIVILEGE_MAP;
	static {
		PRIVILEGE_MAP = new HashMap<String, String>();
		PRIVILEGE_MAP.put(PRIVILEGE_XZGL, "行政管理");
		PRIVILEGE_MAP.put(PRIVILEGE_HQFW, "后勤服务");
		PRIVILEGE_MAP.put(PRIVILEGE_ZXXX, "在线学习");
		PRIVILEGE_MAP.put(PRIVILEGE_XZGL, "纳税服务");
		PRIVILEGE_MAP.put(PRIVILEGE_NSFW, "我的空间");
	}
}
