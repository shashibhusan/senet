package roseindia.net;

import com.mysql.jdbc.PreparedStatement;
import java.sql.SQLException;

public class SenetUpdate {

 public int update(String InstId,int Months
            ,String Years,int Amc_of_pc1
            ,int Web1,int Connectivity1,int Contg1,int Others1
            ,String User_date ,int Amc_of_pc2 ,int Web2 ,int Connectivity2 ,int Contg2
            ,int Others2 ,int Amc_of_pc ,int Web ,int Connectivity
             ,int Contg ,int Others ,int Br_hardware_tomonth
             ,int Br_con_tomonth,int Br_contg_tomonth,int Br_others_tomonth
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
     System.out.println("connection"+con);
    try{
                  String sql = "UPDATE tbl_senet SET AMC_of_pc1 = ?,web1=?,Connectivity1=?,Contg1=?,Others1=?,AMC_of_pc2=?,web2=?,Connectivity2=?,Others2=?,Contg2=?,AMC_of_pc=?,web=?,Connectivity=?,Contg=?,Others=?," +
                                       "Br_hardware_tomonth=?,Br_con_tomonth=?,Br_contg_tomonth=?,Br_others_tomonth=?,Br_hardware_tomonth_1=?,Br_con_tomonth_1=?,Br_contg_tomonth_1=?,Br_others_tomonth_1=?,Br_hardware_tomonth_2=?," +
                                       "Br_con_tomonth_2=?,Br_contg_tomonth_2=?,Br_others_tomonth_2=?,Br_hardware_tomonth_3=?,Br_con_tomonth_3=?,Br_contg_tomonth_3=?,Br_others_tomonth_3=?,Br_hardware_tomonth_4=?,Br_con_tomonth_4=?,Br_contg_tomonth_4=?,"+
                                       "Br_others_tomonth_4=?,Br_hardware_tomonth_5=?,Br_con_tomonth_5=?,Br_contg_tomonth_5=?,Br_others_tomonth_5=?"+
                                       " WHERE year = ? and Inst_id = ? and months = ? ";

 
				PreparedStatement prest =(PreparedStatement)con.prepareStatement(sql);
                                prest.setInt(1,Amc_of_pc1);
                                 prest.setInt(2,Web1);
                                  prest.setInt(3,Connectivity1);
                                   prest.setInt(4,Contg1);
                                    prest.setInt(5,Others1);

                                     prest.setInt(6,Amc_of_pc);
                                      prest.setInt(7,Web2);
                                       prest.setInt(8,Connectivity2);
                                        prest.setInt(9,Contg2);
                                         prest.setInt(10,Others2);
                                         
                                         prest.setInt(11,Amc_of_pc);
                                          prest.setInt(12,Web);
                                           prest.setInt(13,Connectivity);
                                            prest.setInt(14,Contg);
                                             prest.setInt(15,Others);
                                             
prest.setInt(16,Br_hardware_tomonth);
prest.setInt(17,Br_con_tomonth);
prest.setInt(18,Br_contg_tomonth);
prest.setInt(19,Br_others_tomonth);

prest.setInt(20,Br_hardware_tomonth_1);
prest.setInt(21,Br_con_tomonth_1);
prest.setInt(22,Br_contg_tomonth_1);
prest.setInt(23,Br_others_tomonth_1);

prest.setInt(24,Br_hardware_tomonth_2);
prest.setInt(25,Br_con_tomonth_2);
prest.setInt(26,Br_contg_tomonth_2);
prest.setInt(27,Br_others_tomonth_2);

prest.setInt(28,Br_hardware_tomonth_3);
prest.setInt(29,Br_con_tomonth_3);
prest.setInt(30,Br_contg_tomonth_3);
prest.setInt(31,Br_others_tomonth_3);

prest.setInt(32,Br_hardware_tomonth_4);
prest.setInt(33,Br_con_tomonth_4);
prest.setInt(34,Br_contg_tomonth_4);
prest.setInt(35,Br_others_tomonth_4);

prest.setInt(36,Br_hardware_tomonth_5);
prest.setInt(37,Br_con_tomonth_5);
prest.setInt(38,Br_contg_tomonth_5);
prest.setInt(39,Br_others_tomonth_5);
                                             prest.setString(40,Years);
                                               prest.setString(41,InstId);
                                                  prest.setInt(42,Months);

                                     r= prest.executeUpdate();
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
                         System.out.println("SQL statement is not executed! : "+s);

                        }
      }
                        catch (Exception e){
                             }
            return r;
}
}