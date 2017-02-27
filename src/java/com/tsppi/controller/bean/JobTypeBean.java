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
public class JobTypeBean implements Serializable{
    private int job_id;
    private String job_type;
    private boolean management_score;
    private boolean inventory_score;
    private boolean show_job;
        
    public JobTypeBean(){
        job_id = 0;
        job_type = null;
        management_score = false;
        inventory_score = false;
        show_job = false;
    }
    
    public JobTypeBean(int jid, String jt, boolean ms, boolean is, boolean sj){
        job_id = jid;
        job_type = jt;
        management_score = ms;
        inventory_score = is;
        show_job = sj;
    }   
    public void setJobID(int jid){
        job_id = jid;
    }
    public void setJobType(String jt){
        job_type = jt;
    }
    public void setManagementScore(boolean ms){
        management_score = ms;
    }
    public void setInventoryScore(boolean is){
        inventory_score = is;
    }
    public void setShowJob(boolean sj){
        show_job = sj;
    }
    
    public int getJobID(){
        return job_id;
    }
    public String getJobType(){
        return job_type;
    }
    public boolean getManagementScore(){
        return management_score;
    }
    public boolean getInventoryScore(){
        return inventory_score;
    }
    public boolean getShowJob(){
        return show_job;
    }
}
