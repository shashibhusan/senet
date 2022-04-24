/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package pms.form;

import com.mysql.jdbc.PreparedStatement;
import java.sql.SQLException;
import roseindia.net.ConnectionManager;

public class LibUpdate {

 public int update(String InstId,int Months
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
     java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
     System.out.println("connection"+con);
    try{
        System.out.println("prakash"+Amc_of_pc1);
        System.out.println("prakash"+Amc_of_pc2);
        System.out.println("prakash"+Amc_of_pc);
        System.out.println("prakash"+Years);
        System.out.println("prakash"+InstId);
        System.out.println("prakash"+Months);

        
        String sql = "UPDATE tbl_library SET AMC_of_pc1 = ?,AMC_of_pc2=?,Amc_of_pc=? WHERE year = ? and Inst_id = ? and months = ? ";


			PreparedStatement prest =(PreparedStatement)con.prepareStatement(sql);
                                prest.setInt(1,Amc_of_pc1);
                                 prest.setInt(2,Amc_of_pc2);
                                  prest.setInt(3,Amc_of_pc);
                                  prest.setString(4,Years);
                                  prest.setString(5,InstId);
                                  prest.setInt(6,Months);
                                    System.out.println(prest);
                                    r= prest.executeUpdate();

                                     System.out.println("Inserting Data Successfully!");
                                     System.out.println(r);
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