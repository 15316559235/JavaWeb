package com.listener;
import javax.servlet.AsyncListener;
import javax.servlet.AsyncEvent;
import javax.servlet.annotation.*;
import java.io.IOException;

public class MyAsyncListener implements AsyncListener{
	@Override
	public void onStartAsync(AsyncEvent event)throws IOException{
		System.out.println("异步调用开始。");
	}
	public void onComplete(AsyncEvent event)throws IOException {
		System.out.println("异步调用完成。");
	}
	public void onError(AsyncEvent event)throws IOException {
		System.out.println("异步调用出错。");
	}
	public void onTimeout(AsyncEvent event)throws IOException {
		System.out.println("异步调用超时。");
	}
}

