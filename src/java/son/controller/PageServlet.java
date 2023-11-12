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
public class PageServlet extends HttpServlet {

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
        warehouseDAO dao = new warehouseDAO();
        HttpSession session = request.getSession();
        //lấy các tiêu chí để filter về
        String categorise = request.getParameter("categorise");
        String price = request.getParameter("price");
        String sort = request.getParameter("sort");
        String searchValueByName = request.getParameter("searchValueByName");
        String sql = "SELECT * FROM PlantWarehouse WHERE quantity > 0"; //câu này in ra hết sp trong DB có quantity > 0
        int check = 0;
        if (categorise == null) {
            categorise = "All";
        }
        if (price == null) {
            price = "All";
        }
        if (sort == null) {
            sort = "None";
        }

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
            check++;
            if (sort.equals("0")) {
                sql += " ORDER BY price ASC";
            } else if (sort.equals("1")) {
                sql += " ORDER BY price DESC";
            }
        }
        String indexPage = request.getParameter("index");
        if (searchValueByName != null) {
            if (!searchValueByName.equals("")) {
                sql += " AND name LIKE N'%" + searchValueByName + "%'";
                request.setAttribute("searchValueByName", searchValueByName);
            }
        }
        //phân trang
        int total = dao.getTotalOfProducts(sql); //tổng số sp trong cái list mà nó sẽ xét, nếu full thì nhiều, nếu đã lọc thì ít hơn
        int endPage = total / 12;   //sp cuối của 1 page
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        if (index < 1) { //dùng ép condition previous và next
            index = 1;
        }
        if (total % 12 != 0) {
            endPage++;
        }
        if (index > endPage) {
            index = endPage;
        }
        ArrayList<Plant> list;
        if (check == 0) {
            list = dao.pagingPlant(index, sql);
        } else {
            list = dao.pagingPlantForSort(index, sql);
        }
        request.setAttribute("total", total);
        request.setAttribute("index", index);
        request.setAttribute("endP", endPage);
        //ghép hết các tiêu chí, nếu không có gì thì tức là in hết
        //list này là list đã được paging
        request.setAttribute("listP", list); //set list được paging vào request
//        session.setAttribute("listPlant", listPlant);
//        session.setAttribute("listP", listPlant);
        request.setAttribute("categorisePicked", categorise);
        request.setAttribute("pricePicked", price);
        request.setAttribute("sortPicked", sort);

        request.getRequestDispatcher("TemplateShop.jsp").forward(request, response);
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
        processRequest(request, response);
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
