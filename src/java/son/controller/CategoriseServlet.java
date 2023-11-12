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
import son.model.Plant;

/**
 *
 * @author pc
 */
public class CategoriseServlet extends HttpServlet {

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
            out.println("<title>Servlet CategoriseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoriseServlet at " + request.getContextPath() + "</h1>");
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
        String categorise = request.getParameter("categorise");
        String price = request.getParameter("price");
        String sort = request.getParameter("sort");
        ArrayList<Plant> listPlant;
        warehouseDAO dao = new warehouseDAO();
        String sql = "SELECT * FROM PlantWarehouse WHERE 1=1";
        if (categorise != null && price != null && sort != null) {
            if (!categorise.equals("All")) {
                if (categorise.equals("1")) {
                    sql += "AND type = 1";
                } else if (categorise.equals("0")) {
                    sql += "AND type = 0";
                }
            }
            
            if (!price.equals("All")) {
                if (price.equals("1")) {
                    sql += "AND price >= 100000";
                } else if (price.equals("0")) {
                    sql += "AND price <= 100000";
                }
            }
            
            if (!sort.equals("None")) {
                if (sort.equals("0")) {
                    sql += " ORDER BY price ASC";
                } else if (sort.equals("1")) {
                    sql += " ORDER BY price DESC";
                }
            }
        }
        listPlant = dao.categorise(sql);
        session.setAttribute("listPlant", listPlant);
//        session.setAttribute("listP", listPlant);
        request.setAttribute("categorisePicked", categorise);
        request.setAttribute("pricePicked", price);
        request.setAttribute("sortPicked", sort);
        request.getRequestDispatcher("TemplateShop.jsp").forward(request, response);
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
