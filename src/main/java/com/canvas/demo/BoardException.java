package com.canvas.demo;

public class BoardException extends RuntimeException {

	public BoardException() {}
	public BoardException(String msg) { 
		super(msg);
		System.out.println("exception msg:"+msg);
	}
}