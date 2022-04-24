/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package acr.net;

import com.mysql.jdbc.PreparedStatement;
import java.sql.SQLException;
import roseindia.net.ConnectionManager;
public class AcrInsert {


    public int insert(String Name1,String Designation
            ,String Date_of_Birth,String Year2004
            ,String Status,String Year2005,String Status1,String Year2006
            ,String Status2 ,String Year2007 ,String Status3 ,String Year2008 ,String Status4
            ,String Year2009 ,String Status5 ,String Year2010 ,String Status6
             ,String Year2011 ,String Status7 ,String Year2012
             ,String Status8,String Year2013,String Status9
              ,String Year2014,String Status10,String Year2000
               ,String Status11,String Year2001,String Status12
                ,String Year2002,String Status13,String Year2003
                 ,String Status14,String User_id

             ){
            int r=0;
       try{
     java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
     System.out.println("connection"+con);
    try{
      PreparedStatement stmt = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_acr(`name`,`Designation`,`Date_of_Birth`,`year2004`,`status`,`year2005`,`status1`,`year2006`,`status2`,`year2007`,`status3`,`year2008`,`status4`,`year2009`,`status5`,`year2010`,`status6`,`year2011`,`status7`,`year2012`,`status8`,`year2013`,`status9`,`year2014`,`status10`,`year2000`,`status11`,`year2001`,`status12`,`year2002`,`status13`,`year2003`,`status14`,`User_id`)"
                                                                                       + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");


				stmt.setString(1,Name1);
				stmt.setString(2, Designation);
                                stmt.setString(3, Date_of_Birth);
				stmt.setString(4, Year2004);
                                stmt.setString(5, Status);
				stmt.setString(6, Year2005);
                                stmt.setString(7, Status1);
				stmt.setString(8, Year2006);
                                stmt.setString(9, Status2);
                                stmt.setString(10, Year2007);
                                stmt.setString(11, Status3);
                                stmt.setString(12, Year2008);
                                stmt.setString(13, Status4);
                                stmt.setString(14, Year2009);
                                stmt.setString(15, Status5);
                                stmt.setString(16, Year2010);
                                stmt.setString(17, Status6);
                                stmt.setString(18, Year2011);
                                stmt.setString(19, Status7);
                                stmt.setString(20, Year2012);
                                stmt.setString(21, Status8);
                                stmt.setString(22, Year2013);
                                stmt.setString(23, Status9);
                                stmt.setString(24, Year2014);
                                stmt.setString(25, Status10);
                                stmt.setString(26, Year2000);
                                stmt.setString(27, Status11);
                                stmt.setString(28, Year2001);
                                stmt.setString(29, Status12);
                                stmt.setString(30, Year2002);
                                stmt.setString(31, Status13);
                                stmt.setString(32, Year2003);
                                stmt.setString(33, Status14);
                                stmt.setString(34, User_id);

				// ResultSet rs = stmt.executeQuery(sql);

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