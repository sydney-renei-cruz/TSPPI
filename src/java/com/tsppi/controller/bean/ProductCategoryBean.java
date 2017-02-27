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
public class ProductCategoryBean implements Serializable{
    private int category_id;
    private String category_name;
    private boolean show_category;
    
    public ProductCategoryBean(){
        category_id = 0;
        category_name = "";
        show_category = false;
    }
    
    public ProductCategoryBean(int cid, String cn, boolean sc){
        category_id = cid;
        category_name = cn;
        show_category = sc;
    }
    
    public void setCategoryID(int cid){
        category_id = cid;
    }
    public void setCategoryName(String cn){
        category_name = cn;
    }
    public void setShowCategory(boolean sc){
        show_category = sc;
    }
    
    public int getCategoryID(){
        return category_id;
    }
    public String getCategoryName(){
        return category_name;
    }
    public boolean getShowCategory(){
        return show_category;
    }
}
