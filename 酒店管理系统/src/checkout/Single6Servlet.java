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

@WebServlet(name = "Single6Servlet",urlPatterns={"/single6.do"})
public class Single6Servlet extends HttpServlet {
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

        String Rname;
        String Rid;
        String Rimg;
        int Rprice;
        int Rnum;

        try {
            db=dataSource.getConnection();
            stat=db.createStatement();
            ResultSet rs=stat.executeQuery("select * from room where Rid='6' ");

            while(rs.next()){
                singlebean s=new singlebean();

                Rname=rs.getString("Rname");
                Rid=rs.getString("Rid");
                Rimg=rs.getString("Rimg");
                Rprice=rs.getInt("Rprice");
                Rnum=rs.getInt("Rnum");

                if(Rnum<=0){
                    String message="没有空房";
                    session.setAttribute("roommessage", message);

                    rs.close();
                }
                else{
                    String starttime=request.getParameter("starttime");
                    String endtime=request.getParameter("endtime");

                    String [] s1=starttime.split("/");
                    starttime=s1[2]+s1[0]+s1[1];

                    String [] s2=endtime.split("/");
                    endtime=s2[2]+s2[0]+s2[1];

                    s.setRid(Rid);
                    s.setRname(Rname);
                    s.setRimg(Rimg);
                    s.setPrice(Rprice);
                    s.setStarttime(starttime);
                    s.setEndtime(endtime);

                    int m=Integer.parseInt(endtime)-Integer.parseInt(starttime);


                    int total=(int)session.getAttribute("total");
                    total=total+s.getPrice()*m;
                    session.setAttribute("total",total);

                    singlebeanlist.add(s);

                    session.setAttribute("singlebeanlist",singlebeanlist);

                    rs.close();
                }
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
        RequestDispatcher ss=request.getRequestDispatcher("single6.jsp");
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
