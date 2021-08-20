/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Customer;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class DAOCustomer {

    Connection conn = null;
    DBConnect dbConn = null;

    public DAOCustomer(DBConnect dbconn) {
        conn = dbconn.conn;
        this.dbConn = dbconn;
    }

    // insert, update, delete, select
    public int addCustomer(Customer cus) {
        int n = 0;
        String preSQL = "insert into Customer(cname,cphone,"
                + "cAddress,username,password,status)"
                + " values(?,?,?,?,?,?)";
        try {
            // ? has index start 1
            PreparedStatement pre = conn.prepareStatement(preSQL);
//            pre.setDataType(index of ?, value);
//            dataType is data of ?
            pre.setString(1, cus.getCname());
            pre.setString(2, cus.getCphone());
            pre.setString(3, cus.getcAddress());
            pre.setString(4, cus.getUsername());
            pre.setString(5, cus.getPassword());
            pre.setInt(6, cus.getStatus());
            // execute
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
//        String sql="insert into Customer(cname,cphone,cAddress,username,password,status)"
//                + " values('"+cus.getCname()+"','"+cus.getCphone()+
//                "','"+cus.getcAddress()+"','"+cus.getUsername()+
//                "','"+cus.getPassword()+"',"+cus.getStatus()+")";
//        try {
//            Statement state=conn.createStatement();
//            n=state.executeUpdate(sql);
//        } catch (SQLException ex) {
//            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
//        }
        return n;
    }

    public void deleteCus(String str) {

        String deleteSQL = "delete from Customer where cid='" + str + "'";
        try {
            PreparedStatement stm = conn.prepareStatement(deleteSQL);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int updateCustomer(Customer cus) {
        int n = 0;
        String sql = "update Customer set cname=?,cphone=?,"
                + "cAddress=?,username=?,password=?,status=?"
                + " where cid=? ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, cus.getCname());
            pre.setString(2, cus.getCphone());
            pre.setString(3, cus.getcAddress());
            pre.setString(4, cus.getUsername());
            pre.setString(5, cus.getPassword());
            pre.setInt(6, cus.getStatus());
            pre.setInt(7, cus.getCid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changePassword(int id, String user,
            String oldPass, String newPass) {
        int n = 0;
        // check userName is true (user, oldPass)
        String sql = "update Customer set password=? where cid=? ";

        return n;
    }

    public int changeStatus(int id, int status) {
        int n = 0;
        return n;
    }

    public boolean login(String username, String pass) {
        boolean flag = false;
        String sql = "Select * from Customer"
                + " where username='" + username + "' "
                + "and password='" + pass + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                flag = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }
    
    public ArrayList<Customer> getCustomers() {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT [cid]\n"
                    + "      ,[cname]\n"
                    + "      ,[cphone]\n"
                    + "      ,[cAddress]\n"
                    + "      ,[username]\n"
                    + "      ,[password]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[Customer]";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                c.setCphone(rs.getString("cphone"));
                c.setcAddress(rs.getString("cAddress"));
                c.setUsername(rs.getString("username"));
                c.setPassword(rs.getString("password"));
                c.setStatus(rs.getInt("status"));
                customers.add(c);

            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public ArrayList<Customer> getUserCustomers(String user) {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT [cid]\n"
                    + "      ,[cname]\n"
                    + "      ,[cphone]\n"
                    + "      ,[cAddress]\n"
                    + "      ,[username]\n"
                    + "      ,[password]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[Customer] where username = '"+user+"'";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                c.setCphone(rs.getString("cphone"));
                c.setcAddress(rs.getString("cAddress"));
                c.setUsername(rs.getString("username"));
                c.setPassword(rs.getString("password"));
                c.setStatus(rs.getInt("status"));
                customers.add(c);

            }
        } catch (SQLException ex) {
//            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public static void main(String[] args) {
        DBConnect dbconn = new DBConnect();
        DAOCustomer dao = new DAOCustomer(dbconn);
        //int n = dao.addCustomer(new Customer("Sabg", "038979", "HaiPhong", "Sanghp", "abc123@123", 2));
        //if (n > 0) {
        //   System.out.println("inserted");
        // }
        //dao.displayAllCustomer();
        ArrayList<Customer> cus = dao.getUserCustomers("admin");
        
        System.out.println();
    }

}
