/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Bill;
import java.sql.Connection;
import java.sql.Date;
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
public class DAOBill {

    Connection conn = null;
    DBConnect dbConn = null;

    public DAOBill(DBConnect dbconn) {
        conn = dbconn.conn;
        this.dbConn = dbconn;
    }
    
    

    public int addBill(Bill bill) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Bill]\n"
                + "           ([oID]\n"
                + "           ,[dateCreate]\n"
                + "           ,[cname]\n"
                + "           ,[cphone]\n"
                + "           ,[cAddress]\n"
                + "           ,[total]\n"
                + "           ,[status]\n"
                + "           ,[cid])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, bill.getoID());
            stm.setDate(2, bill.getDateCreate());
            stm.setString(3, bill.getCname());
            stm.setString(4, bill.getCphone());
            stm.setString(5, bill.getcAddress());
            stm.setDouble(6, bill.getTotal());
            stm.setInt(7, bill.getStatus());
            stm.setInt(8, bill.getCid());

            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int UpdateBill(Bill bill) {
        int n = 0;
        String sql = "UPDATE [dbo].[Bill]\n"
                + "   SET \n"
                + "       [dateCreate] = ?\n"
                + "      ,[cname] = ?\n"
                + "      ,[cphone] = ?\n"
                + "      ,[cAddress] = ?\n"
                + "      ,[total] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[cid] = ?\n"
                + " WHERE oID = ?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setDate(1, bill.getDateCreate());
            stm.setString(2, bill.getCname());
            stm.setString(3, bill.getCphone());
            stm.setString(4, bill.getcAddress());
            stm.setDouble(5, bill.getTotal());
            stm.setInt(6, bill.getStatus());
            stm.setInt(7, bill.getCid());
            stm.setInt(8, bill.getoID());
            n = stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int takeOID(){
        int b = 0 ;
        try {
            String sql = "SELECT TOP 1 * FROM Bill ORDER BY oID DESC";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                b = rs.getInt("oID");
                return b;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }
    
    public ArrayList<Bill> getBills() {
        ArrayList<Bill> bills = new ArrayList<>();
        try {
            String sql = "SELECT [oID]\n"
                    + "      ,[dateCreate]\n"
                    + "      ,[cname]\n"
                    + "      ,[cphone]\n"
                    + "      ,[cAddress]\n"
                    + "      ,[total]\n"
                    + "      ,[status]\n"
                    + "      ,[cid]\n"
                    + "  FROM [dbo].[Bill]";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Bill b = new Bill();
                b.setoID(rs.getInt("oID"));
                b.setDateCreate(rs.getDate("dateCreate"));
                b.setCname(rs.getString("cname"));
                b.setCphone(rs.getString("cphone"));
                b.setcAddress(rs.getString("cAddress"));
                b.setTotal(rs.getDouble("total"));
                b.setStatus(rs.getInt("status"));
                b.setCid(rs.getInt("cid"));
                bills.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bills;
    }

    public void deleteBill(int str) {

        String deleteSQL = "delete from Bill where oID='" + str + "'";
        try {
            PreparedStatement stm = conn.prepareStatement(deleteSQL);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DBConnect dbconn = new DBConnect();
        DAOBill dao = new DAOBill(dbconn);
        //int n = dao.addBill(new Bill("Sang1", null, "mrSag", "0389794875", "HaiPhong", 20300, 2, 1));
        //if (n > 0) {
        //   System.out.println("inserted");
        //}
        //dao.displayAllBill();

    }

}
