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

@WebServlet(name = "FormServlet",urlPatterns = "/form.do")
public class FormServlet extends HttpServlet {
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String Cid = request.getParameter("Cid");
        String Cpswd = request.getParameter("Cpswd");

        HttpSession session=request.getSession();

        try {
            db=dataSource.getConnection();
            stat=db.createStatement();

            ResultSet r = stat.executeQuery("select * from visitor WHERE Cid='" + Cid + "'");

            if (r.next() == false) {
                int rs=stat.executeUpdate("insert into visitor(Cid,Cpswd,Ctype) values ('"+Cid+"','"+Cpswd+"',"+2+")");

                r.close();
            }
            else{
                String message="用户已存在";
                session.setAttribute("formmessage", message);

                r.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                stat.close();
                db.close();
            }catch (Exception e){

            }
        }
        response.sendRedirect("form.jsp");
    }

    public void destroy() {
        try {
            db.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
