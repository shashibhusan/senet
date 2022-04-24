/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

import com.mysql.jdbc.PreparedStatement;
import java.sql.SQLException;

public class Pswupdate {


    public int update(String Hash,String Username,String Input){
            int r=0;
       try{
     java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
     System.out.println("connection"+con);
   System.out.println("Password that is entered is : "+Input);
          String sql = "UPDATE msme_di_users SET PASSWORD=? WHERE USER_ID = ? and PASSWORD = ? ";
        PreparedStatement prest = (PreparedStatement) con.prepareStatement(sql);
                                prest.setString(1,Hash);
                                 prest.setString(2,Username);
                                  prest.setString(3,Input);
                                    r= prest.executeUpdate();
                                     con.commit();
                             con.close();
                            if(r >0){
                        System.out.println("Result Set have record");

                        }
                        else{
                    System.out.println(" Result Set have not record");

                        }

   
      }
                        catch (Exception e){
                             }
            return r;
}
    
        public int saveOldPass(String inst, String pass, int no_of_change, String time, String IP)
    {
        int result1=0;
        try
        {
           java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
            System.out.println("connection for store old pass===="+con);
            
            try
            {
                String sql1="insert into user_old_pass_di(inst, password, no_of_changes, time, user_ip) values(?,?,?,?,?)";
                PreparedStatement prestm = (PreparedStatement) con.prepareStatement(sql1);
                prestm.setString(1, inst);
                prestm.setString(2, pass);
                prestm.setInt(3, no_of_change);
                prestm.setString(4, time);
                prestm.setString(5, IP);
                result1=prestm.executeUpdate();
                con.commit();
                con.close();
                
                if(result1 >0){
                        System.out.println("done=====================Result Set have record in old pass store");

                        }
                        else{
                    System.out.println(" error---------------Result Set have not record in old pass store");

                        }
                
            }
             catch (SQLException s){
                         System.out.println("SQL statement is not executed while storing old pass!");

                        }
        }
        catch (Exception e){
        e.printStackTrace();
        }
        return result1;
    }
    
}