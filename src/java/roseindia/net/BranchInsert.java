/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

import com.mysql.jdbc.Statement;
public class BranchInsert {
    public int insert(   String InstId,    int Months, String Years,
                         String  Branch,   int Br_hardware_target,   int Br_hardware_tomonth,   int Br_hardware_upto,   int Br_con_target,   int Br_con_tomonth,   int Br_con_upto,   int Br_contg_target,   int Br_contg_tomonth,   int Br_contg_upto,   int Br_others_target,   int Br_others_tomonth,   int Br_others_upto,
                         String  Branch_1, int Br_hardware_target_1, int Br_hardware_tomonth_1, int Br_hardware_upto_1, int Br_con_target_1, int Br_con_tomonth_1, int Br_con_upto_1, int Br_contg_target_1, int Br_contg_tomonth_1, int Br_contg_upto_1, int Br_others_target_1, int Br_others_tomonth_1, int Br_others_upto_1,
                         String  Branch_2, int Br_hardware_target_2, int Br_hardware_tomonth_2, int Br_hardware_upto_2, int Br_con_target_2, int Br_con_tomonth_2, int Br_con_upto_2, int Br_contg_target_2, int Br_contg_tomonth_2, int Br_contg_upto_2, int Br_others_target_2, int Br_others_tomonth_2, int Br_others_upto_2,
                         String  Branch_3, int Br_hardware_target_3, int Br_hardware_tomonth_3, int Br_hardware_upto_3, int Br_con_target_3, int Br_con_tomonth_3, int Br_con_upto_3, int Br_contg_target_3, int Br_contg_tomonth_3, int Br_contg_upto_3, int Br_others_target_3, int Br_others_tomonth_3, int Br_others_upto_3,
                         String  Branch_4, int Br_hardware_target_4, int Br_hardware_tomonth_4, int Br_hardware_upto_4, int Br_con_target_4, int Br_con_tomonth_4, int Br_con_upto_4, int Br_contg_target_4, int Br_contg_tomonth_4, int Br_contg_upto_4, int Br_others_target_4, int Br_others_tomonth_4, int Br_others_upto_4,
                         String  Branch_5, int Br_hardware_target_5, int Br_hardware_tomonth_5, int Br_hardware_upto_5, int Br_con_target_5, int Br_con_tomonth_5, int Br_con_upto_5, int Br_contg_target_5, int Br_contg_tomonth_5, int Br_contg_upto_5, int Br_others_target_5, int Br_others_tomonth_5, int Br_others_upto_5

             ){
            int r=0;
       try{
     java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
                        Statement statement = (Statement) con.createStatement();
                                String Branch_count[]={Branch,Branch_1,Branch_2,Branch_3,Branch_4,Branch_5};
                                String query;
                                String name=common.ConnectionManager.instituteCity(InstId);
                                for(int i=0;i<Branch_count.length;i++)
                                {
                                    if((Branch_count[i]!=null)&&(i==0))
                                    {
                                         
query="insert into Branch (MSME_NAME, Branch_name, years,months,Br_hardware_target,Br_hardware_tomonth,Br_hardware_upto,Br_con_target,Br_con_tomonth,Br_con_upto,Br_contg_target,Br_contg_tomonth,Br_contg_upto,Br_others_target,Br_others_tomonth,Br_others_upto) values ('"+name+"','"+Branch_count[i]+"','"+Years+"','"+Months+"','"+Br_hardware_target+"', '"+Br_hardware_tomonth+"','"+Br_hardware_upto+"', '"+Br_con_target+"','"+Br_con_tomonth+"','"+Br_con_upto+"','"+Br_contg_target+"','"+Br_contg_tomonth+"','"+Br_contg_upto+"','"+Br_others_target+"','"+Br_others_tomonth+"','"+Br_others_upto+"')";
System.out.println("This is the query that is gooing to enter the value in branch : "+query);
r=statement.executeUpdate(query);
                                    }
                                    if((Branch_count[i]!=null)&&(i==1))
                                    {
query="insert into Branch (MSME_NAME, Branch_name, years,months,Br_hardware_target,Br_hardware_tomonth,Br_hardware_upto,Br_con_target,Br_con_tomonth,Br_con_upto,Br_contg_target,Br_contg_tomonth,Br_contg_upto,Br_others_target,Br_others_tomonth,Br_others_upto) values ('"+name+"','"+Branch_count[i]+"','"+Years+"','"+Months+"','"+Br_hardware_target_1+"', '"+Br_hardware_tomonth_1+"','"+Br_hardware_upto_1+"', '"+Br_con_target_1+"','"+Br_con_tomonth_1+"','"+Br_con_upto_1+"','"+Br_contg_target_1+"','"+Br_contg_tomonth_1+"','"+Br_contg_upto_1+"','"+Br_others_target_1+"','"+Br_others_tomonth_1+"','"+Br_others_upto_1+"')";
System.out.println("This is the query that is gooing to enter the value in branch : "+query);
r=statement.executeUpdate(query);
                                    }
                                    if((Branch_count[i]!=null)&&(i==2))
                                    {
query="insert into Branch (MSME_NAME, Branch_name, years,months,Br_hardware_target,Br_hardware_tomonth,Br_hardware_upto,Br_con_target,Br_con_tomonth,Br_con_upto,Br_contg_target,Br_contg_tomonth,Br_contg_upto,Br_others_target,Br_others_tomonth,Br_others_upto) values ('"+name+"','"+Branch_count[i]+"','"+Years+"','"+Months+"','"+Br_hardware_target_2+"', '"+Br_hardware_tomonth_2+"','"+Br_hardware_upto_2+"', '"+Br_con_target_2+"','"+Br_con_tomonth_2+"','"+Br_con_upto_2+"','"+Br_contg_target_2+"','"+Br_contg_tomonth_2+"','"+Br_contg_upto_2+"','"+Br_others_target_2+"','"+Br_others_tomonth_2+"','"+Br_others_upto_2+"')";
System.out.println("This is the query that is gooing to enter the value in branch : "+query);
r=statement.executeUpdate(query);
                                    }
                                    if((Branch_count[i]!=null)&&(i==3))
                                    {
query="insert into Branch (MSME_NAME, Branch_name, years,months,Br_hardware_target,Br_hardware_tomonth,Br_hardware_upto,Br_con_target,Br_con_tomonth,Br_con_upto,Br_contg_target,Br_contg_tomonth,Br_contg_upto,Br_others_target,Br_others_tomonth,Br_others_upto) values ('"+name+"','"+Branch_count[i]+"','"+Years+"','"+Months+"','"+Br_hardware_target_3+"', '"+Br_hardware_tomonth_3+"','"+Br_hardware_upto_3+"', '"+Br_con_target_3+"','"+Br_con_tomonth_3+"','"+Br_con_upto_3+"','"+Br_contg_target_3+"','"+Br_contg_tomonth_3+"','"+Br_contg_upto_3+"','"+Br_others_target_3+"','"+Br_others_tomonth_3+"','"+Br_others_upto_3+"')";
System.out.println("This is the query that is gooing to enter the value in branch : "+query);
r=statement.executeUpdate(query);
                                    }
                                    if((Branch_count[i]!=null)&&(i==4))
                                    {
query="insert into Branch (MSME_NAME, Branch_name, years,months,Br_hardware_target,Br_hardware_tomonth,Br_hardware_upto,Br_con_target,Br_con_tomonth,Br_con_upto,Br_contg_target,Br_contg_tomonth,Br_contg_upto,Br_others_target,Br_others_tomonth,Br_others_upto) values ('"+name+"','"+Branch_count[i]+"','"+Years+"','"+Months+"','"+Br_hardware_target_4+"', '"+Br_hardware_tomonth_4+"','"+Br_hardware_upto_4+"', '"+Br_con_target_4+"','"+Br_con_tomonth_4+"','"+Br_con_upto_4+"','"+Br_contg_target_4+"','"+Br_contg_tomonth_4+"','"+Br_contg_upto_4+"','"+Br_others_target_4+"','"+Br_others_tomonth_4+"','"+Br_others_upto_4+"')";
System.out.println("This is the query that is gooing to enter the value in branch : "+query);
r=statement.executeUpdate(query);
                                    }
                                    if((Branch_count[i]!=null)&&(i==5))
                                    {
query="insert into Branch (MSME_NAME, Branch_name, years,months,Br_hardware_target,Br_hardware_tomonth,Br_hardware_upto,Br_con_target,Br_con_tomonth,Br_con_upto,Br_contg_target,Br_contg_tomonth,Br_contg_upto,Br_others_target,Br_others_tomonth,Br_others_upto) values ('"+name+"','"+Branch_count[i]+"','"+Years+"','"+Months+"','"+Br_hardware_target_5+"', '"+Br_hardware_tomonth_5+"','"+Br_hardware_upto_5+"', '"+Br_con_target_5+"','"+Br_con_tomonth_5+"','"+Br_con_upto_5+"','"+Br_contg_target_5+"','"+Br_contg_tomonth_5+"','"+Br_contg_upto_5+"','"+Br_others_target_5+"','"+Br_others_tomonth_5+"','"+Br_others_upto_5+"')";
System.out.println("This is the query that is gooing to enter the value in branch : "+query);
r=statement.executeUpdate(query);
                                    }

                                }
con.commit();
                             con.close();
      }
                        catch (Exception e)
                        {
                            System.out.println("following error when enterd the data in branch : "+e);
                             }
            return r;
}

    }
 
