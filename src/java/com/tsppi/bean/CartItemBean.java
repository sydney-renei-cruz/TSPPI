/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.bean;

import java.io.Serializable;

/**
 *
 * @author cruzsyd
 * ref = http://www.tech-freaks.com/jsp-servlets/shopping-cart/all-pages.html
 */
public class CartItemBean implements Serializable{
    private int item_number;
    private String item_name;
    private int quantity;
    private float item_cost;
    private float total_cost;
    
    public CartItemBean(){
        item_number = 0;
        item_name = "";
        quantity = 0;
        item_cost = 0;
        total_cost = 0;
    }
    public CartItemBean(int in, String inm, int q, float ic, float tc){
        item_number = in;
        item_name = inm;
        quantity = q;
        item_cost = ic;
        total_cost = tc;
    }
    public int getItemNumber(){
        return item_number;
    }
    public String getItemName(){
        return item_name;
    }
    public int getQuantity(){
        return quantity;
    }
    public float getItemCost(){
        return item_cost;
    }
    public float getTotalCost(){
        return total_cost;
    }
    
    public void setItemNumber(int in){
        item_number = in;
    }
    public void setItemName(String in){
        item_name = in;
    }
    public void setQuantity(int q){
        quantity = q;
    }
    public void setItemCost(float ic){
        item_cost = ic;
    }
    public void setTotalCost(float tc){
        total_cost = tc;
    }
}
