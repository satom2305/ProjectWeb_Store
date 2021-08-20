/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Bill;
import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOBill;
import model.DAOCustomer;
import model.DBConnect;

/**
 *
 * @author Admin
 */
public class ControllerBill extends HttpServlet {

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
        DAOBill dao = new DAOBill(dbConn);
        try (PrintWriter out = response.getWriter()) {
            // get serice
            String service = request.getParameter("service");
            //check service -- not exception
            if (service == null) {
                service = "listAll";
            }
            if(service.equals("insertBill")){
                DAOCustomer dc = new DAOCustomer(dbConn);
                ArrayList<Customer> cus = dc.getCustomers();
                request.setAttribute("cus", cus);
                request.getRequestDispatcher("InsertBill.jsp").forward(request, response);
            }
            if (service.equals("addBill")) {
                int oID = Integer.parseInt(request.getParameter("oid"));
                Date date = Date.valueOf(request.getParameter("date"));
                String cname = request.getParameter("cname");
                String cphone = request.getParameter("cphone");
                String cAddress = request.getParameter("cAddress");
                double total =  Double.parseDouble(request.getParameter("total"));
                int status = Integer.parseInt(request.getParameter("status"));
                int cid = Integer.parseInt(request.getParameter("cid"));
                DAOBill db = new DAOBill(dbConn);
                Bill bill = new Bill(oID, cname, cphone, cAddress, date, total, status, cid);
                if(db.addBill(bill) > 0){
                    response.sendRedirect("ControllerBill");
                }
            }
            
            if (service.equalsIgnoreCase("detail")) {
                int oID = Integer.parseInt(request.getParameter("oID"));
                String sql = "Select Customer.cid,Customer.cname,Product.pid,Product.pname,Category.cateName,BillDetail.quantity, BillDetail.total from BillDetail\n"
                        + "inner join Bill on BillDetail.oID = Bill.oID\n"
                        + "inner join Customer on Customer.cid = Bill.cid\n"
                        + "inner join Product on Product.pid = BillDetail.pid\n"
                        + "inner join Category on Category.cateID = Product.cateID where Bill.oID = "+oID+"";
                ResultSet rs = dbConn.getData(sql);
                request.setAttribute("rs", rs);
                RequestDispatcher dis = request.getRequestDispatcher("listBilldetail.jsp");
                dis.forward(request, response);
            }

            if (service.equalsIgnoreCase("listAll")) {
                ArrayList<Bill> bills = dao.getBills();              
                request.setAttribute("bills", bills);
                request.getRequestDispatcher("listBill.jsp").forward(request, response);
            }

            if (service.equals("delete")) {
                int oID = Integer.parseInt(request.getParameter("oID"));
                dao.deleteBill(oID);
                response.sendRedirect("ControllerBill");

            }

            if (service.equals("preUpdate")) {
                   ResultSet rs = dbConn.getData("select * from Bill where oID = '"+request.getParameter("oID")+"' ");
                   try {
                    if(rs.next()){
                        int oID = rs.getInt(1);
                        Date date = rs.getDate(2);
                        String cname = rs.getString(3);
                        String cphone = rs.getString(4);
                        String cAddress = rs.getString(5);
                        double total = rs.getDouble(6);
                        int status = rs.getInt(7);
                        int cid = rs.getInt(8);
                        Bill bill = new Bill(oID, cname, cphone, cAddress, date, total, status, cid);
                        request.setAttribute("bill", bill);
                        request.setAttribute("formtitle", "Update Bill");
                        RequestDispatcher dis = request.getRequestDispatcher("updateBill.jsp");
                        // run
                        dis.forward(request, response);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(ControllerBill.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (service.equals("update")){             
                Date date = Date.valueOf(request.getParameter("date"));
                String cname = request.getParameter("cname");
                String cphone = request.getParameter("cphone");
                String cAddress = request.getParameter("cAddress");
                double total = Double.valueOf(request.getParameter("total"));
                int status = Integer.parseInt(request.getParameter("status"));
                int cid = Integer.parseInt(request.getParameter("cid"));

                Bill bill = new Bill(date, cname, cphone, cAddress, total, status, cid, cid);
                out.println(bill);
                if (dao.UpdateBill(bill) > 0) {
                    out.print("Updated");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(ControllerProduct.class.getName()).log(Level.SEVERE, null, ex);
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
