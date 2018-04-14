package com.listener;
import javax.sql.*;
import java.util.Date;
import javax.servlet.*;
import javax.naming.*;
import javax.servlet.annotation.WebListener;

@WebListener     
public class MyContextListener  implements ServletContextListener, 
ServletContextAttributeListener{
   private ServletContext context = null;
   public void contextInitialized(ServletContextEvent sce){
    Context ctx = null;
       DataSource dataSource = null;
       context = sce.getServletContext();
       try{
         if(ctx == null){
       	  ctx = new InitialContext();
         }
        dataSource = (DataSource)ctx.lookup("java:comp/env/jdbc/sampleDS");
      }catch(NamingException ne){
     	context.log("Exception:"+ne);
      }
       
   	 context.setAttribute("dataSource",dataSource);   
   	 context.log("Ӧ�ó���������log��"+new Date());
   	 System.out.print("Ӧ�ó���������out��"+new Date());
   }
   public void contextDestroyed(ServletContextEvent sce){
       context = sce.getServletContext();
       context.removeAttribute("dataSource");
   	  context.log("Ӧ�ó����ѹرգ�"+new Date());
   }
   public void attributeAdded(ServletContextAttributeEvent sce){
   	 context = sce.getServletContext();
   	 context.log("���һ�����ԣ�"+sce.getName()+"��"+sce.getValue());
   }
   public void attributeRemoved(ServletContextAttributeEvent sce){
   	 context = sce.getServletContext();
   	 context.log("ɾ��һ�����ԣ�"+sce.getName()+"��"+sce.getValue());
   }
   public void attributeReplaced(ServletContextAttributeEvent sce){
   	 context = sce.getServletContext();
   	 context.log("�滻һ�����ԣ�"+sce.getName()+"��"+sce.getValue());
   }
}

