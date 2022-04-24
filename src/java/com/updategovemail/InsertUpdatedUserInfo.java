/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.updategovemail;

import java.sql.*;
import common.*;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author msme
 */
public class InsertUpdatedUserInfo {

    public int UpdateUserInfoDB(String oldEmail, String new_gov_email, String confirm_gov_email,String ip_address) {
        int result = 0;
        if (new_gov_email.equals(confirm_gov_email)) {
            Connection con = null;
            Statement stm = null;
            PreparedStatement psmt = null;
            ResultSet rs = null;



            int token = 0;
            String name = "";
            String designation = "";
            String current_office = "";
            String password = "";
            String en_password = "";
            String mobile = "";
            String dob = "";

            String timeOfUpdate;

            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            java.util.Date date = new java.util.Date();
            timeOfUpdate = dateFormat.format(date);

            
            try {
                try {
                    con = ConnectionManager.getConnectionDirectForMySQL();
                    stm = con.createStatement();
                    String query = "select * from eis_register where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(query);
                    while (rs.next()) {
                        token = rs.getInt("token");
                        name = rs.getString("name");
                        designation = rs.getString("designation");
                        current_office = rs.getString("curnt_ofc");
                        password = rs.getString("password");
                        en_password = password;
                        mobile = rs.getString("mobile");
                        dob = rs.getString("dob");
                    }

                    System.out.println(token);
                    System.out.println(name);
                    System.out.println(designation);
                    System.out.println(current_office);
                    System.out.println(oldEmail);
                    System.out.println(confirm_gov_email);
                    System.out.println(password);
                    System.out.println(en_password);
                    System.out.println(mobile);
                    System.out.println(dob);
                    System.out.println(timeOfUpdate);
                    System.out.println(ip_address);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                int checkflag=0;
                   String query = "select * from eis_updated_user_gov_mail where gov_email='" + confirm_gov_email + "' ";
                    rs = stm.executeQuery(query);
                    if (rs.next()) {
                        checkflag=1;
                        result= 3;
                        System.out.println("Record is already exist!");
                    }
                    int update_in_eis_old_email=0;
                    if(checkflag==0)
                    {

                try {
                    String sql = "insert into eis_updated_user_gov_mail (token, name, designation, current_office, old_email, gov_email, password, en_password, mobile, dob, time, "
                            + "ip, isDisplay, isDelete, remark) values( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    psmt = (PreparedStatement) con.prepareStatement(sql);

                    psmt.setInt(1, token);
                    psmt.setString(2, name);
                    psmt.setString(3, designation);
                    psmt.setString(4, current_office);
                    psmt.setString(5, oldEmail);
                    psmt.setString(6, confirm_gov_email);
                    psmt.setString(7, password);
                    psmt.setString(8, en_password);
                    psmt.setString(9, mobile);
                    psmt.setString(10, dob);
                    psmt.setString(11, timeOfUpdate);
                    psmt.setString(12, ip_address);
                    psmt.setString(13, "1");
                    psmt.setString(14, "0");
                    psmt.setString(15, "gov_email_update");

                    result = psmt.executeUpdate();
                    
                    con.commit();
                    if(result>0)
                    {
                        result=1;
                                    //insert into eis_old_email
                            
                            try {
                                String sqlu = "insert into eis_old_email (old_email, new_email, name, designation, mobile, dob, time_of_update) values( ?,?,?,?,?,?,?)";
                                psmt = (PreparedStatement) con.prepareStatement(sqlu);

                                psmt.setString(1, oldEmail);
                                psmt.setString(2, confirm_gov_email);
                                psmt.setString(3, name);
                                psmt.setString(4, designation);
                                psmt.setString(5, mobile);
                                psmt.setString(6, dob);
                                psmt.setString(7, timeOfUpdate);

                                update_in_eis_old_email = psmt.executeUpdate();
                                con.commit();

                            } catch (Exception err1) {
                                err1.printStackTrace();
                            }
                    }else
                    {
                        result=0;
                    }

                } catch (Exception err1) {
                    err1.printStackTrace();
                }
                
 
                
//eis_register                
                
                if(update_in_eis_old_email>0 && result==1)
                {
                    try {
                    String check15 = "select * from eis_register where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check15);

                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_register");
                        String query15 = "update eis_register set email='" + confirm_gov_email + "' where email='" + oldEmail + "' and token='" + token + "'";
                        int rs15 = stm.executeUpdate(query15);
                        con.commit();
                        if (rs15 > 0) {
                            System.out.println("email updated in eis_register for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found eis_register for " + confirm_gov_email);
                    }
                } catch (Exception err15) {
                    err15.printStackTrace();
                    System.out.println("error occured while updating eis_register.");
                }
                }


//eis_basicinfo        
                try {
                    String check1 = "select * from eis_basicinfo where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check1);

                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_basicinfo");
                        String query1 = "update eis_basicinfo set email='" + confirm_gov_email + "' where email='" + oldEmail + "' and token='" + token + "'";
                        int rs1 = stm.executeUpdate(query1);
                        con.commit();
                        if (rs1 > 0) {
                            System.out.println("email updated in eis_basicinfo for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found eis_basicinfo for " + confirm_gov_email);
                    }
                } catch (Exception err1) {
                    err1.printStackTrace();
                    System.out.println("error occured while updating eis_basicinfo.");
                }

// eis_data_update_info

                try {
                    String check2 = "select * from eis_data_update_info where email='" + oldEmail + "' ";
                    ResultSet rs1 = stm.executeQuery(check2);
                    if (rs1.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_data_update_info");

                        String query2 = "update eis_data_update_info set email='" + confirm_gov_email + "' where email='" + oldEmail + "' and token='" + token + "'";

                        System.out.println(query2);
                        int rs2 = stm.executeUpdate(query2);
                        con.commit();
                        System.out.println("==" + rs2);
                        if (rs2 > 0) {
                            System.out.println("email updated in eis_data_update_info for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_data_update_info for " + confirm_gov_email);
                    }
                } catch (Exception err2) {
                    err2.printStackTrace();
                    System.out.println("error occured while updating eis_data_update_info.");
                }


// eis_final

                try {
                    String check3 = "select * from eis_final where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check3);
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_final");
                        String query3 = "update eis_final set email='" + confirm_gov_email + "' where email='" + oldEmail + "' ";
                        int rs3 = stm.executeUpdate(query3);
                        con.commit();
                        if (rs3 > 0) {
                            System.out.println("email updated in eis_final for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_final for " + confirm_gov_email);
                    }
                } catch (Exception err3) {
                    err3.printStackTrace();
                    System.out.println("error occured while updating eis_final.");
                }



// eis_final_submit_report

                try {
                    String check4 = "select * from eis_final_submit_report where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check4);
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_final_submit_report");
                        String query4 = "update eis_final_submit_report set email='" + confirm_gov_email + "' where email='" + oldEmail + "' ";
                        int rs4 = stm.executeUpdate(query4);
                        con.commit();
                        if (rs4 > 0) {
                            System.out.println("email updated in eis_final_submit_report for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_final_submit_report for " + confirm_gov_email);
                    }
                } catch (Exception err4) {
                    err4.printStackTrace();
                    System.out.println("error occured while updating eis_final_submit_report.");
                }


// eis_finalchange

                try {
                    String check5 = "select * from eis_finalchange where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check5);
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_finalchange");
                        String query5 = "update eis_finalchange set email='" + confirm_gov_email + "' where email='" + oldEmail + "' ";
                        int rs5 = stm.executeUpdate(query5);
                        con.commit();
                        if (rs5 > 0) {
                            System.out.println("email updated in eis_finalchange for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_finalchange for " + confirm_gov_email);
                    }
                } catch (Exception err5) {
                    err5.printStackTrace();
                    System.out.println("error occured while updating eis_finalchange.");
                }

// eis_other_details

                try {
                    String check6 = "select * from eis_other_details where email='" + oldEmail + "' and token='" + token + "'";
                    rs = stm.executeQuery(check6);
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_other_details");
                        String query6 = "update eis_other_details set email='" + confirm_gov_email + "' where email='" + oldEmail + "' and token='" + token + "' ";
                        int rs6 = stm.executeUpdate(query6);
                        con.commit();
                        if (rs6 > 0) {
                            System.out.println("email updated in eis_other_details for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_other_details for " + confirm_gov_email);
                    }
                } catch (Exception err6) {
                    err6.printStackTrace();
                    System.out.println("error occured while updating eis_other_details.");
                }


// eis_posthistory

                try {
                    String check7 = "select * from eis_posthistory where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check7);
                    con.commit();
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_posthistory");
                        String query7 = "update eis_posthistory set email='" + confirm_gov_email + "' where email='" + oldEmail + "' ";
                        int rs7 = stm.executeUpdate(query7);
                        if (rs7 > 0) {
                            System.out.println("email updated in eis_posthistory for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_posthistory for " + confirm_gov_email);
                    }
                } catch (Exception err7) {
                    err7.printStackTrace();
                    System.out.println("error occured while updating eis_posthistory.");
                }


// eis_postinginfo

                try {
                    String check8 = "select * from eis_postinginfo where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check8);
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_postinginfo");
                        String query8 = "update eis_postinginfo set email='" + confirm_gov_email + "' where email='" + oldEmail + "' ";
                        int rs8 = stm.executeUpdate(query8);
                        con.commit();
                        if (rs8 > 0) {
                            System.out.println("email updated in eis_postinginfo for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_postinginfo for " + confirm_gov_email);
                    }
                } catch (Exception err8) {
                    err8.printStackTrace();
                    System.out.println("error occured while updating eis_postinginfo.");
                }


// eis_postinginfo_new

                try {
                    String check9 = "select * from eis_postinginfo_new where email='" + oldEmail + "' and token='" + token + "' ";
                    rs = stm.executeQuery(check9);
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_postinginfo_new");
                        String query9 = "update eis_postinginfo_new set email='" + confirm_gov_email + "' where email='" + oldEmail + "' and token='" + token + "'";
                        int rs9 = stm.executeUpdate(query9);
                        con.commit();
                        if (rs9 > 0) {
                            System.out.println("email updated in eis_postinginfo_new for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_postinginfo_new for " + confirm_gov_email);
                    }
                } catch (Exception err9) {
                    err9.printStackTrace();
                    System.out.println("error occured while updating eis_postinginfo_new.");
                }



// eis_seniority_list_e

                try {
                    String check10 = "select * from eis_seniority_list_e where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check10);
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_seniority_list_e");
                        String query10 = "update eis_seniority_list_e set email='" + confirm_gov_email + "' where email='" + oldEmail + "'";
                        int rs10 = stm.executeUpdate(query10);
                        con.commit();
                        if (rs10 > 0) {
                            System.out.println("email updated in eis_seniority_list_e for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_seniority_list_e for " + confirm_gov_email);
                    }
                } catch (Exception err10) {
                    err10.printStackTrace();
                    System.out.println("error occured while updating eis_seniority_list_e.");
                }


// eis_trainingcompleted

                try {
                    String check11 = "select * from eis_trainingcompleted where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check11);
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_trainingcompleted");
                        String query11 = "update eis_trainingcompleted set email='" + confirm_gov_email + "' where email='" + oldEmail + "'";
                        int rs11 = stm.executeUpdate(query11);
                        con.commit();
                        if (rs11 > 0) {
                            System.out.println("email updated in eis_trainingcompleted for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_trainingcompleted for " + confirm_gov_email);
                    }
                } catch (Exception err11) {
                    err11.printStackTrace();
                    System.out.println("error occured while updating eis_trainingcompleted.");
                }


// eis_trainingdetails

                try {
                    String check12 = "select * from eis_trainingdetails where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check12);
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_trainingdetails");
                        String query12 = "update eis_trainingdetails set email='" + confirm_gov_email + "' where email='" + oldEmail + "'";
                        int rs12 = stm.executeUpdate(query12);
                        con.commit();
                        if (rs12 > 0) {
                            System.out.println("email updated in eis_trainingdetails for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_trainingdetails for " + confirm_gov_email);
                    }
                } catch (Exception err12) {
                    err12.printStackTrace();
                    System.out.println("error occured while updating eis_trainingdetails.");
                }


// eis_traininginfo

                try {
                    String check13 = "select * from eis_traininginfo where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check13);
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_traininginfo");
                        String query13 = "update eis_traininginfo set email='" + confirm_gov_email + "' where email='" + oldEmail + "'";
                        int rs13 = stm.executeUpdate(query13);
                        con.commit();
                        if (rs13 > 0) {
                            System.out.println("email updated in eis_traininginfo for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_traininginfo for " + confirm_gov_email);
                    }
                } catch (Exception err13) {
                    err13.printStackTrace();
                    System.out.println("error occured while updating eis_traininginfo.");
                }



// eis_transferandpromotiondata

                try {
                    String check14 = "select * from eis_transferandpromotiondata where email='" + oldEmail + "' ";
                    rs = stm.executeQuery(check14);
                    if (rs.next()) {
                        System.out.println("record found for " + oldEmail + " in eis_transferandpromotiondata");
                        String query14 = "update eis_transferandpromotiondata set email='" + confirm_gov_email + "' where email='" + oldEmail + "'";
                        int rs14 = stm.executeUpdate(query14);
                        con.commit();
                        if (rs14 > 0) {
                            System.out.println("email updated in eis_transferandpromotiondata for " + confirm_gov_email);
                        }
                    } else {
                        System.out.println("record not found in eis_transferandpromotiondata for " + confirm_gov_email);
                    }
                } catch (Exception err14) {
                    err14.printStackTrace();
                    System.out.println("error occured while updating eis_transferandpromotiondata.");
                } finally {
                    con.close();
                    psmt.close();
                    rs.close();
                    stm.close();
                }
                    }else
                    {
                        System.out.println("This gov email already updated..Please use another email.");
                        result= 3;
                    }
            } catch (Exception err) {
                err.printStackTrace();
            }



            return result;
        } else {
            return result;
        }

    }
}
