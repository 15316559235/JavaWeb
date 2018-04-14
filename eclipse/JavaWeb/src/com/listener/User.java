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
session.getServletContext().log("用户名:"+username
+", 口令:"+password+" 登录系统.");
}
public void valueUnbound(HttpSessionBindingEvent e){
HttpSession session = e.getSession();
session.getServletContext().log("用户名:"+username
+"口令:"+password+" 退出系统.");
}
}

