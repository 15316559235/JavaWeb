package customer;

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
import customer.customerbean;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customer.do")
public class CustomerServlet extends HttpServlet {
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
        String Cworkplace = null;
        String Cjob = null;

        try {
            db=dataSource.getConnection();
            stat=db.createStatement();
            ResultSet rs=stat.executeQuery("select * from customer");

            ArrayList<customerbean> customerbeanArrayList=new ArrayList<customerbean>();

            while(rs.next()){
                customerbean bean=new customerbean();

                Cid=rs.getString("id");
                Cname=rs.getString("name");
                Cworkplace=rs.getString("workplace");
                Cjob=rs.getString("job");

                bean.setCid(Cid);
                bean.setCname(Cname);
                bean.setCworkplace(Cworkplace);
                bean.setCjob(Cjob);

                customerbeanArrayList.add(bean);
            }

            rs.close();

            request.setAttribute("customerbeanArrayList", customerbeanArrayList);
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
        RequestDispatcher ss=request.getRequestDispatcher("customer.jsp");
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
