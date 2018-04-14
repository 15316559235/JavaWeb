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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet(name = "AlluserServlet",urlPatterns = "/alluser.do")
public class AlluserServlet extends HttpServlet {
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
        String Cid = null;
        String Cname=null;
        String Cnum = null;
        String Ctel = null;
        int Ctype=0;

        try {
            db=dataSource.getConnection();
            stat=db.createStatement();
            ResultSet rs=stat.executeQuery("select * from visitor");

            ArrayList<Userbean> Userbeanlist=new ArrayList<Userbean>();

            while(rs.next()){
                Userbean bean=new Userbean();

                Cid=rs.getString("Cid");
                Cname=rs.getString("Cname");
                Cnum=rs.getString("Cnum");
                Ctel=rs.getString("Ctel");
                Ctype=rs.getInt("Ctype");

                bean.setCid(Cid);
                bean.setCname(Cname);
                bean.setCnum(Cnum);
                bean.setCtel(Ctel);
                if(Ctype==1){
                    bean.setCtype("管理员");
                }
                if(Ctype==2){
                    bean.setCtype("前台工作人员");
                }
                if(Ctype==3){
                    bean.setCtype("用户");
                }

                Userbeanlist.add(bean);
            }

            rs.close();

            request.setAttribute("Userbeanlist", Userbeanlist);
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
        RequestDispatcher ss=request.getRequestDispatcher("alluser.jsp");
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
