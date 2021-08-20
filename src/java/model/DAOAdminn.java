/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOAdminn {

    Connection conn = null;
    DBConnect dbConn = null;

    public DAOAdminn(DBConnect dbconn) {
        conn = dbconn.conn;
        this.dbConn = dbconn;
    }

    public int addAdmin(Admin ad) {
        int n = 0;
        String sql = "INSERT INTO [admin]\n"
                + "           ([username]\n"
                + "           ,[password])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, ad.getUserName());
            stm.setString(2, ad.getPassowrd());

            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdminn.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public void deleteAdmin(String str) {

        String deleteSQL = "delete from Admin where adminID='" + str + "'";
        try {
            PreparedStatement stm = conn.prepareStatement(deleteSQL);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int UpdateAdmin(Admin ad) {
        int n = 0;
        String sql = "UPDATE [dbo].[admin]\n"
                + "   SET [username] = ?\n"
                + "      ,[password] = ?\n"
                + " WHERE adminID = ?";

        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, ad.getUserName());
            stm.setString(2, ad.getPassowrd());
            stm.setInt(3, ad.getAdminID());
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
}
