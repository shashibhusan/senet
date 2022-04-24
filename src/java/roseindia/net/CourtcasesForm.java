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
 * @author Administrator
 */
public class CourtcasesForm extends org.apache.struts.action.ActionForm {
    

    private String serial_number;
       private String status_of_case;
    private String nature_of_court;
       private String detail_of_case;
    private String cases_related_to;
       private String stakes_involved;
    private String detail_of_application;  
    private String present_status_of_the_case;
    private String year_of_case;
       private String affidavit_date_of_filing_CA;
    private String expected_date_of_filing;
     private String date_of_next_hearing;
     private String controlling_Officers;
     private String status;
     private String instId;
     private int years;
        private int months;
        private String mnm;
        private String Name_of_Advocate;
        private String Contact_No;
        private String Email_Id;
    public String getContact_No() {
        return Contact_No;
    }

    public void setContact_No(String Contact_No) {
        this.Contact_No = Contact_No;
    }

    public String getEmail_Id() {
        return Email_Id;
    }

    public void setEmail_Id(String Email_Id) {
        this.Email_Id = Email_Id;
    }

    public String getName_of_Advocate() {
        return Name_of_Advocate;
    }

    public void setName_of_Advocate(String Name_of_Advocate) {
        this.Name_of_Advocate = Name_of_Advocate;
    }
 
       public String getMnm() {
        return mnm;
    }
    public void setMnm(String Mnm) {
        this.mnm = Mnm;
    }
     public String getStatus() {
        return status;
    }
    public void setStatus(String Status) {
        status = Status;
    }
     public String getSerial_number() {
        return serial_number;
    }
    public void setSerial_number(String Serial_number) {
        serial_number = Serial_number;
    }
     public String getControlling_Officers() {
        return controlling_Officers;
    }
    public void setControlling_Officers(String Controlling_Officers) {
        controlling_Officers = Controlling_Officers;
    }
    public String getStatus_of_case() {
        return status_of_case;
    }
    public void setStatus_of_case(String Status_of_case) {
        status_of_case = Status_of_case;
    }
    public String getNature_of_court() {
        return nature_of_court;
    }
    public void setNature_of_court(String Nature_of_court) {
        nature_of_court = Nature_of_court;
    }
    public String getDetail_of_case() {
        return detail_of_case;
    }
    public void setDetail_of_case(String Detail_of_case) {
        detail_of_case = Detail_of_case;
    }
    public String getCases_related_to() {
        return cases_related_to;
    }
    public void setCases_related_to(String Cases_related_to) {
        cases_related_to = Cases_related_to;
    }
     public String getStakes_involved() {
        return stakes_involved;
    }
    public void setStakes_involved(String Stakes_involved) {
        stakes_involved = Stakes_involved;
    }
     public String getDetail_of_application() {
        return detail_of_application;
    }
    public void setDetail_of_application(String Detail_of_application) {
        detail_of_application = Detail_of_application;
    }
     public String getPresent_status_of_the_case() {
        return present_status_of_the_case;
    }
    public void setPresent_status_of_the_case(String Present_status_of_the_case) {
        present_status_of_the_case = Present_status_of_the_case;
    }
     public String getYear_of_case() {
        return year_of_case;
    }
    public void setYear_of_case(String Year_of_case) {
        year_of_case = Year_of_case;
    }
     public String getAffidavit_date_of_filing_CA() {
        return affidavit_date_of_filing_CA;
    }
    public void setAffidavit_date_of_filing_CA(String Affidavit_date_of_filing_CA) {
        affidavit_date_of_filing_CA = Affidavit_date_of_filing_CA;
    }
     public String getExpected_date_of_filing() {
        return expected_date_of_filing;
    }
    public void setExpected_date_of_filing(String Expected_date_of_filing) {
        expected_date_of_filing = Expected_date_of_filing;
    }
     public String getDate_of_next_hearing() {
        return date_of_next_hearing;
    }
    public void setDate_of_next_hearing(String Date_of_next_hearing) {
        date_of_next_hearing = Date_of_next_hearing;
    }
    
     public int getYears() {
        return years;
    }
    public void setYears(int Years) {
        years = Years;
    }
     public int getMonths() {
        return months;
    }
    public void setMonths(int Months) {
        months = Months;
    }
    
    public String getInstId() {
        return instId;
    }
    public void setInstId(String InstId) {
        this.instId = InstId;
    }
    
//    @Override
//     public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
//        ActionErrors errors = new ActionErrors();
//        if (getInstId() == null || getInstId().length() < 1) {
//            errors.add("instId", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getStatus() == null || getStatus().length() < 1) {
//            errors.add("Status", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getSerial_number() == null || getSerial_number().length() < 1) {
//            errors.add("Serial_number", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getControlling_Officers() == null || getControlling_Officers().length() < 1) {
//            errors.add("Controlling_Officers", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getStatus_of_case() == null || getStatus_of_case().length() < 1) {
//            errors.add("Status_of_case", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getNature_of_court() == null || getNature_of_court().length() < 1) {
//            errors.add("Nature_of_court", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getDetail_of_case() == null || getDetail_of_case().length() < 1) {
//            errors.add("Detail_of_case", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getCases_related_to() == null || getCases_related_to().length() < 1) {
//            errors.add("Cases_related_to", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getStakes_involved() == null || getStakes_involved().length() < 1) {
//            errors.add("Stakes_involved", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getDetail_of_application() == null || getDetail_of_application().length() < 1) {
//            errors.add("Detail_of_application", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getPresent_status_of_the_case() == null || getPresent_status_of_the_case().length() < 1) {
//            errors.add("Present_status_of_the_case", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getYear_of_case() == null || getYear_of_case().length() < 1) {
//            errors.add("Year_of_case", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        if (getAffidavit_date_of_filing_CA() == null || getAffidavit_date_of_filing_CA().length() < 1) {
//            errors.add("Affidavit_date_of_filing_CA", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//
//        if (getExpected_date_of_filing() == null || getExpected_date_of_filing().length() < 1) {
//            errors.add("Expected_date_of_filing", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//
//        if (getDate_of_next_hearing() == null || getDate_of_next_hearing().length() < 1) {
//            errors.add("Date_of_next_hearing", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//
//
//        return errors;
//    }
}
    
    
    
    
    
    
    
    

    
   