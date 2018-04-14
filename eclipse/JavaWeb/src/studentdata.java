import java.io.IOException;
import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.*;
import java.sql.*;

@WebServlet("/studentdata.do")
public class studentdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	DataSource dataSource;
	
    public void init() {
      	
     	try {
 	         Context context = new InitialContext();
 	         dataSource = (DataSource)context.lookup("java:comp/env/jdbc/mysqlDS");
     	}catch(NamingException ne){
     		System.out.println("Exception:"+ne);
     	}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      try{
	    	  Connection db=dataSource.getConnection();
	    	  Statement stat=db.createStatement();
				ResultSet rs=stat.executeQuery("SELECT * FROM SCORE");
				while(rs.next()){
					//读取每个字段的值
					int NO=rs.getInt("NO");
					String CNO=rs.getString("CNO");
					int GRADE=rs.getInt("GRADE");		
					System.out.println(NO+"  "+CNO+"  "+GRADE);
				}
	      }        
	      catch(SQLException e){
	    	  e.printStackTrace();
	      }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
