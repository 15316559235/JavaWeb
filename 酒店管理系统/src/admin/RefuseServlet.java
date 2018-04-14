package admin;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "RefuseServlet",urlPatterns = "/refuse.do")
public class RefuseServlet extends HttpServlet {
    DataSource dataSource;
    Connection db=null;
    Statement stat=null;

    public void init() {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource)context.lookup("java:comp/env/jdbc/mysqlDS");
        }catch(NamingException ne){
            System.out.println("Exception:"+ne);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session=request.getSession();

        try {
            db = dataSource.getConnection();
            stat = db.createStatement();

            String Oid = request.getParameter("Oid");

            int r = stat.executeUpdate("UPDATE `order` set Ostatus='已拒绝' WHERE Oid='" + Oid + "'");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                stat.close();
                db.close();
            }catch (Exception e){

            }
        }

        RequestDispatcher ss = request.getRequestDispatcher("task.do");
        ss.forward(request, response);
    }

    public void destroy() {
        try {
            db.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
