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
public class UploadAllocationEditedMain extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
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
            
            
            HttpSession session = request.getSession(true);
             
            //String instId=(String)session.getAttribute("CmbIns");
            String instId=request.getParameter("InstId");
            String role=(String)session.getAttribute("rol");
            String years=request.getParameter("years");
            String months=(String)session.getAttribute("CmbMonth");
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            java.util.Date date = new java.util.Date();
            String time = dateFormat.format(date);
            
            String pao_name=request.getParameter("pao");
            String branch_id=request.getParameter("branchName");
            
            
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
            String pao_id="";
            
            try
            {
                con=ConnectionManager.getConnectionDirectForMySQL();
                st=con.createStatement();
                String sql="select pao_id  from pao_branches where pao_name='"+pao_name+"' " ;
                rs=st.executeQuery(sql);
                while(rs.next())
                {
                    pao_id=rs.getString("pao_id");
                }
            }
            catch(Exception err)
            {
            err.printStackTrace();
            }
            
            
            
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
            System.out.println("branch_id="+branch_id);
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
            
            InsertEditedAllocation editedAllocation=new InsertEditedAllocation();
            int status=editedAllocation.insertAllocationToDb(pao_id, instId, years, salaries, WAGES, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses, rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total, time);
            System.out.println("Status=="+status);
            if(status>0)
            {
                System.out.println("ullocation updated for="+pao_name+"-->"+branch_id);
               // response.sendRedirect("s.jsp");
                out.println("<body bgcolor=' #ebfcea '>"
                        + "<br/><br/><br/><h3 style='color:green; font: normal normal 18px Verdana, Geneva, Arial, Helvetica, sans-serif;'>Budget allocation is updated....</h3>"
                        + "</body>");
            }else
            {
                
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
    }// </editor-fold>
}
