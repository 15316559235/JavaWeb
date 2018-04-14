package message_board;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "DeleteServlet",urlPatterns={"/delete.do"})
public class DeleteServlet extends HttpServlet {
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
        String Name = request.getParameter("Name");

        try{
            db=dataSource.getConnection();
            Statement stat=db.createStatement();
            int rs=stat.executeUpdate("DELETE FROM message WHERE NAME ='"+Name+"'");
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
