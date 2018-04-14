package front;

import admin.orderbean;

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

@WebServlet(name = "FronttaskServlet",urlPatterns = "/fronttask.do")
public class FronttaskServlet extends HttpServlet {
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
        String Oid = null;
        String Ocid = null;
        String Ocname=null;
        String Ocnum = null;
        String Octel = null;
        String Oinf = null;
        String Ostatus = null;
        int Oprice;
        String Ornum;
        String starttime=null;
        String endtime=null;

        try {
            db=dataSource.getConnection();
            stat=db.createStatement();
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
                Ostatus=rs.getString("Ostatus");
                Oprice=rs.getInt("Oprice");
                Ornum=rs.getString("Ornum");
                starttime=rs.getString("Starttime");
                endtime=rs.getString("Endtime");

                bean.setOcid(Ocid);
                bean.setOid(Oid);
                bean.setOcname(Ocname);
                bean.setOcnum(Ocnum);
                bean.setOctel(Octel);
                bean.setOinf(Oinf);
                bean.setOstatus(Ostatus);
                bean.setOprice(Oprice);
                bean.setOrnum(Ornum);
                bean.setStarttime(starttime);
                bean.setEndtime(endtime);

                orderbeanlist.add(bean);
            }

            rs.close();
            request.setAttribute("orderbeanlist", orderbeanlist);
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
        RequestDispatcher ss=request.getRequestDispatcher("fronttask.jsp");
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
