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
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import admin.orderbean;

import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "AdminServlet",urlPatterns = "/admin.do")
public class AdminServlet extends HttpServlet {
    DataSource dataSource;
    Connection db=null;
    Statement stat=null;
    Statement st=null;
    Statement m=null;

    public void init() {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource)context.lookup("java:comp/env/jdbc/mysqlDS");
        }catch(NamingException ne){
            System.out.println("Exception:"+ne);
        }
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Oid = null;
        String Ocid = null;
        String Ocname=null;
        String Ocnum = null;
        String Octel = null;
        String Oinf = null;
        String Ostatus = null;
        int Oprice;
        String Ornum;

       try {
           db=dataSource.getConnection();
           stat=db.createStatement();
           st=db.createStatement();
           m=db.createStatement();
           ResultSet rs=stat.executeQuery("select * from `order`");

           ArrayList<orderbean> orderbeanlist=new ArrayList<orderbean>();

           while(rs.next()){
               orderbean bean=new orderbean();

               Oid=rs.getString("Oid");
               Ocid=rs.getString("Ocid");
               Ocname=rs.getString("Ocname");
               Ocnum=rs.getString("Ocnum");
               Octel=rs.getString("Octel");
               Oinf=rs.getString("Oinf");
               Ornum=rs.getString("Ornum");
               Ostatus=rs.getString("Ostatus");
               Oprice=rs.getInt("Oprice");

               bean.setOcid(Ocid);
               bean.setOid(Oid);
               bean.setOcname(Ocname);
               bean.setOcnum(Ocnum);
               bean.setOctel(Octel);
               bean.setOinf(Oinf);
               bean.setOstatus(Ostatus);
               bean.setOprice(Oprice);
               bean.setOrnum(Ornum);

               orderbeanlist.add(bean);
           }

           ResultSet s=st.executeQuery("select * from message");

           int messagenum=0;

           while (s.next()){
               messagenum++;
           }

           ResultSet p=m.executeQuery("select Ctype from visitor");

           int usernum=0;

           while (p.next()){
               int i=p.getInt("Ctype");
               if(i==3)
                   usernum++;
           }

           rs.close();
           s.close();
           p.close();

           request.setAttribute("orderbeanlist", orderbeanlist);
           request.setAttribute("messagenum",messagenum);
           request.setAttribute("usernum",usernum);

       }
       catch(SQLException e){
           e.printStackTrace();
       }finally {
           try {
               stat.close();
               st.close();
               m.close();
               db.close();
           }catch (Exception e){

           }
       }

       RequestDispatcher ss=request.getRequestDispatcher("admin.jsp");
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
