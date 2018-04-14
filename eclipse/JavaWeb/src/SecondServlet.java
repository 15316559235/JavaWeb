import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="SecondServlet",urlPatterns={"/login2.do"})
public class SecondServlet extends HttpServlet {
public void doPost(HttpServletRequest request, 
HttpServletResponse response)
                     throws ServletException, IOException {

	String sno = (String)request.getAttribute("sno");
	String name = (String)request.getAttribute("name");
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    out.println("<html><body>");
    	out.println("学号 "+sno);
    	out.println("<br>姓名 "+name);
    	out.println("<br>");
    out.println("<a href=http://localhost:8080/JavaWeb/input.jsp>返回输入页面</a>");
    out.println("</body></html>");
    }
}
