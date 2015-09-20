/ Hello.java
import java.io.*;
import javax.servlet.*;
 
public class Hello extends GenericServlet {
    public void service(ServletRequest request, ServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        final PrintWriter pw = response.getWriter();
        pw.println("Hello, world!");
        pw.close();
    }
}