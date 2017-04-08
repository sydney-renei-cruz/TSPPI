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
public class AccountBean extends ClientBean implements Serializable{
    private int account_num;
    private int job_id;
    private String username;
    private String password;
    private String first_name;
    private String last_name;
    private String email;
//    private String mobile;
//    private String telephone;
//    private String address;
    private String account_type;
    private String job_type;
    private boolean account_status;
    private String time_registered;
        
    public AccountBean(){
        account_num = 0;
        job_id = 0;
        username = "";
        password = "";
        first_name = "";
        last_name = "";
        email = "";
//        mobile = "";
//        telephone = "";
//        address = "";
        account_type = "";
        job_type = "";
        account_status = false;
        time_registered = "";
    }
    
    public AccountBean(int an, int jid, String u, String p, String fn, String ln, String e, String m,String t, String a, String at, String jt, boolean as, String tr){
        account_num = an;
        job_id = jid;
        username = u;
        password = p;
        first_name = fn;
        last_name = ln;
        email = e;
//        mobile = m;
//        telephone = t;
//        address = a;
        account_type = at;
        job_type = jt;
        account_status = as;
        time_registered = tr;
    }
    
    public int getAccountNum(){
        return account_num;
    }
    public int getJobID(){
        return job_id;
    }
    public String getUsername(){
        return username;
    }
    public String getPassword(){
        return password;
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
//    public String getMobile(){
//        return mobile;
//    }
//    public String getTelephone(){
//        return telephone;
//    } 
//    public String getAddress(){
//        return address;
//    }

    public String getAccountType(){
        return account_type;
    }
    public String getJobType(){
        return job_type;
    }
    public boolean getAccountStatus(){
        return account_status;
    }
    public String getTimeRegistered(){
        return time_registered;
    }

    public void setAccountNum(int an){
        account_num = an;
    }
    public void setJobID(int jid){
        job_id = jid;
    }
    public void setUsername(String u){
        username = u;
    }
    public void setPassword(String p){
        password = p;
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
//    public void setMobile(String m){
//        mobile = m;
//    }
//    public void setTelephone(String t){
//        telephone = t;
//    }
//    public void setAddress(String a){
//        address = a;
//    }
    public void setAccountType(String at){
        account_type = at;
    }
    public void setJobType(String jt){
        job_type = jt;
    }
    public void setAccountStatus(boolean as){
        account_status = as;
    }
    public void setTimeRegistered(String tr){
        time_registered = tr;
    }
}
