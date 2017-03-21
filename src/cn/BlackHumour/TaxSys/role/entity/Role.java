package cn.BlackHumour.TaxSys.role.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import cn.BlackHumour.TaxSys.privilege.entity.Privilege;
import cn.BlackHumour.TaxSys.user.entity.User;

public class Role implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -5070173302853508745L;

	public Role() {
		super();
	}

	private String rId = UUID.randomUUID().toString();

    private String rName;

    private Boolean rState;
    
    private List<Privilege> privileges = new ArrayList<Privilege>();
    
    private List<User> users = new ArrayList<User>();

    public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<Privilege> getPrivileges() {
		return privileges;
	}

	public void setPrivileges(List<Privilege> privileges) {
		this.privileges = privileges;
	}

	public String getrId() {
        return rId;
    }

    public void setrId(String rId) {
        this.rId = rId == null ? null : rId.trim();
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName == null ? null : rName.trim();
    }

    public Boolean getrState() {
        return rState;
    }

    public void setrState(Boolean rState) {
        this.rState = rState;
    }

	@Override
	public String toString() {
		return "Role [rId=" + rId + ", rName=" + rName + ", rState=" + rState
				+ ", privileges=" + privileges + ", users=" + users + "]";
	}
}