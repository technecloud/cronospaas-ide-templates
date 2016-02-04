import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

// TODO
// import java.util.*;
// import raml.client.api.*;
// import raml.client.resource.products.model.*;
 
@WebServlet(urlPatterns = {"/client"})
public class ClientServlet extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
          
          // TODO
          // String baseUri = request.getRequestURL().toString();
          // ProdutosClient client = new ProdutosClient(baseUri);
  
          // out.println("BaseUri:" + baseUri + "<br/>"  );
            
          // List<ProductsGETResponse> result = client.products.get();
      
          // for(ProductsGETResponse item: result)
          //   out.println(item + "<br>");

        } finally {
            out.close();
        }
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
 
}