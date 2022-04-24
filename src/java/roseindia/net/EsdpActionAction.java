/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package roseindia.net;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author prakash
 */
public class EsdpActionAction extends org.apache.struts.action.Action {
 /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";

    /**
     * This is the Struts action method called on
     * http://.../actionPath?method=myAction1,
     * where "method" is the value specified in <action> element : 
     * ( <action parameter="method" .../> )
     */
    public ActionForward add(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        EsdpActionActionForm EsdpActionActionForm = (EsdpActionActionForm) form;
        int Other1 = EsdpActionActionForm.getOther1();
        int Imc1 = EsdpActionActionForm.getImc1();
        int Sdp1 = EsdpActionActionForm.getSdp1();
        int Mdp1 = EsdpActionActionForm.getMdp1();
        int Bsdp1 = EsdpActionActionForm.getBsdp1();
        int Edp1 = EsdpActionActionForm.getEdp1();
        int Esdp1 = EsdpActionActionForm.getEsdp1();
        
        
        
        
        
        int Other2 = EsdpActionActionForm.getOther2();
        int Imc2 = EsdpActionActionForm.getImc2();
        int Sdp2 = EsdpActionActionForm.getSdp2();
        int Mdp2 = EsdpActionActionForm.getMdp2();
        int Bsdp2 = EsdpActionActionForm.getBsdp2();
        int Edp2 = EsdpActionActionForm.getEdp2();
        int Esdp2 = EsdpActionActionForm.getEsdp2();
        
        
        int Other3 = EsdpActionActionForm.getOther3();
        int Imc3 = EsdpActionActionForm.getImc3();
        int Sdp3 = EsdpActionActionForm.getSdp3();
        int Mdp3 = EsdpActionActionForm.getMdp3();
        int Bsdp3 = EsdpActionActionForm.getBsdp3();
        int Edp3 = EsdpActionActionForm.getEdp3();
        int Esdp3 = EsdpActionActionForm.getEsdp3();
        
        
        int Other4 = EsdpActionActionForm.getOther4();
        int Imc4 = EsdpActionActionForm.getImc4();
        int Sdp4 = EsdpActionActionForm.getSdp4();
        int Mdp4 = EsdpActionActionForm.getMdp4();
        int Bsdp4 = EsdpActionActionForm.getBsdp4();
        int Edp4 = EsdpActionActionForm.getEdp4();
        int Esdp4 = EsdpActionActionForm.getEsdp4();
        
        int Other5 = EsdpActionActionForm.getOther5();
        int Imc5 = EsdpActionActionForm.getImc5();
        int Sdp5 = EsdpActionActionForm.getSdp5();
        int Mdp5 = EsdpActionActionForm.getMdp5();
        int Bsdp5 = EsdpActionActionForm.getBsdp5();
        int Edp5 = EsdpActionActionForm.getEdp5();
        int Esdp5= EsdpActionActionForm.getEsdp5();
        
        
        String Years = EsdpActionActionForm.getYears();
        int Months = EsdpActionActionForm.getMonths();
        String User_date = EsdpActionActionForm.getUser_date();
        String InstId = EsdpActionActionForm.getInstId();
        
        System.out.println("bvbfgfgfgdf"+Esdp5);
         request.setAttribute("InstId",EsdpActionActionForm.getInstId());
         request.setAttribute("Other1",EsdpActionActionForm.getOther1());
         request.setAttribute("Imc1",EsdpActionActionForm.getImc1());
         request.setAttribute("Sdp1",EsdpActionActionForm.getSdp1());
         request.setAttribute("Mdp1",EsdpActionActionForm.getMdp1());
         request.setAttribute("Bsdp1",EsdpActionActionForm.getBsdp1());
         request.setAttribute("Edp1",EsdpActionActionForm.getEdp1());
         request.setAttribute("Esdp1",EsdpActionActionForm.getEsdp1());
          request.setAttribute("Years",EsdpActionActionForm.getYears());
     request.setAttribute("Months",EsdpActionActionForm.getMonths());
     request.setAttribute("User_date",EsdpActionActionForm.getUser_date());
         
         
     request.setAttribute("Other5",EsdpActionActionForm.getOther5());
         request.setAttribute("Imc5",EsdpActionActionForm.getImc5());
         request.setAttribute("Sdp5",EsdpActionActionForm.getSdp5());
         request.setAttribute("Mdp5",EsdpActionActionForm.getMdp5());
         request.setAttribute("Bsdp5",EsdpActionActionForm.getBsdp5());
         request.setAttribute("Edp5",EsdpActionActionForm.getEdp5());
         request.setAttribute("Esdp5",EsdpActionActionForm.getEsdp5());
         
         
         
         request.setAttribute("Other4",EsdpActionActionForm.getOther5());
         request.setAttribute("Imc4",EsdpActionActionForm.getImc5());
         request.setAttribute("Sdp4",EsdpActionActionForm.getSdp5());
         request.setAttribute("Mdp4",EsdpActionActionForm.getMdp5());
         request.setAttribute("Bsdp4",EsdpActionActionForm.getBsdp5());
         request.setAttribute("Edp4",EsdpActionActionForm.getEdp5());
         request.setAttribute("Esdp4",EsdpActionActionForm.getEsdp5());
         
         
         request.setAttribute("Other3",EsdpActionActionForm.getOther3());
         request.setAttribute("Imc3",EsdpActionActionForm.getImc3());
         request.setAttribute("Sdp3",EsdpActionActionForm.getSdp3());
         request.setAttribute("Mdp3",EsdpActionActionForm.getMdp3());
         request.setAttribute("Bsdp3",EsdpActionActionForm.getBsdp3());
         request.setAttribute("Edp3",EsdpActionActionForm.getEdp3());
         request.setAttribute("Esdp3",EsdpActionActionForm.getEsdp3());
         
         
         request.setAttribute("Other2",EsdpActionActionForm.getOther2());
         request.setAttribute("Imc2",EsdpActionActionForm.getImc2());
         request.setAttribute("Sdp2",EsdpActionActionForm.getSdp2());
         request.setAttribute("Mdp2",EsdpActionActionForm.getMdp2());
         request.setAttribute("Bsdp2",EsdpActionActionForm.getBsdp2());
         request.setAttribute("Edp2",EsdpActionActionForm.getEdp2());
         request.setAttribute("Esdp2",EsdpActionActionForm.getEsdp2());
     
         System.out.println(Esdp2);   
         
      
        System.out.println("Inserting values in Mysql database table!");
  try{
  
  
  Connection  con = ConnectionManager.getConnectionDirectForMySQL();
  try{
 // Statement st = con.createStatement();
PreparedStatement stmt = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_esdp(`Inst_id`,`months`,`year`,`esdp2`,`esdp3`,`edp2`,`edp3`,`bsdp2`,`user_date`,`bsdp3`,`mdp2`,`mdp3`,`sdp2`,`sdp3`,`imc2`,`imc3`,`other2`,`other3`,`esdp4`,`esdp5`,`edp4`,`edp5`,`bsdp5`,`mdp4`,`mdp5`,`imc4`,`imc5`,`other4`,`other5`,`sdp4`,`sdp5`,`esdp1`,`edp1`,`bsdp1`,`mdp1`,`sdp1`,`imc1`,`other1`)"
                                                                                       + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
                                                                                                                                                                                                                        
				stmt.setString(1, InstId);
				stmt.setInt(2, Months);
                                stmt.setString(3, Years);
				stmt.setInt(4, Esdp2);
                                stmt.setInt(5, Esdp3);
				stmt.setInt(6, Edp2);
                                stmt.setInt(7, Edp3);
				stmt.setInt(8, Bsdp2);
                                stmt.setString(9, User_date);
				stmt.setInt(10, Bsdp2);
                                stmt.setInt(11, Mdp2);
				stmt.setInt(12, Mdp3);
                                stmt.setInt(13, Sdp2);
				stmt.setInt(14, Sdp3);
                                stmt.setInt(15, Imc2);
				stmt.setInt(16, Imc3);
                                stmt.setInt(17, Other2);
				stmt.setInt(18, Other3);
                                stmt.setInt(19, Esdp4);
                                stmt.setInt(20, Esdp5);
                                stmt.setInt(21, Edp4);
				stmt.setInt(22, Edp5);
                                stmt.setInt(23, Bsdp4);
				stmt.setInt(24, Bsdp5);
                                stmt.setInt(25, Mdp4);
				stmt.setInt(26, Mdp5);
                                stmt.setInt(27, Imc4);
				stmt.setInt(28, Imc5);
                                stmt.setInt(29, Other4);
                                stmt.setInt(30, Other5);
                                stmt.setInt(31, Sdp4);
				stmt.setInt(32, Sdp5);
                                stmt.setInt(33, Esdp1);
				stmt.setInt(34, Edp1);
                                stmt.setInt(35, Bsdp1);
                                 stmt.setInt(31, Mdp1);
				stmt.setInt(32, Sdp1);
                                stmt.setInt(33, Imc1);
				stmt.setInt(34, Edp1);
                                stmt.setInt(35, Other1);
				
				
  
				// ResultSet rs = stmt.executeQuery(sql);

                     stmt.execute();
                        
                         System.out.println("1 row affected");
                       
                             con.commit();
                             con.close();
                             
                        
                              }
                             catch (SQLException s){
                         System.out.println("SQL statement is not executed!");
                         return mapping.findForward("failure");
                        }
                             }
                        catch (Exception e){
                             }
                            return mapping.findForward(SUCCESS);
                                 }

    public ActionForward update(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        SenetActionForm SenetActionForm = (SenetActionForm) form;
        int Amc_of_pc = SenetActionForm.getAmc_of_pc();
        int Amc_of_pc1 = SenetActionForm.getAmc_of_pc1();
        int Amc_of_pc2 = SenetActionForm.getAmc_of_pc2();
        int Web = SenetActionForm.getWeb();
        int Web1 = SenetActionForm.getWeb1();
        int Web2 = SenetActionForm.getWeb2();
        int Connectivity = SenetActionForm.getConnectivity();
        int Connectivity1 = SenetActionForm.getConnectivity1();
        int Connectivity2 = SenetActionForm.getConnectivity2();
        int Contg = SenetActionForm.getContg();
        int Contg1 = SenetActionForm.getContg1();
        int Contg2 = SenetActionForm.getContg2();
        int Others = SenetActionForm.getOthers();
        int Others1 = SenetActionForm.getOthers1();
        int Others2 = SenetActionForm.getOthers2();
        String Years = SenetActionForm.getYears();
        int Months = SenetActionForm.getMonths();
        String User_date = SenetActionForm.getUser_date();
        String InstId = SenetActionForm.getInstId();
        
        
        System.out.println("prakash chandra"+Amc_of_pc);
        System.out.println("prakash chandra"+Amc_of_pc1);
         System.out.println("prakash chandra"+Amc_of_pc2);
        System.out.println("prakash chandra"+Web);
         System.out.println("prakash chandra"+Web1);
        System.out.println("prakash chandra"+Web2);
         System.out.println("prakash chandra"+Connectivity);
        System.out.println("prakash chandra"+Connectivity1);
         System.out.println("prakash chandra"+Connectivity2);
        System.out.println("prakash chandra"+Contg);
         System.out.println("prakash chandra"+Contg1);
        System.out.println("prakash chandra"+Contg2);
         System.out.println("prakash chandra"+Others);
        System.out.println("prakash chandra"+Others1);
         System.out.println("prakash chandra"+Others2);
        System.out.println("prakash chandra"+Years);
        System.out.println("prakash chandra"+Months);
        System.out.println("prakash chandra"+User_date);
        System.out.println("prakash chandra"+InstId);
        
     request.setAttribute("Amc_of_pc",SenetActionForm.getAmc_of_pc());
     request.setAttribute("Amc_of_pc1",SenetActionForm.getAmc_of_pc1());
     request.setAttribute("Amc_of_pc2",SenetActionForm.getAmc_of_pc2());
     request.setAttribute("Web",SenetActionForm.getWeb());
     request.setAttribute("Web1",SenetActionForm.getWeb1());
     request.setAttribute("Web2",SenetActionForm.getWeb2());
     request.setAttribute("Connectivity",SenetActionForm.getConnectivity());
     request.setAttribute("Connectivity1",SenetActionForm.getConnectivity1());
     request.setAttribute("Connectivity2",SenetActionForm.getConnectivity2());
     request.setAttribute("Contg",SenetActionForm.getContg());
     request.setAttribute("Contg1",SenetActionForm.getContg1());
     request.setAttribute("Contg2",SenetActionForm.getContg2());
     request.setAttribute("Others",SenetActionForm.getOthers());
     request.setAttribute("Others1",SenetActionForm.getOthers1());
       request.setAttribute("Others2",SenetActionForm.getOthers2());   
        
        request.setAttribute("Years",SenetActionForm.getYears());
     request.setAttribute("Months",SenetActionForm.getMonths());
     request.setAttribute("User_date",SenetActionForm.getUser_date());
       request.setAttribute("InstId",SenetActionForm.getInstId());
        
        System.out.println("Inserting values in Mysql database table!");
  
  try{
 Connection  con = ConnectionManager.getConnectionDirectForMySQL();
  try{
 // Statement st = con.createStatement();
      String sql = "UPDATE tbl_senet SET AMC_of_pc1 = ?,web1=?,Connectivity1=?,Contg1=?,Others1=?,AMC_of_pc2=?,web2=?,Connectivity2=?,Others2=?,Contg2=?,AMC_of_pc=?,web=?,Connectivity=?,Contg=?,Others=? WHERE year = ? and Inst_id = ? and months = ? ";
              
 // Inst_id, months, year, AMC_of_pc1, web1, Connectivity1, Contg1, Others1, user_date, AMC_of_pc2, web2, Connectivity2, Others2, Contg2, AMC_of_pc, web, Connectivity, Contg, Others
				PreparedStatement prest = con.prepareStatement(sql); 
                                prest.setInt(1,Amc_of_pc1);
                                 prest.setInt(2,Web1);
                                  prest.setInt(3,Connectivity1);
                                   prest.setInt(4,Contg1);
                                    prest.setInt(5,Others1);
                                     prest.setInt(6,Amc_of_pc);
                                      prest.setInt(7,Web2);
                                       prest.setInt(8,Connectivity2);
                                        prest.setInt(9,Others2);
                                         prest.setInt(10,Contg2); 
                                         prest.setInt(11,Amc_of_pc);
                                          prest.setInt(12,Web);
                                           prest.setInt(13,Connectivity);
                                            prest.setInt(14,Contg);
                                             prest.setInt(15,Others);
                                             prest.setString(16,Years);
                                               prest.setString(17,InstId);
                                                  prest.setInt(18,Months);
                                
                                prest.executeUpdate();
                                System.out.println("Updating Successfully!");
                                con.commit();
                                con.close(); 
                        
                         System.out.println("1 row affected");
                       }
                             catch (SQLException s){
                         System.out.println("SQL statement is not executed!");
                         return mapping.findForward("failure");
                        }
                             }
                        catch (Exception e){
                             }

                            return mapping.findForward(SUCCESS);
                                 }


    
}