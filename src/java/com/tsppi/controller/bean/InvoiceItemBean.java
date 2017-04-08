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
public class InvoiceItemBean extends ProductBean implements Serializable{
    private int item_id;
    private int item_quantity;
    
    
    public InvoiceItemBean(){
        item_id = 0 ;
        item_quantity = 0;
    }   
    public InvoiceItemBean(int it, int iq){
        item_id = it;
        item_quantity = iq;
    }
    
    public int getItemID(){
        return item_id;
    }
    public int getItemQuantity(){
        return item_quantity;
    }
    public void setItemID(int it){
        item_id = it;
    }
    public void setItemQuantity(int iq){
        item_quantity = iq;
    }
}
