package user;

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

@WebServlet(name = "SigninServlet",urlPatterns={"/signin.do"})
public class SigninServlet extends HttpServlet {
    DataSource dataSource;
    Connection db=null;

    public void init() {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource)context.lookup("java:comp/env/jdbc/mysqlDS");
        }catch(NamingException ne){
            System.out.println("Exception:"+ne);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");
        String Repassword = request.getParameter("Repassword");
        String Type = request.getParameter("Type");


        HttpSession session=request.getSession();
        if (Password.equals(Repassword)) {
            try {
                db = dataSource.getConnection();
                Statement stat = db.createStatement();
                ResultSet r = stat.executeQuery("select * from user WHERE Username='" + Username + "'");
                if (r.next() == false) {
                    if (Type.equals("0")) {
                        int s = stat.executeUpdate("insert into user(Username,Password,Flag) values ('" + Username + "','" + Password + "',0)");
                        RequestDispatcher ss = request.getRequestDispatcher("Login.jsp");
                        ss.forward(request, response);
                    }
                    if (Type.equals("1")) {
                        int s = stat.executeUpdate("insert into user(Username,Password,Flag) values ('" + Username + "','" + Password + "',1)");
                        RequestDispatcher ss = request.getRequestDispatcher("Login.jsp");
                        ss.forward(request, response);
                    }
                }
                else{
                    String message="用户已存在";
                    session.setAttribute("message", message);
                    response.sendRedirect("Signin.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else {
            String message="两次密码不相同 ";
            session.setAttribute("message", message);
            response.sendRedirect("Signin.jsp");
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
