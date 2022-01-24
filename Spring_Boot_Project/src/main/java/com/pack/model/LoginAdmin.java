package com.pack.model;

import javax.validation.constraints.NotEmpty;

public class LoginAdmin {

	@NotEmpty(message = "Name should not be empty")
	String username;

	@NotEmpty(message = "Password should not be empty")
	String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
