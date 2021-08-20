/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOAccount {

    Connection conn = null;
    DBConnect dbConn = null;

    public DAOAccount(DBConnect dbconn) {
        conn = dbconn.conn;
        this.dbConn = dbconn;
    }

    public Account getAccountByUaP(String user, String pass) {
        try {
            String sql = "SELECT [username],[role] FROM admin WHERE [username] = ? AND password = ? ";

            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();               
                account.setUser(rs.getString("username"));
                account.setRole(rs.getInt("role"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insert(Account acc) {
        try {
            String sql = "INSERT INTO [dbo].[admin]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[role])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?,\n"
                    + "            0)";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, acc.getUser());
            stm.setString(2, acc.getPass());
            
            stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
