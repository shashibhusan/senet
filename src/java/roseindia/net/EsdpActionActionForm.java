/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package roseindia.net;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author prakash
 */
public class EsdpActionActionForm extends org.apache.struts.action.ActionForm {
    
   
    private int esdp3;
    private int edp3;
   private int bsdp3;
    private int mdp3;
       private int sdp3;
    private int imc3;
       private int other3;
       
       private int esdp2;
    private int edp2;
   private int bsdp2;
    private int mdp2;
       private int sdp2;
    private int imc2;
       private int other2;
       
       private int esdp5;
    private int edp5;
   private int bsdp5;
    private int mdp5;
       private int sdp5;
    private int imc5;
       private int other5;
       
       
       private int esdp4;
    private int edp4;
   private int bsdp4;
    private int mdp4;
       private int sdp4;
    private int imc4;
       private int other4;
       
       private int esdp1;
    private int edp1;
   private int bsdp1;
    private int mdp1;
       private int sdp1;
    private int imc1;
       private int other1;
    
     
     
     private String user_date;
     private String instId;
     private String years;
     private int months;
     
     
     public int getOther1() {
        return other1;
    }
    public void setOther1(int Other1) {
        other1 = Other1;
    }
    public int getImc1() {
        return imc1;
    }
    public void setImc1(int Imc1) {
        imc1 = Imc1;
    }
    public int getSdp1() {
        return sdp1;
    }
    public void setSdp1(int Sdp1) {
        sdp1 = Sdp1;
    }
    public int getMdp1() {
        return mdp1;
    }
    public void setMdp1(int Mdp1) {
        mdp1 = Mdp1;
    }
    public int getBsdp1() {
        return bsdp1;
    }
    public void setBsdp1(int Bsdp1) {
        bsdp1 = Bsdp1;
    }
      public int getEdp1() {
        return edp1;
    }
    public void setEdp1(int Edp1) {
        edp1 = Edp1;
    }
     public int getEsdp1() {
        return esdp1;
    }
    public void setEsdp1(int Esdp1) {
        esdp1 = Esdp1;
    }
     
    
    
    
     public int getOther2() {
        return other2;
    }
    public void setOther2(int Other2) {
        other2 = Other2;
    }
    public int getImc2() {
        return imc2;
    }
    public void setImc2(int Imc2) {
        imc2 = Imc2;
    }
    public int getSdp2() {
        return sdp2;
    }
    public void setSdp2(int Sdp2) {
        sdp2 = Sdp2;
    }
    public int getMdp2() {
        return mdp2;
    }
    public void setMdp2(int Mdp2) {
        mdp2 = Mdp2;
    }
    public int getBsdp2() {
        return bsdp2;
    }
    public void setBsdp2(int Bsdp2) {
        bsdp2 = Bsdp2;
    }
      public int getEdp2() {
        return edp2;
    }
    public void setEdp2(int Edp2) {
        edp2 = Edp2;
    }
     public int getEsdp2() {
        return esdp2;
    }
    public void setEsdp2(int Esdp2) {
        esdp2 = Esdp2;
    }
     
    
    
     public int getOther3() {
        return other3;
    }
    public void setOther3(int Other3) {
        other3 = Other3;
    }
    public int getImc3() {
        return imc3;
    }
    public void setImc3(int Imc3) {
        imc3 = Imc3;
    }
    public int getSdp3() {
        return sdp3;
    }
    public void setSdp3(int Sdp3) {
        sdp3 = Sdp3;
    }
    public int getMdp3() {
        return mdp3;
    }
    public void setMdp3(int Mdp3) {
        mdp3 = Mdp3;
    }
    public int getBsdp3() {
        return bsdp3;
    }
    public void setBsdp3(int Bsdp3) {
        bsdp3 = Bsdp3;
    }
      public int getEdp3() {
        return edp3;
    }
    public void setEdp3(int Edp3) {
        edp3 = Edp3;
    }
     public int getEsdp3() {
        return esdp3;
    }
    public void setEsdp3(int Esdp3) {
        esdp3 = Esdp3;
    }
     
    
    
     public int getOther4() {
        return other4;
    }
    public void setOther4(int Other4) {
        other4 = Other4;
    }
    public int getImc4() {
        return imc4;
    }
    public void setImc4(int Imc4) {
        imc4 = Imc4;
    }
    public int getSdp4() {
        return sdp4;
    }
    public void setSdp4(int Sdp4) {
        sdp4 = Sdp4;
    }
    public int getMdp4() {
        return mdp4;
    }
    public void setMdp4(int Mdp4) {
        mdp4 = Mdp4;
    }
    public int getBsdp4() {
        return bsdp4;
    }
    public void setBsdp4(int Bsdp4) {
        bsdp4 = Bsdp4;
    }
      public int getEdp4() {
        return edp4;
    }
    public void setEdp4(int Edp4) {
        edp4 = Edp4;
    }
     public int getEsdp4() {
        return esdp4;
    }
    public void setEsdp4(int Esdp4) {
        esdp4 = Esdp4;
    }
     
    
    
    
    
     public int getOther5() {
        return other5;
    }
    public void setOther5(int Other5) {
        other5 = Other5;
    }
    public int getImc5() {
        return imc5;
    }
    public void setImc5(int Imc5) {
        imc5 = Imc5;
    }
    public int getSdp5() {
        return sdp5;
    }
    public void setSdp5(int Sdp5) {
        sdp5 = Sdp5;
    }
    public int getMdp5() {
        return mdp5;
    }
    public void setMdp5(int Mdp5) {
        mdp5 = Mdp5;
    }
    public int getBsdp5() {
        return bsdp5;
    }
    public void setBsdp5(int Bsdp5) {
        bsdp5 = Bsdp5;
    }
      public int getEdp5() {
        return edp5;
    }
    public void setEdp5(int Edp5) {
        edp5 = Edp5;
    }
     public int getEsdp5() {
        return esdp5;
    }
    public void setEsdp5(int Esdp5) {
        esdp5 = Esdp5;
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