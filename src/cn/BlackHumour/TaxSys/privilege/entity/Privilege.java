package cn.BlackHumour.TaxSys.privilege.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.BlackHumour.TaxSys.role.entity.Role;

public class Privilege implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 4123127040978746836L;

	private String pCode;

    public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	private String pName;
    
    private List<Role> roles = new ArrayList<Role>(); 

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode == null ? null : pCode.trim();
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

	@Override
	public String toString() {
		return "Privilege [pCode=" + pCode + ", pName=" + pName + ", roles="
				+ roles + "]";
	}
}