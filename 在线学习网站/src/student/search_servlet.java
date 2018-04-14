package student;


import java.io.IOException;

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

@WebServlet(name = "search_servlet",urlPatterns = {"/search_servlet.do"})
public class search_servlet extends HttpServlet{
       private static final long serialVersionUID= 2L;
       protected void doGet(HttpServletRequest request,
    		   HttpServletResponse response)
       throws ServletException,IOException{
    	      doPost(request,response);
       }
       
       protected void doPost(HttpServletRequest request,
    		   HttpServletResponse response)
       throws ServletException,IOException{
    	      DateDao mysql = new DateDao();
    	      
    	    
    	      List<ScoreBean> list=new LinkedList<ScoreBean>();
    	      
    	      HttpSession session = request.getSession();
    	      String username = (String) session.getAttribute("username");
    	      System.out.println(username);

    	      String sql = "SELECT * FROM Student where susername = '"+username+"'";
    	      ResultSet rs = mysql.query(sql);
    	      String NAME = "";
    	      try{
    	      if(rs.next()){
    	      	     NAME = rs.getString("NAME");
			  }
    	      }catch(SQLException e){
    	      	 e.getStackTrace();
			  }
			  session.setAttribute("name",NAME);
    	    
    	      sql ="SELECT * FROM Score WHERE NO IN"
    	      		+ "(SELECT NO FROM Student WHERE susername = '"+username+"')";
    	      System.out.println(sql);
    	      rs= mysql.query(sql);
    	     
    	      
    	      try {
					  while(rs.next()) {
						   int Grade = rs.getInt("Grade");
						   int CNO = rs.getInt("CNO");
					       DateDao mysql2= new DateDao();
						   sql = "Select * from Course where CNO ="+CNO;
						   
						   ResultSet rs2 = mysql2.query(sql);
						   String CNAME="";
						   try {
						   if(rs2.next()) {
						       CNAME = rs2.getString("CNAME");
						    }}catch(SQLException e) {
							   e.printStackTrace();
						   }
						  
						   
						   ScoreBean newbean = new ScoreBean(Grade,CNAME);
						   if(Grade != 0 )list.add(newbean);
						   mysql2.close();
						  
					  }
					  mysql.close();
					  
					  session.setAttribute("list", list);

					 // System.out.println(list.get(1).getCourse());
					 //System.out.println(list.get(0).getCourse());
					  RequestDispatcher rd = request.getRequestDispatcher("/grade.jsp");
					  rd.forward(request, response);
				  
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
       }
}
