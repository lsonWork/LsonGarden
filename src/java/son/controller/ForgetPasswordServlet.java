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
import java.util.Random;
import son.DAO.warehouseDAO;

/**
 *
 * @author pc
 */
public class ForgetPasswordServlet extends HttpServlet {

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
            out.println("<title>Servlet ForgetPasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgetPasswordServlet at " + request.getContextPath() + "</h1>");
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
        String captchaInputToCheck = request.getParameter("captchaInputToCheck"); //captcha mình nhập
        HttpSession session = request.getSession();
        String msg = "";
        String captchaForget = (String) session.getAttribute("captchaForget"); //captcha gốc
        if (captchaInputToCheck.equals(captchaForget)) {
            request.getRequestDispatcher("TemplateSetNewPassword.jsp").forward(request, response);
        } else {
            msg = "Your captcha is not match";
            request.setAttribute("msgErrorCaptcha", msg);
            request.getRequestDispatcher("TemplateEnterCaptcha.jsp").forward(request, response);
        }
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
        String usernameToGetPassword = request.getParameter("usernameToGetPassword");
        HttpSession session = request.getSession();
        session.setAttribute("usernameToGetPassword", usernameToGetPassword);
        warehouseDAO dao = new warehouseDAO();
        String msg = "";
        String getMail = dao.getMailByUsername(usernameToGetPassword);
        if (getMail == null) {
            msg = "Your username is incorrect";
            request.setAttribute("msgEnterUsername", msg);
            request.getRequestDispatcher("TemplateForgetPassword.jsp").forward(request, response);
        } else {
            Random random = new Random();
            StringBuilder sb = new StringBuilder(4);
            String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            for (int i = 0; i < 4; i++) {
                int randomIndex = random.nextInt(characters.length());
                char randomChar = characters.charAt(randomIndex);
                sb.append(randomChar);
            }
            String content = sb.toString();
            session.setAttribute("captchaForget", content); //captcha gốc
            dao.sendMail(getMail, "Forget Password!", "Here is your captcha: " + content);
            request.getRequestDispatcher("TemplateEnterCaptcha.jsp").forward(request, response);
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
