package cn.BlackHumour.TaxSys.user.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import cn.BlackHumour.TaxSys.dept.entity.Dept;
import cn.BlackHumour.TaxSys.role.entity.Role;

public class User implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 7068904177091121784L;

	
	//ÓÃ»§×´Ì¬
	//public static String USER_STATE_VALID = "1";
	//public static String uSER_STATE_INVALID = "0";



	private String uId = UUID.randomUUID().toString();

	@Override
	public String toString() {
		return "User [uId=" + uId + ", uDept=" + uDept + ", uAccount="
				+ uAccount + ", uName=" + uName + ", uPassword=" + uPassword
				+ ", uHeadimg=" + uHeadimg + ", uGender=" + uGender
				+ ", uState=" + uState + ", uMobile=" + uMobile + ", uEmail="
				+ uEmail + ", uBirthday=" + uBirthday + ", uMemo=" + uMemo
				+ ", uRole=" + uRole + "]";
	}


	public User() {
		super();
	}

	private Dept uDept;

	private String uAccount;

	private String uName;

	private String uPassword;

	private String uHeadimg;
	
	private MultipartFile uHeadImgFile;

	public MultipartFile getuHeadImgFile() {
		return uHeadImgFile;
	}


	public void setuHeadImgFile(MultipartFile uHeadImgFile) {
		this.uHeadImgFile = uHeadImgFile;
	}

	private Boolean uGender;

	private Boolean uState;

	private String uMobile;

	private String uEmail;

	private Date uBirthday;

	private String uMemo;
	
	private Role uRole;

	public String getuId() {
		return uId;
	}
	
	public void setuId(String uId) {
		this.uId = uId;
	}
	
	public Dept getuDept() {
		return uDept;
	}
	
	public void setuDept(Dept uDept) {
		this.uDept = uDept;
	}
	
	public Role getuRole() {
		return uRole;
	}
	
	public void setuRole(Role uRole) {
		this.uRole = uRole;
	}
	
	public String getuAccount() {
		return uAccount;
	}

	public void setuAccount(String uAccount) {
		this.uAccount = uAccount == null ? null : uAccount.trim();
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName == null ? null : uName.trim();
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword == null ? null : uPassword.trim();
	}

	public String getuHeadimg() {
		return uHeadimg;
	}

	public void setuHeadimg(String uHeadimg) {
		this.uHeadimg = uHeadimg == null ? null : uHeadimg.trim();
	}

	public Boolean getuGender() {
		return uGender;
	}

	public void setuGender(Boolean uGender) {
		this.uGender = uGender;
	}

	public Boolean getuState() {
		return uState;
	}
	public void setuState(Boolean uState) {
		this.uState = uState;
	}
	public String getuMobile() {
		return uMobile;
	}

	public void setuMobile(String uMobile) {
		this.uMobile = uMobile == null ? null : uMobile.trim();
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail == null ? null : uEmail.trim();
	}

	public Date getuBirthday() {
		return uBirthday;
	}

	public void setuBirthday(Date uBirthday) {
		this.uBirthday = uBirthday;
	}

	public String getuMemo() {
		return uMemo;
	}

	public void setuMemo(String uMemo) {
		this.uMemo = uMemo == null ? null : uMemo.trim();
	}
}