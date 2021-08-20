/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOCategory {

    Connection conn = null;
    DBConnect dbConn = null;

    public DAOCategory(DBConnect dbconn) {
        conn = dbconn.conn;
        this.dbConn = dbconn;
    }

    public int addCate(Category cate) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Category]\n"
                + "           ([cateName]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, cate.getCateName());
            stm.setInt(2, cate.getStatus());

            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int UpdateCate(Category cate) {
        int n = 0;
        String sql = "UPDATE [dbo].[Category]\n"
                + "   SET [cateName] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE cateID = ?";

        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, cate.getCateName());
            stm.setInt(2, cate.getStatus());
            stm.setInt(3, cate.getCateID());
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<Category> getCategorys() {
        ArrayList<Category> categorys = new ArrayList<>();
        try {
            String sql = "SELECT [cateID]\n"
                    + "      ,[cateName]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[Category]";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCateID(rs.getInt("cateID"));
                c.setCateName(rs.getString("cateName"));
                c.setStatus(rs.getInt("status"));
                categorys.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorys;
    }

    public void deleteCate(String str) {
        String deleteSQL = "delete from Category where cateID='" + str + "'";
        try {
            PreparedStatement stm = conn.prepareStatement(deleteSQL);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DBConnect dbconn = new DBConnect();
        DAOCategory dao = new DAOCategory(dbconn);
        //int n = dao.addCate(new Category("Sanghp123", true));
        //if(n > 0){
        //   System.out.println("Inserted");
        //}
        //dao.displayAllCate();
    }
}
