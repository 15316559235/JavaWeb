package Visitor;

import checkout.singlebean;

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
import java.util.ArrayList;

@WebServlet(name = "LoginServlet",urlPatterns={"/login.do"})
public class LoginServlet extends HttpServlet {
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
        String name=null;
        int Ctype=0;
        int total=0;

        ArrayList<singlebean> singlebeanlist=new ArrayList<singlebean>();

        HttpSession session=request.getSession();

        try {
            db=dataSource.getConnection();
            stat=db.createStatement();

            ResultSet rs=stat.executeQuery("SELECT Cpswd,Cname,Ctype FROM visitor WHERE Cid ='"+Cid+"'");

            String dCpswd=null;

            while (rs.next()){
                dCpswd=rs.getString("Cpswd");
                name=rs.getString("Cname");
                Ctype=rs.getInt("Ctype");
            }

            if(dCpswd==null) {
                String message = "用户名或密码不正确 ";
                session.setAttribute("loginmessage", message);

                RequestDispatcher ss = request.getRequestDispatcher("login.jsp");
                ss.forward(request, response);
            }
            rs.close();

            if(Cpswd.equals(dCpswd)){
                if(Ctype==1){
                    response.sendRedirect("admin.do");
                }
                if(Ctype==2){
                    response.sendRedirect("front.do");
                }
                if(Ctype==3) {
                    session.setAttribute("singlebeanlist",singlebeanlist);
                    session.setAttribute("total",total);
                    session.setAttribute("Cname", name);

                    response.sendRedirect("index.jsp");
                }
            }
            else {
                String message="用户名或密码不正确 ";
                session.setAttribute("loginmessage", message);

                response.sendRedirect("login.jsp");
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }finally {
            try {
                stat.close();
                db.close();
            }catch (Exception e){

            }
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
