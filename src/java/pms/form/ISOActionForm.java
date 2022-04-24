/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pms.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Administrator
 */
public class ISOActionForm extends org.apache.struts.action.ActionForm {
    
    private int gENERALappication_received_during_month;
    private int gENERALappication_disburded_during_month;
   private int gENERALamount_disburded_during_month;
    private int gENERALappication_received_upto_month;
       
    private int gENERALappication_disburded_upto_month;
    private int gENERALamount_disburded_upto_month;
       private int nERappication_received_during_month;
       
      
    private int nERappication_disburded_during_month;
   private int nERamount_disburded_during_month;
    private int nERappication_received_upto_month;
     
    private int nERappication_disburded_upto_month;
    private int nERamount_disburded_upto_month;
    private int sCPappication_received_during_month;

  
 private int sCPappication_disburded_during_month;
 private int sCPamount_disburded_during_month ;
 private int sCPappication_received_upto_month;
 
 private int sCPappication_disburded_upto_month;
 private int sCPamount_disburded_upto_month;
 private int tSPappication_received_during_month;
 private int tSPappication_disburded_during_month;
 
 private int tSPamount_disburded_during_month;
 private int tSPappication_received_upto_month;
 private int tSPappication_disburded_upto_month;
 private int tSPamount_disburded_upto_month;








     
     private String user_date;
     private String instId;
     private String years;
     private int months;
     
     
     
    
    
    
     public int getGENERALappication_received_during_month() {
        return gENERALappication_received_during_month;
    }
    public void setGENERALappication_received_during_month(int GENERALappication_received_during_month) {
        gENERALappication_received_during_month = GENERALappication_received_during_month;
    }
	
	
	 public int getGENERALappication_disburded_during_month() {
        return gENERALappication_disburded_during_month;
    }
    public void setGENERALappication_disburded_during_month(int GENERALappication_disburded_during_month) {
        gENERALappication_disburded_during_month = GENERALappication_disburded_during_month;
    }
    
	
	
	   public int getGENERALamount_disburded_during_month() {
        return gENERALamount_disburded_during_month;
    }
    public void setGENERALamount_disburded_during_month(int GENERALamount_disburded_during_month) {
        gENERALamount_disburded_during_month = GENERALamount_disburded_during_month;
    }
    
	
	
	
	   public int GetGENERALappication_received_upto_month() {
        return gENERALappication_received_upto_month;
    }
    public void setGENERALappication_received_upto_month(int GENERALappication_received_upto_month) {
        gENERALappication_received_upto_month = GENERALappication_received_upto_month;
    }
    
	
	
	   public int getGENERALappication_disburded_upto_month_month() {
        return gENERALappication_disburded_upto_month;
    }
    public void setGENERALappication_disburded_upto_month(int GENERALappication_disburded_upto_month) {
        gENERALappication_disburded_upto_month = GENERALappication_disburded_upto_month;
    }
    
	
	  public int getGENERALamount_disburded_upto_month() {
        return gENERALamount_disburded_upto_month;
    }
    public void setGENERALamount_disburded_upto_month(int GENERALamount_disburded_upto_month) {
        gENERALamount_disburded_upto_month = GENERALamount_disburded_upto_month;
    }
       
	     public int getNERappication_received_during_month() {
        return nERappication_received_during_month;
    }
    public void setNERappication_received_during_month(int NERappication_received_during_month) {
        nERappication_received_during_month = NERappication_received_during_month;
    }
       
	     public int getNERappication_disburded_during_month() {
        return nERappication_disburded_during_month;
    }
    public void setNERappication_disburded_during_month(int NERappication_disburded_during_month) {
        nERappication_disburded_during_month = NERappication_disburded_during_month;
    }
       
	     public int getNERamount_disburded_during_month() {
        return nERamount_disburded_during_month;
    }
    public void setNERamount_disburded_during_month(int NERamount_disburded_during_month) {
        nERamount_disburded_during_month = NERamount_disburded_during_month;
    }
       
	     public int getNERappication_received_upto_month() {
        return nERappication_received_upto_month;
    }
    public void setNERappication_received_upto_month(int NERappication_received_upto_month) {
        nERappication_received_upto_month = NERappication_received_upto_month;
    }
       
	     public int getNERappication_disburded_upto_month() {
        return nERappication_disburded_upto_month;
    }
    public void setNERappication_disburded_upto_month(int NERappication_disburded_upto_month) {
        nERappication_disburded_upto_month = NERappication_disburded_upto_month;
    }
       
	     public int getNERamount_disburded_upto_month() {
        return nERamount_disburded_upto_month;
    }
    public void setNERamount_disburded_upto_month(int NERamount_disburded_upto_month) {
        nERamount_disburded_upto_month = NERamount_disburded_upto_month;
    }
       
	     public int getSCPappication_received_during_month() {
        return sCPappication_received_during_month;
    }
    public void setSCPappication_received_during_month(int SCPappication_received_during_month) {
        sCPappication_received_during_month = SCPappication_received_during_month;
    }
       
	     public int getSCPappication_disburded_during_month() {
        return sCPappication_disburded_during_month;
    }
    public void setSCPappication_disburded_during_month(int SCPappication_disburded_during_month) {
        sCPappication_disburded_during_month = SCPappication_disburded_during_month;
    }
       
	   	     public int getSCPamount_disburded_during_month() {
        return sCPamount_disburded_during_month;
    }
    public void setSCPamount_disburded_during_month(int SCPamount_disburded_during_month) {
        sCPamount_disburded_during_month = SCPamount_disburded_during_month;
    }
		     public int getSCPappication_received_upto_month() {
        return sCPappication_received_upto_month;
    }
    public void setSCPappication_received_upto_month(int SCPappication_received_upto_month) {
        sCPappication_received_upto_month = SCPappication_received_upto_month;
    }
		     public int getSCPappication_disburded_upto_month() {
        return sCPappication_disburded_upto_month;
    }
    public void setSCPappication_disburded_upto_month(int SCPappication_disburded_upto_month) {
        sCPappication_disburded_upto_month = SCPappication_disburded_upto_month;
    }
		     public int getSCPamount_disburded_upto_month() {
        return sCPamount_disburded_upto_month;
    }
    public void setSCPamount_disburded_upto_month(int SCPamount_disburded_upto_month) {
        sCPamount_disburded_upto_month = SCPamount_disburded_upto_month;
    }
		     public int getTSPappication_received_during_month() {
        return tSPappication_received_during_month;
    }
    public void setTSPappication_received_during_month(int TSPappication_received_during_month) {
        tSPappication_received_during_month = TSPappication_received_during_month;
    }
		     public int getTSPappication_disburded_during_month() {
        return tSPappication_disburded_during_month;
    }
    public void setTSPappication_disburded_during_month(int TSPappication_disburded_during_month) {
        tSPappication_disburded_during_month = TSPappication_disburded_during_month;
    }
		     public int getTSPamount_disburded_during_month() {
        return tSPamount_disburded_during_month;
    }
    public void setTSPamount_disburded_during_month(int TSPamount_disburded_during_month) {
        tSPamount_disburded_during_month = TSPamount_disburded_during_month;
    }
		     public int getTSPappication_received_upto_month() {
        return tSPappication_received_upto_month;
    }
    public void setTSPappication_received_upto_month(int TSPappication_received_upto_month) {
        tSPappication_received_upto_month = TSPappication_received_upto_month;
    }
		     public int getTSPappication_disburded_upto_month() {
        return tSPappication_disburded_upto_month;
    }
    public void setTSPappication_disburded_upto_month(int TSPappication_disburded_upto_month) {
        tSPappication_disburded_upto_month = TSPappication_disburded_upto_month;
    }
		     public int getTSPamount_disburded_upto_month() {
        return tSPamount_disburded_upto_month;
    }
    public void setTSPamount_disburded_upto_month(int TSPamount_disburded_upto_month) {
        tSPamount_disburded_upto_month = TSPamount_disburded_upto_month;
    }
	
   
    
     public String getYears() {
        return years;
    }
    public void setYears(String Years) {
        years = Years;
    }
     public int getMonths() {
        return months;
    }
    public void setMonths(int Months) {
        months = Months;
    }
    public String getUser_date() {
        return user_date;
    }
    public void setUser_date(String User_date) {
        this.user_date = User_date;
    }
    
    public String getInstId() {
        return instId;
    }
    public void setInstId(String InstId) {
        this.instId = InstId;
    }
    
    
}
    
    
    
    
    
    
    
    

    
   