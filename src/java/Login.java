import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {

    private static final String VALID_USERNAME = "Venuka";
    private static final String VALID_PASSWORD = "123";

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    if (VALID_USERNAME.equals(username) && VALID_PASSWORD.equals(password)) {
        // ✅ Store username in session so home.jsp can detect login
        request.getSession().setAttribute("username", username);

        // ✅ Redirect to home.jsp
        response.sendRedirect("home.jsp");
    } else {
        out.println("<html><head><title>Login Failed</title></head><body>");
        out.println("<h2 style='color:red;'>❌ Invalid username or password.</h2>");
        out.println("<a href='login.jsp'>🔁 Try Again</a>");
        out.println("</body></html>");
    }
}
}