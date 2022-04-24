/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uploadFundAllocation;

import common.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author msme
 */
public class InsertExpenditureMain extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session= request.getSession();
            
            String instId = (String) session.getAttribute("CmbIns");
            String role=(String)session.getAttribute("rol");
            String years=(String)session.getAttribute("CmbYear");
            String months=(String)session.getAttribute("CmbMonth");
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            java.util.Date date = new java.util.Date();
            String time = dateFormat.format(date);
            
            
            
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
            String pao_id="";
            int checkflag=0;
            try
            {
                con=ConnectionManager.getConnectionDirectForMySQL();
                st=con.createStatement();
                String sql="select pao_id  from pao_branches where Inst_id='"+instId+"' " ;
                rs=st.executeQuery(sql);
                if(rs.next())
                {
                    checkflag=1;
                    pao_id=rs.getString("pao_id");
                }
                else
                {
                    checkflag=0;
                }
            }
            catch(Exception err)
            {
            err.printStackTrace();
            }
            
            if(checkflag==0)
            {
               out.println("<body bgcolor=' #fceaea '>"
                        + "<br/><br/><br/><h3 align='center' style='color:red; font: normal normal 18px Verdana, Geneva, Arial, Helvetica, sans-serif;'>You are not eligible to fill the B&A expenditure....</h3>"
                        + "</body>");
            }else
            {
                
            double salaries=Double.parseDouble(request.getParameter("salaries"));
            double WAGES=Double.parseDouble(request.getParameter("wages"));
            double over_time_allawance=Double.parseDouble(request.getParameter("over_time_allawance"));
            double medical_treatment=Double.parseDouble(request.getParameter("medical_treatment"));
            double travel_expense_domestic=Double.parseDouble(request.getParameter("travel_expense_domestic"));
            double travel_expenses_foreign=Double.parseDouble(request.getParameter("travel_expenses_foreign"));
            double office_expenses=Double.parseDouble(request.getParameter("office_expenses"));
            double rent_rate_taxes=Double.parseDouble(request.getParameter("rent_rate_taxes"));
            double other_admin_expenses=Double.parseDouble(request.getParameter("other_admin_expenses"));
            double advertisement_publicity=Double.parseDouble(request.getParameter("advertisement_publicity"));
            double professional_services=Double.parseDouble(request.getParameter("professional_services"));
            double gr_in_aid_general=Double.parseDouble(request.getParameter("gr_in_aid_general"));
            double other_charges=Double.parseDouble(request.getParameter("other_charges"));
            double dcanteen=Double.parseDouble(request.getParameter("dcanteen"));
            double total=Double.parseDouble(request.getParameter("total"));
            
            System.out.println("years="+years);
            System.out.println("months="+months);
            System.out.println("time="+time);
            System.out.println("pao_id="+pao_id);
            System.out.println("branch_id="+instId);
            System.out.println("salaries="+salaries);
            System.out.println("WAGES="+WAGES);
            System.out.println("over_time_allawance="+over_time_allawance);
            System.out.println("medical_treatment="+medical_treatment);
            System.out.println("travel_expense_domestic="+travel_expense_domestic);
            System.out.println("travel_expenses_foreign="+travel_expenses_foreign);
            System.out.println("office_expenses="+office_expenses);
            System.out.println("rent_rate_taxes="+rent_rate_taxes);
            System.out.println("other_admin_expenses="+other_admin_expenses);
            System.out.println("advertisement_publicity="+advertisement_publicity);
            System.out.println("professional_services="+professional_services);
            System.out.println("gr_in_aid_general="+gr_in_aid_general);
            System.out.println("other_charges="+other_charges);
            System.out.println("dcanteen="+dcanteen);
            System.out.println("total="+total);
            
            UploadExpenditure uploadExpenditure = new UploadExpenditure();
            
            int i=uploadExpenditure.Insert(pao_id, instId, months, years, salaries, WAGES, over_time_allawance, medical_treatment, travel_expense_domestic, 
                    travel_expenses_foreign, office_expenses, rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, 
                    other_charges, dcanteen, total, time);
                System.out.println("Status============="+i);
            if(i>0)
            {
                System.out.println("Expenditure successfully inserted for "+instId);
                out.println("<body bgcolor=' #ebfcea '");
                out.println("<div id='uploaded'>");
                out.println("<br/><br/><br/><p style='color:green; font: normal normal 18px Verdana, Geneva, Arial, Helvetica, sans-serif;'>Expenditure updated....</p>");
                out.println("</div>");
                out.println("</body>");
            }
            
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
