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

@WebServlet(name = "FrontacceptServlet",urlPatterns = "/frontaccept.do")
public class FrontacceptServlet extends HttpServlet {
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

        try {
            db = dataSource.getConnection();
            stat = db.createStatement();

            String Oid = request.getParameter("Oid");

            ResultSet q = stat.executeQuery("select Oinf from `order` where Oid='" + Oid + "'");

            String[] strs=new String[100];

            while (q.next()){
                String inf=q.getString("Oinf");
                strs=inf.split(" ");
            }
            q.close();

            ResultSet p;
            ResultSet l;
            String Ornum=null;

            for(int i=0,len=strs.length;i<len;i=i+2){
                String Rname=strs[i+1].toString();

                p = stat.executeQuery("select Rnum from room where Rname='" + Rname + "'");

                int x = 0;
                int flag=0;

                p.next();
                x = p.getInt("Rnum") - 1;
                int f = stat.executeUpdate("UPDATE room set Rnum= " + x + " where Rname= '" + Rname + "'");
                p.close();

                l=stat.executeQuery("select Rnumber,Rflag from room_number where R_name='" + Rname + "'");

                while(l.next()){
                    flag=l.getInt("Rflag");
                    if(flag==1){
                        String Rnumber=l.getString("Rnumber");
                        if(Ornum==null){
                            Ornum=Rnumber;
                        }
                        else {
                            Ornum = Ornum + "，" + Rnumber;
                        }
                        int m = stat.executeUpdate("UPDATE room_number set Rflag= 0 where Rnumber= '" + Rnumber + "'");
                        break;
                    }
                }
                l.close();
            }

            int r = stat.executeUpdate("UPDATE `order` set Ostatus='已接收' WHERE Oid='" + Oid + "'");
            int n = stat.executeUpdate("UPDATE `order` set Ornum ='"+Ornum+"' WHERE Oid='" + Oid + "'");

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
