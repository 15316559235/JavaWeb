import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet{
   public void doGet(HttpServletRequest request, 
                    HttpServletResponse response) 
                 throws ServletException,IOException{
	   
          Address address = new Address("abc", 
                              "def","201600");
          Employee employee = new Employee("automan", 
               "hacker@163.com","8899123",address);
         request.setAttribute("employee", employee);
         RequestDispatcher rd = 
                     request.getRequestDispatcher("/beandemo.jsp");
        rd.forward(request, response);
    }
}

