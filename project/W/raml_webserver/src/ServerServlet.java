import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(urlPatterns = {"/products"})
public class ServerServlet extends HttpServlet {
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ServletContext cntxt = this.getServletContext();
        InputStream ins = cntxt.getResourceAsStream("/products.json");
        try {
            if (ins != null) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(ins));

                String line = "";
                while ((line = reader.readLine()) != null) {
                    out.println(line);
                }
            }
        }finally {
            out.close();
        }
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}