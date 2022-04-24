/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

/**
 *
 * @author Administrator
 */
public class Main extends org.apache.struts.action.ActionForm {


 //  private FormFile theFile;
 private String cmbIns;
    private String cmbYear;
     private String cmbMonth;
     private String crosssite;
      private String section;

   //  private String district;
  /**
 * @return Returns the theFile.
 */
 public String getSection() {
        return section;
    }
    public void setSection(String Section) {
        this.section = Section;
    }


  public String getCmbIns() {
        return cmbIns;
    }
    public void setCmbIns(String CmbIns) {
        this.cmbIns = CmbIns;
    }

    public String getCmbYear() {
        return cmbYear;
    }
    public void setCmbYear(String CmbYear) {
        this.cmbYear = CmbYear;
    }

public String getCmbMonth() {
        return cmbMonth;
    }
    public void setCmbMonth(String CmbMonth) {
        this.cmbMonth = CmbMonth;
    }

 String geCrosssite() {
       return crosssite;
   }
   public void setCrosssite(String Crosssite) {
       this.crosssite = Crosssite;
    }
}