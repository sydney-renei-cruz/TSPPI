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
public class CompanyBean extends CompanyAddressBean implements Serializable{
    protected int company_id;
    protected String company_name;
    protected String company_branch;
    protected String company_telephone;
    
    public CompanyBean(){
        company_id = 0;
        company_name = "";
        company_branch = "";
        company_telephone = "";
    }
    
    public CompanyBean(int ci, String cn, String cb, String ct){
        company_id = ci;
        company_name = cn;
        company_branch = cb;
        company_telephone = ct;
        
    }
    
    public void setCompanyID(int ci){
        company_id = ci;
    }
    public void setCompanyName(String cn){
        company_name = cn;
    }
    public void setCompanyBranch(String cb){
        company_branch = cb;
    }
    public void setCompanyTelephone(String ct){
        company_telephone = ct;
    }
    
    
    public int getCompanyID(){
        return company_id;
    }
    public String getCompanyName(){
        return company_name;
    }
    public String getCompanyBranch(){
        return company_branch;
    }
    public String getCompanyTelephone(){
        return company_telephone;
    }
    public String getFullCompany(){
        return company_name + " - " + company_branch;
    }
}
