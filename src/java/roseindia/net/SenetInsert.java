/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

import com.mysql.jdbc.PreparedStatement;
import java.sql.SQLException;
public class SenetInsert {


    public int insert(String InstId,int Months
            ,String Years,int Amc_of_pc1
            ,int Web1,int Connectivity1,int Contg1,int Others1
            ,String User_date ,int Amc_of_pc2 ,int Web2 ,int Connectivity2 ,int Contg2
            ,int Others2 ,int Amc_of_pc ,int Web ,int Connectivity
             ,int Contg ,int Others ,int Br_hardware_tomonth_0
             ,int Br_con_tomonth_0,int Br_contg_tomonth_0,int Br_others_tomonth_0
              ,int Br_hardware_tomonth_1,int Br_con_tomonth_1,int Br_contg_tomonth_1
               ,int Br_others_tomonth_1,int Br_hardware_tomonth_2,int Br_con_tomonth_2
                ,int Br_contg_tomonth_2,int Br_others_tomonth_2,int Br_hardware_tomonth_3
                 ,int Br_contg_tomonth_3,int Br_others_tomonth_3
                 ,int Br_hardware_tomonth_4,int Br_con_tomonth_4,int Br_contg_tomonth_4,int Br_others_tomonth_4
                 ,int Br_hardware_tomonth_5,int Br_con_tomonth_5,int Br_contg_tomonth_5,int Br_others_tomonth_5
                 ,int Br_con_tomonth_3,String Branch, String Branch_1,String Branch_2,String Branch_3,String Branch_4,String Branch_5

             ){
            int r=0;
       try{
     java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
     
    try{
     PreparedStatement stmt = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_senet(`Inst_id`,`months`,`year`,`AMC_of_pc1`,`web1`,`Connectivity1`,`Contg1`,`Others1`,`user_date`,`AMC_of_pc2`,`web2`,`Connectivity2`,`Others2`,`Contg2`,`AMC_of_pc`,`web`,`Connectivity`,`Contg`,`Others`, br_hardware_tomonth, br_con_tomonth, br_contg_tomonth, br_others_tomonth, br_hardware_tomonth_1, br_con_tomonth_1, br_contg_tomonth_1, br_others_tomonth_1, br_hardware_tomonth_2, br_con_tomonth_2, br_contg_tomonth_2, br_others_tomonth_2, br_hardware_tomonth_3, br_contg_tomonth_3, br_others_tomonth_3, br_hardware_tomonth_4, br_con_tomonth_4, br_contg_tomonth_4, br_others_tomonth_4, br_hardware_tomonth_5, br_con_tomonth_5, br_contg_tomonth_5, br_others_tomonth_5,br_con_tomonth_3)"
                                                                                       + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");


				stmt.setString(1, InstId);
				stmt.setInt(2, Months);
                                stmt.setString(3, Years);
				stmt.setInt(4, Amc_of_pc1);
                                stmt.setInt(5, Web1);
				stmt.setInt(6, Connectivity1);
                                stmt.setInt(7, Contg1);
				stmt.setInt(8, Others1);
                                stmt.setString(9, User_date);
				stmt.setInt(10, Amc_of_pc2);
                                stmt.setInt(11, Web2);
				stmt.setInt(12, Connectivity2);
                                stmt.setInt(13, Contg2);
				stmt.setInt(14, Others2);
                                stmt.setInt(15, Amc_of_pc);
				stmt.setInt(16, Web);
                                stmt.setInt(17, Connectivity);
				stmt.setInt(18, Contg);
                                stmt.setInt(19, Others);
                                stmt.setInt(20, Br_hardware_tomonth_0);
                                stmt.setInt(21, Br_con_tomonth_0);
				stmt.setInt(22, Br_contg_tomonth_0);
                                stmt.setInt(23, Br_others_tomonth_0);
                                stmt.setInt(24, Br_hardware_tomonth_1);
                                stmt.setInt(25, Br_con_tomonth_1);
				stmt.setInt(26, Br_contg_tomonth_1);
                                stmt.setInt(27, Br_others_tomonth_1);
                                stmt.setInt(28, Br_hardware_tomonth_2);
                                stmt.setInt(29, Br_con_tomonth_2);
				stmt.setInt(30, Br_contg_tomonth_2);
                                stmt.setInt(31, Br_others_tomonth_2);
                                stmt.setInt(32, Br_hardware_tomonth_3);
                                stmt.setInt(33, Br_contg_tomonth_3);
				stmt.setInt(34, Br_others_tomonth_3);
                                stmt.setInt(35, Br_hardware_tomonth_4);
                                stmt.setInt(36, Br_con_tomonth_4);
                                stmt.setInt(37, Br_contg_tomonth_4);
				stmt.setInt(38, Br_others_tomonth_4);
                                stmt.setInt(39, Br_hardware_tomonth_5);
                                stmt.setInt(40, Br_con_tomonth_5);
                                stmt.setInt(41, Br_contg_tomonth_5);
				stmt.setInt(42, Br_others_tomonth_5);
                                stmt.setInt(43, Br_con_tomonth_3);
                                     r= stmt.executeUpdate();

                                     System.out.println("Inserting Data Successfully!..........");

 

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
                         System.out.println("SQL statement is not executed!  "+s);

                        }
      }
                        catch (Exception e){
                             }
            return r;
}
}