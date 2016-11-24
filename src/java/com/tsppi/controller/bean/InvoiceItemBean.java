/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.bean;

import java.io.Serializable;

/**
 *
 * @author cruzsyd
 */
public class InvoiceItemBean implements Serializable{
    private int item_id;
    private int invoice_id;
    private int product_id;
    private String product_name;
    private float msrp;
    private int item_quantity;
    
    
    public InvoiceItemBean(){
        item_id = 0 ;
        invoice_id = 0;
        product_id = 0;
        product_name = "";
        msrp = 0;
        item_quantity = 0;
    }   
    public InvoiceItemBean(int it, int in, int pi, String pn, float m, int iq){
        item_id = it;
        invoice_id = in;
        product_id = pi;
        product_name = pn;
        msrp = m;
        item_quantity = iq;
    }
    
    public int getItemID(){
        return item_id;
    }
    public int getInvoiceID(){
        return invoice_id;
    }
    public int getProductID(){
        return product_id;
    }
    public String getProductName(){
        return product_name;
    }
    public float getMSRP(){
        return msrp;
    }
    public int getItemQuantity(){
        return item_quantity;
    }
    public void setItemID(int it){
        item_id = it;
    }
    public void setInvoiceID(int in){
        invoice_id = in;
    }
    public void setProductID(int pi){
        product_id = pi;
    }
    public void setProductName(String pn){
        product_name = pn;
    }
    public void setMSRP(float m){
        msrp = m;
    }
    public void setItemQuantity(int iq){
        item_quantity = iq;
    }
}
