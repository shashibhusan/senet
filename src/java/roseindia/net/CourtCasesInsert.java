/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

import com.mysql.jdbc.PreparedStatement;
import java.sql.SQLException;
public class CourtCasesInsert {


    public int insert(String Serial_number,String Detail_of_case
            ,java.sql.Date date,String Stakes_involved
            ,String Status,String Detail_of_application,String Present_status_of_the_case,int Months
            ,String Years ,String InstId ,String Nature_of_court ,String Controlling_Officers ,String Date_of_next_hearing
            ,String Expected_date_of_filing ,String Affidavit_date_of_filing_CA ,String Cases_related_to ,String Year_of_case
             ,String Status_of_case,String Name_of_Advocate,String Contact_No,String Email_Id,String Phone
             ){
            int r=0;
       try{
     java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
     System.out.println("connection"+con);
    try{
     PreparedStatement stmt = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_judical_detail(`Serial_number`,`Detail_of_case`,`date_of_entry`,`stakes_involved`,`status`,`Detail_of_application`,`Present_status_of_the_case`,`months`,`year`,`INST_ID`,`nature_of_court`,`Controlling_Officers`,`date_of_next_hearing`,`expected_date_of_filing`,`Affidavit_date_of_filing_CA`,`cases_related_to`,`year_of_case`,`status_of_case`,`Name_of_Advocate`,`Contact_No`,`Email_Id`,`Phone`)"
                                                                                       + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");


				stmt.setString(1, Serial_number);
				stmt.setString(2, Detail_of_case);
                                stmt.setDate(3, date);
				stmt.setString(4, Stakes_involved);
                                stmt.setString(5, Status);
                                stmt.setString(6, Detail_of_application);
				stmt.setString(7, Present_status_of_the_case);
                                stmt.setInt(8, Months);
				stmt.setString(9, Years);
                                stmt.setString(10, InstId);
				stmt.setString(11, Nature_of_court);
                                stmt.setString(12, Controlling_Officers);
                                stmt.setString(13, Date_of_next_hearing);
				stmt.setString(14, Expected_date_of_filing);
                                stmt.setString(15, Affidavit_date_of_filing_CA);
				stmt.setString(16, Cases_related_to);
                                stmt.setString(17, Year_of_case);
				stmt.setString(18, Status_of_case);
                                stmt.setString(19, Name_of_Advocate);
                                stmt.setString(20, Contact_No);
                                stmt.setString(21, Email_Id);
                                stmt.setString(22, Phone);

				// ResultSet rs = stmt.executeQuery(sql);
                        System.out.println("Inserting Data Successfully!"+stmt);
                                     r= stmt.executeUpdate();

                                    
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
                         System.out.println("SQL statement is kkknot executed!" +s);

                        }
      }
                        catch (Exception e){
                             }
            return r;
}
}