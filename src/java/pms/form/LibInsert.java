/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package pms.form;



import com.mysql.jdbc.PreparedStatement;
import java.sql.SQLException;
import roseindia.net.ConnectionManager;
import java.sql.*;
public class LibInsert {


    public int insert(String InstId,int Months
            ,String Years,int Amc_of_pc1
           ,int Amc_of_pc2 ,int Amc_of_pc ,int Br_hardware_target
             ,int Br_hardware_tomonth,int Br_hardware_upto,int Br_hardware_target_1
              ,int Br_hardware_tomonth_1,int Br_hardware_upto_1,int Br_hardware_target_2
               ,int Br_hardware_tomonth_2,int Br_hardware_upto_2,int Br_hardware_target_3
                ,int Br_hardware_tomonth_3,int Br_hardware_upto_3,int Br_hardware_target_4
                 ,int Br_hardware_tomonth_4,int Br_hardware_upto_4
                 ,int Br_hardware_target_5,int Br_hardware_tomonth_5,int Br_hardware_upto_5

             ){
            int r=0;
       try{
     //Connection  con = ConnectionManager.getConnectionDirectForMySQL();
           Connection con=ConnectionManager.getConnectionDirectForMySQL();
     System.out.println("connection"+con);
    try{
    PreparedStatement stmt = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_library(Inst_id, months, year, AMC_of_pc1, AMC_of_pc2, AMC_of_pc, br_hardware_target, br_hardware_tomonth, br_hardware_upto, br_hardware_target_1, br_hardware_tomonth_1, br_hardware_upto_1, br_hardware_target_2, br_hardware_tomonth_2, br_hardware_upto_2, br_hardware_target_3, br_hardware_tomonth_3, br_hardware_upto_3, br_hardware_target_4, br_hardware_tomonth_4, br_hardware_upto_4, br_hardware_target_5, br_hardware_tomonth_5, br_hardware_upto_5)"
                                                                                       + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");


				stmt.setString(1, InstId);
				stmt.setInt(2, Months);
                                stmt.setString(3, Years);
				stmt.setInt(4, Amc_of_pc1);
                                stmt.setInt(5, Amc_of_pc2);
				stmt.setInt(6, Amc_of_pc);
                                stmt.setInt(7, Br_hardware_target);
                                stmt.setInt(8, Br_hardware_tomonth);
				stmt.setInt(9, Br_hardware_upto);
                                 stmt.setInt(10, Br_hardware_target_1);
                                stmt.setInt(11, Br_hardware_tomonth_1);
				stmt.setInt(12, Br_hardware_upto_1);
                                 stmt.setInt(13, Br_hardware_target_2);
                                stmt.setInt(14, Br_hardware_tomonth_2);
				stmt.setInt(15, Br_hardware_upto_2);
                                 stmt.setInt(16, Br_hardware_target_3);
                                stmt.setInt(17, Br_hardware_tomonth_3);
				stmt.setInt(18, Br_hardware_upto_3);
                                 stmt.setInt(19, Br_hardware_target_4);
                                stmt.setInt(20, Br_hardware_tomonth_4);
				stmt.setInt(21, Br_hardware_upto_4);
                                 stmt.setInt(22, Br_hardware_target_5);
                                stmt.setInt(23, Br_hardware_tomonth_5);
				stmt.setInt(24, Br_hardware_upto_5);

            
                                     r= stmt.executeUpdate();

                                     System.out.println("Inserting Data Successfully!");
                                     con.commit();
                             con.close();
                            if(r >0){
                        System.out.println("Result Set have record");

                        }
                        else{
                    System.out.println(" Result Set have not record");

                        }

    }
     catch (SQLException s){
                         System.out.println("SQL statement is not executed!");

                        }
      }
                        catch (Exception e){
                             }
            return r;
}
}