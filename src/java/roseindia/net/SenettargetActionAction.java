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
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

/**
 *
 * @author eswar@vaannila.com
 */
public class SenettargetActionAction extends DispatchAction {

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
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>0");
        SenettargetActionForm SenettargetActionForm = (SenettargetActionForm) form;
        HttpSession session = request.getSession(true);
        String Random5 = (String) session.getAttribute("Random5");
        System.out.println("financial random number" + Random5);
        String Mnm = SenettargetActionForm.getMnm();
        String captcha = request.getParameter("formcaptcha");
        String generated_Captcha = (String) session.getAttribute("key");
        System.out.println("this is raghav captcha page ==================senettargetactionaction.java=====" + captcha);
        if (generated_Captcha.endsWith(captcha)) {
            System.out.println("financial random number second" + Mnm);
            if (!Random5.equals(Mnm)) // if(!OWASP_CSRFTOKENN.equals(OWASP_CSRFTOKEN))
            {
                response.sendRedirect("staterror.jsp");
            } else {
                int Amc_of_pc1 = SenettargetActionForm.getAmc_of_pc1();
                int Web1 = SenettargetActionForm.getWeb1();
                int Connectivity1 = SenettargetActionForm.getConnectivity1();
                int Contg1 = SenettargetActionForm.getContg1();
                int Others1 = SenettargetActionForm.getOthers1();


                int Br_hardware_target = SenettargetActionForm.getBr_hardware_target();
                int Br_con_target = SenettargetActionForm.getBr_con_target();
                int Br_contg_target = SenettargetActionForm.getBr_contg_target();
                int Br_others_target = SenettargetActionForm.getBr_others_target();

                int Br_hardware_target_1 = SenettargetActionForm.getBr_hardware_target_1();
                int Br_con_target_1 = SenettargetActionForm.getBr_con_target_1();
                int Br_contg_target_1 = SenettargetActionForm.getBr_contg_target_1();
                int Br_others_target_1 = SenettargetActionForm.getBr_others_target_1();


                int Br_hardware_target_2 = SenettargetActionForm.getBr_hardware_target_2();
                int Br_con_target_2 = SenettargetActionForm.getBr_con_target_2();
                int Br_contg_target_2 = SenettargetActionForm.getBr_contg_target_2();
                int Br_others_target_2 = SenettargetActionForm.getBr_others_target_2();


                int Br_hardware_target_3 = SenettargetActionForm.getBr_hardware_target_3();
                int Br_con_target_3 = SenettargetActionForm.getBr_con_target_3();
                int Br_contg_target_3 = SenettargetActionForm.getBr_contg_target_3();
                int Br_others_target_3 = SenettargetActionForm.getBr_others_target_3();


                int Br_hardware_target_4 = SenettargetActionForm.getBr_hardware_target_4();
                int Br_con_target_4 = SenettargetActionForm.getBr_con_target_4();
                int Br_contg_target_4 = SenettargetActionForm.getBr_contg_target_4();
                int Br_others_target_4 = SenettargetActionForm.getBr_others_target_4();


                int Br_hardware_target_5 = SenettargetActionForm.getBr_hardware_target_5();
                int Br_con_target_5 = SenettargetActionForm.getBr_con_target_5();
                int Br_contg_target_5 = SenettargetActionForm.getBr_contg_target_5();
                int Br_others_target_5 = SenettargetActionForm.getBr_others_target_5();












                String InstId = (String) session.getAttribute("CmbIns");
                String Years = (String) session.getAttribute("CmbYear");
                int Months = Integer.parseInt((String) session.getAttribute("CmbMonth"));


                if (Amc_of_pc1 < 0 || Web1 < 0 || Connectivity1 < 0 || Contg1 < 0 || Others1 < 0
                        || Br_hardware_target_5 < 0 || Br_con_target_5 < 0 || Br_contg_target_5 < 0 || Br_others_target_5 < 0
                        || Br_hardware_target_4 < 0 || Br_con_target_4 < 0 || Br_contg_target_4 < 0 || Br_others_target_4 < 0
                        || Br_hardware_target_3 < 0 || Br_con_target_3 < 0 || Br_contg_target_3 < 0 || Br_others_target_3 < 0
                        || Br_hardware_target_2 < 0 || Br_con_target_2 < 0 || Br_contg_target_2 < 0 || Br_others_target_2 < 0
                        || Br_hardware_target_1 < 0 || Br_con_target_1 < 0 || Br_contg_target_1 < 0 || Br_others_target_1 < 0
                        || Br_hardware_target < 0 || Br_con_target < 0 || Br_contg_target < 0 || Br_others_target < 0) {
                    response.sendRedirect("staterror.jsp");
                } else {







                    request.setAttribute("Amc_of_pc1", SenettargetActionForm.getAmc_of_pc1());

                    request.setAttribute("Web1", SenettargetActionForm.getWeb1());

                    request.setAttribute("Connectivity1", SenettargetActionForm.getConnectivity1());


                    request.setAttribute("Contg1", SenettargetActionForm.getContg1());

                    request.setAttribute("Others1", SenettargetActionForm.getOthers1());


                    request.setAttribute("Years", SenettargetActionForm.getYears());
                    request.setAttribute("Months", SenettargetActionForm.getMonths());

                    request.setAttribute("InstId", SenettargetActionForm.getInstId());

                    System.out.println("Inserting values in Mysql database table!");
                    try {


                        Connection con = ConnectionManager.getConnectionDirectForMySQL();
                        try {
                            // Statement st = con.createStatement();
                            PreparedStatement stmt = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_targetsenet(`Inst_id`,`months`,`year`,`AMC_of_pc1`,`web1`,`Connectivity1`,`Contg1`,`Others1`,Br_hardware_target, Br_con_target, Br_contg_target,Br_others_target, Br_hardware_target_1, Br_con_target_1, Br_contg_target_1, Br_others_target_1, Br_hardware_target_2, Br_con_target_2, Br_contg_target_2, Br_others_target_2, Br_hardware_target_3, Br_con_target_3, Br_contg_target_3, Br_others_target_3, Br_hardware_target_4, Br_con_target_4, Br_contg_target_4, Br_others_target_4, Br_hardware_target_5, Br_con_target_5, Br_contg_target_5, Br_others_target_5)"
                                    + " VALUES (?,?,?,?,"
                                    + "?,?,?,?"
                                    + ",?,?,?,?"
                                    + ",?,?,?,?"
                                    + ",?,?,?,?"
                                    + ",?,?,?,?"
                                    + ",?,?,?,?"
                                    + ",?,?,?,?) ");


                            stmt.setString(1, InstId);
                            stmt.setInt(2, Months);
                            stmt.setString(3, Years);
                            stmt.setInt(4, Amc_of_pc1);
                            stmt.setInt(5, Web1);
                            stmt.setInt(6, Connectivity1);
                            stmt.setInt(7, Contg1);
                            stmt.setInt(8, Others1);
                            stmt.setInt(9, Br_hardware_target);
                            stmt.setInt(10, Br_con_target);
                            stmt.setInt(11, Br_contg_target);
                            stmt.setInt(12, Br_others_target);
                            stmt.setInt(13, Br_hardware_target_1);
                            stmt.setInt(14, Br_con_target_1);
                            stmt.setInt(15, Br_contg_target_1);
                            stmt.setInt(16, Br_others_target_1);
                            stmt.setInt(17, Br_hardware_target_2);
                            stmt.setInt(18, Br_con_target_2);
                            stmt.setInt(19, Br_contg_target_2);
                            stmt.setInt(20, Br_others_target_2);
                            stmt.setInt(21, Br_hardware_target_3);
                            stmt.setInt(22, Br_con_target_3);
                            stmt.setInt(23, Br_contg_target_3);
                            stmt.setInt(24, Br_others_target_3);
                            stmt.setInt(25, Br_hardware_target_4);
                            stmt.setInt(26, Br_con_target_4);
                            stmt.setInt(27, Br_contg_target_4);
                            stmt.setInt(28, Br_others_target_4);
                            stmt.setInt(29, Br_hardware_target_5);
                            stmt.setInt(30, Br_con_target_5);
                            stmt.setInt(31, Br_contg_target_5);
                            stmt.setInt(32, Br_others_target_5);

                            // ResultSet rs = stmt.executeQuery(sql);
                            System.out.println("1 row affected" + stmt);
                            stmt.execute();

                            System.out.println("1 row affected" + stmt);
                            System.out.println("1 row affected");

                            con.commit();
                            con.close();


                        } catch (SQLException s) {
                            System.out.println("SQL statement is not executed!");
                            return mapping.findForward("failure");
                        }
                    } catch (Exception e) {
                    }
                }
            }
        } else {
            response.sendRedirect("targetsenet.jsp");
        }
        return mapping.findForward(SUCCESS);
    }

    public ActionForward update(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        SenettargetActionForm SenettargetActionForm = (SenettargetActionForm) form;
        HttpSession session = request.getSession(true);
        String Random5 = (String) session.getAttribute("Random5");
        System.out.println("financial random number" + Random5);
        String Mnm = SenettargetActionForm.getMnm();

        System.out.println("financial random number second" + Mnm);
        if (!Random5.equals(Mnm)) //  if(!OWASP_CSRFTOKENN.equals(OWASP_CSRFTOKEN))
        {
            response.sendRedirect("staterror.jsp");
        } else {
            int Amc_of_pc1 = SenettargetActionForm.getAmc_of_pc1();
            int Web1 = SenettargetActionForm.getWeb1();
            int Connectivity1 = SenettargetActionForm.getConnectivity1();
            int Contg1 = SenettargetActionForm.getContg1();
            int Others1 = SenettargetActionForm.getOthers1();
            //   String Years = SenettargetActionForm.getYears();




            int Br_hardware_target = SenettargetActionForm.getBr_hardware_target();
            int Br_con_target = SenettargetActionForm.getBr_con_target();
            int Br_contg_target = SenettargetActionForm.getBr_contg_target();
            int Br_others_target = SenettargetActionForm.getBr_others_target();

            int Br_hardware_target_1 = SenettargetActionForm.getBr_hardware_target_1();
            int Br_con_target_1 = SenettargetActionForm.getBr_con_target_1();
            int Br_contg_target_1 = SenettargetActionForm.getBr_contg_target_1();
            int Br_others_target_1 = SenettargetActionForm.getBr_others_target_1();


            int Br_hardware_target_2 = SenettargetActionForm.getBr_hardware_target_2();
            int Br_con_target_2 = SenettargetActionForm.getBr_con_target_2();
            int Br_contg_target_2 = SenettargetActionForm.getBr_contg_target_2();
            int Br_others_target_2 = SenettargetActionForm.getBr_others_target_2();


            int Br_hardware_target_3 = SenettargetActionForm.getBr_hardware_target_3();
            int Br_con_target_3 = SenettargetActionForm.getBr_con_target_3();
            int Br_contg_target_3 = SenettargetActionForm.getBr_contg_target_3();
            int Br_others_target_3 = SenettargetActionForm.getBr_others_target_3();


            int Br_hardware_target_4 = SenettargetActionForm.getBr_hardware_target_4();
            int Br_con_target_4 = SenettargetActionForm.getBr_con_target_4();
            int Br_contg_target_4 = SenettargetActionForm.getBr_contg_target_4();
            int Br_others_target_4 = SenettargetActionForm.getBr_others_target_4();


            int Br_hardware_target_5 = SenettargetActionForm.getBr_hardware_target_5();
            int Br_con_target_5 = SenettargetActionForm.getBr_con_target_5();
            int Br_contg_target_5 = SenettargetActionForm.getBr_contg_target_5();
            int Br_others_target_5 = SenettargetActionForm.getBr_others_target_5();







            String InstId = (String) session.getAttribute("CmbIns");
            String Years = (String) session.getAttribute("CmbYear");
            int Months = Integer.parseInt((String) session.getAttribute("CmbMonth"));

            if (Amc_of_pc1 < 0 || Web1 < 0 || Connectivity1 < 0 || Contg1 < 0 || Others1 < 0
                    || Br_hardware_target_5 < 0 || Br_con_target_5 < 0 || Br_contg_target_5 < 0 || Br_others_target_5 < 0
                    || Br_hardware_target_4 < 0 || Br_con_target_4 < 0 || Br_contg_target_4 < 0 || Br_others_target_4 < 0
                    || Br_hardware_target_3 < 0 || Br_con_target_3 < 0 || Br_contg_target_3 < 0 || Br_others_target_3 < 0
                    || Br_hardware_target_2 < 0 || Br_con_target_2 < 0 || Br_contg_target_2 < 0 || Br_others_target_2 < 0
                    || Br_hardware_target_1 < 0 || Br_con_target_1 < 0 || Br_contg_target_1 < 0 || Br_others_target_1 < 0
                    || Br_hardware_target < 0 || Br_con_target < 0 || Br_contg_target < 0 || Br_others_target < 0) {
                response.sendRedirect("staterror.jsp");
            } else {







                request.setAttribute("Amc_of_pc1", SenettargetActionForm.getAmc_of_pc1());
                request.setAttribute("Web1", SenettargetActionForm.getWeb1());
                request.setAttribute("Connectivity1", SenettargetActionForm.getConnectivity1());
                request.setAttribute("Contg1", SenettargetActionForm.getContg1());
                request.setAttribute("Others1", SenettargetActionForm.getOthers1());
                request.setAttribute("Years", SenettargetActionForm.getYears());
                request.setAttribute("Months", SenettargetActionForm.getMonths());
                request.setAttribute("InstId", SenettargetActionForm.getInstId());

                System.out.println("Inserting values in Mysql database table!");

                try {
                    Connection con = ConnectionManager.getConnectionDirectForMySQL();
                    try {
                        // Statement st = con.createStatement();
                        String sql = "UPDATE tbl_targetsenet SET AMC_of_pc1 = ?,web1=?,Connectivity1=?,Contg1=?,Others1=? WHERE year = ? and Inst_id = ? ";

                        // Inst_id, months, year, AMC_of_pc1, web1, Connectivity1, Contg1, Others1, user_date, AMC_of_pc2, web2, Connectivity2, Others2, Contg2, AMC_of_pc, web, Connectivity, Contg, Others
                        PreparedStatement prest = con.prepareStatement(sql);
                        prest.setInt(1, Amc_of_pc1);
                        prest.setInt(2, Web1);
                        prest.setInt(3, Connectivity1);
                        prest.setInt(4, Contg1);
                        prest.setInt(5, Others1);
                        prest.setString(6, Years);
                        prest.setString(7, InstId);


                        prest.executeUpdate();
                        System.out.println("Updating Successfully!");
                        con.commit();
                        con.close();

                        System.out.println("1 row affected");
                    } catch (SQLException s) {
                        System.out.println("SQL statement is not executed!");
                        return mapping.findForward("failure");
                    }
                } catch (Exception e) {
                }
            }
        }
        return mapping.findForward(SUCCESS);
    }
}