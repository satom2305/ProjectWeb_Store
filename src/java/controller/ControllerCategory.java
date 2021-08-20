/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOCategory;
import model.DBConnect;

/**
 *
 * @author Admin
 */
public class ControllerCategory extends HttpServlet {

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
        DBConnect dbConn = new DBConnect();
        DAOCategory dao = new DAOCategory(dbConn);
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAll";
            }

            if (service.equals("insertCategory")) {
                String cateName = request.getParameter("catename");
                String status = request.getParameter("status");

                if (cateName == null || cateName == "") {
                    out.print("pls input Category name.");
                } else {
                    int n = Integer.parseInt(status);
                    Category cate = new Category(cateName, n);
                    if (dao.addCate(cate) > 0) {
                        out.print("Inserted");
                    }
                }
            }
                       

            if (service.equalsIgnoreCase("listAll")) {
                ArrayList<Category> categorys = dao.getCategorys();
                request.setAttribute("categorys", categorys);
                request.getRequestDispatcher("listCategory.jsp").forward(request, response);
            }

            if (service.equals("delete")) {
                String cateID = request.getParameter("cateID");
                dao.deleteCate(cateID);
                response.sendRedirect("ControllerCategory");
            }

            if (service.equals("preUpdate")) {
                String sql = "Select * from Category where cateID = "+Integer.parseInt(request.getParameter("cateID"))+"";
                ResultSet rs = dbConn.getData(sql);
                try {
                    if(rs.next()){
                    String cateName = rs.getString(2);
                    int status = rs.getInt(3);
                    Category cates = new Category(cateName, status);
                    request.setAttribute("cates", cates);
                    request.setAttribute("formtitle", "update Category");
                    RequestDispatcher dis = request.getRequestDispatcher("updateCategory.jsp");
                    dis.forward(request, response);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(ControllerCategory.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (service.equals("update")) {
                String cateName = request.getParameter("catename");
                String status = request.getParameter("status");
                int cateID = Integer.parseInt(request.getParameter("cateID"));
                if (cateName == null || cateName == "") {
                    out.print("pls input Category name.");
                } else {
                    int n = Integer.parseInt(status);
                    Category cate = new Category(cateName, n, cateID);
                    if (dao.UpdateCate(cate) > 0) {
                        out.print("Updated");
                    }
                }
            }
        } catch (Exception e) {
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
