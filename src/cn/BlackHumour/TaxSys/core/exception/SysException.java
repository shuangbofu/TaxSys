package cn.BlackHumour.TaxSys.core.exception;
/**
 * 
 * 
 * 
 */
public class SysException extends Exception {
	
	private String errorMsg;

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public SysException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SysException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
		errorMsg = message;
	}

	public SysException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public SysException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

}
