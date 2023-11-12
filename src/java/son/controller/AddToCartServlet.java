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
import son.DAO.warehouseDAO;
import son.model.Account;
import son.model.Plant;

/**
 *
 * @author pc
 */
public class AddToCartServlet extends HttpServlet {

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
            out.println("<title>Servlet AddToCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String username = account.getUsername();
        warehouseDAO warehouseDAO = new warehouseDAO();
        int idAddToCart = Integer.parseInt(request.getParameter("tree"));
        String quantity = request.getParameter("quantity");
        String role = (String) session.getAttribute("roleToRedirrect");
        String msg = null;
        String msg1 = null;
        if (quantity.equalsIgnoreCase("")) {
            msg = "Please input the quantity";
            request.setAttribute("msgErrorQuantity", msg);
        } else {
            if (!warehouseDAO.checkAvailableQuantity(idAddToCart, quantity)) {
                msg1 = "Quantity is not enough";
                request.setAttribute("msgErrorQuantityNotEnough", msg1);
            } else {
                int quantityAddToCart = Integer.parseInt(quantity);
                warehouseDAO.addPurchase(username, idAddToCart, quantityAddToCart);
                request.setAttribute("msgErrorQuantity", msg);
            }
        }
        Plant plant = warehouseDAO.getPlantByID(idAddToCart);
        request.setAttribute("plantDetail", plant);
        request.getRequestDispatcher("PageServlet").forward(request, response);
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
        Account account = (Account) session.getAttribute("account");
        String username = account.getUsername();
        warehouseDAO warehouseDAO = new warehouseDAO();
        int idAddToCart = Integer.parseInt(request.getParameter("tree"));
        String quantity = request.getParameter("quantity");
        String role = (String) session.getAttribute("roleToRedirrect");
        String msg = null;
        String msg1 = null;
        if (quantity.equalsIgnoreCase("")) {
            msg = "Please input the quantity";
            request.setAttribute("msgErrorQuantity", msg);
        } else {
            if (!warehouseDAO.checkAvailableQuantity(idAddToCart, quantity)) { //nếu quantity > trong kho thì sai
                msg1 = "Quantity is not enough";
                request.setAttribute("msgErrorQuantityNotEnough", msg1);
            } else { //nếu không lớn hơn thì add
                int quantityAddToCart = Integer.parseInt(quantity);
                warehouseDAO.addPurchase(username, idAddToCart, quantityAddToCart);
                request.setAttribute("msgErrorQuantity", msg);
            }
        }
        Plant plant = warehouseDAO.getPlantByID(idAddToCart);
        request.setAttribute("plantDetail", plant);
        request.getRequestDispatcher("TemplateShowDetail.jsp").forward(request, response);
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
