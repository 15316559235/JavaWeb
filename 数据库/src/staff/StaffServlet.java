package staff;

import staff.staffbean;
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

@WebServlet(name = "StaffServlet",urlPatterns = "/staff.do")
public class StaffServlet extends HttpServlet {
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
        String Gid = null;
        String Gname=null;
        String Ggrade = null;
        String Gindetify = null;
        String branch_id=null;

        try {
            db=dataSource.getConnection();
            stat=db.createStatement();
            ResultSet rs=stat.executeQuery("select * from staff");

            ArrayList<staffbean> staffbeanArrayList=new ArrayList<staffbean>();

            while(rs.next()){
                staffbean bean=new staffbean();

                Gid=rs.getString("guide_id");
                Gname=rs.getString("guide_name");
                Gindetify=rs.getString("identify");
                Ggrade=rs.getString("ggrade");
                branch_id=rs.getString("branch_id");

                bean.setGid(Gid);
                bean.setGgrade(Ggrade);
                bean.setGidentify(Gindetify);
                bean.setGname(Gname);
                bean.setBranch_id(branch_id);

                staffbeanArrayList.add(bean);
            }

            rs.close();

            request.setAttribute("staffbeanArrayList", staffbeanArrayList);
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
        RequestDispatcher ss=request.getRequestDispatcher("staff.jsp");
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
