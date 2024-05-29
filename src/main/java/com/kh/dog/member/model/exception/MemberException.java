package com.kh.dog.member.model.exception;

public class MemberException extends RuntimeException {	// runtimeException : uncheckedException의 최상위
	public MemberException() {}				// 기본생성자
	public MemberException(String msg) {	// 매개변수 생성자
		super(msg);
	}
}
