package com.listener;
import javax.servlet.AsyncListener;
import javax.servlet.AsyncEvent;
import javax.servlet.annotation.*;
import java.io.IOException;

public class MyAsyncListener implements AsyncListener{
	@Override
	public void onStartAsync(AsyncEvent event)throws IOException{
		System.out.println("�첽���ÿ�ʼ��");
	}
	public void onComplete(AsyncEvent event)throws IOException {
		System.out.println("�첽������ɡ�");
	}
	public void onError(AsyncEvent event)throws IOException {
		System.out.println("�첽���ó���");
	}
	public void onTimeout(AsyncEvent event)throws IOException {
		System.out.println("�첽���ó�ʱ��");
	}
}

