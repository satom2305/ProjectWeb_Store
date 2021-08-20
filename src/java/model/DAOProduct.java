/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOProduct {

    Connection conn ;
    DBConnect dbConn ;

    public DAOProduct(DBConnect dbconn) {
        conn = dbconn.conn;
        this.dbConn = dbconn;
    }

    public int addProduct(Product pro) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([pid]\n"
                + "           ,[pname]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[image]\n"
                + "           ,[description]\n"
                + "           ,[status]\n"
                + "           ,[cateID])\n"
                + "     VALUES"
                + "           (?"
                + "           ,?"
                + "           ,?"
                + "           ,?"
                + "           ,?"
                + "           ,?"
                + "           ,?"
                + "           ,?)";

        PreparedStatement stm;
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, pro.getPid());
            stm.setString(2, pro.getPname());
            stm.setInt(3, pro.getQuantity());
            stm.setDouble(4, pro.getPrice());
            stm.setString(5, pro.getImage());
            stm.setString(6, pro.getDescription());
            stm.setInt(7, pro.getStatus());
            stm.setInt(8, pro.getCateID());

            n = stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public void displayforCate(String name){
        String sql = "select * from Product where cateID = '"+name+"'";
        
        try {
            Statement state;
            state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String pid= rs.getString(1);//rs.getInt(2);
                String pname= rs.getString(2);//rs.getString("cname");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String image = rs.getString(5);
                String descriptiom =rs.getString(6);
                int status = rs.getInt(7);
                int cateID = rs.getInt(8);
                Product pro=new Product(pid, pname, quantity, price, image, descriptiom, status, cateID);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
    
    public void displayAllProduct() {
        String sql = "select * from Product";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String pid= rs.getString(1);//rs.getInt(2);
                String pname= rs.getString(2);//rs.getString("cname");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String image = rs.getString(5);
                String descriptiom =rs.getString(6);
                int status = rs.getInt(7);
                int cateID = rs.getInt(8);
                Product pro=new Product(pid, pname, quantity, price, image, descriptiom, status, cateID);
                System.out.println(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProduct(Product p) {
        String sql = "UPDATE product set pname='" + p.getPname()+ "' , quantity='" + p.getQuantity()+ "' , price='" + p.getPrice()+ "' , image='" + p.getImage()+ "' , description='" + p.getDescription()+ "' , status ='" + p.getStatus()+ "' where pid='" + p.getPid()+ "'";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }    
    }

    public ArrayList<Product> getProduct() {
        ArrayList<Product> products = new ArrayList<>();       
        try {
            String sql = "SELECT [pid]\n"
                    + "      ,[pname]\n"
                    + "      ,[quantity]\n"
                    + "      ,[price]\n"
                    + "      ,[image]\n"
                    + "      ,[description]\n"
                    + "      ,[status]\n"
                    + "      ,[cateID]\n"
                    + "  FROM [dbo].[Product]";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getString("pid"));
                p.setPname(rs.getString("pname"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setImage(rs.getString("image"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setCateID(rs.getInt("cateID"));
                products.add(p);
            }
           
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public void deleteProduct(String str) {

        String deleteSQL = "delete from Product where pid='" + str + "'";
        try {
            PreparedStatement stm = conn.prepareStatement(deleteSQL);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DBConnect dbconn = new DBConnect();
        DAOProduct dao = new DAOProduct(dbconn);
//        int n = dao.addProduct(new Product("pro1", "San Pham 1", 120 , 150.4, "anh doi giay", "san pham nhua", true, 1));
//        if (n > 0) {
//            System.out.println("inserted");
//        }
        //  dao.displayAllProduct();
        dao.displayAllProduct();
    }
}
