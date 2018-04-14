package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;
import javax.servlet.http.*;

@WebFilter(filterName = "LoginFilter",
        urlPatterns = {"/single1.do","/single2.do","/single3.do","/single4.do","/single5.do","/single6.do","/single7.do","/single8.do","/checkout.jsp"},
        initParams = {
                   @WebInitParam(name = "encoding",value = "UTF-8"),
                   @WebInitParam(name = "loginPage",value = "login.jsp")
        })
public class LoginFilter implements Filter {
    private FilterConfig config;

    public void destroy() {
        this.config=null;
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        String encoding=config.getInitParameter("encoding");
        String loginPage=config.getInitParameter("loginPage");

        request.setCharacterEncoding(encoding);
        HttpServletRequest hrequest=(HttpServletRequest)request;
        HttpSession session=hrequest.getSession(true);

        String requestPath=hrequest.getServletPath();

        if(session.getAttribute("Cname")==null&&!requestPath.endsWith(loginPage)){
            request.setAttribute("filtermessage","请先登录");
            request.getRequestDispatcher(loginPage).forward(request,response);
        }
        else {
            chain.doFilter(request,response);
        }
    }

    public void init(FilterConfig config) throws ServletException {
        this.config=config;
    }

}
