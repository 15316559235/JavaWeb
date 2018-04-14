package com.listener;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.ArrayList;
import javax.servlet.annotation.WebListener;

@WebListener
public class MySessionListener implements HttpSessionListener{
    private ServletContext context = null;
    public void sessionCreated(HttpSessionEvent se){
       HttpSession session = se.getSession();
       context = session.getServletContext();
       ArrayList<HttpSession> sessionList = (ArrayList<HttpSession>)
       context.getAttribute("sessionList");
       if(sessionList==null){
          sessionList = new ArrayList<HttpSession>();
     	  context.setAttribute("sessionList",sessionList); 
       }else{
          sessionList.add(session);
       }
       context.log("����һ���Ự��"+session.getId());	
    }
  public void sessionDestroyed(HttpSessionEvent se){
   	 HttpSession session = se.getSession();
      context = session.getServletContext();
      ArrayList<HttpSession> sessionList = (ArrayList<HttpSession>)
        context.getAttribute("sessionList");
      sessionList.remove(session);  
      context.log("����һ���Ự��"+session.getId()); 
   }
   
}

