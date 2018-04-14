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
import java.util.ArrayList;

@WebServlet(name="testsservlet",urlPatterns={"/newtest.do"})


public class testservlet extends HttpServlet {
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
        String Id = request.getParameter("Id");
        String Question = request.getParameter("Question");
        String Answer = request.getParameter("Answer");
        String AnswerA = request.getParameter("AnswerA");
        String AnswerB = request.getParameter("AnswerB");
        String AnswerC = request.getParameter("AnswerC");
        String AnswerD = request.getParameter("AnswerD");

        try{
            db=dataSource.getConnection();
            Statement stat=db.createStatement();
            int rs=stat.executeUpdate("insert into test(Id,Question,Answer,AnswerA,AnswerB,AnswerC,AnswerD) values ('"+Id+"','"+Question+"','"+Answer+"','"+AnswerA+"','"+AnswerB+"','"+AnswerC+"','"+AnswerD+"')");
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Question = null;
        String AnswerA = null;
        String AnswerB = null;
        String AnswerC = null;
        String AnswerD = null;
        String Id = null;


        ArrayList<testbean> testbeanlist=null;
        testbeanlist=new ArrayList<testbean>();

        try {
            db=dataSource.getConnection();
            Statement stat=db.createStatement();
            ResultSet rs=stat.executeQuery("select * from test");
            HttpSession session=request.getSession();

            while(rs.next()){
                testbean bean=new testbean();

                Id=rs.getString("Id");
                Question=rs.getString("Question");
                AnswerA=rs.getString("AnswerA");
                AnswerB=rs.getString("AnswerB");
                AnswerC=rs.getString("AnswerC");
                AnswerD=rs.getString("AnswerD");


                bean.setQuestion(Question);
                bean.setAnswerA(AnswerA);
                bean.setAnswerB(AnswerB);
                bean.setAnswerC(AnswerC);
                bean.setAnswerD(AnswerD);
                bean.setId(Id);


                testbeanlist.add(bean);
            }
            if(!testbeanlist.isEmpty())
                request.setAttribute("testbeanlist",testbeanlist);
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        RequestDispatcher ss=request.getRequestDispatcher("STtest.jsp");
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