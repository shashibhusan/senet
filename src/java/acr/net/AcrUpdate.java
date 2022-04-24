/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package acr.net;

import com.mysql.jdbc.PreparedStatement;
import java.sql.SQLException;
import roseindia.net.ConnectionManager;

public class AcrUpdate {

 public int update(String Name1,String Designation
            ,String Date_of_Birth,String Year2004
            ,String Status,String Year2005,String Status1,String Year2006
            ,String Status2 ,String Year2007 ,String Status3 ,String Year2008 ,String Status4
            ,String Year2009 ,String Status5 ,String Year2010 ,String Status6
             ,String Year2011 ,String Status7 ,String Year2012
             ,String Status8,String Year2013,String Status9
              ,String Year2014,String Status10,String Year2000
               ,String Status11,String Year2001,String Status12
                ,String Year2002,String Status13,String Year2003
                 ,String Status14,String User_id,String Sno

             ){
            int r=0;
       try{
     java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
     System.out.println("connection"+con);
    try{
     String sql = "UPDATE tbl_acr SET name = ?,Designation=?,Date_of_Birth=?,year2004=?,status=?,year2005=?,status1=?,year2006=?,status2=?,year2007=?,status3=?,year2008=?,status4=?,year2009=?,status5=?,year2010=? ,status6 = ?,year2011=?,status7=?,year2012=?,status8=?,year2013=?,status9=?,year2014=?,status10=?,year2000=?,status11=?,year2001=?,status12=?,year2002=?,status13=?,year2003=?,status14=? WHERE sno = ? ";

 // Inst_id, months, year, AMC_of_pc1, web1, Connectivity1, Contg1, Others1, user_date, AMC_of_pc2, web2, Connectivity2, Others2, Contg2, AMC_of_pc, web, Connectivity, Contg, Others
				PreparedStatement prest =(PreparedStatement)con.prepareStatement(sql);
                               prest.setString(1,Name1);
				prest.setString(2, Designation);
                                prest.setString(3, Date_of_Birth);
				prest.setString(4, Year2004);
                                prest.setString(5, Status);
				prest.setString(6, Year2005);
                                prest.setString(7, Status1);
				prest.setString(8, Year2006);
                                prest.setString(9, Status2);
                                prest.setString(10, Year2007);
                                prest.setString(11, Status3);
                                prest.setString(12, Year2008);
                                prest.setString(13, Status4);
                                prest.setString(14, Year2009);
                                prest.setString(15, Status5);
                                prest.setString(16, Year2010);
                                prest.setString(17, Status6);
                                prest.setString(18, Year2011);
                                prest.setString(19, Status7);
                                prest.setString(20, Year2012);
                                prest.setString(21, Status8);
                                prest.setString(22, Year2013);
                                prest.setString(23, Status9);
                                prest.setString(24, Year2014);
                                prest.setString(25, Status10);
                                prest.setString(26, Year2000);
                                prest.setString(27, Status11);
                                prest.setString(28, Year2001);
                                prest.setString(29, Status12);
                                prest.setString(30, Year2002);
                                prest.setString(31, Status13);
                                prest.setString(32, Year2003);
                                prest.setString(33, Status14);
                                prest.setString(34, Sno);


				// ResultSet rs = stmt.executeQuery(sql);

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
                         System.out.println("SQL statement is not executed!");

                        }
      }
                        catch (Exception e){
                             }
            return r;
}
}