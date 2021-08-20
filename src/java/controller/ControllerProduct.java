/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Bill;
import entity.BillDetail;
import entity.Category;
import entity.Customer;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOBill;
import model.DAOBilldetail;
import model.DAOCategory;
import model.DAOCustomer;
import model.DAOProduct;
import model.DBConnect;

/**
 *
 * @author Admin
 */
public class ControllerProduct extends HttpServlet {

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
        DAOProduct dao = new DAOProduct(dbConn);

        try (PrintWriter out = response.getWriter()) {
            // get serice
            String service = request.getParameter("service");
            //check service -- not exception
            if (service == null) {
                service = "listAll";
            }

            if (service.equals("listProAdmin")) {
                ArrayList<Product> products = dao.getProduct();
                out.println(products);

                DAOCategory cd = new DAOCategory(dbConn);
                ArrayList<Category> cates = cd.getCategorys();
                request.setAttribute("cates", cates);
                out.println(cates);

                request.setAttribute("cates", cates);

                request.setAttribute("products", products);
                request.getRequestDispatcher("listProduct.jsp").forward(request, response);
            }

            if (service.equals("insertProduct")) {
                DAOCategory cd = new DAOCategory(dbConn);
                ArrayList<Category> cates = cd.getCategorys();
                request.setAttribute("cates", cates);
                response.sendRedirect("index.jsp");
            }

            if (service.equals("search")) {
                String cid = request.getParameter("cid");
                //ArrayList<Product> products = dao.displayforCate(cid);
                //request.setAttribute("products", products);
                response.sendRedirect("index.jsp");
            }

            if (service.equals("addProduct")) {
                String pid = request.getParameter("pid");
                String pname = request.getParameter("pname");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                Double price = Double.valueOf(request.getParameter("price"));
                String image = request.getParameter("image");
                String des = request.getParameter("des");
                int status = Integer.parseInt(request.getParameter("status"));
                int cateid = Integer.parseInt(request.getParameter("cateID"));
                DAOProduct dc = new DAOProduct(dbConn);
                Product pro = new Product(pid, pname, quantity, price, image, des, status, cateid);
                if (dc.addProduct(pro) > 0) {
                    response.sendRedirect("listProduct.jsp");
                }
            }

            if (service.equalsIgnoreCase("listAll")) {
                ArrayList<Product> products = dao.getProduct();

                DAOCategory cd = new DAOCategory(dbConn);
                ArrayList<Category> cates = cd.getCategorys();
                request.setAttribute("cates", cates);
                out.println(cates);

                request.setAttribute("cates", cates);

                request.setAttribute("products", products);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            if (service.equals("delete")) {
                String pid = request.getParameter("pid");
                dao.deleteProduct(pid);
                response.sendRedirect("ControllerProduct?service=listProAdmin");
            }

            if (service.equals("preUpdate")) {
                //get submit-- check
                //model

                ResultSet rs = dbConn.getData("select * from Product where pid = '" + request.getParameter("pid") + "'");
                try {
                    if (rs.next()) {
                        String pid = rs.getString(1);//rs.getInt(2);
                        String pname = rs.getString(2);//rs.getString("cname");
                        int quantity = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        String image = rs.getString(5);
                        String descriptiom = rs.getString(6);
                        int status = rs.getInt(7);
                        int cateID = rs.getInt(8);
                        Product pro = new Product(pid, pname, quantity, price, image, descriptiom, status, cateID);
                        // set data
                        request.setAttribute("pro", pro);
                        request.setAttribute("formtitle", "Update Product");
                        // call view
                        RequestDispatcher dis = request.getRequestDispatcher("updateProduct.jsp");
                        // run
                        dis.forward(request, response);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(ControllerProduct.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (service.equals("update")) {
                String pid = request.getParameter("pid");
                String pname = request.getParameter("pname");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                double price = Double.valueOf(request.getParameter("Price"));
                String image = request.getParameter("image");
                String des = request.getParameter("description");
                int status = Integer.parseInt(request.getParameter("status"));
                int cateid = Integer.parseInt(request.getParameter("cateID"));

                Product pro = new Product(pname, quantity, price, image, des, status, cateid, pid);
                dao.updateProduct(pro);
                response.sendRedirect("ControllerProduct?service=listProAdmin");
            }

            if (service.equals("add2Cart")) {
                String productID = request.getParameter("pid");
                String sql = "select * from Product where pid = '" + productID + "'";
                ResultSet rs = dbConn.getData(sql);
                if (rs.next()) {
                    Product product = new Product(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
                    HttpSession session = request.getSession();
                    Product p = (Product) session.getAttribute(productID);
                    if (p == null) {
                        product.setQuantity(1);
                        session.setAttribute(productID, product);
                    } else {
                        Product pro = (Product) session.getAttribute(productID);
                        int count = pro.getQuantity();
                        product.setQuantity(count + 1);
                        session.setAttribute(productID, product);
                    }
                    //request.setAttribute("title", "them thanh cong " + product.getPname() + " with pid = " + product.getPid() + " to Cart shopping!");
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                }
            }

            if (service.equals("checkout")) {
                HttpSession session = request.getSession();
                DAOBill db = new DAOBill(dbConn);
                int oID = db.takeOID() + 1;
                Date date = Date.valueOf(request.getParameter("date"));
                String cname = request.getParameter("cname");
                String cphone = request.getParameter("cphone");
                String caddress = request.getParameter("cAddress");
                int status = Integer.parseInt(request.getParameter("status"));

                //String user = session.getAttribute("user").toString();
                //String pass = session.getAttribute("pass").toString();
                //DAOCustomer dbcus = new DAOCustomer(dbConn);
                //List<Customer> UserCus = dbcus.getUserCustomers(user);
                //if (UserCus.isEmpty()) {
                // Customer cus = new Customer(cname, cphone, caddress, user, pass, status);
                //if (dbcus.addCustomer(cus) > 0) {
                double total = Double.parseDouble(request.getParameter("total"));
                int cid = Integer.parseInt(request.getParameter("cid"));
                Bill bi = new Bill(oID, cname, cphone, caddress, date, total, status, cid);

                java.util.Enumeration em = session.getAttributeNames();
                if (db.addBill(bi) > 0) {
                    while (em.hasMoreElements()) {
                        String productID = em.nextElement().toString();
                        if (session.getAttribute(productID) != null && session.getAttribute(productID) != session.getAttribute("user") && session.getAttribute(productID) != session.getAttribute("role")) {
                            Product pro = (Product) session.getAttribute(productID);
                            int pid = Integer.parseInt(pro.getPid());
                            int quantity = pro.getQuantity();
                            double price = pro.getPrice();
                            BillDetail bill = new BillDetail(pid, oID, quantity, price, total);
                            DAOBilldetail dbc = new DAOBilldetail(dbConn);
                            dbc.addBilldetail(bill);
                            session.removeAttribute(productID);
                        }
                    }
                }
                out.print("Thanks you for shopping !");
                //}
                //}else{

                //}
            }

            if (service.equals(
                    "remove")) {
                String id = request.getParameter("di");
                HttpSession sesssion = request.getSession();
                sesssion.removeAttribute(id);
                RequestDispatcher dis = request.getRequestDispatcher("cart.jsp");
                dis.forward(request, response);
            }

            if (service.equals(
                    "updateCart")) {
                HttpSession session = request.getSession();
                java.util.Enumeration em = session.getAttributeNames();
                while (em.hasMoreElements()) {
                    String productID = em.nextElement().toString();
                    if (session.getAttribute(productID) != null && session.getAttribute(productID) != session.getAttribute("user") && session.getAttribute(productID) != session.getAttribute("role")) {
                        Product proItems = (Product) session.getAttribute(productID);
                        String[] quantity = request.getParameterValues("quantity");
                        for (int i = 0; i < 100; i++) {

                        }
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ControllerProduct.class
                    .getName()).log(Level.SEVERE, null, ex);
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
