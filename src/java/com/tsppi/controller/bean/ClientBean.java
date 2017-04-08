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
public class ClientBean extends CompanyBean implements Serializable{
//    protected int account_num;
    protected int client_id;
//    protected String first_name;
//    protected String last_name;
//    protected String email;
    protected String mobile;
    
    
    public ClientBean(){
//        account_num = 0;
        client_id = 0;
//        first_name = "";
//        last_name = "";
//        email = "";
        mobile = "";
    }
    
    public ClientBean(int an, int ci, String fn, String ln, String e, String m){
//        account_num = an;
        client_id = ci;
//        first_name = fn;
//        last_name = ln;
//        email = e;
        mobile = m;
    }
    
//    public int getAccountNum(){
//        return account_num;
//    }
    public int getClientID(){
        return client_id;
    }
//    public String getFirstName(){
//        return first_name;
//    }
//    public String getLastName(){
//        return last_name;
//    }
//    public String getFullName(){
//        return first_name + " " + last_name;
//    }
//    public String getEmail(){
//        return email;
//    }
    public String getMobile(){
        return mobile;
    }
    
//    public void setAccountNum(int an){
//        account_num = an;
//    }
    public void setClientID(int ci){
        client_id = ci;
    }
//    public void setFirstName(String fn){
//        first_name = fn;
//    }
//    public void setLastName(String ln){
//        last_name = ln;
//    }
//    public void setEmail(String e){
//        email = e;
//    }
    public void setMobile(String m){
        mobile = m;
    }
}
