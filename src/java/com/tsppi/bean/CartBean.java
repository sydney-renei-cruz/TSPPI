/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.bean;

import java.util.ArrayList;

/**
 *
 * @author cruzsyd
 * ref = http://www.tech-freaks.com/jsp-servlets/shopping-cart/all-pages.html
 */
public class CartBean {
    private ArrayList cart_items = new ArrayList();
    private float order_total;
    
    public CartBean(){
        cart_items = new ArrayList();
        order_total = 0;
    }
    public CartBean(ArrayList ci, float ot){
        cart_items = ci;
        order_total = ot;
    }
    
    public ArrayList getCartItems(){
        return cart_items;
    }
  
    public float getOrderTotal(){
        return order_total;
    }
    
    public void setCartItems(ArrayList ci){
        cart_items = ci;
    }
    
    public void setOrderTotal(float ot){
        order_total = ot;
    }
    
    public int getCartSize(){
        return cart_items.size();
    }
    
    protected void calculateOrderTotal(){
        float total = 0;
        for(int counter = 0; counter < cart_items.size(); counter++){
            CartItemBean ci = (CartItemBean) cart_items.get(counter);
            total = total + ci.getTotalCost();
        }
        setOrderTotal(total);
    }
   
    public void addCartItem(int in, String inm, int q, float ic){
        
        int quantity = 0;
        float item_cost = 0;
        float total_cost = 0;
        CartItemBean cib = new CartItemBean();
        
        try{
            item_cost = ic;
            quantity = q;
            if(quantity > 0){
                total_cost = item_cost * quantity;
                cib.setItemNumber(in);
                cib.setItemName(inm);
                cib.setQuantity(quantity);
                cib.setItemCost(item_cost);
                cib.setTotalCost(total_cost);
                cart_items.add(cib);
                calculateOrderTotal();
            }
        }catch(Exception e){
            System.out.println(e);
            e.printStackTrace();
        }
    }
    
    public void addCartItem(CartItemBean cib){
        cart_items.add(cib);
    }
    
    public CartItemBean getCartItem(int item_number){
        CartItemBean cib = null;
        if(cart_items.size() > item_number){
            cib = (CartItemBean) cart_items.get(item_number);
        }
        return cib;
    }
    
    public void updateCartItem(int in, int q){
        int quantity = 0;
        int item_number = 0;
        float item_cost = 0;
        float total_cost = 0;
        
        CartItemBean cib = null;
        
        try{
            item_number = in;
            quantity = q;
            if(quantity > 0){
                cib = (CartItemBean) cart_items.get(item_number - 1);
                item_cost = cib.getItemCost();
                total_cost = item_cost * quantity;
                cib.setQuantity(quantity);
                cib.setTotalCost(total_cost);
                calculateOrderTotal();
            }
        }catch(Exception e){
            System.out.println(e);
            e.printStackTrace();
        }
    }
    public void deleteCartItem(int in){
        int item_number = 0;
        try{
            item_number = in;
            cart_items.remove(item_number - 1);
            calculateOrderTotal();
        }catch(Exception e){
            System.out.println(e);
            e.printStackTrace();
        }
    }
}
