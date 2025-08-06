import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Sales")
public class Sales extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");
        String itemName = request.getParameter("itemName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
        double total = quantity * unitPrice;

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\BookShop\\data\\sales.txt", true))) {
            writer.write(accountNumber + "," + itemName + "," + quantity + "," + unitPrice + "," + total);
            writer.newLine();

            // POS-Style Bill Print
            out.println("<html><body style='font-family: monospace;'>");
            out.println("<h2>🧾 Bill Receipt</h2>");
            out.println("<pre>");
            out.println("--------------------------------------");
            out.println("📇 Account No : " + accountNumber);
            out.println("📦 Item       : " + itemName);
            out.println("🔢 Quantity   : " + quantity);
            out.println("💰 Unit Price : Rs. " + unitPrice);
            out.println("--------------------------------------");
            out.println("🧾 Total Bill : Rs. " + total);
            out.println("--------------------------------------");
            out.println("✅ Payment Received. Thank You!");
            out.println("</pre>");
            out.println("</body></html>");

        } catch (Exception e) {
            out.println("<h3 style='color:red;'>❌ Error: " + e.getMessage() + "</h3>");
        }
    }
}
