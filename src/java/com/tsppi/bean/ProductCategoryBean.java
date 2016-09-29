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
 */
public class ProductCategoryBean implements Serializable{
    private int category_id;
    private String category_name;
    
    public ProductCategoryBean(){
        category_id = 0;
        category_name = "";
    }
    
    public ProductCategoryBean(int cid, String cn){
        category_id = cid;
        category_name = cn;
    }
    
    public void setCategoryID(int cid){
        category_id = cid;
    }
    public void setCategoryName(String cn){
        category_name = cn;
    }
    
    public int getCategoryID(){
        return category_id;
    }
    public String getCategoryName(){
        return category_name;
    }
}
