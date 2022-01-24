package com.pack.controller;

public class CustomException extends Exception {
	
	private static final long serialVersionUID = 1L;

	
	private String errMsg;


	public String getErrMsg() {
		return errMsg;
	}


	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	
	public CustomException( String errMsg) {
		
		this.errMsg = errMsg;
	}

}
