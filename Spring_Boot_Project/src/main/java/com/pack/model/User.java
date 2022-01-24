package com.pack.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class User {

	int corpId;
	@NotEmpty(message = "Required section")
	String loginId;

	@NotEmpty(message = "Required section")
	String password;

	@NotEmpty(message = "Required section")
	String department;

	@NotEmpty(message = "Required section")
	String userAddress;

	@Pattern(regexp = "([789][0-9]{9})", message = "Enter valid phone number")
	String userPhone;

	public int getCorpId() {
		return corpId;
	}

	public void setCorpId(int corpId) {
		this.corpId = corpId;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

}
