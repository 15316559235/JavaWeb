package test;

import java.io.IOException;
import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.sql.*;
import java.sql.*;
import test.testbean;

@WebServlet(name="testscheck",urlPatterns={"/testcheck.do"})

public class checkServlet extends HttpServlet {
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
        HttpSession session=request.getSession();

        String Answer = request.getParameter("Answer");
        String Id = request.getParameter("Id");
        String rightAnswer = null;

        try{
            db=dataSource.getConnection();
            Statement stat=db.createStatement();
            ResultSet rs=stat.executeQuery("select Answer from test where Id = '"+Id+"'");
            while(rs.next()) {
                rightAnswer = rs.getString("Answer");
            }

            if(Answer.equals(rightAnswer)) {
                String message="正确";
                session.setAttribute("message", message);
                response.sendRedirect("newtest.do");
            }
            else {
                String message="错误";
                session.setAttribute("message", message);
                response.sendRedirect("newtest.do");
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
}