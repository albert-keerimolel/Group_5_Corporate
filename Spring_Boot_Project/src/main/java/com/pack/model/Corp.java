package com.pack.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class Corp {

	public int corpId;

	@NotEmpty(message = "Required section")
	private String corpName;

	@NotEmpty(message = "Required section")
	String corpAddress;

	@Pattern(regexp = "([789][0-9]{9})", message = "Enter valid phone number")
	String corpPhone;

	public int getCorpId() {
		return corpId;
	}

	public void setCorpId(int corpId) {
		this.corpId = corpId;
	}

	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}

	public String getCorpAddress() {
		return corpAddress;
	}

	public void setCorpAddress(String corpAddress) {
		this.corpAddress = corpAddress;
	}

	public String getCorpPhone() {
		return corpPhone;
	}

	public void setCorpPhone(String corpPhone) {
		this.corpPhone = corpPhone;
	}

}
