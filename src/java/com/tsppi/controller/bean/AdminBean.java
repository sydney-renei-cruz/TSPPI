/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.bean;

import java.io.Serializable;

/**
 *
 * @author Sydney Cruz
 */
public class AdminBean implements Serializable{
    protected int admin_id;
    protected int account_num;
    
    public AdminBean(){
        admin_id = 0;
        account_num = 0;
    }
    public AdminBean(int aid, int an){
        admin_id = aid;
        account_num = an;
    }
    public void setAdminID(int aid){
        admin_id = aid;
    }
    public void setAccountNum(int an){
        account_num = an;
    }
    public int getAdminID(){
        return admin_id;
    }
    public int getAccountNum(){
        return account_num;
    }
}
