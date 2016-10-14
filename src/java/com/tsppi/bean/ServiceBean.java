/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.bean;

import java.io.Serializable;

/**
 *
 * @author SAM
 */
public class ServiceBean implements Serializable{
    
    private int id;
    private String name;
    private String description;
    
    public ServiceBean(){
        id = 0;
        name = "";
        description = "";
    }
    
    public ServiceBean(int sid, String sn, String sd){
        id = sid;
        name = sn;
        description = sd;
    }
    
    public void setServiceID(int sid){
        id = sid;
    }
    public void setServiceName(String sn){
        name = sn;
    }
    public void setServiceDesc(String sd){
        description = sd;
    }
    
    public int getServiceID(){
        return id;
    }
    public String getServiceName(){
        return name;
    }
    public String getServiceDesc(){
        return description;
    }
}
