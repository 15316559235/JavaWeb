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

@WebServlet(name = "LoginServlet",urlPatterns={"/login.do"})
public class LoginServlet extends HttpServlet {
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");
        String rightPassword=null;
        String s=null;
        int Flag=-1;
        HttpSession session=request.getSession();

        try {
            db=dataSource.getConnection();
            Statement stat=db.createStatement();
            ResultSet rs=stat.executeQuery("select * from user WHERE Username='"+Username+"'");

            while(rs.next()){
                rightPassword=rs.getString("Password");
                Flag=rs.getInt("Flag");
            }

            if(rightPassword==null) {
                String message = "用户名或密码不正确 ";
                session.setAttribute("message", message);
                RequestDispatcher ss = request.getRequestDispatcher("Login.jsp");
                ss.forward(request, response);
            }

            if(rightPassword.equals(Password)) {
                if(Flag==1) {
                    session.setAttribute("username",Username);
                    response.sendRedirect("Student.html");
                }
                if(Flag==0){
                    response.sendRedirect("Teacher.html");
                }
            }
            else {
                String message="用户名或密码不正确 ";
                session.setAttribute("message", message);
                response.sendRedirect("Login.jsp");
            }
        }
        catch(SQLException e){
            e.printStackTrace();
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
