/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uploadFundAllocation;
import java.sql.*;
import common.*;
/**
 *
 * @author msme
 */
public class UploadExpenditure 
{
    public int Insert(
            String pao_id,
            String branch_id,
            String months,
            String years,
            Double salaries,
            Double WAGES,
            Double over_time_allawance,
            Double medical_treatment,
            Double travel_expense_domestic,
            Double travel_expenses_foreign,
            Double office_expenses,
            Double rent_rate_taxes,
            Double other_admin_expenses,
            Double advertisement_publicity,
            Double professional_services,
            Double gr_in_aid_general,
            Double other_charges,
            Double dcanteen,
            Double total,
            String time
            )
    {
        Connection con=null;
        PreparedStatement psmt=null;
        int i=0;
        try
        {
        String Query="insert into tbl_ba_expenditure (pao_id,inst_id,MONTHS,YEARS,yearmonths,salaries,wages,over_time_allawance,medical_treatment,travel_expense_domestic,"
                + "travel_expenses_foreign,office_expenses,rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,"
                + "dcanteen,total,creation_date,isDisplay,isDelete,isActive) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        con=ConnectionManager.getConnectionDirectForMySQL();
        
        psmt=(PreparedStatement) con.prepareCall(Query);
        
         psmt.setString(1, pao_id);
        psmt.setString(2, branch_id);
        psmt.setString(3, months);
        psmt.setString(4, years);
        psmt.setString(5, months+years);
        psmt.setDouble(6, salaries);
        psmt.setDouble(7, WAGES);
        psmt.setDouble(8, over_time_allawance);
        psmt.setDouble(9, medical_treatment);
        psmt.setDouble(10, travel_expense_domestic);
        psmt.setDouble(11, travel_expenses_foreign);
        psmt.setDouble(12, office_expenses);
        psmt.setDouble(13, rent_rate_taxes);
        psmt.setDouble(14, other_admin_expenses);
        psmt.setDouble(15, advertisement_publicity);
        psmt.setDouble(16, professional_services);
        psmt.setDouble(17, gr_in_aid_general);
        psmt.setDouble(18, other_charges);
        psmt.setDouble(19, dcanteen);
        psmt.setDouble(20, total);
        psmt.setString(21, time);
        psmt.setString(22, "1");
        psmt.setString(23, "0");
        psmt.setString(24, "1");
        
        i=psmt.executeUpdate();
        con.commit();
        
        if(i>0)
        {
            System.out.println("1 row inserted in expenditure");
        }
        }
        catch(Exception err)
        {
            System.out.println("error is="+err.getMessage());
        }
        return i;
    }
    
}
