package front;

import message_board.messagebean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet(name = "FrontmessageServlet",urlPatterns = "/frontmessage.do")
public class FrontmessageServlet extends HttpServlet {
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
        String Name = null;
        String Mail = null;
        String Subject=null;
        String Message = null;

        ArrayList<messagebean> messagebeanlist=new ArrayList<messagebean>();

        try {
            db=dataSource.getConnection();
            stat=db.createStatement();
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
        RequestDispatcher ss=request.getRequestDispatcher("frontmessage.jsp");
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
