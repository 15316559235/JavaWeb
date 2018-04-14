package student;

import javax.swing.JCheckBox;
import java.io.IOException;

import java.sql.ResultSet;  
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;  

@WebServlet("/add_servlet")

public class add_servlet extends HttpServlet{
	   private static final long serialVersionUID = 4L;
	   

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException   
	    {  
	        doPost(request, response);  
	    }  
	  
	      
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException   
	    {  
	    	 DateDao mysql = new DateDao();  
	    	 HttpSession session = request.getSession();
	    	 List<ChooseCourseBean> clist = (List<ChooseCourseBean>) session.getAttribute("clist");
	    	 String quest = request.getParameter("quest");
	    	 String username =(String) session.getAttribute("username");
	    	 
	    	 String sql = "Select * from student where susername = '"+ username+"'";
	    	 ResultSet rs = mysql.query(sql);
	    	 
	    	 int NO=0,CNO=0;
	    	 
	    	 try {
				if(rs.next()) {
				   NO = rs.getInt("NO");	
				}
				 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	 ChooseCourseBean newbean = new ChooseCourseBean();
	    	 
	    	 if(quest.equals("1")) { CNO = 3245;  newbean.setTeacher("LZ"); newbean.setCourse("CZXT");}
	    	 if(quest.equals("2")) { CNO = 3105;  newbean.setTeacher("WP"); newbean.setCourse("jsjdl");}
	    	 if(quest.equals("3")) { CNO = 9888;  newbean.setTeacher("LB"); newbean.setCourse("GDSX");}
	         if(quest.equals("4")) { CNO = 6166;  newbean.setTeacher("ZX"); newbean.setCourse("SZDL");}
	    	 sql = "insert into Score(NO,CNO,GRADE) VALUES("+NO+","+CNO+",0)";
	    	 rs = mysql.query(sql);
	    	 clist.add(newbean);
	    	 session.setAttribute("clist",clist);
	    	 RequestDispatcher rd = request.getRequestDispatcher("/course.jsp");
				  rd.forward(request, response);
	    }
	   
}
