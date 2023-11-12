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
import son.model.Order;

/**
 *
 * @author pc
 */
public class ShowOrdersServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShowOrdersServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowOrdersServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        warehouseDAO dao = new warehouseDAO();
        ArrayList<Order> list = dao.getOrders();
        request.setAttribute("listShowOrders", list);
        request.getRequestDispatcher("TemplateShowOrders.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        warehouseDAO dao = new warehouseDAO();
        int idOrderToStatus = Integer.parseInt(request.getParameter("idOrderToStatus")); //id order
        String checkStatus = request.getParameter("checkStatus");
        int checkToShowSet = Integer.parseInt(request.getParameter("checkToShowSet")); //check xem bấm chưa
        checkToShowSet++;
        request.setAttribute("checkToShowSet", checkToShowSet);
        int status;
        if (checkStatus == null) {
            status = 0;
        } else {
            status = 1;
        }
        String name = String.valueOf(idOrderToStatus);
        HttpSession session = request.getSession();
        Account account =(Account) session.getAttribute("account");
        String accName = account.getUsername();
        dao.addSellerClick(accName, idOrderToStatus);
        session.setAttribute(name, accName);
        request.setAttribute("idOrderToStatus", idOrderToStatus);
        dao.setStatus(idOrderToStatus, status);
        ArrayList<Order> list = dao.getOrders();
        request.setAttribute("listShowOrders", list);
        request.getRequestDispatcher("TemplateShowOrders.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
