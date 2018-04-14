import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
@WebServlet("/VariableServlet")
public class VariableServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,
                           HttpServletResponse response)
                     throws ServletException, IOException {
     request.setAttribute("attrib1", new Integer(100));
     HttpSession session = request.getSession();
	 session.setAttribute("attrib2", "Java World!");
	 ServletContext application = getServletContext();
	 application.setAttribute("attrib3",new java.util.Date());

	 request.setAttribute("attrib4", "����������");
	 session.setAttribute("attrib4", "�Ự������");
	 application.setAttribute("attrib4", "Ӧ��������");
    // ����ת����JSPҳ��
	 RequestDispatcher rd =
	              request.getRequestDispatcher("/variables.jsp");
	 rd.forward(request, response);
  }
}

