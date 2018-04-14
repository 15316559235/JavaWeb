package student;

import java.io.IOException;
import java.io.Serializable;
import java.sql.ResultSet;  
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;  

@WebServlet(name = "course_servlet" , urlPatterns = {"/course_servlet.do"})
public class course_servlet extends HttpServlet{
	   protected void doGet(HttpServletRequest request,
    		   HttpServletResponse response)
       throws ServletException,IOException{
    	      doPost(request,response);
       }
       
       protected void doPost(HttpServletRequest request,
    		   HttpServletResponse response)
       throws ServletException,IOException{
    	      DateDao mysql = new DateDao();
    	      HttpSession session = request.getSession();
    	      String username = (String) session.getAttribute("username");
    	      List<ChooseCourseBean> clist = new LinkedList<ChooseCourseBean>();
    	      List<AllCourseBean> alist = new LinkedList<AllCourseBean>();
    	      
    	      System.out.println(username);


    	      String sql= "SELECT CNAME,NAME FROM Course a,Teacher b WHERE a.CNO IN (SELECT CNO FROM SCORE WHERE NO IN "
    	      		+ "(SELECT NO FROM STUDENT WHERE SUSERNAME = '"+username+"'))"
    	      		+ "AND a.TNO = b.TNO";
    	      ResultSet rs = mysql.query(sql);
    	      
    	      try {
				while(rs.next()) {
					  String CNAME = rs.getString("CNAME") ;
					  String NAME = rs.getString("NAME");
					  ChooseCourseBean newbean = new ChooseCourseBean(NAME,CNAME);
					  clist.add(newbean);
				  }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	      
    	     sql = "SELECT CNAME,NAME FROM Course a,Teacher b WHERE  a.TNO = b.TNO";
    	     rs = mysql.query(sql);
    	     
    	     try {
 				while(rs.next()) {
 					  String CNAME = rs.getString("CNAME") ;
 					  String NAME = rs.getString("NAME");
 					  AllCourseBean newbean = new AllCourseBean(NAME,CNAME);
 					  alist.add(newbean);
 				  }
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
    	     mysql.close();
    	     
    	    session.setAttribute("alist", alist);
    	    session.setAttribute("clist",clist);
    	    RequestDispatcher rd = request.getRequestDispatcher("/course.jsp");
			  rd.forward(request, response);
       }

}
