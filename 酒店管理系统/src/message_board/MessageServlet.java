package message_board;

import checkout.singlebean;

import java.io.IOException;
import javax.naming.Context;
        import javax.naming.InitialContext;
        import javax.naming.NamingException;
        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import javax.servlet.RequestDispatcher;
        import javax.sql.DataSource;
        import java.sql.*;
        import java.util.ArrayList;

@WebServlet(name="messageservlet",urlPatterns={"/message.do"})


public class MessageServlet extends HttpServlet {
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

        String Name = request.getParameter("Name");
        String Mail = request.getParameter("Mail");
        String Subject=request.getParameter("Subject");
        String Message = request.getParameter("Message");

        try {
            db=dataSource.getConnection();
            stat=db.createStatement();
            int rs=stat.executeUpdate("insert into message(Name,Mail,Subject,Message) values ('"+Name+"','"+Mail+"','"+Subject+"','"+Message+"')");

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
        RequestDispatcher ss=request.getRequestDispatcher("contact.jsp");
        ss.forward(request, response);
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Name = null;
        String Mail = null;
        String Subject=null;
        String Message = null;

       ArrayList<messagebean> messagebeanlist=new ArrayList<messagebean>();

        try {
            db=dataSource.getConnection();
            Statement stat=db.createStatement();
            ResultSet rs=stat.executeQuery("select * from message");

            while(rs.next()){
                messagebean bean=new messagebean();

                Name=rs.getString("Name");
                Mail=rs.getString("Mail");
                Subject=rs.getString("Subject");
                Message=rs.getString("Message");

                bean.setName(Name);
                bean.setMail(Mail);
                bean.setSubject(Subject);
                bean.setMessage(Message);

                messagebeanlist.add(bean);
            }
            if(!messagebeanlist.isEmpty()) {
                request.setAttribute("messagebeanlist", messagebeanlist);
                rs.close();
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
       RequestDispatcher ss=request.getRequestDispatcher("message.jsp");
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

