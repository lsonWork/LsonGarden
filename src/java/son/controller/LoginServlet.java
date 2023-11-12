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
import son.DAO.DAO;
import son.DAO.warehouseDAO;
import son.model.Account;
import son.model.Plant;

/**
 *
 * @author pc
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("TemplateLogin.jsp").forward(request, response);
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
        //đoạn này lấy dữ liệu những cây có trong kho ra
        warehouseDAO warehouseDAO = new warehouseDAO();
        HttpSession session = request.getSession();
        ArrayList<Plant> listPlant = new ArrayList<>();
        listPlant = warehouseDAO.getAllPlant();
        session.setAttribute("listPlant", listPlant);
        session.setAttribute("listToShow", listPlant);
        //-------------------------------------------------
        DAO dao = new DAO();
        String username = request.getParameter("usernameLogin");
        String password = request.getParameter("passwordLogin");
        String msg = "";
        Account account = null;
        if (dao.checkLogin(username, password)) {
            account = new Account(username);
            session.setAttribute("account", account);
        } else {
            msg = "Login failed!";
            request.setAttribute("msgLoginFailed", msg);
            request.getRequestDispatcher("TemplateLogin.jsp").forward(request, response);
        }
        boolean gender = false; 
        int role;
        if (account != null) { //nếu có account
            //---------------------------------------
            gender = dao.getGenderOfMember(username); //lấy gender và role
            role = dao.getRoleOfMember(username);
            if (gender == true) {
                session.setAttribute("genderToDisplay", "(Mr) ");
            } else {
                session.setAttribute("genderToDisplay", "(Ms) ");
            }
            if (role == 1) { //nếu role true thì set roleToRedirrect = Admin vào session
                session.setAttribute("roleToRedirrect", "Admin");
            } else if (role == 0) {
                session.setAttribute("roleToRedirrect", "Member");
            } else {
                session.setAttribute("roleToRedirrect", "Seller");
            }
            String fullnameToDisplay = dao.getFullnameOfMember(username);
            session.setAttribute("fullnameToDisplay", fullnameToDisplay);
        }
//        if (role) {
        request.getRequestDispatcher("TemplateIndex.jsp").forward(request, response);
//        } else {
//            request.getRequestDispatcher("main.jsp").forward(request, response);
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
