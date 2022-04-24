/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import common.ConnectionManager;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.*;
import java.util.*;
import java.lang.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Senet
 */
public class EisServ extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            //* Get the value from current posting *//
             HttpSession session = request.getSession();
             String Crosssite=(String)session.getAttribute("nmm");
             System.out.println("crosssite we get=="+Crosssite);
             session.setAttribute("Crosssite",Crosssite);
             if (!Crosssite.equals(null))
    {
        String email=(String)session.getAttribute("email");
        int fCount=0;
        Connection con15=null;
          ResultSet rs15=null;
               try{
               con15 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt15 = con15.createStatement();
               String sql15="Select * from eis_final where email='"+email+"'";
               rs15=stmt15.executeQuery(sql15);
 if(rs15.next())
 {
  fCount=1;
 }
 else
 {
  fCount=0;
 }

 con15.close();
}
 catch (Exception e) {
e.printStackTrace();
}
          if(fCount==0)
          {
    String curr_ofctype =request.getParameter("cur_ofctype");
    String curr_ofcname =request.getParameter("state");
    String curr_despln =request.getParameter("curr_despln");
    String curr_doj =request.getParameter("curr_doj");
    if(curr_ofctype=="" || curr_ofctype.equals(null))
        {
        curr_ofctype="0";
    }
if(curr_ofcname=="" || curr_ofcname.equals(null))
        {
        curr_ofcname="0";
    }
    if(curr_despln=="" || curr_despln.equals(null))
        {
        curr_despln="0";
    }
    if(curr_doj=="" || curr_doj.equals(null))
        {
        curr_doj="0";
    }
    System.out.println("Current   "+curr_ofcname+" in "+curr_ofctype+" with post"+curr_despln);
   System.out.println("Working since  "+curr_doj);
    // get value from posting history
     String num=request.getParameter("nam");
        int counter=Integer.parseInt(num)-1;

        ArrayList<String> name=new ArrayList<String>();
        ArrayList<String> design=new ArrayList<String>();
        ArrayList<String> mode=new ArrayList<String>();
        ArrayList<String> ph_frm=new ArrayList<String>();
        ArrayList<String> ph_to=new ArrayList<String>();
      //  String name1=request.getParameter("name");

        name.add(request.getParameter("name[1]"));
        design.add(request.getParameter("desig[1]"));
        mode.add(request.getParameter("mode[1]"));
        ph_frm.add(request.getParameter("frm[1]"));
        ph_to.add(request.getParameter("to[1]"));

        System.out.println("ofc name==="+name.get(0));
        System.out.println("ofc name==="+design.get(0));
        System.out.println("ofc name==="+mode.get(0));
        System.out.println("ofc name==="+ph_frm.get(0));
        System.out.println("ofc name==="+ph_to.get(0));
        if(counter==2)
            {
        name.add(request.getParameter("name[2]"));
        design.add(request.getParameter("desig[2]"));
        mode.add(request.getParameter("mode[2]"));
        ph_frm.add(request.getParameter("frm[2]"));
        ph_to.add(request.getParameter("to[2]"));
       }

          if(counter==3)
            {
        name.add(request.getParameter("name[2]"));
        design.add(request.getParameter("desig[2]"));
        mode.add(request.getParameter("mode[2]"));
        ph_frm.add(request.getParameter("frm[2]"));
        ph_to.add(request.getParameter("to[2]"));

        name.add(request.getParameter("name[3]"));
        design.add(request.getParameter("desig[3]"));
        mode.add(request.getParameter("mode[3]"));
        ph_frm.add(request.getParameter("frm[3]"));
        ph_to.add(request.getParameter("to[3]"));

       }

        if(counter==4)
            {
        name.add(request.getParameter("name[2]"));
        design.add(request.getParameter("desig[2]"));
        mode.add(request.getParameter("mode[2]"));
        ph_frm.add(request.getParameter("frm[2]"));
        ph_to.add(request.getParameter("to[2]"));

        name.add(request.getParameter("name[3]"));
        design.add(request.getParameter("desig[3]"));
        mode.add(request.getParameter("mode[3]"));
        ph_frm.add(request.getParameter("frm[3]"));
        ph_to.add(request.getParameter("to[3]"));

        name.add(request.getParameter("name[4]"));
        design.add(request.getParameter("desig[4]"));
        mode.add(request.getParameter("mode[4]"));
        ph_frm.add(request.getParameter("frm[4]"));
        ph_to.add(request.getParameter("to[4]"));

       }

        if(counter==5)
            {
        name.add(request.getParameter("name[2]"));
        design.add(request.getParameter("desig[2]"));
        mode.add(request.getParameter("mode[2]"));
        ph_frm.add(request.getParameter("frm[2]"));
        ph_to.add(request.getParameter("to[2]"));

        name.add(request.getParameter("name[3]"));
        design.add(request.getParameter("desig[3]"));
        mode.add(request.getParameter("mode[3]"));
        ph_frm.add(request.getParameter("frm[3]"));
        ph_to.add(request.getParameter("to[3]"));

        name.add(request.getParameter("name[4]"));
        design.add(request.getParameter("desig[4]"));
        mode.add(request.getParameter("mode[4]"));
        ph_frm.add(request.getParameter("frm[4]"));
        ph_to.add(request.getParameter("to[4]"));

         name.add(request.getParameter("name[5]"));
        design.add(request.getParameter("desig[5]"));
        mode.add(request.getParameter("mode[5]"));
        ph_frm.add(request.getParameter("frm[5]"));
        ph_to.add(request.getParameter("to[5]"));

       }

        if(counter==6)
            {
        name.add(request.getParameter("name[2]"));
        design.add(request.getParameter("desig[2]"));
        mode.add(request.getParameter("mode[2]"));
        ph_frm.add(request.getParameter("frm[2]"));
        ph_to.add(request.getParameter("to[2]"));

        name.add(request.getParameter("name[3]"));
        design.add(request.getParameter("desig[3]"));
        mode.add(request.getParameter("mode[3]"));
        ph_frm.add(request.getParameter("frm[3]"));
        ph_to.add(request.getParameter("to[3]"));

        name.add(request.getParameter("name[4]"));
        design.add(request.getParameter("desig[4]"));
        mode.add(request.getParameter("mode[4]"));
        ph_frm.add(request.getParameter("frm[4]"));
        ph_to.add(request.getParameter("to[4]"));

         name.add(request.getParameter("name[5]"));
        design.add(request.getParameter("desig[5]"));
        mode.add(request.getParameter("mode[5]"));
        ph_frm.add(request.getParameter("frm[5]"));
        ph_to.add(request.getParameter("to[5]"));

        name.add(request.getParameter("name[6]"));
        design.add(request.getParameter("desig[6]"));
        mode.add(request.getParameter("mode[6]"));
        ph_frm.add(request.getParameter("frm[6]"));
        ph_to.add(request.getParameter("to[6]"));
       }

        if(counter==7)
            {
        name.add(request.getParameter("name[2]"));
        design.add(request.getParameter("desig[2]"));
        mode.add(request.getParameter("mode[2]"));
        ph_frm.add(request.getParameter("frm[2]"));
        ph_to.add(request.getParameter("to[2]"));

        name.add(request.getParameter("name[3]"));
        design.add(request.getParameter("desig[3]"));
        mode.add(request.getParameter("mode[3]"));
        ph_frm.add(request.getParameter("frm[3]"));
        ph_to.add(request.getParameter("to[3]"));

        name.add(request.getParameter("name[4]"));
        design.add(request.getParameter("desig[4]"));
        mode.add(request.getParameter("mode[4]"));
        ph_frm.add(request.getParameter("frm[4]"));
        ph_to.add(request.getParameter("to[4]"));

         name.add(request.getParameter("name[5]"));
        design.add(request.getParameter("desig[5]"));
        mode.add(request.getParameter("mode[5]"));
        ph_frm.add(request.getParameter("frm[5]"));
        ph_to.add(request.getParameter("to[5]"));

        name.add(request.getParameter("name[6]"));
        design.add(request.getParameter("desig[6]"));
        mode.add(request.getParameter("mode[6]"));
        ph_frm.add(request.getParameter("frm[6]"));
        ph_to.add(request.getParameter("to[6]"));

        name.add(request.getParameter("name[7]"));
        design.add(request.getParameter("desig[7]"));
        mode.add(request.getParameter("mode[7]"));
        ph_frm.add(request.getParameter("frm[7]"));
        ph_to.add(request.getParameter("to[7]"));
       }

        if(counter==8)
            {
        name.add(request.getParameter("name[2]"));
        design.add(request.getParameter("desig[2]"));
        mode.add(request.getParameter("mode[2]"));
        ph_frm.add(request.getParameter("frm[2]"));
        ph_to.add(request.getParameter("to[2]"));

        name.add(request.getParameter("name[3]"));
        design.add(request.getParameter("desig[3]"));
        mode.add(request.getParameter("mode[3]"));
        ph_frm.add(request.getParameter("frm[3]"));
        ph_to.add(request.getParameter("to[3]"));

        name.add(request.getParameter("name[4]"));
        design.add(request.getParameter("desig[4]"));
        mode.add(request.getParameter("mode[4]"));
        ph_frm.add(request.getParameter("frm[4]"));
        ph_to.add(request.getParameter("to[4]"));

         name.add(request.getParameter("name[5]"));
        design.add(request.getParameter("desig[5]"));
        mode.add(request.getParameter("mode[5]"));
        ph_frm.add(request.getParameter("frm[5]"));
        ph_to.add(request.getParameter("to[5]"));

        name.add(request.getParameter("name[6]"));
        design.add(request.getParameter("desig[6]"));
        mode.add(request.getParameter("mode[6]"));
        ph_frm.add(request.getParameter("frm[6]"));
        ph_to.add(request.getParameter("to[6]"));

        name.add(request.getParameter("name[7]"));
        design.add(request.getParameter("desig[7]"));
        mode.add(request.getParameter("mode[7]"));
        ph_frm.add(request.getParameter("frm[7]"));
        ph_to.add(request.getParameter("to[7]"));

        name.add(request.getParameter("name[8]"));
        design.add(request.getParameter("desig[8]"));
        mode.add(request.getParameter("mode[8]"));
        ph_frm.add(request.getParameter("frm[8]"));
        ph_to.add(request.getParameter("to[8]"));
       }

        if(counter==9)
            {
        name.add(request.getParameter("name[2]"));
        design.add(request.getParameter("desig[2]"));
        mode.add(request.getParameter("mode[2]"));
        ph_frm.add(request.getParameter("frm[2]"));
        ph_to.add(request.getParameter("to[2]"));

        name.add(request.getParameter("name[3]"));
        design.add(request.getParameter("desig[3]"));
        mode.add(request.getParameter("mode[3]"));
        ph_frm.add(request.getParameter("frm[3]"));
        ph_to.add(request.getParameter("to[3]"));

        name.add(request.getParameter("name[4]"));
        design.add(request.getParameter("desig[4]"));
        mode.add(request.getParameter("mode[4]"));
        ph_frm.add(request.getParameter("frm[4]"));
        ph_to.add(request.getParameter("to[4]"));

         name.add(request.getParameter("name[5]"));
        design.add(request.getParameter("desig[5]"));
        mode.add(request.getParameter("mode[5]"));
        ph_frm.add(request.getParameter("frm[5]"));
        ph_to.add(request.getParameter("to[5]"));

        name.add(request.getParameter("name[6]"));
        design.add(request.getParameter("desig[6]"));
        mode.add(request.getParameter("mode[6]"));
        ph_frm.add(request.getParameter("frm[6]"));
        ph_to.add(request.getParameter("to[6]"));

        name.add(request.getParameter("name[7]"));
        design.add(request.getParameter("desig[7]"));
        mode.add(request.getParameter("mode[7]"));
        ph_frm.add(request.getParameter("frm[7]"));
        ph_to.add(request.getParameter("to[7]"));

        name.add(request.getParameter("name[8]"));
        design.add(request.getParameter("desig[8]"));
        mode.add(request.getParameter("mode[8]"));
        ph_frm.add(request.getParameter("frm[8]"));
        ph_to.add(request.getParameter("to[8]"));

        name.add(request.getParameter("name[9]"));
        design.add(request.getParameter("desig[9]"));
        mode.add(request.getParameter("mode[9]"));
        ph_frm.add(request.getParameter("frm[9]"));
        ph_to.add(request.getParameter("to[9]"));
       }

        if(counter==10)
            {
        name.add(request.getParameter("name[2]"));
        design.add(request.getParameter("desig[2]"));
        mode.add(request.getParameter("mode[2]"));
        ph_frm.add(request.getParameter("frm[2]"));
        ph_to.add(request.getParameter("to[2]"));

        name.add(request.getParameter("name[3]"));
        design.add(request.getParameter("desig[3]"));
        mode.add(request.getParameter("mode[3]"));
        ph_frm.add(request.getParameter("frm[3]"));
        ph_to.add(request.getParameter("to[3]"));

        name.add(request.getParameter("name[4]"));
        design.add(request.getParameter("desig[4]"));
        mode.add(request.getParameter("mode[4]"));
        ph_frm.add(request.getParameter("frm[4]"));
        ph_to.add(request.getParameter("to[4]"));

         name.add(request.getParameter("name[5]"));
        design.add(request.getParameter("desig[5]"));
        mode.add(request.getParameter("mode[5]"));
        ph_frm.add(request.getParameter("frm[5]"));
        ph_to.add(request.getParameter("to[5]"));

        name.add(request.getParameter("name[6]"));
        design.add(request.getParameter("desig[6]"));
        mode.add(request.getParameter("mode[6]"));
        ph_frm.add(request.getParameter("frm[6]"));
        ph_to.add(request.getParameter("to[6]"));

        name.add(request.getParameter("name[7]"));
        design.add(request.getParameter("desig[7]"));
        mode.add(request.getParameter("mode[7]"));
        ph_frm.add(request.getParameter("frm[7]"));
        ph_to.add(request.getParameter("to[7]"));

        name.add(request.getParameter("name[8]"));
        design.add(request.getParameter("desig[8]"));
        mode.add(request.getParameter("mode[8]"));
        ph_frm.add(request.getParameter("frm[8]"));
        ph_to.add(request.getParameter("to[8]"));

        name.add(request.getParameter("name[10]"));
        design.add(request.getParameter("desig[10]"));
        mode.add(request.getParameter("mode[10]"));
        ph_frm.add(request.getParameter("frm[10]"));
        ph_to.add(request.getParameter("to[10]"));
       }


    // Get value from posting preferences
    String pst_pref_1 =request.getParameter("pst_pref_1");
    String pst_pref_2 =request.getParameter("pst_pref_2");
    String pst_pref_3 =request.getParameter("pst_pref_3");
     if(pst_pref_1=="" || pst_pref_1.equals(null))
        {
        pst_pref_1="0";
    }

    if(pst_pref_2=="" || pst_pref_2.equals(null))
        {
        pst_pref_2="0";
    }

    if(pst_pref_3=="" || pst_pref_3.equals(null))
        {
        pst_pref_3="0";
    }

  System.out.println("post preferences : 1. "+pst_pref_1+" 2. "+pst_pref_2+" 3. "+pst_pref_3);

 //Yourself
    String your_spl_area =request.getParameter("your_spl_area");
    String your_spl_pref =request.getParameter("your_spl_pref");

   if(your_spl_area=="" || your_spl_area.equals(null))
        {
        your_spl_area="0";
    }

    if(your_spl_pref=="" || your_spl_pref.equals(null))
        {
        your_spl_pref="0";
    }


System.out.println("your specailization : "+your_spl_area+" and preferences "+your_spl_pref);

    // get the value from trining completed
String no=request.getParameter("val");
int counterTc=Integer.parseInt(no)-1;
System.out.println("no of tc===="+no);

        ArrayList<String> tcName=new ArrayList<String>();
        ArrayList<String> tcFrom=new ArrayList<String>();
        ArrayList<String> tcTo=new ArrayList<String>();


        tcName.add(request.getParameter("tcname[1]"));
        tcFrom.add(request.getParameter("tcfrom[1]"));
        tcTo.add(request.getParameter("tcto[1]"));

        if(counterTc==2)
            {
        tcName.add(request.getParameter("tcname[2]"));
        tcFrom.add(request.getParameter("tcfrom[2]"));
        tcTo.add(request.getParameter("tcto[2]"));
       }

        if(counterTc==3)
            {
        tcName.add(request.getParameter("tcname[2]"));
        tcFrom.add(request.getParameter("tcfrom[2]"));
        tcTo.add(request.getParameter("tcto[2]"));

        tcName.add(request.getParameter("tcname[3]"));
        tcFrom.add(request.getParameter("tcfrom[3]"));
        tcTo.add(request.getParameter("tcto[3]"));
       }

        if(counterTc==4)
            {
        tcName.add(request.getParameter("tcname[2]"));
        tcFrom.add(request.getParameter("tcfrom[2]"));
        tcTo.add(request.getParameter("tcto[2]"));

        tcName.add(request.getParameter("tcname[3]"));
        tcFrom.add(request.getParameter("tcfrom[3]"));
        tcTo.add(request.getParameter("tcto[3]"));

        tcName.add(request.getParameter("tcname[4]"));
        tcFrom.add(request.getParameter("tcfrom[4]"));
        tcTo.add(request.getParameter("tcto[4]"));
       }

        if(counterTc==5)
            {
        tcName.add(request.getParameter("tcname[2]"));
        tcFrom.add(request.getParameter("tcfrom[2]"));
        tcTo.add(request.getParameter("tcto[2]"));

        tcName.add(request.getParameter("tcname[3]"));
        tcFrom.add(request.getParameter("tcfrom[3]"));
        tcTo.add(request.getParameter("tcto[3]"));

        tcName.add(request.getParameter("tcname[4]"));
        tcFrom.add(request.getParameter("tcfrom[4]"));
        tcTo.add(request.getParameter("tcto[4]"));

        tcName.add(request.getParameter("tcname[5]"));
        tcFrom.add(request.getParameter("tcfrom[5]"));
        tcTo.add(request.getParameter("tcto[5]"));
       }

        if(counterTc==6)
            {
        tcName.add(request.getParameter("tcname[2]"));
        tcFrom.add(request.getParameter("tcfrom[2]"));
        tcTo.add(request.getParameter("tcto[2]"));

        tcName.add(request.getParameter("tcname[3]"));
        tcFrom.add(request.getParameter("tcfrom[3]"));
        tcTo.add(request.getParameter("tcto[3]"));

        tcName.add(request.getParameter("tcname[4]"));
        tcFrom.add(request.getParameter("tcfrom[4]"));
        tcTo.add(request.getParameter("tcto[4]"));

        tcName.add(request.getParameter("tcname[5]"));
        tcFrom.add(request.getParameter("tcfrom[5]"));
        tcTo.add(request.getParameter("tcto[5]"));

        tcName.add(request.getParameter("tcname[6]"));
        tcFrom.add(request.getParameter("tcfrom[6]"));
        tcTo.add(request.getParameter("tcto[6]"));
       }

        if(counterTc==7)
            {
        tcName.add(request.getParameter("tcname[2]"));
        tcFrom.add(request.getParameter("tcfrom[2]"));
        tcTo.add(request.getParameter("tcto[2]"));

        tcName.add(request.getParameter("tcname[3]"));
        tcFrom.add(request.getParameter("tcfrom[3]"));
        tcTo.add(request.getParameter("tcto[3]"));

        tcName.add(request.getParameter("tcname[4]"));
        tcFrom.add(request.getParameter("tcfrom[4]"));
        tcTo.add(request.getParameter("tcto[4]"));

        tcName.add(request.getParameter("tcname[5]"));
        tcFrom.add(request.getParameter("tcfrom[5]"));
        tcTo.add(request.getParameter("tcto[5]"));

        tcName.add(request.getParameter("tcname[6]"));
        tcFrom.add(request.getParameter("tcfrom[6]"));
        tcTo.add(request.getParameter("tcto[6]"));

        tcName.add(request.getParameter("tcname[7]"));
        tcFrom.add(request.getParameter("tcfrom[7]"));
        tcTo.add(request.getParameter("tcto[7]"));
       }

         if(counterTc==8)
            {
        tcName.add(request.getParameter("tcname[2]"));
        tcFrom.add(request.getParameter("tcfrom[2]"));
        tcTo.add(request.getParameter("tcto[2]"));

        tcName.add(request.getParameter("tcname[3]"));
        tcFrom.add(request.getParameter("tcfrom[3]"));
        tcTo.add(request.getParameter("tcto[3]"));

        tcName.add(request.getParameter("tcname[4]"));
        tcFrom.add(request.getParameter("tcfrom[4]"));
        tcTo.add(request.getParameter("tcto[4]"));

        tcName.add(request.getParameter("tcname[5]"));
        tcFrom.add(request.getParameter("tcfrom[5]"));
        tcTo.add(request.getParameter("tcto[5]"));

        tcName.add(request.getParameter("tcname[6]"));
        tcFrom.add(request.getParameter("tcfrom[6]"));
        tcTo.add(request.getParameter("tcto[6]"));

        tcName.add(request.getParameter("tcname[7]"));
        tcFrom.add(request.getParameter("tcfrom[7]"));
        tcTo.add(request.getParameter("tcto[7]"));

         tcName.add(request.getParameter("tcname[8]"));
        tcFrom.add(request.getParameter("tcfrom[8]"));
        tcTo.add(request.getParameter("tcto[8]"));
       }

         if(counterTc==9)
            {
        tcName.add(request.getParameter("tcname[2]"));
        tcFrom.add(request.getParameter("tcfrom[2]"));
        tcTo.add(request.getParameter("tcto[2]"));

        tcName.add(request.getParameter("tcname[3]"));
        tcFrom.add(request.getParameter("tcfrom[3]"));
        tcTo.add(request.getParameter("tcto[3]"));

        tcName.add(request.getParameter("tcname[4]"));
        tcFrom.add(request.getParameter("tcfrom[4]"));
        tcTo.add(request.getParameter("tcto[4]"));

        tcName.add(request.getParameter("tcname[5]"));
        tcFrom.add(request.getParameter("tcfrom[5]"));
        tcTo.add(request.getParameter("tcto[5]"));

        tcName.add(request.getParameter("tcname[6]"));
        tcFrom.add(request.getParameter("tcfrom[6]"));
        tcTo.add(request.getParameter("tcto[6]"));

        tcName.add(request.getParameter("tcname[7]"));
        tcFrom.add(request.getParameter("tcfrom[7]"));
        tcTo.add(request.getParameter("tcto[7]"));

         tcName.add(request.getParameter("tcname[8]"));
        tcFrom.add(request.getParameter("tcfrom[8]"));
        tcTo.add(request.getParameter("tcto[8]"));

        tcName.add(request.getParameter("tcname[9]"));
        tcFrom.add(request.getParameter("tcfrom[9]"));
        tcTo.add(request.getParameter("tcto[9]"));
       }

        if(counterTc==9)
            {
        tcName.add(request.getParameter("tcname[2]"));
        tcFrom.add(request.getParameter("tcfrom[2]"));
        tcTo.add(request.getParameter("tcto[2]"));

        tcName.add(request.getParameter("tcname[3]"));
        tcFrom.add(request.getParameter("tcfrom[3]"));
        tcTo.add(request.getParameter("tcto[3]"));

        tcName.add(request.getParameter("tcname[4]"));
        tcFrom.add(request.getParameter("tcfrom[4]"));
        tcTo.add(request.getParameter("tcto[4]"));

        tcName.add(request.getParameter("tcname[5]"));
        tcFrom.add(request.getParameter("tcfrom[5]"));
        tcTo.add(request.getParameter("tcto[5]"));

        tcName.add(request.getParameter("tcname[6]"));
        tcFrom.add(request.getParameter("tcfrom[6]"));
        tcTo.add(request.getParameter("tcto[6]"));

        tcName.add(request.getParameter("tcname[7]"));
        tcFrom.add(request.getParameter("tcfrom[7]"));
        tcTo.add(request.getParameter("tcto[7]"));

         tcName.add(request.getParameter("tcname[8]"));
        tcFrom.add(request.getParameter("tcfrom[8]"));
        tcTo.add(request.getParameter("tcto[8]"));

        tcName.add(request.getParameter("tcname[9]"));
        tcFrom.add(request.getParameter("tcfrom[9]"));
        tcTo.add(request.getParameter("tcto[9]"));

        tcName.add(request.getParameter("tcname[10]"));
        tcFrom.add(request.getParameter("tcfrom[10]"));
        tcTo.add(request.getParameter("tcto[10]"));
       }


  //* training required
    //1
    String tp_name_req_1 =request.getParameter("tp_name_req_1");
String tp_det_1=request.getParameter("tp_det_1");
    if(tp_name_req_1=="" || tp_name_req_1.equals(null))
        {
        tp_name_req_1="0";
    }
if(tp_det_1=="" || tp_det_1.equals(null))
        {
        tp_det_1="0";
    }

System.out.println("training required 1 :"+tp_name_req_1);
System.out.println("training detail  :"+tp_det_1);

    //2
 String tp_name_req_2 =request.getParameter("tp_name_req_2");
String tp_det_2=request.getParameter("tp_det_2");
    if(tp_name_req_2=="" || tp_name_req_2.equals(null))
        {
        tp_name_req_2="0";
    }
if(tp_det_2=="" || tp_det_2.equals(null))
        {
        tp_det_2="0";
    }

System.out.println("training required 2 :"+tp_name_req_2);
System.out.println("training detail  :"+tp_det_2);

//3
 String tp_name_req_3 =request.getParameter("train_name_req_3");
String tp_det_3=request.getParameter("tp_det_3");
    if(tp_name_req_3=="" || tp_name_req_3.equals(null))
        {
        tp_name_req_3="0";
    }
if(tp_det_3=="" || tp_det_3.equals(null))
        {
        tp_det_3="0";
    }
System.out.println("training required 3 :"+tp_name_req_3);
System.out.println("training detail  :"+tp_det_3);
    //* End * //
       // String ofcType =request.getParameter("ofcType");
       //System.out.println("Office Type :"+ofcType);
      // String name =request.getParameter("bas_name");
      // String designation =request.getParameter("bas_designation");
        String DOB =request.getParameter("dob");
       String doj_gov =request.getParameter("doj_gov");
        String doj_msme =request.getParameter("doj_msme");
        String dat_ret =request.getParameter("dat_ret");
       // String email =request.getParameter("email");
        String bas_descipline =request.getParameter("bas_descipline");
//      String counter = request.getParameter("param");
    //    System.out.println("no of row added   "+counter);

       String name1=(String)session.getAttribute("name");

       String designation=(String)session.getAttribute("userdesig");
        System.out.println("name   "+name1);
        System.out.println("email   "+email);
        System.out.println("designation   "+designation);
        System.out.println("date of birth   "+DOB);
        System.out.println("date of joining Govt service   "+doj_gov);
        System.out.println("date of joining mame service  "+doj_msme);
        System.out.println("date of retirement  "+dat_ret);
        System.out.println("descipline  "+bas_descipline);
        session.setAttribute("name",name1);


        String token1=(String)session.getAttribute("token");
        String user_cur_ofc=(String)session.getAttribute("user_cur_ofc");

        String inst_id="";

        Connection con2=null;
          ResultSet rs2=null;
               try{
               con2 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt2 = con2.createStatement();
               String sql2="Select Inst_id from eis_branch_list where Inst_Name='"+user_cur_ofc+"'";
               rs2=stmt2.executeQuery(sql2);
 while(rs2.next())
 {
     inst_id=rs2.getString("Inst_id");
 }
 con2.close();
}
 catch (Exception e) {
e.printStackTrace();
}

int iCount=0;
          Connection con3=null;
          ResultSet rs3=null;
               try{
               con3 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt3 = con3.createStatement();
               String sql3="Select * from eis_basicinfo where email='"+email+"'";
               rs3=stmt3.executeQuery(sql3);
 while(rs3.next())
 {
     iCount=1;
 }
 con3.close();
}
 catch (Exception e) {
e.printStackTrace();
}




System.out.println("token====="+token1);
int finalSubmit=1 ;

    if(iCount==1)
        {

         int flag=0;
         ResultSet rs= null;
         String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";
               try{
 Connection con = DriverManager.getConnection(connectionUrl+dbName, userId, password);

Statement st=con.createStatement();
String sql1="delete from eis_postinginfo where email='"+email+"'";
int rs1=st.executeUpdate(sql1);
String sql4="delete from eis_traininginfo where email='"+email+"'";
int rs4=st.executeUpdate(sql4);

//String  sql1 ="insert into eis_basicinfo values ('"+token1+"','"+email+"','"+inst_id+"','"+name+"','"+designation+"','"+DOB+"','"+dat_ret+"'," +
 //              "'"+bas_descipline+"','"+doj_gov+"','"+doj_msme+"')";

//int rs1 = st.executeUpdate(sql1);

String sql2="insert into eis_postinginfo values ('"+email+"','"+curr_ofctype+"','"+curr_ofcname+"','"+curr_despln+"'," +
               "'"+curr_doj+"','"+pst_pref_1+"','"+pst_pref_2+"'," +
               "'"+pst_pref_3+"','"+your_spl_area+"','"+your_spl_pref+"')";
String sql7="";
int rs7=0;

for(int k=0; k<name.size(); k++)
    {


    System.out.println("office name==="+name.get(k));
    sql7="insert into eis_posthistory values ('"+email+"','"+name.get(k)+"','"+design.get(k)+"','"+mode.get(k)+"','"+ph_frm.get(k)+"','"+ph_to.get(k)+"')";
    rs7=st.executeUpdate(sql7);
}



int rs5 = st.executeUpdate(sql2);

String  sql3 ="insert into eis_traininginfo values ('"+email+"','"+tp_name_req_1+"','"+tp_det_1+"','"+tp_name_req_2+"','"+tp_det_2+"','"+tp_name_req_3+"','"+tp_det_3+"')";
int rs6 = st.executeUpdate(sql3);

String sql9="";
int rs9=0;
for(int j=0;j<tcName.size(); j++)
{
    sql9="insert into eis_trainingcompleted values('"+email+"','"+tcName.get(j)+"','"+tcFrom.get(j)+"','"+tcTo.get(j)+"')";
    rs9=st.executeUpdate(sql9);

}
String sql8="delete from eis_posthistory where email='"+email+"' and officeName=''";
int rs8=st.executeUpdate(sql8);
String sql10="delete  from eis_trainingcompleted where email='"+email+"' and trainingName=''";
int rs10=st.executeUpdate(sql10);

String  sql12 ="insert into eis_final values ('"+email+"','"+finalSubmit+"')";
int rs12 = st.executeUpdate(sql12);

if(rs5>0 && rs6>0 && rs7>0 && rs9>0 && rs12>0 ){

//System.out.println("sql==="+sql1);
flag=1;

    }
else
    {
    flag=0;
    }
con.close();
}

catch (Exception e) {
e.printStackTrace();
}
if(flag==1)
    {
 response.sendRedirect("/mprsenet/EIS_fSuccess.jsp");
      }
else
   {
   response.sendRedirect("/mprsenet/EIS_ferror.jsp");
}
}
    else
        {

         int flag=0;
         ResultSet rs= null;
         String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";
               try{
 Connection con = DriverManager.getConnection(connectionUrl+dbName, userId, password);

Statement st=con.createStatement();
String  sql1 ="insert into eis_basicinfo values ('"+token1+"','"+email+"','"+inst_id+"','"+name+"','"+designation+"','"+DOB+"','"+dat_ret+"'," +
               "'"+bas_descipline+"','"+doj_gov+"','"+doj_msme+"')";

int rs1 = st.executeUpdate(sql1);

String sql2="insert into eis_postinginfo values ('"+email+"','"+curr_ofctype+"','"+curr_ofcname+"','"+curr_despln+"'," +
               "'"+curr_doj+"','"+pst_pref_1+"','"+pst_pref_2+"'," +
               "'"+pst_pref_3+"','"+your_spl_area+"','"+your_spl_pref+"')";

int rs5 = st.executeUpdate(sql2);

String sql7="";
int rs7=0;
for(int k=0; k<name.size(); k++)
    {
    sql7="insert into eis_posthistory values ('"+email+"','"+name.get(k)+"','"+design.get(k)+"','"+mode.get(k)+"','"+ph_frm.get(k)+"','"+ph_to.get(k)+"')";
    rs7=st.executeUpdate(sql7);
}

String  sql3 ="insert into eis_traininginfo values ('"+email+"','"+tp_name_req_1+"','"+tp_det_1+"','"+tp_name_req_2+"','"+tp_det_2+"','"+tp_name_req_3+"','"+tp_det_3+"')";
int rs6 = st.executeUpdate(sql3);


String sql9="";
int rs9=0;
for(int j=0;j<tcName.size(); j++)
{
    sql9="insert into eis_trainingcompleted values('"+email+"','"+tcName.get(j)+"','"+tcFrom.get(j)+"','"+tcTo.get(j)+"')";
    rs9=st.executeUpdate(sql9);

}
String  sql12 ="insert into eis_final values ('"+email+"','"+finalSubmit+"')";
int rs12 = st.executeUpdate(sql12);

if(rs1>0 && rs5>0 && rs6>0 && rs9>0 && rs12>0){

//System.out.println("sql==="+sql1);
     flag=1;

    }
else
    {
    flag=0;
    }
con.close();
}

catch (Exception e) {
e.printStackTrace();
}
if(flag==1)
    {
    response.sendRedirect("/mprsenet/aa.jsp");
      }
else
   {
response.sendRedirect("/mprsenet/EIS_ferror.jsp");
}
}
    }
 else
        {
   response.sendRedirect("/mprsenet/EIS_fsubmit.jsp");
   }

          }
             else
          {
                  response.sendRedirect("/mprsenet/EIS_error.jsp");

          }
        } finally { 
            out.close();
        }
    }
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   