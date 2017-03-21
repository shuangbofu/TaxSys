package cn.BlackHumour.TaxSys.core.exception;
/**
 * 
 * 
 * 
 */
public class ServiceException extends Exception {

	public ServiceException() {
		super("业务操作错误！");
		// TODO Auto-generated constructor stub
	}

	public ServiceException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}
	
}
