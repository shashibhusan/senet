/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.updategovemail;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import common.*;

/**
 *
 * @author msme
 */
public class UpdateEmail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            HttpSession session = request.getSession(true);
            
            String oldEmail=request.getParameter("oldEmail");
            String email=request.getParameter("govEmail");
            String confirm_email=request.getParameter("confirmGovEmail");
            
            
            String ipAddress =  request.getRemoteAddr();
            System.out.println("IP Address :- " + ipAddress);
            
            System.out.println("oldEmail="+oldEmail);
            System.out.println("email="+email);
            System.out.println("confirm_email="+confirm_email);
            
            String captcha = (String) session.getAttribute("key");
            request.setCharacterEncoding("UTF-8");
            String answer = request.getParameter("answer");
            
            if(email.equals(confirm_email) && captcha.equals(answer))
            {
//                String nmm = "0x6a09e667f3bcc908";
//                session.setAttribute("nmm", nmm);
//                session.setAttribute("username", confirm_email);
                
               InsertUpdatedUserInfo insert=new InsertUpdatedUserInfo();
               int i=insert.UpdateUserInfoDB(oldEmail, email, confirm_email,ipAddress);
               
               if(i==1)
               {
                   response.sendRedirect("eis_forms/changesuccessfull.jsp");
               }else if(i==3)
               {
                   response.sendRedirect("eis_forms/jsperror.jsp?errorCode="+i);
               }else
               {
                   response.sendRedirect("eis_forms/jsperror.jsp?errorCode=Oxbhd56jd");
               }
                
                
            }else
            {
                out.println("Email not valid");
            }
            
        } finally {            
            out.close();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
