/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customer;
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
import model.DAOCustomer;
import model.DBConnect;

/**
 *
 * @author Admin
 */
public class ControllerCustomter extends HttpServlet {

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
        DAOCustomer dao = new DAOCustomer(dbConn);
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAll";
            }

            if (service.equals("insertCustomer")) {
                String cname = request.getParameter("cname");
                String cphone = request.getParameter("cphone");
                String caddress = request.getParameter("cAddress");
                String user = request.getParameter("username");
                String pass = request.getParameter("password");
                int status = Integer.parseInt(request.getParameter("status"));

                Customer cus = new Customer(cname, cphone, caddress, user, pass, status);
                if (dao.addCustomer(cus) > 0) {
                    out.print("Inserted");
                }
            }

            if (service.equals("addCus")) {
                String cname = request.getParameter("cname");
                String cphone = request.getParameter("cphone");
                String caddress = request.getParameter("cAddress");
                String user = request.getParameter("username");
                String pass = request.getParameter("password");
                int status = Integer.parseInt(request.getParameter("status"));

                Customer cus = new Customer(cname, cphone, caddress, user, pass, status);
                if (dao.addCustomer(cus) > 0) {
                    out.print("Inserted");
                }
            }

            if (service.equals("delete")) {
                String cid = request.getParameter("cid");
                dao.deleteCus(cid);
                response.sendRedirect("ControllerCustomter");
            }

            if (service.equals("preUpdate")) {
                String sql = "Select * from Customer where cid= '"+request.getParameter("cid")+"' ";
                ResultSet rs = dbConn.getData(sql);
                try {
                    if(rs.next()){
                    int cid = rs.getInt("cid");
                    String cname = rs.getString(2);
                    String cphone = rs.getString(3);
                    String caddress = rs.getString(4);
                    String user = rs.getString(5);
                    String pass = rs.getString(6);
                    int status = rs.getInt(7);
                    Customer cus = new Customer(cid, cname, cphone, caddress, user, pass, status);
                    request.setAttribute("cus", cus);
                    request.setAttribute("formtitle", "update Customer");
                    request.getRequestDispatcher("updateCustomer.jsp").forward(request, response);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(ControllerCustomter.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (service.equals("update")) {
                String cname = request.getParameter("cname");
                String cphone = request.getParameter("cphone");
                String caddress = request.getParameter("cAddress");
                String user = request.getParameter("username");
                String pass = request.getParameter("password");
                int status = Integer.parseInt(request.getParameter("status"));
                int cid = Integer.parseInt(request.getParameter("cid"));

                Customer cus = new Customer(cname, cphone, caddress, user, pass, status, cid);
                if (dao.updateCustomer(cus) > 0) {
                    out.print("Updated");
                }
            }

            if (service.equalsIgnoreCase("listAll")) {
                DAOCustomer cd = new DAOCustomer(dbConn);
                ArrayList<Customer> cus = cd.getCustomers();
                request.setAttribute("cus", cus);
                request.getRequestDispatcher("listCustomer.jsp").forward(request, response);
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
