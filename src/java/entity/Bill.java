/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author HP
 */
public class Bill {
    private int oID;
    private String cname,cphone,cAddress;
    private Date dateCreate;
    private double total;
    private int status,cid;

    @Override
    public String toString() {
        return "Bill{" + "oID=" + oID + ", cname=" + cname + ", cphone=" + cphone + ", cAddress=" + cAddress + ", dateCreate=" + dateCreate + ", total=" + total + ", status=" + status + ", cid=" + cid + '}';
    }

    public Bill() {
    }

    public Bill(int oID, String cname, String cphone, String cAddress, Date dateCreate, double total, int status, int cid) {
        this.oID = oID;
        this.cname = cname;
        this.cphone = cphone;
        this.cAddress = cAddress;
        this.dateCreate = dateCreate;
        this.total = total;
        this.status = status;
        this.cid = cid;
    }
    
    public Bill( Date dateCreate, String cname, String cphone, String cAddress, double total, int status, int cid, int oID) {
        this.oID = oID;
        this.cname = cname;
        this.cphone = cphone;
        this.cAddress = cAddress;
        this.dateCreate = dateCreate;
        this.total = total;
        this.status = status;
        this.cid = cid;
    }

    public Bill(String cname, String cphone, String cAddress, Date dateCreate, double total, int status, int cid) {
        this.cname = cname;
        this.cphone = cphone;
        this.cAddress = cAddress;
        this.dateCreate = dateCreate;
        this.total = total;
        this.status = status;
        this.cid = cid;
    }
    
    
 

    public int getoID() {
        return oID;
    }

    public void setoID(int oID) {
        this.oID = oID;
    }
  

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public String getcAddress() {
        return cAddress;
    }

    public void setcAddress(String cAddress) {
        this.cAddress = cAddress;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
    
}
