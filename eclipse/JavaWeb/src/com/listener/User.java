package com.listener;
import javax.servlet.http.*;

public class User implements HttpSessionBindingListener{
public String username = "";
public String password = "";
public User(){}
public User(String username,String password){
       this.username = username;
       this.password = password;
}
public void valueBound(HttpSessionBindingEvent e){
HttpSession session = e.getSession();
session.getServletContext().log("�û���:"+username
+", ����:"+password+" ��¼ϵͳ.");
}
public void valueUnbound(HttpSessionBindingEvent e){
HttpSession session = e.getSession();
session.getServletContext().log("�û���:"+username
+"����:"+password+" �˳�ϵͳ.");
}
}

