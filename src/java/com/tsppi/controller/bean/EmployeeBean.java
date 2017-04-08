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
public class EmployeeBean extends JobPositionBean implements Serializable{
    protected int employee_id;
    protected int account_num;
    
    public EmployeeBean(){
        employee_id = 0;
        account_num = 0;
    }
    
    public EmployeeBean(int eid, int an){
        employee_id = eid;
        account_num = an;
    }
    public void setEmployeeID(int eid){
        employee_id = eid;
    }
    public void setAccountNum(int an){
        account_num = an;
    }
    public int getEmployeeID(){
        return employee_id;
    }
    public int getAccountNum(){
        return account_num;
    }
}
