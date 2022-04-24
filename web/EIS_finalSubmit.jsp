<%-- 
    Document   : aa
    Created on : Dec 28, 2017, 3:30:42 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ResultSet rs = null;
            Connection con = null;
            Statement st = null;

            System.out.println("===========Servlet is working=6============");


            //* Get the value from current posting *//

            String Crosssite = (String) session.getAttribute("nmm");
            System.out.println("crosssite we get==" + Crosssite);
            session.setAttribute("Crosssite", Crosssite);
            if (!Crosssite.equals(null)) {
                String email = (String) session.getAttribute("email");
                int fCount = 0;
                Connection con15 = null;
                ResultSet rs15 = null;
                System.out.println("Checking final submit done or not:");
                try {
                    con15 = ConnectionManager.getConnectionDirectForMySQL();
                    Statement stmt15 = con15.createStatement();
                    String sql15 = "Select * from eis_final where email='" + email + "'";
                    rs15 = stmt15.executeQuery(sql15);
                    if (rs15.next()) {
                        fCount = 1;
                    } else {
                        fCount = 0;
                    }

                    con15.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (fCount == 0) {
                    System.out.println("=======NO");
                    String curr_ofctype = request.getParameter("cur_ofctype");
                    String curr_ofcname = request.getParameter("state");
                    String curr_despln = request.getParameter("curr_despln");
                    String curr_doj = request.getParameter("curr_doj");
                    if (curr_ofctype == "" || curr_ofctype.equals(null)) {
                        curr_ofctype = "0";
                    }
                    if (curr_ofcname == "" || curr_ofcname.equals(null)) {
                        curr_ofcname = "0";
                    }
                    if (curr_despln == "" || curr_despln.equals(null)) {
                        curr_despln = "0";
                    }
                    if (curr_doj == "" || curr_doj.equals(null)) {
                        curr_doj = "0";
                    }
                    System.out.println("Current   " + curr_ofcname + " in " + curr_ofctype + " with post" + curr_despln);
                    System.out.println("Working since  " + curr_doj);
                    // get value from posting history
                    Connection con1 = null;
                    ResultSet rsa = null;
                    int ph = 0;
                    try {
                        con1 = ConnectionManager.getConnectionDirectForMySQL();
                        Statement stmt1 = con1.createStatement();
                        String sql = "select * from eis_posthistory where email='" + email + "'";
                        rsa = stmt1.executeQuery(sql);
                        while (rsa.next()) {
                            ph = ph + 1;
                        }
                        con1.close();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    ArrayList<String> ofcName = new ArrayList<String>();
                    ArrayList<String> dsn = new ArrayList<String>();
                    ArrayList<String> mod = new ArrayList<String>();
                    ArrayList<String> fromm = new ArrayList<String>();
                    ArrayList<String> too = new ArrayList<String>();

                    if (ph == 1) {
                        ofcName.add(request.getParameter("ofcName[1]"));
                        dsn.add(request.getParameter("dsn[1]"));
                        mod.add(request.getParameter("mod[1]"));
                        fromm.add(request.getParameter("fromm[1]"));
                        too.add(request.getParameter("too[1]"));
                    }
                    if (ph == 2) {
                        ofcName.add(request.getParameter("ofcName[1]"));
                        dsn.add(request.getParameter("dsn[1]"));
                        mod.add(request.getParameter("mod[1]"));
                        fromm.add(request.getParameter("fromm[1]"));
                        too.add(request.getParameter("too[1]"));

                        ofcName.add(request.getParameter("ofcName[2]"));
                        dsn.add(request.getParameter("dsn[2]"));
                        mod.add(request.getParameter("mod[2]"));
                        fromm.add(request.getParameter("fromm[2]"));
                        too.add(request.getParameter("too[2]"));
                    }
                    if (ph == 3) {
                        ofcName.add(request.getParameter("ofcName[1]"));
                        dsn.add(request.getParameter("dsn[1]"));
                        mod.add(request.getParameter("mod[1]"));
                        fromm.add(request.getParameter("fromm[1]"));
                        too.add(request.getParameter("too[1]"));

                        ofcName.add(request.getParameter("ofcName[2]"));
                        dsn.add(request.getParameter("dsn[2]"));
                        mod.add(request.getParameter("mod[2]"));
                        fromm.add(request.getParameter("fromm[2]"));
                        too.add(request.getParameter("too[2]"));

                        ofcName.add(request.getParameter("ofcName[3]"));
                        dsn.add(request.getParameter("dsn[3]"));
                        mod.add(request.getParameter("mod[3]"));
                        fromm.add(request.getParameter("fromm[3]"));
                        too.add(request.getParameter("too[3]"));
                    }
                    if (ph == 4) {
                        ofcName.add(request.getParameter("ofcName[1]"));
                        dsn.add(request.getParameter("dsn[1]"));
                        mod.add(request.getParameter("mod[1]"));
                        fromm.add(request.getParameter("fromm[1]"));
                        too.add(request.getParameter("too[1]"));

                        ofcName.add(request.getParameter("ofcName[2]"));
                        dsn.add(request.getParameter("dsn[2]"));
                        mod.add(request.getParameter("mod[2]"));
                        fromm.add(request.getParameter("fromm[2]"));
                        too.add(request.getParameter("too[2]"));

                        ofcName.add(request.getParameter("ofcName[3]"));
                        dsn.add(request.getParameter("dsn[3]"));
                        mod.add(request.getParameter("mod[3]"));
                        fromm.add(request.getParameter("fromm[3]"));
                        too.add(request.getParameter("too[3]"));

                        ofcName.add(request.getParameter("ofcName[4]"));
                        dsn.add(request.getParameter("dsn[4]"));
                        mod.add(request.getParameter("mod[4]"));
                        fromm.add(request.getParameter("fromm[4]"));
                        too.add(request.getParameter("too[4]"));
                    }
                    if (ph == 5) {
                        ofcName.add(request.getParameter("ofcName[1]"));
                        dsn.add(request.getParameter("dsn[1]"));
                        mod.add(request.getParameter("mod[1]"));
                        fromm.add(request.getParameter("fromm[1]"));
                        too.add(request.getParameter("too[1]"));

                        ofcName.add(request.getParameter("ofcName[2]"));
                        dsn.add(request.getParameter("dsn[2]"));
                        mod.add(request.getParameter("mod[2]"));
                        fromm.add(request.getParameter("fromm[2]"));
                        too.add(request.getParameter("too[2]"));

                        ofcName.add(request.getParameter("ofcName[3]"));
                        dsn.add(request.getParameter("dsn[3]"));
                        mod.add(request.getParameter("mod[3]"));
                        fromm.add(request.getParameter("fromm[3]"));
                        too.add(request.getParameter("too[3]"));

                        ofcName.add(request.getParameter("ofcName[4]"));
                        dsn.add(request.getParameter("dsn[4]"));
                        mod.add(request.getParameter("mod[4]"));
                        fromm.add(request.getParameter("fromm[4]"));
                        too.add(request.getParameter("too[4]"));

                        ofcName.add(request.getParameter("ofcName[5]"));
                        dsn.add(request.getParameter("dsn[5]"));
                        mod.add(request.getParameter("mod[5]"));
                        fromm.add(request.getParameter("fromm[5]"));
                        too.add(request.getParameter("too[5]"));
                    }
                    if (ph == 6) {
                        ofcName.add(request.getParameter("ofcName[1]"));
                        dsn.add(request.getParameter("dsn[1]"));
                        mod.add(request.getParameter("mod[1]"));
                        fromm.add(request.getParameter("fromm[1]"));
                        too.add(request.getParameter("too[1]"));

                        ofcName.add(request.getParameter("ofcName[2]"));
                        dsn.add(request.getParameter("dsn[2]"));
                        mod.add(request.getParameter("mod[2]"));
                        fromm.add(request.getParameter("fromm[2]"));
                        too.add(request.getParameter("too[2]"));

                        ofcName.add(request.getParameter("ofcName[3]"));
                        dsn.add(request.getParameter("dsn[3]"));
                        mod.add(request.getParameter("mod[3]"));
                        fromm.add(request.getParameter("fromm[3]"));
                        too.add(request.getParameter("too[3]"));

                        ofcName.add(request.getParameter("ofcName[4]"));
                        dsn.add(request.getParameter("dsn[4]"));
                        mod.add(request.getParameter("mod[4]"));
                        fromm.add(request.getParameter("fromm[4]"));
                        too.add(request.getParameter("too[4]"));

                        ofcName.add(request.getParameter("ofcName[5]"));
                        dsn.add(request.getParameter("dsn[5]"));
                        mod.add(request.getParameter("mod[5]"));
                        fromm.add(request.getParameter("fromm[5]"));
                        too.add(request.getParameter("too[5]"));

                        ofcName.add(request.getParameter("ofcName[6]"));
                        dsn.add(request.getParameter("dsn[6]"));
                        mod.add(request.getParameter("mod[6]"));
                        fromm.add(request.getParameter("fromm[6]"));
                        too.add(request.getParameter("too[6]"));
                    }
                    if (ph == 7) {
                        ofcName.add(request.getParameter("ofcName[1]"));
                        dsn.add(request.getParameter("dsn[1]"));
                        mod.add(request.getParameter("mod[1]"));
                        fromm.add(request.getParameter("fromm[1]"));
                        too.add(request.getParameter("too[1]"));

                        ofcName.add(request.getParameter("ofcName[2]"));
                        dsn.add(request.getParameter("dsn[2]"));
                        mod.add(request.getParameter("mod[2]"));
                        fromm.add(request.getParameter("fromm[2]"));
                        too.add(request.getParameter("too[2]"));

                        ofcName.add(request.getParameter("ofcName[3]"));
                        dsn.add(request.getParameter("dsn[3]"));
                        mod.add(request.getParameter("mod[3]"));
                        fromm.add(request.getParameter("fromm[3]"));
                        too.add(request.getParameter("too[3]"));

                        ofcName.add(request.getParameter("ofcName[4]"));
                        dsn.add(request.getParameter("dsn[4]"));
                        mod.add(request.getParameter("mod[4]"));
                        fromm.add(request.getParameter("fromm[4]"));
                        too.add(request.getParameter("too[4]"));

                        ofcName.add(request.getParameter("ofcName[5]"));
                        dsn.add(request.getParameter("dsn[5]"));
                        mod.add(request.getParameter("mod[5]"));
                        fromm.add(request.getParameter("fromm[5]"));
                        too.add(request.getParameter("too[5]"));

                        ofcName.add(request.getParameter("ofcName[6]"));
                        dsn.add(request.getParameter("dsn[6]"));
                        mod.add(request.getParameter("mod[6]"));
                        fromm.add(request.getParameter("fromm[6]"));
                        too.add(request.getParameter("too[6]"));

                        ofcName.add(request.getParameter("ofcName[7]"));
                        dsn.add(request.getParameter("dsn[7]"));
                        mod.add(request.getParameter("mod[7]"));
                        fromm.add(request.getParameter("fromm[7]"));
                        too.add(request.getParameter("too[7]"));

                    }
                    if (ph == 8) {
                        ofcName.add(request.getParameter("ofcName[1]"));
                        dsn.add(request.getParameter("dsn[1]"));
                        mod.add(request.getParameter("mod[1]"));
                        fromm.add(request.getParameter("fromm[1]"));
                        too.add(request.getParameter("too[1]"));

                        ofcName.add(request.getParameter("ofcName[2]"));
                        dsn.add(request.getParameter("dsn[2]"));
                        mod.add(request.getParameter("mod[2]"));
                        fromm.add(request.getParameter("fromm[2]"));
                        too.add(request.getParameter("too[2]"));

                        ofcName.add(request.getParameter("ofcName[3]"));
                        dsn.add(request.getParameter("dsn[3]"));
                        mod.add(request.getParameter("mod[3]"));
                        fromm.add(request.getParameter("fromm[3]"));
                        too.add(request.getParameter("too[3]"));

                        ofcName.add(request.getParameter("ofcName[4]"));
                        dsn.add(request.getParameter("dsn[4]"));
                        mod.add(request.getParameter("mod[4]"));
                        fromm.add(request.getParameter("fromm[4]"));
                        too.add(request.getParameter("too[4]"));

                        ofcName.add(request.getParameter("ofcName[5]"));
                        dsn.add(request.getParameter("dsn[5]"));
                        mod.add(request.getParameter("mod[5]"));
                        fromm.add(request.getParameter("fromm[5]"));
                        too.add(request.getParameter("too[5]"));

                        ofcName.add(request.getParameter("ofcName[6]"));
                        dsn.add(request.getParameter("dsn[6]"));
                        mod.add(request.getParameter("mod[6]"));
                        fromm.add(request.getParameter("fromm[6]"));
                        too.add(request.getParameter("too[6]"));

                        ofcName.add(request.getParameter("ofcName[7]"));
                        dsn.add(request.getParameter("dsn[7]"));
                        mod.add(request.getParameter("mod[7]"));
                        fromm.add(request.getParameter("fromm[7]"));
                        too.add(request.getParameter("too[7]"));

                        ofcName.add(request.getParameter("ofcName[8]"));
                        dsn.add(request.getParameter("dsn[8]"));
                        mod.add(request.getParameter("mod[8]"));
                        fromm.add(request.getParameter("fromm[8]"));
                        too.add(request.getParameter("too[8]"));
                    }
                    if (ph == 9) {
                        ofcName.add(request.getParameter("ofcName[1]"));
                        dsn.add(request.getParameter("dsn[1]"));
                        mod.add(request.getParameter("mod[1]"));
                        fromm.add(request.getParameter("fromm[1]"));
                        too.add(request.getParameter("too[1]"));

                        ofcName.add(request.getParameter("ofcName[2]"));
                        dsn.add(request.getParameter("dsn[2]"));
                        mod.add(request.getParameter("mod[2]"));
                        fromm.add(request.getParameter("fromm[2]"));
                        too.add(request.getParameter("too[2]"));

                        ofcName.add(request.getParameter("ofcName[3]"));
                        dsn.add(request.getParameter("dsn[3]"));
                        mod.add(request.getParameter("mod[3]"));
                        fromm.add(request.getParameter("fromm[3]"));
                        too.add(request.getParameter("too[3]"));

                        ofcName.add(request.getParameter("ofcName[4]"));
                        dsn.add(request.getParameter("dsn[4]"));
                        mod.add(request.getParameter("mod[4]"));
                        fromm.add(request.getParameter("fromm[4]"));
                        too.add(request.getParameter("too[4]"));

                        ofcName.add(request.getParameter("ofcName[5]"));
                        dsn.add(request.getParameter("dsn[5]"));
                        mod.add(request.getParameter("mod[5]"));
                        fromm.add(request.getParameter("fromm[5]"));
                        too.add(request.getParameter("too[5]"));

                        ofcName.add(request.getParameter("ofcName[6]"));
                        dsn.add(request.getParameter("dsn[6]"));
                        mod.add(request.getParameter("mod[6]"));
                        fromm.add(request.getParameter("fromm[6]"));
                        too.add(request.getParameter("too[6]"));

                        ofcName.add(request.getParameter("ofcName[7]"));
                        dsn.add(request.getParameter("dsn[7]"));
                        mod.add(request.getParameter("mod[7]"));
                        fromm.add(request.getParameter("fromm[7]"));
                        too.add(request.getParameter("too[7]"));

                        ofcName.add(request.getParameter("ofcName[8]"));
                        dsn.add(request.getParameter("dsn[8]"));
                        mod.add(request.getParameter("mod[8]"));
                        fromm.add(request.getParameter("fromm[8]"));
                        too.add(request.getParameter("too[8]"));

                        ofcName.add(request.getParameter("ofcName[9]"));
                        dsn.add(request.getParameter("dsn[9]"));
                        mod.add(request.getParameter("mod[9]"));
                        fromm.add(request.getParameter("fromm[9]"));
                        too.add(request.getParameter("too[9]"));
                    }
                    if (ph == 10) {
                        ofcName.add(request.getParameter("ofcName[1]"));
                        dsn.add(request.getParameter("dsn[1]"));
                        mod.add(request.getParameter("mod[1]"));
                        fromm.add(request.getParameter("fromm[1]"));
                        too.add(request.getParameter("too[1]"));

                        ofcName.add(request.getParameter("ofcName[2]"));
                        dsn.add(request.getParameter("dsn[2]"));
                        mod.add(request.getParameter("mod[2]"));
                        fromm.add(request.getParameter("fromm[2]"));
                        too.add(request.getParameter("too[2]"));

                        ofcName.add(request.getParameter("ofcName[3]"));
                        dsn.add(request.getParameter("dsn[3]"));
                        mod.add(request.getParameter("mod[3]"));
                        fromm.add(request.getParameter("fromm[3]"));
                        too.add(request.getParameter("too[3]"));

                        ofcName.add(request.getParameter("ofcName[4]"));
                        dsn.add(request.getParameter("dsn[4]"));
                        mod.add(request.getParameter("mod[4]"));
                        fromm.add(request.getParameter("fromm[4]"));
                        too.add(request.getParameter("too[4]"));

                        ofcName.add(request.getParameter("ofcName[5]"));
                        dsn.add(request.getParameter("dsn[5]"));
                        mod.add(request.getParameter("mod[5]"));
                        fromm.add(request.getParameter("fromm[5]"));
                        too.add(request.getParameter("too[5]"));

                        ofcName.add(request.getParameter("ofcName[6]"));
                        dsn.add(request.getParameter("dsn[6]"));
                        mod.add(request.getParameter("mod[6]"));
                        fromm.add(request.getParameter("fromm[6]"));
                        too.add(request.getParameter("too[6]"));

                        ofcName.add(request.getParameter("ofcName[7]"));
                        dsn.add(request.getParameter("dsn[7]"));
                        mod.add(request.getParameter("mod[7]"));
                        fromm.add(request.getParameter("fromm[7]"));
                        too.add(request.getParameter("too[7]"));

                        ofcName.add(request.getParameter("ofcName[8]"));
                        dsn.add(request.getParameter("dsn[8]"));
                        mod.add(request.getParameter("mod[8]"));
                        fromm.add(request.getParameter("fromm[8]"));
                        too.add(request.getParameter("too[8]"));

                        ofcName.add(request.getParameter("ofcName[9]"));
                        dsn.add(request.getParameter("dsn[9]"));
                        mod.add(request.getParameter("mod[9]"));
                        fromm.add(request.getParameter("fromm[9]"));
                        too.add(request.getParameter("too[9]"));

                        ofcName.add(request.getParameter("ofcName[10]"));
                        dsn.add(request.getParameter("dsn[10]"));
                        mod.add(request.getParameter("mod[10]"));
                        fromm.add(request.getParameter("fromm[10]"));
                        too.add(request.getParameter("too[10]"));
                    }



                    try {
                        con = ConnectionManager.getConnectionDirectForMySQL();
                        st = con.createStatement();
                        String sql21 = "delete from eis_posthistory where email='" + email + "'";
                        int rs21 = st.executeUpdate(sql21);
                        int rs23 = 0;
                        for (int ij = 0; ij < ph; ij++) {
                            String sql23 = "insert into eis_posthistory values ('" + email + "','" + ofcName.get(ij) + "','" + dsn.get(ij) + "','" + mod.get(ij) + "','" + fromm.get(ij) + "','" + too.get(ij) + "')";
                            rs23 = st.executeUpdate(sql23);
                            //  System.out.println(ij+" posting =" +ofcName.get(ij)+", by "+mod.get(ij)+", as "+dsn.get(ij)+" from="+fromm.get(ij)+" to="+too.get(ij));
                        }

                        if (rs21 > 0) {
                            System.out.println("Old Posting History deleted");
                        }

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }



                    String num = request.getParameter("nam");
                    int counter = Integer.parseInt(num) - 1;

                    ArrayList<String> name = new ArrayList<String>();
                    ArrayList<String> design = new ArrayList<String>();
                    ArrayList<String> mode = new ArrayList<String>();
                    ArrayList<String> ph_frm = new ArrayList<String>();
                    ArrayList<String> ph_to = new ArrayList<String>();
                    //  String name1=request.getParameter("name");

                    name.add(request.getParameter("name[1]"));
                    design.add(request.getParameter("desig[1]"));
                    mode.add(request.getParameter("mode[1]"));
                    ph_frm.add(request.getParameter("frm[1]"));
                    ph_to.add(request.getParameter("to[1]"));

                    System.out.println("ofc name===" + name.get(0));
                    System.out.println("ofc name===" + design.get(0));
                    System.out.println("ofc name===" + mode.get(0));
                    System.out.println("ofc name===" + ph_frm.get(0));
                    System.out.println("ofc name===" + ph_to.get(0));
                    if (counter == 2) {
                        name.add(request.getParameter("name[2]"));
                        design.add(request.getParameter("desig[2]"));
                        mode.add(request.getParameter("mode[2]"));
                        ph_frm.add(request.getParameter("frm[2]"));
                        ph_to.add(request.getParameter("to[2]"));
                    }

                    if (counter == 3) {
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

                    if (counter == 4) {
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

                    if (counter == 5) {
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

                    if (counter == 6) {
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

                    if (counter == 7) {
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

                    if (counter == 8) {
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

                    if (counter == 9) {
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

                    if (counter == 10) {
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
                    String pst_pref_1 = request.getParameter("pst_pref_1");
                    String pst_pref_2 = request.getParameter("pst_pref_2");
                    String pst_pref_3 = request.getParameter("pst_pref_3");
                    if (pst_pref_1 == "" || pst_pref_1.equals(null)) {
                        pst_pref_1 = "0";
                    }

                    if (pst_pref_2 == "" || pst_pref_2.equals(null)) {
                        pst_pref_2 = "0";
                    }

                    if (pst_pref_3 == "" || pst_pref_3.equals(null)) {
                        pst_pref_3 = "0";
                    }

                    System.out.println("post preferences : 1. " + pst_pref_1 + " 2. " + pst_pref_2 + " 3. " + pst_pref_3);

                    //Yourself
                    // String your_spl_area =request.getParameter("your_spl_area");
                    String your_spl_pref = request.getParameter("your_spl_pref");



                    if (your_spl_pref == "" || your_spl_pref.equals(null)) {
                        your_spl_pref = "0";
                    }


                    System.out.println(" and preferences " + your_spl_pref);

                    // get the value from trining completed
                    int tc = 0;
                    try {
                        con1 = ConnectionManager.getConnectionDirectForMySQL();
                        Statement stmt1 = con1.createStatement();
                        String sql = "select * from eis_trainingcompleted where email='" + email + "'";
                        rsa = stmt1.executeQuery(sql);
                        while (rsa.next()) {
                            tc = tc + 1;
                        }
                        con1.close();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    ArrayList<String> Tc_Name = new ArrayList<String>();
                    ArrayList<String> Tc_Frm = new ArrayList<String>();
                    ArrayList<String> Tc_To = new ArrayList<String>();

                    if (tc == 1) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));
                    }
                    if (tc == 2) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));
                    }
                    if (tc == 3) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));
                    }
                    if (tc == 4) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));
                    }
                    if (tc == 5) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));

                        Tc_Name.add(request.getParameter("Tc_Name[5]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[5]"));
                        Tc_To.add(request.getParameter("Tc_To[5]"));
                    }
                    if (tc == 6) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));

                        Tc_Name.add(request.getParameter("Tc_Name[5]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[5]"));
                        Tc_To.add(request.getParameter("Tc_To[5]"));

                        Tc_Name.add(request.getParameter("Tc_Name[6]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[6]"));
                        Tc_To.add(request.getParameter("Tc_To[6]"));
                    }
                    if (tc == 7) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));

                        Tc_Name.add(request.getParameter("Tc_Name[5]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[5]"));
                        Tc_To.add(request.getParameter("Tc_To[5]"));

                        Tc_Name.add(request.getParameter("Tc_Name[6]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[6]"));
                        Tc_To.add(request.getParameter("Tc_To[6]"));

                        Tc_Name.add(request.getParameter("Tc_Name[7]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[7]"));
                        Tc_To.add(request.getParameter("Tc_To[7]"));
                    }
                    if (tc == 8) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));

                        Tc_Name.add(request.getParameter("Tc_Name[5]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[5]"));
                        Tc_To.add(request.getParameter("Tc_To[5]"));

                        Tc_Name.add(request.getParameter("Tc_Name[6]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[6]"));
                        Tc_To.add(request.getParameter("Tc_To[6]"));

                        Tc_Name.add(request.getParameter("Tc_Name[7]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[7]"));
                        Tc_To.add(request.getParameter("Tc_To[7]"));

                        Tc_Name.add(request.getParameter("Tc_Name[8]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[8]"));
                        Tc_To.add(request.getParameter("Tc_To[8]"));
                    }
                    if (tc == 9) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));

                        Tc_Name.add(request.getParameter("Tc_Name[5]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[5]"));
                        Tc_To.add(request.getParameter("Tc_To[5]"));

                        Tc_Name.add(request.getParameter("Tc_Name[6]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[6]"));
                        Tc_To.add(request.getParameter("Tc_To[6]"));

                        Tc_Name.add(request.getParameter("Tc_Name[7]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[7]"));
                        Tc_To.add(request.getParameter("Tc_To[7]"));

                        Tc_Name.add(request.getParameter("Tc_Name[8]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[8]"));
                        Tc_To.add(request.getParameter("Tc_To[8]"));

                        Tc_Name.add(request.getParameter("Tc_Name[9]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[9]"));
                        Tc_To.add(request.getParameter("Tc_To[9]"));
                    }
                    if (tc == 10) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));

                        Tc_Name.add(request.getParameter("Tc_Name[5]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[5]"));
                        Tc_To.add(request.getParameter("Tc_To[5]"));

                        Tc_Name.add(request.getParameter("Tc_Name[6]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[6]"));
                        Tc_To.add(request.getParameter("Tc_To[6]"));

                        Tc_Name.add(request.getParameter("Tc_Name[7]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[7]"));
                        Tc_To.add(request.getParameter("Tc_To[7]"));

                        Tc_Name.add(request.getParameter("Tc_Name[8]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[8]"));
                        Tc_To.add(request.getParameter("Tc_To[8]"));

                        Tc_Name.add(request.getParameter("Tc_Name[9]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[9]"));
                        Tc_To.add(request.getParameter("Tc_To[9]"));

                        Tc_Name.add(request.getParameter("Tc_Name[10]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[10]"));
                        Tc_To.add(request.getParameter("Tc_To[10]"));
                    }

                    if (tc == 11) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));

                        Tc_Name.add(request.getParameter("Tc_Name[5]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[5]"));
                        Tc_To.add(request.getParameter("Tc_To[5]"));

                        Tc_Name.add(request.getParameter("Tc_Name[6]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[6]"));
                        Tc_To.add(request.getParameter("Tc_To[6]"));

                        Tc_Name.add(request.getParameter("Tc_Name[7]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[7]"));
                        Tc_To.add(request.getParameter("Tc_To[7]"));

                        Tc_Name.add(request.getParameter("Tc_Name[8]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[8]"));
                        Tc_To.add(request.getParameter("Tc_To[8]"));

                        Tc_Name.add(request.getParameter("Tc_Name[9]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[9]"));
                        Tc_To.add(request.getParameter("Tc_To[9]"));

                        Tc_Name.add(request.getParameter("Tc_Name[10]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[10]"));
                        Tc_To.add(request.getParameter("Tc_To[10]"));

                        Tc_Name.add(request.getParameter("Tc_Name[11]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[11]"));
                        Tc_To.add(request.getParameter("Tc_To[11]"));
                    }
                    if (tc == 12) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));

                        Tc_Name.add(request.getParameter("Tc_Name[5]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[5]"));
                        Tc_To.add(request.getParameter("Tc_To[5]"));

                        Tc_Name.add(request.getParameter("Tc_Name[6]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[6]"));
                        Tc_To.add(request.getParameter("Tc_To[6]"));

                        Tc_Name.add(request.getParameter("Tc_Name[7]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[7]"));
                        Tc_To.add(request.getParameter("Tc_To[7]"));

                        Tc_Name.add(request.getParameter("Tc_Name[8]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[8]"));
                        Tc_To.add(request.getParameter("Tc_To[8]"));

                        Tc_Name.add(request.getParameter("Tc_Name[9]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[9]"));
                        Tc_To.add(request.getParameter("Tc_To[9]"));

                        Tc_Name.add(request.getParameter("Tc_Name[10]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[10]"));
                        Tc_To.add(request.getParameter("Tc_To[10]"));

                        Tc_Name.add(request.getParameter("Tc_Name[11]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[11]"));
                        Tc_To.add(request.getParameter("Tc_To[11]"));

                        Tc_Name.add(request.getParameter("Tc_Name[12]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[12]"));
                        Tc_To.add(request.getParameter("Tc_To[12]"));
                    }

                    if (tc == 13) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));

                        Tc_Name.add(request.getParameter("Tc_Name[5]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[5]"));
                        Tc_To.add(request.getParameter("Tc_To[5]"));

                        Tc_Name.add(request.getParameter("Tc_Name[6]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[6]"));
                        Tc_To.add(request.getParameter("Tc_To[6]"));

                        Tc_Name.add(request.getParameter("Tc_Name[7]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[7]"));
                        Tc_To.add(request.getParameter("Tc_To[7]"));

                        Tc_Name.add(request.getParameter("Tc_Name[8]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[8]"));
                        Tc_To.add(request.getParameter("Tc_To[8]"));

                        Tc_Name.add(request.getParameter("Tc_Name[9]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[9]"));
                        Tc_To.add(request.getParameter("Tc_To[9]"));

                        Tc_Name.add(request.getParameter("Tc_Name[10]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[10]"));
                        Tc_To.add(request.getParameter("Tc_To[10]"));

                        Tc_Name.add(request.getParameter("Tc_Name[11]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[11]"));
                        Tc_To.add(request.getParameter("Tc_To[11]"));

                        Tc_Name.add(request.getParameter("Tc_Name[12]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[12]"));
                        Tc_To.add(request.getParameter("Tc_To[12]"));

                        Tc_Name.add(request.getParameter("Tc_Name[13]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[13]"));
                        Tc_To.add(request.getParameter("Tc_To[13]"));
                    }
                    if (tc == 14) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));

                        Tc_Name.add(request.getParameter("Tc_Name[5]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[5]"));
                        Tc_To.add(request.getParameter("Tc_To[5]"));

                        Tc_Name.add(request.getParameter("Tc_Name[6]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[6]"));
                        Tc_To.add(request.getParameter("Tc_To[6]"));

                        Tc_Name.add(request.getParameter("Tc_Name[7]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[7]"));
                        Tc_To.add(request.getParameter("Tc_To[7]"));

                        Tc_Name.add(request.getParameter("Tc_Name[8]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[8]"));
                        Tc_To.add(request.getParameter("Tc_To[8]"));

                        Tc_Name.add(request.getParameter("Tc_Name[9]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[9]"));
                        Tc_To.add(request.getParameter("Tc_To[9]"));

                        Tc_Name.add(request.getParameter("Tc_Name[10]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[10]"));
                        Tc_To.add(request.getParameter("Tc_To[10]"));

                        Tc_Name.add(request.getParameter("Tc_Name[11]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[11]"));
                        Tc_To.add(request.getParameter("Tc_To[11]"));

                        Tc_Name.add(request.getParameter("Tc_Name[12]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[12]"));
                        Tc_To.add(request.getParameter("Tc_To[12]"));

                        Tc_Name.add(request.getParameter("Tc_Name[13]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[13]"));
                        Tc_To.add(request.getParameter("Tc_To[13]"));

                        Tc_Name.add(request.getParameter("Tc_Name[14]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[14]"));
                        Tc_To.add(request.getParameter("Tc_To[14]"));
                    }
                    if (tc == 15) {
                        Tc_Name.add(request.getParameter("Tc_Name[1]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[1]"));
                        Tc_To.add(request.getParameter("Tc_To[1]"));

                        Tc_Name.add(request.getParameter("Tc_Name[2]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[2]"));
                        Tc_To.add(request.getParameter("Tc_To[2]"));

                        Tc_Name.add(request.getParameter("Tc_Name[3]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[3]"));
                        Tc_To.add(request.getParameter("Tc_To[3]"));

                        Tc_Name.add(request.getParameter("Tc_Name[4]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[4]"));
                        Tc_To.add(request.getParameter("Tc_To[4]"));

                        Tc_Name.add(request.getParameter("Tc_Name[5]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[5]"));
                        Tc_To.add(request.getParameter("Tc_To[5]"));

                        Tc_Name.add(request.getParameter("Tc_Name[6]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[6]"));
                        Tc_To.add(request.getParameter("Tc_To[6]"));

                        Tc_Name.add(request.getParameter("Tc_Name[7]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[7]"));
                        Tc_To.add(request.getParameter("Tc_To[7]"));

                        Tc_Name.add(request.getParameter("Tc_Name[8]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[8]"));
                        Tc_To.add(request.getParameter("Tc_To[8]"));

                        Tc_Name.add(request.getParameter("Tc_Name[9]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[9]"));
                        Tc_To.add(request.getParameter("Tc_To[9]"));

                        Tc_Name.add(request.getParameter("Tc_Name[10]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[10]"));
                        Tc_To.add(request.getParameter("Tc_To[10]"));

                        Tc_Name.add(request.getParameter("Tc_Name[11]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[11]"));
                        Tc_To.add(request.getParameter("Tc_To[11]"));

                        Tc_Name.add(request.getParameter("Tc_Name[12]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[12]"));
                        Tc_To.add(request.getParameter("Tc_To[12]"));

                        Tc_Name.add(request.getParameter("Tc_Name[13]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[13]"));
                        Tc_To.add(request.getParameter("Tc_To[13]"));

                        Tc_Name.add(request.getParameter("Tc_Name[15]"));
                        Tc_Frm.add(request.getParameter("Tc_Frm[15]"));
                        Tc_To.add(request.getParameter("Tc_To[15]"));
                    }


                    try {

                        String sql21 = "delete from eis_trainingcompleted where email='" + email + "'";
                        int rs21 = st.executeUpdate(sql21);
                        int rs23 = 0;
                        for (int ij = 0; ij < tc; ij++) {
                            String sql23 = "insert into eis_trainingcompleted values ('" + email + "','" + Tc_Name.get(ij) + "','" + Tc_Frm.get(ij) + "','" + Tc_To.get(ij) + "')";
                            rs23 = st.executeUpdate(sql23);
                            //  System.out.println(ij+" posting =" +ofcName.get(ij)+", by "+mod.get(ij)+", as "+dsn.get(ij)+" from="+fromm.get(ij)+" to="+too.get(ij));
                        }

                        if (rs21 > 0) {
                            System.out.println("Old Posting History deleted");
                        }

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }



                    String no = request.getParameter("val");
                    int counterTc = Integer.parseInt(no) - 1;
                    System.out.println("no of tc====" + no);

                    ArrayList<String> tcName = new ArrayList<String>();
                    ArrayList<String> tcFrom = new ArrayList<String>();
                    ArrayList<String> tcTo = new ArrayList<String>();


                    tcName.add(request.getParameter("tcname[1]"));
                    tcFrom.add(request.getParameter("tcfrom[1]"));
                    tcTo.add(request.getParameter("tcto[1]"));

                    if (counterTc == 2) {
                        tcName.add(request.getParameter("tcname[2]"));
                        tcFrom.add(request.getParameter("tcfrom[2]"));
                        tcTo.add(request.getParameter("tcto[2]"));
                    }

                    if (counterTc == 3) {
                        tcName.add(request.getParameter("tcname[2]"));
                        tcFrom.add(request.getParameter("tcfrom[2]"));
                        tcTo.add(request.getParameter("tcto[2]"));

                        tcName.add(request.getParameter("tcname[3]"));
                        tcFrom.add(request.getParameter("tcfrom[3]"));
                        tcTo.add(request.getParameter("tcto[3]"));
                    }

                    if (counterTc == 4) {
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

                    if (counterTc == 5) {
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

                    if (counterTc == 6) {
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

                    if (counterTc == 7) {
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

                    if (counterTc == 8) {
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

                    if (counterTc == 9) {
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

                    if (counterTc == 10) {
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

                    if (counterTc == 11) {
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

                        tcName.add(request.getParameter("tcname[11]"));
                        tcFrom.add(request.getParameter("tcfrom[11]"));
                        tcTo.add(request.getParameter("tcto[11]"));
                    }

                    if (counterTc == 12) {
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

                        tcName.add(request.getParameter("tcname[11]"));
                        tcFrom.add(request.getParameter("tcfrom[11]"));
                        tcTo.add(request.getParameter("tcto[11]"));

                        tcName.add(request.getParameter("tcname[12]"));
                        tcFrom.add(request.getParameter("tcfrom[12]"));
                        tcTo.add(request.getParameter("tcto[12]"));
                    }

                    if (counterTc == 13) {
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

                        tcName.add(request.getParameter("tcname[11]"));
                        tcFrom.add(request.getParameter("tcfrom[11]"));
                        tcTo.add(request.getParameter("tcto[11]"));

                        tcName.add(request.getParameter("tcname[12]"));
                        tcFrom.add(request.getParameter("tcfrom[12]"));
                        tcTo.add(request.getParameter("tcto[12]"));

                        tcName.add(request.getParameter("tcname[13]"));
                        tcFrom.add(request.getParameter("tcfrom[13]"));
                        tcTo.add(request.getParameter("tcto[13]"));
                    }

                    if (counterTc == 14) {
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

                        tcName.add(request.getParameter("tcname[11]"));
                        tcFrom.add(request.getParameter("tcfrom[11]"));
                        tcTo.add(request.getParameter("tcto[11]"));

                        tcName.add(request.getParameter("tcname[12]"));
                        tcFrom.add(request.getParameter("tcfrom[12]"));
                        tcTo.add(request.getParameter("tcto[12]"));

                        tcName.add(request.getParameter("tcname[13]"));
                        tcFrom.add(request.getParameter("tcfrom[13]"));
                        tcTo.add(request.getParameter("tcto[13]"));

                        tcName.add(request.getParameter("tcname[14]"));
                        tcFrom.add(request.getParameter("tcfrom[14]"));
                        tcTo.add(request.getParameter("tcto[14]"));
                    }

                    if (counterTc == 15) {
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

                        tcName.add(request.getParameter("tcname[11]"));
                        tcFrom.add(request.getParameter("tcfrom[11]"));
                        tcTo.add(request.getParameter("tcto[11]"));

                        tcName.add(request.getParameter("tcname[12]"));
                        tcFrom.add(request.getParameter("tcfrom[12]"));
                        tcTo.add(request.getParameter("tcto[12]"));

                        tcName.add(request.getParameter("tcname[13]"));
                        tcFrom.add(request.getParameter("tcfrom[13]"));
                        tcTo.add(request.getParameter("tcto[13]"));

                        tcName.add(request.getParameter("tcname[14]"));
                        tcFrom.add(request.getParameter("tcfrom[14]"));
                        tcTo.add(request.getParameter("tcto[14]"));

                        tcName.add(request.getParameter("tcname[15]"));
                        tcFrom.add(request.getParameter("tcfrom[15]"));
                        tcTo.add(request.getParameter("tcto[15]"));
                    }


                    //* training required
                    //1
                    String tp_name_req_1 = request.getParameter("tp_name_req_1");
                    String tp_det_1 = request.getParameter("tp_det_1");
                    if (tp_name_req_1 == "" || tp_name_req_1.equals(null)) {
                        tp_name_req_1 = "0";
                    }
                    if (tp_det_1 == "" || tp_det_1.equals(null)) {
                        tp_det_1 = "0";
                    }

                    System.out.println("training required 1 :" + tp_name_req_1);
                    System.out.println("training detail  :" + tp_det_1);

                    //2
                    String tp_name_req_2 = request.getParameter("tp_name_req_2");
                    String tp_det_2 = request.getParameter("tp_det_2");
                    if (tp_name_req_2 == "" || tp_name_req_2.equals(null)) {
                        tp_name_req_2 = "0";
                    }
                    if (tp_det_2 == "" || tp_det_2.equals(null)) {
                        tp_det_2 = "0";
                    }

                    System.out.println("training required 2 :" + tp_name_req_2);
                    System.out.println("training detail  :" + tp_det_2);

  //3
                    String tp_name_req_3 = request.getParameter("train_name_req_3");
                    String tp_det_3 = request.getParameter("tp_det_3");
                    if (tp_name_req_3 == "" || tp_name_req_3.equals(null)) {
                        tp_name_req_3 = "0";
                    }
                    if (tp_det_3 == "" || tp_det_3.equals(null)) {
                        tp_det_3 = "0";
                    }
                    System.out.println("training required 3 :" + tp_name_req_3);
                    System.out.println("training detail  :" + tp_det_3);
                    //* End * //

                    String DOB = request.getParameter("dob");
                    String doj_gov = request.getParameter("doj_gov");
                    String doj_msme = request.getParameter("doj_msme");
                    String dat_ret = request.getParameter("dat_ret");
                    String bas_descipline = request.getParameter("bas_descipline");
                    String name1 = (String) session.getAttribute("name");
                    String designation = (String) session.getAttribute("userdesig");

                    //Newly Created
                    String CrPayLevel = request.getParameter("CrPayLevel");
                    String aptPrPost = request.getParameter("aptPrPost");
                    String payLevelSub = request.getParameter("payLevelSub");
                    String Category = request.getParameter("Category");

                    String Trade = request.getParameter("Trade");
                    String splTrade = request.getParameter("splTrade");
                    String splOTrade = request.getParameter("splOTrade");
                    String phyFit = request.getParameter("phyFit");
                    String qualification = request.getParameter("qualification");
                    String hobbies = request.getParameter("hobbies");
                    //End


                    System.out.println("name   " + name1);
                    System.out.println("email   " + email);
                    System.out.println("designation   " + designation);
                    System.out.println("date of birth   " + DOB);
                    System.out.println("date of joining Govt service   " + doj_gov);
                    System.out.println("date of joining mame service  " + doj_msme);
                    System.out.println("date of retirement  " + dat_ret);
                    System.out.println("descipline  " + bas_descipline);
                    session.setAttribute("name", name1);


                    String token1 = (String) session.getAttribute("token");
                    String user_cur_ofc = (String) session.getAttribute("user_cur_ofc");

                    String inst_id = "";

                    Connection con2 = null;
                    ResultSet rs2 = null;
                    try {
                        con2 = ConnectionManager.getConnectionDirectForMySQL();
                        Statement stmt2 = con2.createStatement();
                        String sql2 = "Select Inst_id from eis_branch_list where Inst_Name='" + user_cur_ofc + "'";
                        rs2 = stmt2.executeQuery(sql2);
                        while (rs2.next()) {
                            inst_id = rs2.getString("Inst_id");
                        }
                        con2.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    int iCount = 0;
                    Connection con3 = null;
                    ResultSet rs3 = null;
                    try {
                        con3 = ConnectionManager.getConnectionDirectForMySQL();
                        Statement stmt3 = con3.createStatement();
                        String sql3 = "Select * from eis_basicinfo where email='" + email + "'";
                        rs3 = stmt3.executeQuery(sql3);
                        while (rs3.next()) {
                            iCount = 1;
                        }
                        con3.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }




                    System.out.println("token=====" + token1);
                    int finalSubmit = 1;

                    if (iCount == 1) {

                        int flag = 0;

                        try {
  //String sql1="delete from eis_postinginfo where email='"+email+"'";
  //int rs1=st.executeUpdate(sql1);
  //String sql4="delete from eis_traininginfo where email='"+email+"'";
  //int rs4=st.executeUpdate(sql4);

  //String  sql1 ="insert into eis_basicinfo values ('"+token1+"','"+email+"','"+inst_id+"','"+name+"','"+designation+"','"+DOB+"','"+dat_ret+"'," +
                            //              "'"+bas_descipline+"','"+doj_gov+"','"+doj_msme+"')";

  //int rs1 = st.executeUpdate(sql1);

                            String sql2 = "update eis_postinginfo set cur_ofctype='" + curr_ofctype + "',state='" + curr_ofcname + "',curr_despln='" + curr_despln + "',"
                                    + "curr_doj='" + curr_doj + "',pst_pref_1='" + pst_pref_1 + "',pst_pref_2='" + pst_pref_2 + "',"
                                    + "pst_pref_3='" + pst_pref_3 + "',your_spl_pref='" + your_spl_pref + "' where  email='" + email + "' ";
                            String sql7 = "";
                            int rs7 = 0;

                            for (int k = 0; k < name.size(); k++) {


                                System.out.println("office name===" + name.get(k));
                                sql7 = "insert into eis_posthistory values ('" + email + "','" + name.get(k) + "','" + design.get(k) + "','" + mode.get(k) + "','" + ph_frm.get(k) + "','" + ph_to.get(k) + "')";
                                rs7 = st.executeUpdate(sql7);
                            }



                            int rs5 = st.executeUpdate(sql2);

                            String sql3 = "update eis_traininginfo set tp_name_req_1='" + tp_name_req_1 + "',tp_det_1='" + tp_det_1 + "',tp_name_req_2='" + tp_name_req_2 + "',tp_det_2='" + tp_det_2 + "',tp_name_req_3='" + tp_name_req_3 + "',"
                                    + "tp_det_3='" + tp_det_3 + "',Trade='" + Trade + "',sptTrade='" + splTrade + "',splOTrade='" + splOTrade + "',phyFit='" + phyFit + "',qualification='" + qualification + "',hobbies='" + hobbies + "' where email='" + email + "'";
                            int rs6 = st.executeUpdate(sql3);

                            String sql9 = "";
                            int rs9 = 0;
                            for (int j = 0; j < tcName.size(); j++) {
                                sql9 = "insert into eis_trainingcompleted values('" + email + "','" + tcName.get(j) + "','" + tcFrom.get(j) + "','" + tcTo.get(j) + "')";
                                rs9 = st.executeUpdate(sql9);

                            }
                            String blank = "Select";
                            String blank1 = "";
                            String sql8 = "delete from eis_posthistory where email='" + email + "' and officeName='" + blank + "' or  officeName='" + blank1 + "' or designation='' or  phmode='' or phfrom='' or phto='' or officeName='null' or designation='null' or  phmode='null' or phfrom='null' or phto='null'";
                            int rs8 = st.executeUpdate(sql8);


                            String sql10 = "delete  from eis_trainingcompleted where email='" + email + "' and trainingName='' or tcFrom='' or tcTo='' or trainingName='null' or tcFrom='null' or tcTo='null'";
                            int rs10 = st.executeUpdate(sql10);

                            String sql12 = "insert into eis_final values ('" + email + "','" + finalSubmit + "')";
                            int rs12 = st.executeUpdate(sql12);

                            if (rs5 > 0 && rs6 > 0 && rs7 > 0 && rs9 > 0 && rs12 > 0) {

  //System.out.println("sql==="+sql1);
                                flag = 1;

                            } else {
                                flag = 0;
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        if (flag == 1) {
                            int token = Integer.parseInt(token1);
                            String isDelete = "0";
                            String isDisplay = "1";

                            String updated_data = "everything required for new registration";

                            String updated_table_name = "eis_basicinfo,eis_posthistory,eis_postinginfo,eis_traininginfo,eis_trainingcompleted";

                            String action_taken = "new registration";

                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                            Date date = new Date();
                            String time = dateFormat.format(date);


                            String query = "insert into eis_data_update_info (token, email, time, updated_data, updated_table_name, isDisplay, isDelete, action_taken) values (?,?,?,?,?,?,?,?)";

                            PreparedStatement psmt1 = (PreparedStatement) con.prepareStatement(query);

                            psmt1.setInt(1, token);
                            psmt1.setString(2, email);
                            psmt1.setString(3, time);
                            psmt1.setString(4, updated_data);
                            psmt1.setString(5, updated_table_name);
                            psmt1.setString(6, isDisplay);
                            psmt1.setString(7, isDelete);
                            psmt1.setString(8, action_taken);

                            int updatedInfo = psmt1.executeUpdate();
                            con.commit();
                            con.close();
                            if (updatedInfo > 0) {
                                System.out.println("data is updated on the eis_postinginfo and eis_data_update_info by :" + email);

                            }
                            System.out.println("Inserting Data Successfully!..........");
        %>
        <jsp:forward page="EIS_fSuccess.jsp" />
        <%

            //response.sendRedirect("/mprsenet/EIS_fSuccess.jsp");
        } else {
        %>
        <jsp:forward page="EIS_ferror.jsp" />
        <%                // response.sendRedirect("/mprsenet/EIS_ferror.jsp");
            }
        } else {

            int flag = 0;

            try {
                String sql1 = "insert into eis_basicinfo values ('" + token1 + "','" + email + "','" + inst_id + "','" + name1 + "','" + designation + "','" + DOB + "','" + dat_ret + "',"
                        + "'" + bas_descipline + "','" + doj_gov + "','" + doj_msme + "','" + CrPayLevel + "','" + aptPrPost + "','" + payLevelSub + "','" + Category + "')";

                int rs1 = st.executeUpdate(sql1);

                String sql2 = "insert into eis_postinginfo values ('" + email + "','" + curr_ofctype + "','" + curr_ofcname + "','" + curr_despln + "',"
                        + "'" + curr_doj + "','" + pst_pref_1 + "','" + pst_pref_2 + "',"
                        + "'" + pst_pref_3 + "','" + your_spl_pref + "')";

                int rs5 = st.executeUpdate(sql2);

                String sql7 = "";
                int rs7 = 0;
                for (int k = 0; k < name.size(); k++) {
                    sql7 = "insert into eis_posthistory values ('" + email + "','" + name.get(k) + "','" + design.get(k) + "','" + mode.get(k) + "','" + ph_frm.get(k) + "','" + ph_to.get(k) + "')";
                    rs7 = st.executeUpdate(sql7);
                }

                String sql3 = "insert into eis_traininginfo values ('" + email + "','" + tp_name_req_1 + "','" + tp_det_1 + "','" + tp_name_req_2 + "','" + tp_det_2 + "','" + tp_name_req_3 + "',"
                        + "'" + tp_det_3 + "','" + Trade + "','" + splTrade + "','" + splOTrade + "','" + phyFit + "','" + qualification + "','" + hobbies + "')";
                int rs6 = st.executeUpdate(sql3);


                String sql9 = "";
                int rs9 = 0;
                for (int j = 0; j < tcName.size(); j++) {
                    sql9 = "insert into eis_trainingcompleted values('" + email + "','" + tcName.get(j) + "','" + tcFrom.get(j) + "','" + tcTo.get(j) + "')";
                    rs9 = st.executeUpdate(sql9);

                }
                String sql12 = "insert into eis_final values ('" + email + "','" + finalSubmit + "')";
                int rs12 = st.executeUpdate(sql12);

                if (rs1 > 0 && rs5 > 0 && rs6 > 0 && rs9 > 0 && rs12 > 0) {

//System.out.println("sql==="+sql1);
                    flag = 1;

                } else {
                    flag = 0;
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
            if (flag == 1) {

                int token = Integer.parseInt(token1);
                String isDelete = "0";
                String isDisplay = "1";

                String updated_data = "everything required for new registration";

                String updated_table_name = "eis_basicinfo,eis_posthistory,eis_postinginfo,eis_traininginfo,eis_trainingcompleted";

                String action_taken = "new registration";

                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                Date date = new Date();
                String time = dateFormat.format(date);


                String query = "insert into eis_data_update_info (token, email, time, updated_data, updated_table_name, isDisplay, isDelete, action_taken) values (?,?,?,?,?,?,?,?)";

                PreparedStatement psmt1 = (PreparedStatement) con.prepareStatement(query);

                psmt1.setInt(1, token);
                psmt1.setString(2, email);
                psmt1.setString(3, time);
                psmt1.setString(4, updated_data);
                psmt1.setString(5, updated_table_name);
                psmt1.setString(6, isDisplay);
                psmt1.setString(7, isDelete);
                psmt1.setString(8, action_taken);

                int updatedInfo = psmt1.executeUpdate();
                con.commit();
                con.close();
                if (updatedInfo > 0) {
                    System.out.println("data is updated on the eis_postinginfo and eis_data_update_info by :" + email);

                }
        %>
        <jsp:forward page="EIS_fSuccess.jsp" />
        <%
            //  response.sendRedirect("/mprsenet/EIS_fSuccess.jsp");
        } else {
        %>
        <jsp:forward page="EIS_ferror.jsp" />
        <%//response.sendRedirect("/mprsenet/EIS_ferror.jsp");
                }
            }
        } else {
            System.out.println("Yes=========== done");

            String not = "";

            try {

                String blank = "Select";
                String blank1 = "";
                String sql18 = "delete from eis_posthistory where email='" + email + "' and officeName='" + blank + "' or  officeName='" + blank1 + "' or designation='' or  phmode='' or phfrom='' or phto='' or officeName='null' or designation='null' or  phmode='null' or phfrom='null' or phto='null'";
                int rs18 = st.executeUpdate(sql18);


                if (rs18 > 0) {

                    System.out.println("blank row has been deleted");
                } else {
                    System.out.println("blank row not deleted");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <jsp:forward page="EIS_fsubmit.jsp" />
        <%
                // response.sendRedirect("/mprsenet/EIS_fsubmit.jsp");
            }

        } else {%>
        <jsp:forward page="EIS_error.jsp" />
        <%     //     response.sendRedirect("/mprsenet/EIS_fsubmit.jsp");
            }
        %>

    </body>
</html>
