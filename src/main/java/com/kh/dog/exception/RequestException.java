package com.kh.dog.exception;

public class RequestException extends RuntimeException{
	
	
	public RequestException() {}
	
	public RequestException(String msg) {
		super(msg);
	}
}
