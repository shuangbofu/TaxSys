package cn.BlackHumour.TaxSys.dept.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.BlackHumour.TaxSys.user.entity.User;

/**
 * 
 * 
 * 
 */
public class Dept implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4911459117377489405L;

	public Dept() {
		super();
	}

	private String dId;
	
	@Override
	public String toString() {
		return "Dept [dId=" + dId + ", dName=" + dName + ", users=" + users
				+ "]";
	}

	public String getdId() {
		return dId;
	}

	public void setdId(String dId) {
		this.dId = dId;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	private String dName;


	public List<User> getUsersssssss() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	private List<User> users = new ArrayList<User>();

	
}
