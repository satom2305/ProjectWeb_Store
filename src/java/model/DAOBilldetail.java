/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.BillDetail;
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
public class DAOBilldetail {

    Connection conn = null;
    DBConnect dbConn = null;

    public DAOBilldetail(DBConnect dbconn) {
        conn = dbconn.conn;
        this.dbConn = dbconn;
    }

    public int addBilldetail(BillDetail billd) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[BillDetail]\n"
                + "           ([pid]\n"
                + "           ,[oID]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[total])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, billd.getPid());
            stm.setInt(2, billd.getoID());
            stm.setInt(3, billd.getQuantity());
            stm.setDouble(4, billd.getMoney());
            stm.setDouble(5, billd.getTotal());

            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBilldetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateBillDetail(BillDetail billd) {
        int n = 0;
        String sql = "UPDATE [dbo].[BillDetail]\n"
                + "   SET \n"
                + "      \n"
                + "      [quantity] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[total] = ?\n"
                + " WHERE pid = ? and oID = ?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, billd.getQuantity());
            stm.setDouble(2, billd.getMoney());
            stm.setDouble(3, billd.getTotal());
            stm.setInt(4, billd.getPid());
            stm.setInt(5, billd.getoID());

            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBilldetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<BillDetail> getBillDetails(int oID) {
        ArrayList<BillDetail> billDetails = new ArrayList<>();
        try {
            String sql = "Select Customer.cid,Customer.cname,Product.pid,Product.pname,Category.cateName,BillDetail.quantity, BillDetail.total from BillDetail\n"
                    + "inner join Bill on BillDetail.oID = Bill.oID\n"
                    + "inner join Customer on Customer.cid = Bill.cid\n"
                    + "inner join Product on Product.pid = BillDetail.pid\n"
                    + "inner join Category on Category.cateID = Product.cateID where Bill.oID = "+oID+" ";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BillDetail p = new BillDetail();
                p.setPid(rs.getInt(1));
                p.setoID(rs.getInt(2));
                p.setQuantity(rs.getInt(3));
                p.setMoney(rs.getDouble(4));
                p.setTotal(rs.getDouble(5));
                billDetails.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billDetails;
    }

    public void deleteBillDetail(String str) {

        String deleteSQL = "delete from BillDetail where pid='" + str + "'";
        try {
            PreparedStatement stm = conn.prepareStatement(deleteSQL);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DBConnect dbconn = new DBConnect();
        DAOBilldetail dao = new DAOBilldetail(dbconn);
//        int n = dao.addBilldetail(new BillDetail("pro1", "Sang1", 5237, 2313, 482));
//        if (n > 0) {
//            System.out.println("inserted");
//        }
        //dao.displayAllBilldetail();
    }
}
