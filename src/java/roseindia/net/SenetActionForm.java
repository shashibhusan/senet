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
public class SenetActionForm extends org.apache.struts.action.ActionForm {

    private  int amc_of_pc;
    private int amc_of_pc1;
   private int amc_of_pc2;
    private int web;
       private int web1;
    private int web2;
       private int connectivity;
    private int connectivity1;
       private int connectivity2;
    private int contg;
    private int contg1;
    private int contg2;
       private int others;
    private int others1;
     private int others2;
       private String mnm;
       private String captcha;

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
       public String getMnm() {
        return mnm;
    }
    public void setMnm(String Mnm) {
        this.mnm = Mnm;
    }
	



      private String branch;
       private int br_hardware_target;
        private int br_hardware_tomonth;
         private int br_hardware_upto;
          private int br_con_target;
           private int br_con_tomonth;
            private int br_con_upto;


             private String branch_1;
       private int br_hardware_target_1;
        private int br_hardware_tomonth_1;
         private int br_hardware_upto_1;
          private int br_con_target_1;
           private int br_con_tomonth_1;
            private int br_con_upto_1;

             private String branch_2;
       private int br_hardware_target_2;
        private int br_hardware_tomonth_2;
         private int br_hardware_upto_2;
          private int br_con_target_2;
           private int br_con_tomonth_2;
            private int br_con_upto_2;


             private String branch_3;
       private int br_hardware_target_3;
        private int br_hardware_tomonth_3;
         private int br_hardware_upto_3;
          private int br_con_target_3;
           private int br_con_tomonth_3;
            private int br_con_upto_3;


             private String branch_4;
       private int br_hardware_target_4;
        private int br_hardware_tomonth_4;
         private int br_hardware_upto_4;
          private int br_con_target_4;
           private int br_con_tomonth_4;
            private int br_con_upto_4;


             private String branch_5;
       private int br_hardware_target_5;
        private int br_hardware_tomonth_5;
         private int br_hardware_upto_5;
          private int br_con_target_5;
           private int br_con_tomonth_5;
            private int br_con_upto_5;



               private int br_contg_target;
           private int br_contg_tomonth;
            private int br_contg_upto;
               private int br_others_target;
           private int br_others_tomonth;
            private int br_others_upto;

                 public int getBr_others_target() {
        return br_others_target;
    }
    public void setBr_others_target(int Br_others_target) {
        br_others_target = Br_others_target;
    }
             public int getBr_others_tomonth() {
        return br_others_tomonth;
    }
    public void setBr_others_tomonth(int Br_others_tomonth) {
        br_others_tomonth = Br_others_tomonth;
    }

       public int getBr_others_upto() {
        return br_others_upto;
    }
    public void setBr_others_upto(int Br_others_upto) {
        br_others_upto = Br_others_upto;
    }



               public int getBr_contg_target() {
        return br_contg_target;
    }
    public void setBr_contg_target(int Br_contg_target) {
        br_contg_target = Br_contg_target;
    }
        public int getBr_contg_tomonth() {
        return br_contg_tomonth;
    }
    public void setBr_contg_tomonth(int Br_contg_tomonth) {
        br_contg_tomonth = Br_contg_tomonth;
    }
        public int getBr_contg_upto() {
        return br_contg_upto;
    }
    public void setBr_contg_upto(int Br_contg_upto) {
        br_contg_upto = Br_contg_upto;
    }






       public int getBr_others_target_1() {
        return br_others_target_1;
    }
    public void setBr_others_target_1(int Br_others_target_1) {
        br_others_target_1 = Br_others_target_1;
    }
             public int getBr_others_tomonth_1() {
        return br_others_tomonth_1;
    }
    public void setBr_others_tomonth_1(int Br_others_tomonth_1) {
        br_others_tomonth_1 = Br_others_tomonth_1;
    }

       public int getBr_others_upto_1() {
        return br_others_upto_1;
    }
    public void setBr_others_upto_1(int Br_others_upto_1) {
        br_others_upto_1 = Br_others_upto_1;
    }



               public int getBr_contg_target_1() {
        return br_contg_target_1;
    }
    public void setBr_contg_target_1(int Br_contg_target_1) {
        br_contg_target_1 = Br_contg_target_1;
    }
        public int getBr_contg_tomonth_1() {
        return br_contg_tomonth_1;
    }
    public void setBr_contg_tomonth_1(int Br_contg_tomonth_1) {
        br_contg_tomonth_1 = Br_contg_tomonth_1;
    }
        public int getBr_contg_upto_1() {
        return br_contg_upto_1;
    }
    public void setBr_contg_upto_1(int Br_contg_upto_1) {
        br_contg_upto_1 = Br_contg_upto_1;
    }










       public int getBr_others_target_2() {
        return br_others_target_2;
    }
    public void setBr_others_target_2(int Br_others_target_2) {
        br_others_target_2 = Br_others_target_2;
    }
             public int getBr_others_tomonth_2() {
        return br_others_tomonth_2;
    }
    public void setBr_others_tomonth_2(int Br_others_tomonth_2) {
        br_others_tomonth_2 = Br_others_tomonth_2;
    }

       public int getBr_others_upto_2() {
        return br_others_upto_2;
    }
    public void setBr_others_upto_2(int Br_others_upto_2) {
        br_others_upto_2 = Br_others_upto_2;
    }



               public int getBr_contg_target_2() {
        return br_contg_target_2;
    }
    public void setBr_contg_target_2(int Br_contg_target_2) {
        br_contg_target_2 = Br_contg_target_2;
    }
        public int getBr_contg_tomonth_2() {
        return br_contg_tomonth_2;
    }
    public void setBr_contg_tomonth_2(int Br_contg_tomonth_2) {
        br_contg_tomonth_2 = Br_contg_tomonth_2;
    }
        public int getBr_contg_upto_2() {
        return br_contg_upto_2;
    }
    public void setBr_contg_upto_2(int Br_contg_upto_2) {
        br_contg_upto_2 = Br_contg_upto_2;
    }






       public int getBr_others_target_3() {
        return br_others_target_3;
    }
    public void setBr_others_target_3(int Br_others_target_3) {
        br_others_target_3 = Br_others_target_3;
    }
             public int getBr_others_tomonth_3() {
        return br_others_tomonth_3;
    }
    public void setBr_others_tomonth_3(int Br_others_tomonth_3) {
        br_others_tomonth_3 = Br_others_tomonth_3;
    }

       public int getBr_others_upto_3() {
        return br_others_upto_3;
    }
    public void setBr_others_upto_3(int Br_others_upto_3) {
        br_others_upto_3 = Br_others_upto_3;
    }



               public int getBr_contg_target_3() {
        return br_contg_target_3;
    }
    public void setBr_contg_target_3(int Br_contg_target_3) {
        br_contg_target_3 = Br_contg_target_3;
    }
        public int getBr_contg_tomonth_3() {
        return br_contg_tomonth_3;
    }
    public void setBr_contg_tomonth_3(int Br_contg_tomonth_3) {
        br_contg_tomonth_3 = Br_contg_tomonth_3;
    }
        public int getBr_contg_upto_3() {
        return br_contg_upto_3;
    }
    public void setBr_contg_upto_3(int Br_contg_upto_3) {
        br_contg_upto_3 = Br_contg_upto_3;
    }





       public int getBr_others_target_4() {
        return br_others_target_4;
    }
    public void setBr_others_target_4(int Br_others_target_4) {
        br_others_target_4 = Br_others_target_4;
    }
             public int getBr_others_tomonth_4() {
        return br_others_tomonth_4;
    }
    public void setBr_others_tomonth_4(int Br_others_tomonth_4) {
        br_others_tomonth_4 = Br_others_tomonth_4;
    }

       public int getBr_others_upto_4() {
        return br_others_upto_4;
    }
    public void setBr_others_upto_4(int Br_others_upto_4) {
        br_others_upto_4 = Br_others_upto_4;
    }



               public int getBr_contg_target_4() {
        return br_contg_target_4;
    }
    public void setBr_contg_target_4(int Br_contg_target_4) {
        br_contg_target_4 = Br_contg_target_4;
    }
        public int getBr_contg_tomonth_4() {
        return br_contg_tomonth_4;
    }
    public void setBr_contg_tomonth_4(int Br_contg_tomonth_4) {
        br_contg_tomonth_4 = Br_contg_tomonth_4;
    }
        public int getBr_contg_upto_4() {
        return br_contg_upto_4;
    }
    public void setBr_contg_upto_4(int Br_contg_upto_4) {
        br_contg_upto_4 = Br_contg_upto_4;
    }











       public int getBr_others_target_5() {
        return br_others_target_5;
    }
    public void setBr_others_target_5(int Br_others_target_5) {
        br_others_target_5 = Br_others_target_5;
    }
             public int getBr_others_tomonth_5() {
        return br_others_tomonth_5;
    }
    public void setBr_others_tomonth_5(int Br_others_tomonth_5) {
        br_others_tomonth_5 = Br_others_tomonth_5;
    }

       public int getBr_others_upto_5() {
        return br_others_upto_5;
    }
    public void setBr_others_upto_5(int Br_others_upto_5) {
        br_others_upto_5 = Br_others_upto_5;
    }



               public int getBr_contg_target_5() {
        return br_contg_target_5;
    }
    public void setBr_contg_target_5(int Br_contg_target_5) {
        br_contg_target_5 = Br_contg_target_5;
    }
        public int getBr_contg_tomonth_5() {
        return br_contg_tomonth_5;
    }
    public void setBr_contg_tomonth_5(int Br_contg_tomonth_5) {
        br_contg_tomonth_5 = Br_contg_tomonth_5;
    }
        public int getBr_contg_upto_5() {
        return br_contg_upto_5;
    }
    public void setBr_contg_upto_5(int Br_contg_upto_5) {
        br_contg_upto_5 = Br_contg_upto_5;
    }






             private int br_contg_target_1;
           private int br_contg_tomonth_1;
            private int br_contg_upto_1;
               private int br_others_target_1;
           private int br_others_tomonth_1;
            private int br_others_upto_1;


             private int br_contg_target_2;
           private int br_contg_tomonth_2;
            private int br_contg_upto_2;
               private int br_others_target_2;
           private int br_others_tomonth_2;
            private int br_others_upto_2;


             private int br_contg_target_3;
           private int br_contg_tomonth_3;
            private int br_contg_upto_3;
               private int br_others_target_3;
           private int br_others_tomonth_3;
            private int br_others_upto_3;


             private int br_contg_target_4;
           private int br_contg_tomonth_4;
            private int br_contg_upto_4;
               private int br_others_target_4;
           private int br_others_tomonth_4;
            private int br_others_upto_4;


               private int br_contg_target_5;
           private int br_contg_tomonth_5;
            private int br_contg_upto_5;
               private int br_others_target_5;
           private int br_others_tomonth_5;
            private int br_others_upto_5;











             public int getBr_con_tomonth_5() {
        return br_con_tomonth_5;
    }
    public void setBr_con_tomonth_5(int Br_con_tomonth_5) {
        br_con_tomonth_5 = Br_con_tomonth_5;
    }
     public int getBr_con_upto_5() {
        return br_con_upto_5;
    }
    public void setBr_con_upto_5(int Br_con_upto_5) {
        br_con_upto_5 = Br_con_upto_5;
    }




        public int getBr_con_target_5() {
        return br_con_target_5;
    }
    public void setBr_con_target_5(int Br_con_target_5) {
        br_con_target_5 = Br_con_target_5;
    }

         public int getBr_hardware_upto_5() {
        return br_hardware_upto_5;
    }
    public void setBr_hardware_upto_5(int Br_hardware_upto_5) {
        br_hardware_upto_5 = Br_hardware_upto_5;
    }




     public int getBr_hardware_tomonth_5() {
        return br_hardware_tomonth_5;
    }
    public void setBr_hardware_tomonth_5(int Br_hardware_tomonth_5) {
        br_hardware_tomonth_5 = Br_hardware_tomonth_5;
    }
     public String getBranch_5() {
        return branch_5;
    }
    public void setBranch_5(String Branch_5) {
        branch_5 = Branch_5;
    }
     public int getBr_hardware_target_5() {
        return br_hardware_target_5;
    }
    public void setBr_hardware_target_5(int Br_hardware_target_5) {
        br_hardware_target_5 = Br_hardware_target_5;
    }





     private String user_date;
     private String instId;
     private String years;
     private int months;


     public int getAmc_of_pc() {
        return amc_of_pc;
    }
    public void setAmc_of_pc(int Amc_of_pc) {
        amc_of_pc = Amc_of_pc;
    }



    public int getAmc_of_pc1() {
        return amc_of_pc1;
    }
    public void setAmc_of_pc1(int Amc_of_pc1) {
        amc_of_pc1 = Amc_of_pc1;
    }



    public int getAmc_of_pc2() {
        return amc_of_pc2;
    }
    public void setAmc_of_pc2(int Amc_of_pc2) {
        amc_of_pc2 = Amc_of_pc2;
    }
    public int getWeb() {
        return web;
    }
    public void setWeb(int Web) {
        web = Web;
    }
      public int getWeb1() {
        return web1;
    }
    public void setWeb1(int Web1) {
        web1 = Web1;
    }
      public int getWeb2() {
        return web2;
    }
    public void setWeb2(int Web2) {
        web2 = Web2;
    }


    public int getConnectivity() {
        return connectivity;
    }
    public void setConnectivity(int Connectivity) {
        connectivity = Connectivity;
    }
       public int getConnectivity1() {
        return connectivity1;
    }
    public void setConnectivity1(int Connectivity1) {
        connectivity1 = Connectivity1;
    }
       public int getConnectivity2() {
        return connectivity2;
    }
    public void setConnectivity2(int Connectivity2) {
        connectivity2 = Connectivity2;
    }
     public int getContg() {
        return contg;
    }
    public void setContg(int Contg) {
        contg = Contg;
    }
     public int getContg1() {
        return contg1;
    }
    public void setContg1(int Contg1) {
        contg1 = Contg1;
    }
     public int getContg2() {
        return contg2;
    }
    public void setContg2(int Contg2) {
        contg2 = Contg2;
    }
        public int getOthers() {
        return others;
    }
    public void setOthers(int Others) {
        others = Others;
    }
    public int getOthers1() {
        return others1;
    }
    public void setOthers1(int Others1) {
        others1 = Others1;
    }
    public int getOthers2() {
        return others2;
    }
    public void setOthers2(int Others2) {
        others2 = Others2;
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
            public int getBr_con_tomonth() {
        return br_con_tomonth;
    }
    public void setBr_con_tomonth(int Br_con_tomonth) {
        br_con_tomonth = Br_con_tomonth;
    }
     public int getBr_con_upto() {
        return br_con_upto;
    }
    public void setBr_con_upto(int Br_con_upto) {
        br_con_upto = Br_con_upto;
    }




        public int getBr_con_target() {
        return br_con_target;
    }
    public void setBr_con_target(int Br_con_target) {
        br_con_target = Br_con_target;
    }

         public int getBr_hardware_upto() {
        return br_hardware_upto;
    }
    public void setBr_hardware_upto(int Br_hardware_upto) {
        br_hardware_upto = Br_hardware_upto;
    }




     public int getBr_hardware_tomonth() {
        return br_hardware_tomonth;
    }
    public void setBr_hardware_tomonth(int Br_hardware_tomonth) {
        br_hardware_tomonth = Br_hardware_tomonth;
    }
     public String getBranch() {
        return branch;
    }
    public void setBranch(String Branch) {
        branch = Branch;
    }
     public int getBr_hardware_target() {
        return br_hardware_target;
    }
    public void setBr_hardware_target(int Br_hardware_target) {
        br_hardware_target = Br_hardware_target;
    }

           public int getBr_con_tomonth_1() {
        return br_con_tomonth_1;
    }
    public void setBr_con_tomonth_1(int Br_con_tomonth_1) {
        br_con_tomonth_1 = Br_con_tomonth_1;
    }
     public int getBr_con_upto_1() {
        return br_con_upto_1;
    }
    public void setBr_con_upto_1(int Br_con_upto_1) {
        br_con_upto_1 = Br_con_upto_1;
    }




        public int getBr_con_target_1() {
        return br_con_target_1;
    }
    public void setBr_con_target_1(int Br_con_target_1) {
        br_con_target_1 = Br_con_target_1;
    }

         public int getBr_hardware_upto_1() {
        return br_hardware_upto_1;
    }
    public void setBr_hardware_upto_1(int Br_hardware_upto_1) {
        br_hardware_upto_1 = Br_hardware_upto_1;
    }




     public int getBr_hardware_tomonth_1() {
        return br_hardware_tomonth_1;
    }
    public void setBr_hardware_tomonth_1(int Br_hardware_tomonth_1) {
        br_hardware_tomonth_1 = Br_hardware_tomonth_1;
    }
     public String getBranch_1() {
        return branch_1;
    }
    public void setBranch_1(String Branch_1) {
        branch_1 = Branch_1;
    }
     public int getBr_hardware_target_1() {
        return br_hardware_target_1;
    }
    public void setBr_hardware_target_1(int Br_hardware_target_1) {
        br_hardware_target_1 = Br_hardware_target_1;
    }




            public int getBr_con_tomonth_2() {
        return br_con_tomonth_2;
    }
    public void setBr_con_tomonth_2(int Br_con_tomonth_2) {
        br_con_tomonth_2 = Br_con_tomonth_2;
    }
     public int getBr_con_upto_2() {
        return br_con_upto_2;
    }
    public void setBr_con_upto_2(int Br_con_upto_2) {
        br_con_upto_2 = Br_con_upto_2;
    }




        public int getBr_con_target_2() {
        return br_con_target_2;
    }
    public void setBr_con_target_2(int Br_con_target_2) {
        br_con_target_2 = Br_con_target_2;
    }

         public int getBr_hardware_upto_2() {
        return br_hardware_upto_2;
    }
    public void setBr_hardware_upto_2(int Br_hardware_upto_2) {
        br_hardware_upto_2 = Br_hardware_upto_2;
    }




     public int getBr_hardware_tomonth_2() {
        return br_hardware_tomonth_2;
    }
    public void setBr_hardware_tomonth_2(int Br_hardware_tomonth_2) {
        br_hardware_tomonth_2 = Br_hardware_tomonth_2;
    }
     public String getBranch_2() {
        return branch_2;
    }
    public void setBranch_2(String Branch_2) {
        branch_2 = Branch_2;
    }
     public int getBr_hardware_target_2() {
        return br_hardware_target_2;
    }
    public void setBr_hardware_target_2(int Br_hardware_target_2) {
        br_hardware_target_2 = Br_hardware_target_2;
    }





















            public int getBr_con_tomonth_3() {
        return br_con_tomonth_3;
    }
    public void setBr_con_tomonth_3(int Br_con_tomonth_3) {
        br_con_tomonth_3 = Br_con_tomonth_3;
    }
     public int getBr_con_upto_3() {
        return br_con_upto_3;
    }
    public void setBr_con_upto_3(int Br_con_upto_3) {
        br_con_upto_3 = Br_con_upto_3;
    }




        public int getBr_con_target_3() {
        return br_con_target_3;
    }
    public void setBr_con_target_3(int Br_con_target_3) {
        br_con_target_3 = Br_con_target_3;
    }

         public int getBr_hardware_upto_3() {
        return br_hardware_upto_3;
    }
    public void setBr_hardware_upto_3(int Br_hardware_upto_3) {
        br_hardware_upto_3 = Br_hardware_upto_3;
    }




     public int getBr_hardware_tomonth_3() {
        return br_hardware_tomonth_3;
    }
    public void setBr_hardware_tomonth_3(int Br_hardware_tomonth_3) {
        br_hardware_tomonth_3 = Br_hardware_tomonth_3;
    }
     public String getBranch_3() {
        return branch_3;
    }
    public void setBranch_3(String Branch_3) {
        branch_3 = Branch_3;
    }
     public int getBr_hardware_target_3() {
        return br_hardware_target_3;
    }
    public void setBr_hardware_target_3(int Br_hardware_target_3) {
        br_hardware_target_3 = Br_hardware_target_3;
    }



























            public int getBr_con_tomonth_4() {
        return br_con_tomonth_4;
    }
    public void setBr_con_tomonth_4(int Br_con_tomonth_4) {
        br_con_tomonth_4 = Br_con_tomonth_4;
    }
     public int getBr_con_upto_4() {
        return br_con_upto_4;
    }
    public void setBr_con_upto_4(int Br_con_upto_4) {
        br_con_upto_4 = Br_con_upto_4;
    }




        public int getBr_con_target_4() {
        return br_con_target_4;
    }
    public void setBr_con_target_4(int Br_con_target_4) {
        br_con_target_4 = Br_con_target_4;
    }

         public int getBr_hardware_upto_4() {
        return br_hardware_upto_4;
    }
    public void setBr_hardware_upto_4(int Br_hardware_upto_4) {
        br_hardware_upto_4 = Br_hardware_upto_4;
    }




     public int getBr_hardware_tomonth_4() {
        return br_hardware_tomonth_4;
    }
    public void setBr_hardware_tomonth_4(int Br_hardware_tomonth_4) {
        br_hardware_tomonth_4 = Br_hardware_tomonth_4;
    }
     public String getBranch_4() {
        return branch_4;
    }
    public void setBranch_4(String Branch_4) {
        branch_4 = Branch_4;
    }
     public int getBr_hardware_target_4() {
        return br_hardware_target_4;
    }
    public void setBr_hardware_target_4(int Br_hardware_target_4) {
        br_hardware_target_4 = Br_hardware_target_4;
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










   