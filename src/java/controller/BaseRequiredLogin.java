/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entity.Account;

/**
 *
 * @author Admin
 */
public abstract class BaseRequiredLogin extends HttpServlet {


    private boolean isAllowedAccess(HttpServletRequest request){
        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("account");
        Account user = (Account) session.getAttribute("user");
        return account != null;       
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(isAllowedAccess(request))
            processGet(request, response);
        else
            request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;
    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(isAllowedAccess(request))
            processPost(request, response);
        else
            request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
