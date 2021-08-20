/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOAdminn;
import model.DBConnect;

/**
 *
 * @author Admin
 */
public class ControllerAdmin extends HttpServlet {

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
        DAOAdminn dao = new DAOAdminn(dbConn);
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");

            if (service == null) {
                service = "listAll";
            }

            if (service.equals("insertAdmin")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                if (username == null || username == "" || password == null || password == "") {
                    out.print("pls input user and pass");
                } else {
                    Admin ad = new Admin(username, password);
                    if (dao.addAdmin(ad) > 0) {
                        out.print("Inserted");
                    }
                }
            }

            if (service.equals("addAdmin")) {
                out.println("<form action=\"ControllerAdmin\" method=\"post\">\n"
                        + "            <table border=\"1px\">");
                out.println("UserName <input type=\"text\" name=\"username\">\n"
                        + "        Password <input type=\"text\" name=\"password\">\n"
                        + "        <input type=\"submit\" value=\"insert\">\n"
                        + "                    <td><input type=\"submit\" value=\"Insert\"/></td>\n"
                        + "                    <td><input type=\"reset\"></td>\n"
                        + "                </tr>\n"
                        + "                     <input type=\"hidden\" name=\"service\" value=\"insertAdmin\" />\n"
                        + "            </table>\n"
                        + "        </form>");
            }

            if (service.equalsIgnoreCase("listAll")) {
                out.println("<table border=\"1\">\n"
                        + "            <thead>\n"
                        + "                <tr>\n"
                        + "                    <th>AdminID</th>\n"
                        + "                    <th>Username</th>\n"
                        + "                    <th>Password</th>\n"
                        + "                    <th>Delete</th>\n"
                        + "                    <th>update</th>\n"
                        + "                </tr>\n"
                        + "            </thead>\n"
                        + "            <tbody>");
                String sql = "select * from Admin";
                ResultSet rs = dbConn.getData(sql);
                while (rs.next()) {
                    out.println("<tr>\n"
                            + "                    <td>" + rs.getInt("adminID") + "</td>\n"
                            + "                    <td>" + rs.getString("username") + "</td>\n"
                            + "                    <td>" + rs.getString("password") + "</td>\n"
                            + "                    <td> <a href=\"ControllerAdmin?service=delete&adminID=" + rs.getString("adminID") + "\">delete</a></td>\n"
                            + "                    <td><a href=\"ControllerAdmin?service=preUpdate&adminID=" + rs.getString("adminID") + "\">update</a></td>\n"
                            + "                </tr>");
                }
                out.println(" </tbody>\n"
                        + "        </table>");
            }

            if (service.equals("delete")) {
                String adminID = request.getParameter("adminID");
                dao.deleteAdmin(adminID);
                response.sendRedirect("ControllerAdmin");
            }

            if (service.equals("preUpdate")) {
                String adminID = request.getParameter("adminID");
                String sql = "Select * from Admin where adminID='" + adminID + "'";
                ResultSet rs = dbConn.getData(sql);
                if (rs.next()) {
                    out.println("<form action=\"ControllerAdmin\" method=\"post\">\n"
                            + "            <table border=\"0\">");
                    out.println(" <tr>\n"
                            + "                    <td>AdminID</td>\n"
                            + "                    <td><input type=\"text\" name=\"adminID\" value=\"" + rs.getString(1) + "\" readonly/></td>\n"
                            + "                </tr>\n"
                            + "                <tr>\n"
                            + "                    <td>Username</td>\n"
                            + "                    <td><input type=\"text\" name=\"username\" value=\"" + rs.getString(2) + "\" /></td>\n"
                            + "                </tr>\n"
                            + "                <tr>\n"
                            + "                    <td>PassWord</td>\n"
                            + "                    <td><input type=\"text\" name=\"password\" value=\"" + rs.getString(3) + "\" /></td>\n"
                            + "                </tr>\n");
                    out.println(""
                            + "                        </td>\n"
                            + "                </tr>\n"
                            + "                <tr>\n"
                            + "                    <td><input type=\"submit\"  value=\"Update\" name=\"submit\" /></td>\n"
                            + "                    <td><input type=\"reset\"></td>\n"
                            + "                </tr>\n"
                            + "         <input type=\"hidden\" name=\"service\" value=\"update\" />\n"
                            + "            </table>\n"
                            + "        </form>");

                }
            }

            if (service.equals("update")) {
                int adminID = Integer.parseInt(request.getParameter("adminID"));
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                Admin admin = new Admin(username, password, adminID);
                if (dao.UpdateAdmin(admin) > 0) {
                    out.println("Updated");
                }

            }
        } catch (SQLException ex) {
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
