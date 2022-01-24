package com.pack.model;

import javax.validation.constraints.NotEmpty;

public class Account {

	@NotEmpty(message = "Required section")
	String accNumber;

	@NotEmpty(message = "Required section")
	String accName;

	String accBranch;
	String accCurrency;

	@NotEmpty(message = "Required section")
	String accBalance;
	int corpId;

	public String getAccNumber() {
		return accNumber;
	}

	public void setAccNumber(String accNumber) {
		this.accNumber = accNumber;
	}

	public String getAccName() {
		return accName;
	}

	public void setAccName(String accName) {
		this.accName = accName;
	}

	public String getAccBranch() {
		return accBranch;
	}

	public void setAccBranch(String accBranch) {
		this.accBranch = accBranch;
	}

	public String getAccCurrency() {
		return accCurrency;
	}

	public void setAccCurrency(String accCurrency) {
		this.accCurrency = accCurrency;
	}

	public String getAccBalance() {
		return accBalance;
	}

	public void setAccBalance(String accBalance) {
		this.accBalance = accBalance;
	}

	public int getCorpId() {
		return corpId;
	}

	public void setCorpId(int corpId) {
		this.corpId = corpId;
	}

}
