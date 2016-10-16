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
public class ClientBean implements Serializable{
    private int account_num;
    private int client_id;
    private String first_name;
    private String last_name;
    private String email;
    private String mobile;
    private String telephone;
    private String address;
    
    public ClientBean(){
        account_num = 0;
        client_id = 0;
        first_name = "";
        last_name = "";
        email = "";
        mobile = "";
        telephone = "";
        address = "";
    }
    
    public ClientBean(int an, int ci, String fn, String ln, String e, String m, String t, String a){
        account_num = an;
        client_id = ci;
        first_name = fn;
        last_name = ln;
        email = e;
        mobile = m;
        telephone = t;
        address = a;
    }
    
    public int getAccountNum(){
        return account_num;
    }
    public int getClientID(){
        return client_id;
    }
    public String getFirstName(){
        return first_name;
    }
    public String getLastName(){
        return last_name;
    }
    public String getFullName(){
        return first_name + " " + last_name;
    }
    public String getEmail(){
        return email;
    }
    public String getMobile(){
        return mobile;
    }
    public String getTelephone(){
        return telephone;
    }
    public String getAddress(){
        return address;
    }
    
    public void setAccountNum(int an){
        account_num = an;
    }
    public void setClientID(int ci){
        client_id = ci;
    }
    public void setFirstName(String fn){
        first_name = fn;
    }
    public void setLastName(String ln){
        last_name = ln;
    }
    public void setEmail(String e){
        email = e;
    }
    public void setMobile(String m){
        mobile = m;
    }
    public void setTelephone(String t){
        telephone = t;
    }
    public void setAddress(String a){
        address = a;
    }
}
