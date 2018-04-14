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
import java.io.*;
import java.net.Socket;
import java.sql.Connection;
import java.sql.Statement;

@WebServlet(name = "SaveServlet",urlPatterns = "/save.do")
public class SaveServlet extends HttpServlet {
    DataSource dataSource;
    Connection db=null;
    Statement stat=null;
    String Password=null;
    String money=null;
    int Money;
    boolean result=false;

    String dUsername=null;
    String dPassword=null;

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

        RemoteCall call = new RemoteCall("RPCServiceImpl", "save", new Class[]{int.class,String.class,String.class,String.class}, new Object[]{Money,Password,dUsername,dPassword});      // 向服务器发送Call 对象
        oos.writeObject(call);       //接收包含了方法执行结果的Call 对象

        call = (RemoteCall) ois.readObject();
        result=(boolean)call.getResult();
        ois.close();        oos.close();        socket.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        money = request.getParameter("Money");
        Money=Integer.parseInt(money);
        Password = request.getParameter("Password");

        HttpSession session=request.getSession();

        dUsername=(String) session.getAttribute("dUsername");
        dPassword=(String) session.getAttribute("dPassword");

        try {
            invoke();
        }catch (Exception e){
            e.printStackTrace();
        }


        if(result){
            RequestDispatcher ss = request.getRequestDispatcher("userpage.jsp");
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
