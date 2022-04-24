/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uploadFundAllocation;

import common.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author msme
 */
public class InsertEditedAllocation 
{
    
    public int insertAllocationToDb(
            String pao_id,
            String branch_id,
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
        String Query="update tbl_ba_fundallocation set salaries=?,wages=?,over_time_allawance=?,medical_treatment=?,travel_expense_domestic=?,"
                + "travel_expenses_foreign=?,office_expenses=?,rent_rate_taxes=?,other_admin_expenses=?,advertisement_publicity=?,professional_services=?,"
                + "gr_in_aid_general=?,other_charges=?, dcanteen=?,total=?,isEdited=?,edited_date=? where pao_id=? and inst_id=? and YEARS=?";
        
        con=ConnectionManager.getConnectionDirectForMySQL();
        
        psmt=(PreparedStatement) con.prepareCall(Query);
        
        
        psmt.setDouble(1, salaries);
        psmt.setDouble(2, WAGES);
        psmt.setDouble(3, over_time_allawance);
        psmt.setDouble(4, medical_treatment);
        psmt.setDouble(5, travel_expense_domestic);
        psmt.setDouble(6, travel_expenses_foreign);
        psmt.setDouble(7, office_expenses);
        psmt.setDouble(8, rent_rate_taxes);
        psmt.setDouble(9, other_admin_expenses);
        psmt.setDouble(10, advertisement_publicity);
        psmt.setDouble(11, professional_services);
        psmt.setDouble(12, gr_in_aid_general);
        psmt.setDouble(13, other_charges);
        psmt.setDouble(14, dcanteen);
        psmt.setDouble(15, total);
        psmt.setString(16, "yes");        
        psmt.setString(17, time);
        psmt.setString(18, pao_id);
        psmt.setString(19, branch_id);
        psmt.setString(20, years);
        
        i=psmt.executeUpdate();
        con.commit();
        
        if(i>0)
        {
            System.out.println("allocation is updated");
        }
        }
        catch(Exception err)
        {
            System.out.println("there is some error while updation allocation"+err.getMessage());
            System.out.println("error is="+err.getMessage());
        }
        
        return i;
    }
}
