package cn.BlackHumour.TaxSys.core.entity;

import java.io.Serializable;

public class Admin implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -846738963310135311L;
	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", password=" + password
				+ "]";
	}
	private Integer id;
	private String name;
	private String password;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
