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
import son.model.Person;

/**
 *
 * @author pc
 */
public class SignupServlet extends HttpServlet {

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
            out.println("<title>Servlet SignupServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("TemplatePreSignUp.jsp").forward(request, response);
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
        DAO dao = new DAO();
        warehouseDAO warehouseDAO = new warehouseDAO();
        String username = request.getParameter("usernameSignUp").trim().replaceAll("\\s+", "");
        session.setAttribute("usernameLaunch", username); //set lại vào request để hiển thị lại bên jsp thông tin vừa được nhập
        request.setAttribute("usernameLaunch", username);
        String password = request.getParameter("passwordSignUp").trim().replaceAll("\\s+", "");
        session.setAttribute("passwordLaunch", password);
        request.setAttribute("passwordLaunch", password);
        String reenter = request.getParameter("reenterSignUp").trim().replaceAll("\\s+", "");
        session.setAttribute("reenterLaunch", reenter);
        request.setAttribute("reenterLaunch", reenter);
        String fullname = request.getParameter("fullnameSignUp").trim().replaceAll("\\s+", " ");
        session.setAttribute("fullnameLaunch", fullname);
        request.setAttribute("fullnameLaunch", fullname);
        String mail = request.getParameter("mailSignUp").trim().replaceAll("\\s+", " ");
        session.setAttribute("mailLaunch", mail);
        request.setAttribute("mailLaunch", mail);
//        boolean gender = Boolean.parseBoolean(request.getParameter("genderSignUp"));
        String gender = request.getParameter("genderSignUp");
        session.setAttribute("genderLaunch", gender);
        request.setAttribute("genderLaunch", gender);
        String msgErrorUsername = null;
        String msgErrorPassword = null;
        String msgErrorReenter1 = null;
        String msgErrorReenter2 = null;
        String msgErrorFullname = null;
        String msgErrorGender = null;
        String msgErrorRole = null;
        String msgDuplicate = null;
        String msgErrorMail = null;
        String msgSignupSuccessfully = null;
        //check điều kiện để cho sign up
        if (username.length() < 6 || username.length() > 20 || username.length() == 0) {
            msgErrorUsername = "Username must be 6-20 characters";
            request.setAttribute("msgErrorUsername", msgErrorUsername);
        }
        if (password.length() < 6 || password.length() > 20 || password.length() == 0) {
            msgErrorPassword = "Password must be 6-20 characters";
            request.setAttribute("msgErrorPassword", msgErrorPassword);
        }
        if (reenter.length() < 6 || reenter.length() > 20 || reenter.length() == 0) {
            msgErrorReenter1 = "Re-enter must be 6-20 characters";
            request.setAttribute("msgErrorReenter", msgErrorReenter1);
        }
        if (fullname.length() < 6 || fullname.length() > 20 || fullname.length() == 0 || !fullname.matches("^[a-zA-Z sÀ-ỹ]+$")) {
            msgErrorFullname = "Full Name must be 6-20 characters and not contain any number and special character";
            request.setAttribute("msgErrorFullname", msgErrorFullname);
        }
        if (!password.equalsIgnoreCase(reenter)) {
            msgErrorReenter2 = "Password does not match";
            request.setAttribute("msgErrorDoesNotMatch", msgErrorReenter2);
        }
        if (gender == null) {
            msgErrorGender = "Please choose one";
            request.setAttribute("msgErrorGender", msgErrorGender);
        }
        //kiểm tra username có trong database chưa
        if (dao.findUsernameToCheckDuplicate(username).equalsIgnoreCase(username)) {
            msgDuplicate = "Your username is already exist!";
            request.setAttribute("msgDuplicate", msgDuplicate);
        }
        if (warehouseDAO.checkDuplicateMail(mail)) { //nếu trùng mail thì báo lỗi
            msgErrorMail = "Your mail is already exist!";
            request.setAttribute("msgErrorMail", msgErrorMail);
        }

        if (msgDuplicate == null && msgErrorUsername == null && msgErrorPassword == null && msgErrorFullname == null && msgErrorReenter1 == null && msgErrorReenter2 == null && msgErrorGender == null && msgErrorRole == null && msgErrorMail == null) {
            //nếu không có msg nào, msg nào cũng bằng null tức là không có lỗi gì thì bắt đầu sign up
            boolean genderSignupBit;
            boolean roleSignupBit;
            if (gender.equalsIgnoreCase("male")) {
                genderSignupBit = true;
            } else {
                genderSignupBit = false;
            }
            String title = "Verify!";
            //-------- Sinh captcha
            Random random = new Random();
            StringBuilder sb = new StringBuilder(4);
            String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            for (int i = 0; i < 4; i++) {
                int randomIndex = random.nextInt(characters.length()); //lấy index của 1 phần tử bất kì trong array
                char randomChar = characters.charAt(randomIndex);   //lấy kí tự đối xứng theo index
                sb.append(randomChar); //add vào chuỗi
            }
            String content = sb.toString();
            //---------------------
            warehouseDAO.sendMail(mail, title, "Here is your captcha: " + content);
            
            session.setAttribute("captchaMail", content);
            response.sendRedirect("CaptchaServlet");
        } else { //nếu lỗi thì giữ lại ở template sign up
            request.getRequestDispatcher("TemplateSignUp.jsp").forward(request, response);
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
