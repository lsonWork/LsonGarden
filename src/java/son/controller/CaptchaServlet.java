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
import son.DAO.DAO;
import son.DAO.warehouseDAO;

/**
 *
 * @author pc
 */
public class CaptchaServlet extends HttpServlet {

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
            out.println("<title>Servlet CaptchaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CaptchaServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("TemplateCheckMail.jsp").forward(request, response);
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
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        String username = ((String)session.getAttribute("usernameLaunch")).trim().replaceAll("\\s+", "");
        String password = ((String)session.getAttribute("passwordLaunch")).trim().replaceAll("\\s+", "");
        String fullname = ((String)session.getAttribute("fullnameLaunch")).trim().replaceAll("\\s+", " ");
        String mail = ((String)session.getAttribute("mailLaunch")).trim().replaceAll("\\s+", " ");
        String gender = ((String)session.getAttribute("genderLaunch")).trim().replaceAll("\\s+", " ");
        String captcha = request.getParameter("captcha").trim().replaceAll("\\s+", " ");
        String msgSignupSuccessfully = null;
        String captchaNotMatch = null;
        boolean genderSignupBit;
        warehouseDAO warehouseDAO = new warehouseDAO();
        
        String captchaMail = (String) session.getAttribute("captchaMail");
        if (gender.equalsIgnoreCase("male")) {
            genderSignupBit = true;
        } else {
            genderSignupBit = false;
        }
        if (captcha.equals(captchaMail)) { //nếu captcha đúng thì sign up
            dao.signup(username, password, fullname, genderSignupBit, mail);
            msgSignupSuccessfully = "You have created a new account!";
            request.setAttribute("msgSignupSuccessfully", msgSignupSuccessfully);
            request.getRequestDispatcher("TemplateLogin.jsp").forward(request, response);
        } else { //sai thì chuyển lại về template check mail
            captchaNotMatch = "Captcha is not match";
            request.setAttribute("captchaNotMatch", captchaNotMatch);
            request.getRequestDispatcher("TemplateCheckMail.jsp").forward(request, response);
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
