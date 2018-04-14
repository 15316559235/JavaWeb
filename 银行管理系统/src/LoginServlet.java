import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

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
import java.net.Socket;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "LoginServlet",urlPatterns = "/login.do")
public class LoginServlet extends HttpServlet {
    DataSource dataSource;
    Connection db=null;
    Statement stat=null;
    String Password=null;
    String Username=null;
    boolean result=false;

    public void init() {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource)context.lookup("java:comp/env/jdbc/mysqlDS");
        }catch(NamingException ne){
            System.out.println("Exception:"+ne);
        }
    }

    public void invoke() throws Exception{
        Socket socket = new Socket("localhost",8000);
        OutputStream out = socket.getOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(out);
        InputStream in = socket.getInputStream();
        ObjectInputStream ois = new ObjectInputStream(in);

        RemoteCall call = new RemoteCall("RPCServiceImpl", "login", new Class[]{String.class,String.class}, new Object[]{Username,Password});      // 向服务器发送Call 对象
        oos.writeObject(call);       //接收包含了方法执行结果的Call 对象

        call = (RemoteCall) ois.readObject();
        result=(boolean)call.getResult();
        ois.close();        oos.close();        socket.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        Username = request.getParameter("Username");
        Password = request.getParameter("Password");

        HttpSession session=request.getSession();

        session.setAttribute("dUsername",Username);
        session.setAttribute("dPassword",Password);

        try {
            invoke();
        }catch (Exception e){
            e.printStackTrace();
        }

        if(result){
            RequestDispatcher ss = request.getRequestDispatcher("userpage.jsp");
            ss.forward(request, response);
        }else{
            String message="用户名或密码错误";
            session.setAttribute("loginmessage", message);
            RequestDispatcher ss = request.getRequestDispatcher("index.jsp");
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
