/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package roseindia.net;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import common.ConnectionManager;

/**
 *
 * @author shashi
 */
public class ISOAction extends DispatchAction{
    private final static String SUCCESS = "success";
     private final static String ADD = "add";
      private final static String SELECT = "select";
    private final static String FAILURE = "failure";
    public ActionForward add(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception {

        String institute=ConnectionManager.instituteName(request.getParameter("institute"));
  String program1=request.getParameter("program1");
  String program2=request.getParameter("program2");
  String program3=request.getParameter("program3");
  String program4=request.getParameter("program4");
  String smonth=request.getParameter("cmbMonth");
  int months=Integer.parseInt(smonth);
  String years=request.getParameter("cmbYear");

  int  g2=Integer.parseInt(request.getParameter("g2"));
  int g3=Integer.parseInt(request.getParameter("g3"));
  int g4=Integer.parseInt(request.getParameter("g4"));
  int g5=Integer.parseInt(request.getParameter("g5"));
  int g6=Integer.parseInt(request.getParameter("g6"));
  int g7=Integer.parseInt(request.getParameter("g7"));
  int bal1=Integer.parseInt(request.getParameter("bal1"));

  int s2=Integer.parseInt(request.getParameter("s2"));
  int s3=Integer.parseInt(request.getParameter("s3"));
  int s4=Integer.parseInt(request.getParameter("s4"));
  int s5=Integer.parseInt(request.getParameter("s5"));
  int s6=Integer.parseInt(request.getParameter("s6"));
  int s7=Integer.parseInt(request.getParameter("s7"));
   int bal2=Integer.parseInt(request.getParameter("bal2"));

  int t2=Integer.parseInt(request.getParameter("t2"));
  int t3=Integer.parseInt(request.getParameter("t3"));
  int t4=Integer.parseInt(request.getParameter("t4"));
  int t5=Integer.parseInt(request.getParameter("t5"));
  int t6=Integer.parseInt(request.getParameter("t6"));
  int t7=Integer.parseInt(request.getParameter("t7"));
   int bal3=Integer.parseInt(request.getParameter("bal3"));

  int w2=Integer.parseInt(request.getParameter("w2"));
  int w3=Integer.parseInt(request.getParameter("w3"));
  int w4=Integer.parseInt(request.getParameter("w4"));
  int w5=Integer.parseInt(request.getParameter("w5"));
  int w6=Integer.parseInt(request.getParameter("w6"));
  int w7=Integer.parseInt(request.getParameter("w7"));
   int bal4=Integer.parseInt(request.getParameter("bal4"));

 int indicate=IsoInsert.insert(institute,program1,program2,program3,program4,months,years,g2,g3,g4,g5,g6,g7,bal1,s2,s3,s4,s5,s6,s7,bal2,t2,t3,t4,t5,t6,t7,bal3,w2,w3,w4,w5,w6,w7,bal4);
 if(indicate>0)
 {
     return mapping.findForward(ADD);
 }
 else
 {
return mapping.findForward(FAILURE);
 }
}
public ActionForward update(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)throws Exception {

      String institute=ConnectionManager.instituteName(request.getParameter("institute"));
  String program1=request.getParameter("program1");
  String program2=request.getParameter("program2");
  String program3=request.getParameter("program3");
  String program4=request.getParameter("program4");
  String smonth=request.getParameter("cmbMonth");
  int months=Integer.parseInt(smonth);
  String years=request.getParameter("cmbYear");

 int  g2=Integer.parseInt(request.getParameter("g2"));
  int g3=Integer.parseInt(request.getParameter("g3"));
  int g4=Integer.parseInt(request.getParameter("g4"));
  int g5=Integer.parseInt(request.getParameter("g5"));
  int g6=Integer.parseInt(request.getParameter("g6"));
  int g7=Integer.parseInt(request.getParameter("g7"));
  int bal1=Integer.parseInt(request.getParameter("bal1"));

  int s2=Integer.parseInt(request.getParameter("s2"));
  int s3=Integer.parseInt(request.getParameter("s3"));
  int s4=Integer.parseInt(request.getParameter("s4"));
  int s5=Integer.parseInt(request.getParameter("s5"));
  int s6=Integer.parseInt(request.getParameter("s6"));
  int s7=Integer.parseInt(request.getParameter("s7"));
   int bal2=Integer.parseInt(request.getParameter("bal2"));

  int t2=Integer.parseInt(request.getParameter("t2"));
  int t3=Integer.parseInt(request.getParameter("t3"));
  int t4=Integer.parseInt(request.getParameter("t4"));
  int t5=Integer.parseInt(request.getParameter("t5"));
  int t6=Integer.parseInt(request.getParameter("t6"));
  int t7=Integer.parseInt(request.getParameter("t7"));
   int bal3=Integer.parseInt(request.getParameter("bal3"));

  int w2=Integer.parseInt(request.getParameter("w2"));
  int w3=Integer.parseInt(request.getParameter("w3"));
  int w4=Integer.parseInt(request.getParameter("w4"));
  int w5=Integer.parseInt(request.getParameter("w5"));
  int w6=Integer.parseInt(request.getParameter("w6"));
  int w7=Integer.parseInt(request.getParameter("w7"));

 int indicate=IsoInsert.update(institute,program1,program2,program3,program4,months,years,g2,g3,g4,g5,g6,g7,bal1,s2,s3,s4,s5,s6,s7,bal2,t2,t3,t4,t5,t6,t7,bal3,w2,w3,w4,w5,w6,w7);
 if(indicate>0)
 {
     return mapping.findForward("update");
 }
 else
 {
return mapping.findForward(FAILURE);
 }
}

}
