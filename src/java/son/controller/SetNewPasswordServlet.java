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

/**
 *
 * @author pc
 */
public class SetNewPasswordServlet extends HttpServlet {

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
            out.println("<title>Servlet SetNewPasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SetNewPasswordServlet at " + request.getContextPath() + "</h1>");
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
        String newPassword = request.getParameter("newPassword");
        String username = (String) session.getAttribute("usernameToGetPassword");
        warehouseDAO dao = new warehouseDAO();
        String msg = "";
        String newReEnterPassword = request.getParameter("newReEnterPassword");
        String msgNewPassword = "";
        String msgReEnterNewPassword = "";
        if (newPassword.length() < 6 || newPassword.length() > 20 || newPassword.length() == 0) {
            msgNewPassword = "Password must be 6-20 characters";
            request.setAttribute("msgNewPassword", msgNewPassword);
        }
        if (newReEnterPassword.length() < 6 || newReEnterPassword.length() > 20 || newReEnterPassword.length() == 0) {
            msgReEnterNewPassword = "Re-enter password must be 6-20 characters";
            request.setAttribute("msgReEnterNewPassword", msgReEnterNewPassword);
        }
        if (msgNewPassword.equalsIgnoreCase("") && msgReEnterNewPassword.equalsIgnoreCase("")) {
            if (newPassword.equals(newReEnterPassword)) {   //nếu 2 pass khớp thì set pass mới và chuyển về login
                msg = "Set new password successfully!";
                dao.setNewPassword(newPassword, username);
                request.setAttribute("msgErrorMatchPassword", msg);
                request.getRequestDispatcher("TemplateLogin.jsp").forward(request, response);
            } else { //nếu không khớp thì quay lại trang đấy và hiển thị lỗi
                msg = "Password does not match";
                request.setAttribute("msgErrorMatchPassword", msg);
                request.getRequestDispatcher("TemplateSetNewPassword.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("TemplateSetNewPassword.jsp").forward(request, response);
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
