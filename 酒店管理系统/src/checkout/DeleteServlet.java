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

@WebServlet(name = "DeleteServlet",urlPatterns = "/delete.do")
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session=request.getSession();

        ArrayList<singlebean> singlebeanlist=new ArrayList<singlebean>();
        singlebeanlist=(ArrayList<singlebean>)session.getAttribute("singlebeanlist");
        int total=(int)session.getAttribute("total");

        String Rid = request.getParameter("Rid");

        for(int i=0;i<singlebeanlist.size();i++){
            String id=singlebeanlist.get(i).getRid();

            if(id.equals(Rid)){
                total=total-singlebeanlist.get(i).getPrice();
                singlebeanlist.remove(i);
                break;
            }
        }

        session.setAttribute("singlebeanlist",singlebeanlist);
        session.setAttribute("total",total);

        RequestDispatcher ss=request.getRequestDispatcher("checkout.jsp");
        ss.forward(request, response);
    }
}
