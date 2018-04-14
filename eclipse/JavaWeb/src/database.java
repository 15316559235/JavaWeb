import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/database")
public class database extends HttpServlet {
      /**
     * @see HttpServlet#HttpServlet()
     */
    public database() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="jdbc:mysql://localhost:3306/suchen";
		String user="root";
		String passwd="19970303";
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection(url,user,passwd);
			Statement stat=con.createStatement();
			ResultSet rs=stat.executeQuery("SELECT * FROM SCORE");
			while(rs.next()){
				//读取每个字段的值
				int NO=rs.getInt("NO");
				String CNO=rs.getString("CNO");
				int GRADE=rs.getInt("GRADE");
			
				System.out.println(NO+"  "+CNO+"  "+GRADE);
			}
		
			if(rs!=null){
				rs.close();
				rs=null;
			}
			//关闭Statement对象
			if(stat!=null){
				stat.close();
				stat=null;
			}
			//关闭Connection对象
			if(con!=null){
				con.close();
				con=null;
			}
		} catch (ClassNotFoundException e) {
			System.out.print("没有找到MySQL驱动");
		} catch (SQLException e) {
			System.out.print("连接数据库服务器出现异常");
		}
	}
}
