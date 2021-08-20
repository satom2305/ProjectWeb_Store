/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author HP
 */
public class BillDetail {
    private int pid,oID;
    private int quantity;
    private double money, total;

    public BillDetail() {
    }

    public BillDetail(int pid, int oID, int quantity, double money, double total) {
        this.pid = pid;
        this.oID = oID;
        this.quantity = quantity;
        this.money = money;
        this.total = total;
    }
        

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getoID() {
        return oID;
    }

    public void setoID(int oID) {
        this.oID = oID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "BillDetail{" + "pid=" + pid + ", oID=" + oID + ", quantity=" + quantity + ", money=" + money + ", total=" + total + '}';
    }
    
    
    
}
