/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package son.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import son.DAO.warehouseDAO;
import son.model.Account;
import son.model.Cart;

/**
 *
 * @author pc
 */
public class PurchaseServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PurchaseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PurchaseServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Cart> list = (ArrayList<Cart>) session.getAttribute("cartToShow");
        warehouseDAO dao = new warehouseDAO();
        String msg = "";
        for (Cart cart : list) {
            if (!dao.checkAvailableQuantity(cart.getId(), Integer.toString(cart.getQuantity()))) {
                msg = cart.getName() + " is not enough";
                request.setAttribute("msgErrorQuantityNotEnoughInCart" + cart.getName(), msg);
            }
        }
        if (msg.equalsIgnoreCase("")) { //nếu msg rỗng thì (không có lỗi quantity)
            request.setAttribute("msgErrorQuantityNotEnoughInCart", msg);
            for (Cart cart : list) {
                dao.deleteTheFollowingQuantity(cart); //giảm số lượng trong kho
            }
            Account account = (Account) session.getAttribute("account");
            String usernameToPurchase = account.getUsername(); //lấy ra username mua hàng
            for (Cart cart : list) {
                dao.addPurchaseToStatistic(cart, usernameToPurchase); //add đơn hàng được thanh toán vào 1 bảng lưu tất cả các đơn đã được bán
            }
            for (Cart cart : list) {
                dao.setTheQuantityTo0InCart(cart.getId(), account.getUsername()); //xóa số lượng trong giỏ sau khi mua
            }
            String customerName = request.getParameter("customerName");
            String customerAddress = request.getParameter("customerAddress");
            String customerPhone = request.getParameter("customerPhone");
            request.setAttribute("customerName", customerName);
            request.setAttribute("customerAddress", customerAddress);
            request.setAttribute("customerPhone", customerPhone);
            String contentOfMail = "<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "<head>\n"
                    + "<title>Servlet ForgetPasswordServlet</title>\n"
                    + "</head>\n"
                    + "<body>\n"
                    + "<h2 style='color: #236D5E'>Orders Confirmation</h2>\n"
                    + "__________________________________"
                    + "<br>"
                    + "<br>"
                    + "Customer's Name: " + customerName
                    + "<br>"
                    + "<br>"
                    + "Address: " + customerAddress
                    + "<br>"
                    + "<br>"
                    + "Phone: " + customerPhone
                    + "<br>"
                    + "<br>"
                    + "We'll prepare your orders and send it as soon as possible\n"
                    + "<br>"
                    + "Thanks for choosing us <3"
                    + "</tbody>"
                    + "</body>\n"
                    + "</html>\n";
            dao.sendMail(dao.getMailByUsername(account.getUsername()), "Orders Confirmation", contentOfMail);
            request.getRequestDispatcher("TemplateOrderSuccessfully.jsp").forward(request, response);
        } else { //nếu msg không rỗng thì (nếu có lỗi thì)
            request.getRequestDispatcher("TemplateViewCart.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
