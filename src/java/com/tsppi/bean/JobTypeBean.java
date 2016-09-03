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
public class JobTypeBean implements Serializable{
    private int job_id;
    private String job_type;
        
    public JobTypeBean(){
        job_id = 0;
        job_type = null;
    }
    
    public JobTypeBean(int jid, String jt){
        job_id = jid;
        job_type = jt;
    }
    
    public int getJobID(){
        return job_id;
    }
    public String getJobType(){
        return job_type;
    }
    
    public void setJobID(int jid){
        job_id = jid;
    }
    public void setJobType(String jt){
        job_type = jt;
    }
}
