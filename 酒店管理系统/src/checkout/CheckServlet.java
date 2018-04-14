package checkout;

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
import java.util.*;

@WebServlet(name = "CheckServlet",urlPatterns = "/check.do")
public class CheckServlet extends HttpServlet {
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

        HttpSession session=request.getSession();

        ArrayList<singlebean> singlebeanlist=new ArrayList<singlebean>();

        singlebeanlist=(ArrayList<singlebean>)session.getAttribute("singlebeanlist");

        if(singlebeanlist.isEmpty()){
            String message="订单为空";

            session.setAttribute("checkmessage",message);

            RequestDispatcher ss=request.getRequestDispatcher("checkout.jsp");
            ss.forward(request, response);
        }
        else {

            String Cname = (String) session.getAttribute("Cname");
            int total = (int) session.getAttribute("total") + 100;

            String Ouser_id = null;
            String Ouser_name = null;
            String Ouser_tel = null;
            String Ouser_num = null;
            String inf = null;

            int max = 9999;
            int min = 1000;
            Random random = new Random();

            int s = random.nextInt(max) % (max - min + 1) + min;

            String Oid = String.valueOf(s);



            try {
                db = dataSource.getConnection();
                stat = db.createStatement();

                ResultSet rs = stat.executeQuery("select * from visitor where Cname='" + Cname + "'");

                while (rs.next()) {
                    Ouser_id = rs.getString("Cid");
                    Ouser_name = rs.getString("Cname");
                    Ouser_tel = rs.getString("Ctel");
                    Ouser_num = rs.getString("Cnum");
                }

                String starttime=null;
                String endtime=null;

                for (int i = 0; i < singlebeanlist.size(); i++) {
                    if (inf == null) {
                        inf = "1* " + singlebeanlist.get(i).getRname() + " ";

                        starttime=singlebeanlist.get(i).getStarttime();


                        endtime=singlebeanlist.get(i).getEndtime();


                    } else {
                        inf = inf + "1* " + singlebeanlist.get(i).getRname() + " ";
                    }
                }

                rs.close();

                int r = stat.executeUpdate("insert into `order`(Oid, Ocid, Ocname, Ocnum, Octel, Oinf,Starttime,Endtime, Oprice,Ostatus) values ('" + Oid + "','" + Ouser_id + "','" + Ouser_name + "','" + Ouser_num + "','" + Ouser_tel + "','" + inf  +"','"+starttime+"','"+endtime+"','"+ total + "','待审核')");


            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    stat.close();
                    db.close();
                }catch (Exception e){

                }
            }

            ArrayList<singlebean> sl = new ArrayList<singlebean>();

            session.setAttribute("singlebeanlist", sl);
            session.setAttribute("total", 0);

            RequestDispatcher ss = request.getRequestDispatcher("checkout.jsp");
            ss.forward(request, response);
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
