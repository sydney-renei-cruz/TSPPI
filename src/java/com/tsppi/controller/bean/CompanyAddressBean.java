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
public class CompanyAddressBean implements Serializable{
    protected int address_id;
    protected String street_line1;
    protected String street_line2;
    protected String spr;
    protected String city;
    protected int postal_code;
    protected String country;
    
    public CompanyAddressBean(){
        address_id = 0;
        street_line1 = "";
        street_line2 = "";
        spr = "";
        city = "";
        postal_code = 0;
        country = "";
    }
    
    public CompanyAddressBean(int ai, String sl1, String sl2, String s, String cty, int pc, String c){
        address_id = ai;
        street_line1 = sl1;
        street_line2 = sl2;
        spr = s;
        city = cty;
        postal_code = pc;
        country = c;
    }
    
    public void setAddressID(int ai){
        address_id = ai;
    }
    public void setStreetLine1(String sl1){
        street_line1 = sl1;
    }
    public void setStreetLine2(String sl2){
        street_line2 = sl2;
    }
    public void setSPR(String s){
        spr = s;
    }
    public void setCity(String c){
        city = c;
    }
    public void setPostalCode(int pc){
        postal_code = pc;
    }
    public void setCountry(String c){
        country = c;
    }
    
    public int getAddressID(){
        return address_id;
    }
    public String getStreetLine1(){
        return street_line1;
    }
    public String getStreetLine2(){
        return street_line2;
    }
    public String getSPR(){
        return spr;
    }
    public String getCity(){
        return city;
    }
    public int getPostalCode(){
        return postal_code;
    }
    public String getCountry(){
        return country;
    }
    public String getCompanyAddress(){
        String replacement = street_line2 + " ";
        if(getStreetLine2().isEmpty())
            replacement = "";
        return street_line1 + " " + replacement + spr + ", " + city + " " + postal_code + " " + country;
    }
}
