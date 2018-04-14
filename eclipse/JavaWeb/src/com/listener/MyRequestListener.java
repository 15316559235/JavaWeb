package com.listener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MyRequestListener 
                           implements ServletRequestListener{
   private int count = 0;
   public void requestInitialized(ServletRequestEvent re){
      HttpServletRequest request=
               (HttpServletRequest)re.getServletRequest();
      if(request.getRequestURI().endsWith("onlineCount.jsp")){
         count++;
         re.getServletContext().setAttribute("count",new Integer(count));
      } 
   }  
   public void requestDestroyed(ServletRequestEvent re){
   }
}

