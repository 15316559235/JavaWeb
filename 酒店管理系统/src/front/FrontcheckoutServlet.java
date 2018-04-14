package front;

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

@WebServlet(name = "FrontcheckoutServlet",urlPatterns = "/frontcheckout.do")
public class FrontcheckoutServlet extends HttpServlet {
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
        request.setCharacterEncoding("UTF-8");

        HttpSession session=request.getSession();

        try {
            db = dataSource.getConnection();
            stat = db.createStatement();

            String Oid = request.getParameter("Oid");

            ResultSet q = stat.executeQuery("select Ornum from `order` where Oid='" + Oid + "'");

            String[] strs=new String[100];

            while (q.next()){
                String inf=q.getString("Ornum");
                strs=inf.split("，");
            }
            q.close();

            ResultSet p;
            ResultSet l;

            for(int i=0,len=strs.length;i<len;i++){
                String Ornum=strs[i].toString();
                String R_name=null;

                p = stat.executeQuery("select R_name from room_number where Rnumber='" + Ornum + "'");

                while (p.next()){
                    R_name=p.getString("R_name");
                }

                p.close();

                int x=0;

                l=stat.executeQuery("select Rnum from room where Rname='" + R_name + "'");

                while (l.next()){
                    x=l.getInt("Rnum")+1;
                }

                l.close();

                int f = stat.executeUpdate("UPDATE room set Rnum= " + x + " where Rname= '" + R_name + "'");
                int m=stat.executeUpdate("UPDATE room_number set Rflag=1");
            }

            int r = stat.executeUpdate("UPDATE `order` set Ostatus='已退房' WHERE Oid='" + Oid + "'");
            int n = stat.executeUpdate("UPDATE `order` set Ornum = null WHERE Oid='" + Oid + "'");

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                stat.close();
                db.close();
            }catch (Exception e){

            }
        }

        RequestDispatcher ss = request.getRequestDispatcher("fronttask.do");
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
