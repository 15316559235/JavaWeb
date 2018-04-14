package Visitor;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import javax.servlet.http.HttpSession;
import  javax.sql.*;

@WebServlet(name = "SigninServlet",urlPatterns={"/signin.do"})
public class SigninServlet extends HttpServlet {
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
        String Crpswd=request.getParameter("Crpswd");
        String Cname = request.getParameter("Cname");
        String Cnum = request.getParameter("Cnum");
        String Ctel = request.getParameter("Ctel");

        HttpSession session=request.getSession();

        if (Cpswd.equals(Crpswd)) {
            try {
                db=dataSource.getConnection();
                stat=db.createStatement();

                ResultSet r = stat.executeQuery("select * from visitor WHERE Cid='" + Cid + "'");

                if (r.next() == false) {
                    int rs=stat.executeUpdate("insert into visitor(Cid,Cpswd,Cname,Cnum,Ctel,Ctype) values ('"+Cid+"','"+Cpswd+"','"+Cname+"','"+Cnum+"','"+Ctel+"',"+3+")");

                    r.close();

                    RequestDispatcher ss = request.getRequestDispatcher("login.jsp");
                    ss.forward(request, response);
                }
                else{
                    String message="用户已存在";
                    session.setAttribute("signinmessage", message);

                    r.close();

                    response.sendRedirect("register.jsp");
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
        }
        else {
            String message="两次密码不相同 ";
            session.setAttribute("signinmessage", message);
            response.sendRedirect("register.jsp");
        }
    }

    public void destroy() {
        try {
            db.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
