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
public class PaymentMethodBean implements Serializable{
    protected int pm_id;
    protected String payment_method;
    protected boolean show_method;
    
    public PaymentMethodBean(){
        pm_id = 0;
        payment_method = "";
        show_method = false;
    }
    
    public PaymentMethodBean(int pi, String pm, boolean sm){
        pm_id = pi;
        payment_method = pm;
        show_method = sm;
    }
    
    public void setPMID(int pi){
        pm_id = pi;
    }
    public void setPaymentMethod(String pm){
        payment_method = pm;
    }
    public void setShowMethod(boolean sm){
        show_method = sm;
    }
    public int getPMID(){
        return pm_id;
    }
    public String getPaymentMethod(){
        return payment_method;
    }
    public boolean getShowMethod(){
        return show_method;
    }
}
