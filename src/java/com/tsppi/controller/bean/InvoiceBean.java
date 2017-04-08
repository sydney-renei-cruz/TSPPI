/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.bean;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author cruzsyd
 */
public class InvoiceBean extends AccountBean implements Serializable{
    protected int invoice_id;
    protected int pm_id;
    protected String payment_method;
    protected String invoice_status;
    protected float total_amount;
    protected Date invoice_date;
    
    public InvoiceBean(){
       invoice_id = 0;
       client_id = 0;
       pm_id = 0;
       payment_method = "";
       invoice_status = "";
       total_amount = 0;
       invoice_date = new Date();
    }
    public InvoiceBean(int ii, int ci, int pi, String pm, String is, float ta, Date id){
        invoice_id = ii;
        client_id = ci;
        pm_id = pi;
        payment_method = pm;
        invoice_status = is;
        total_amount = ta;
        invoice_date = id;
    }
    public void setInvoiceID(int ii){
        invoice_id = ii;
    }
    public void setClientID(int ci){
        client_id = ci;
    }
    public void setPMID(int pi){
        pm_id = pi;
    }
    public void setPaymentMethod(String pm){
        payment_method = pm;
    }
    public void setInvoiceStatus(String is){
        invoice_status = is;
    }
    public void setTotalAmount(float ta){
        total_amount = ta;
    }
    public void setInvoiceDate(Date id){
        invoice_date = id;
    }
    public int getInvoiceID(){
        return invoice_id;
    }
    public int getClientID(){
        return client_id;
    }
    public int getPMID(){
        return pm_id;
    }
    public String getPaymentMethod(){
        return payment_method;
    }
    public String getInvoiceStatus(){
        return invoice_status;
    }
    public float getTotalAmount(){
        return total_amount;
    }
    public Date getInvoiceDate(){
        return invoice_date;
    }
}
