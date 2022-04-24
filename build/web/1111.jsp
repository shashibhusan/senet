<%-- 
    Document   : 1111
    Created on : Feb 23, 2018, 5:46:59 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";
String[] email={ "HUSSAINSHAIKH1414.HS@GMAIL.com",
"siva671958@yahoo.co.in",
"ajayk0995@gmail.com",
"aniketmistry6@gmail.com",
"attadip.aloney358@gmail.com",
"dcdi-jammu@dcmsme.gov.in",
"dibyendubaidya@yahoo.co.in",
"Divy.2021@gmail.com",
"globalenterprisesvizag@gmail.com",
"gurukumar934@gmail.com",
"Hansrajloth064@gmail.com",
"kalimkhan7875@gmail.com",
"karanarora@live.com",
"kavithanjaliphotostudio@gmail.com",
"krishnanvg093@gmail.com",
"lecpl14@gmail.com",
"maarakshakalienterprises@gmail.com",
"midasbiotech@gmail.com",
"milovehk@gmail.com",
"mtlinox@gmail.com",
"naseerkha1987@rediffmail.com",
"nitikgupta9532@gmail.com",
"opmehta@dcmsme.gov.in",
"PLOSTARSENTHIL@GMAIL.COM",
"prasanthi.kondaveety@gmail.com",
"pritamdhondge@gmail.com",
"rafique.mullick@gmail.com",
"rajnishkumarraj2@gmail.com",
"rajnishkumarrj2@gmail.com",
"Rishabhpareek1990@gmail.com",
"rk.rai@nic.in",
"rudraesolution@gmail.com",
"SAJIDKUTTY6363@GMAIL.COM",
"siddharthdarole@gmail.com",
"sopanshinde@yahoo.com",
"sudhakara.bn@gmai.com",
"sunilgrd2020@gmail.com",
"supriyotalukdar786@gmail.com",
"Suresh.poonia.108@gmail.com",
"tmpraba.karan@gmail.com",
"tripathyinfraprojects@gmail.com",
"valoroustobacco@gmail.com",
"Vinmanvinod3@gmail.com",
"amanshahabuddin@gmail.com",
"brdcdi-coim@dcmsme.gov.in",
"deepa.gl@gov.in",
"dharmaselvan@yahoo.com",
"dharmaselvan@yahooo.com",
"dipakchanda900@hotmail.com",
"govindaraj@dcmsme.gov.in",
"jayachandiran.k@gov.in",
"kalebu.meesala@gov.in",
"kumarmsmedi@gnail.com",
"msmegovind@gmail.com",
"sjavedd7@gamil.com",
"skverma@dcmsme.gov.in",
"anutoshmsme@gmail.com",
"ck5279533@gmail.com",
"himanshurohilla009@gmail.com",
"mka.balasai@mail.com",
"mmfcgnt@gmail.com",
"pankaj_cftri@yahoo.co.in",
"Santosh.bhujang420@gmail.com",
"arvind.tiwarin@rediffmail.com",
"balagopal2010@gmail.com",
"bpn.brahm@gmail.com",
"brchadokar@gmail.com",
"btombing79@gmail.com",
"chandramouli.ad@gov.in",
"dkpandey@dcmsme.gov.in",
"gsk.fts@gmail.com",
"gsk.fts@gmil.com",
"gyrasip73@gmail.com",
"harpal.singh@gov.in",
"harpal.singh1959@gov.in",
"karthikmsme@gmail.com",
"kjhariya57@gmail.com",
"kureelvp@rediffmail.com",
"martoliagdsingh@gmail.com",
"megnath.singh@gov.in",
"mohit@dcmsme.gov.in",
"naraza.msme @gmail.com",
"naraza.msme@gmail.com",
"neera.sharma44@gov.in",
"neeraj.sharma44@gov.in",
"neeraj6kumar5@gmail.com",
"nsingh@msmediagra.gov.in",
"nsmahadeoputra@rediffmail.com, narayan.saw@gov.in",
"palj@dcmsme.gov.in",
"parveenthakran04@gmail.com",
"pks.msme@gmail.com",
"pksingh@dcmsme.gov.in",
"pushkar_bisht12@yahoo.co.in",
"rahul.bhardwaj@gmail.com",
"rajesjhdec76@gmail.com",
"ran.bahadur@dcmsme.gov.in",
"rangaraogoberu@gmail.com",
"rsv1962@gmail.com",
"rsv2299@gmail.com",
"saheel.allaqband@gmail.com",
"saloni@dcmsme.gov.in",
"skumar.met@gmail.com",
"skumar.msmediranchi@gmail.com",
"subba@gmail.com",
"venkatgoberu*2018@gmail.com",
"vijayakumarmridhun@yahoo.co.in",
"vkhar.msme@gov.in",
"ABHINAY0159@GMAIL.COM",
"amit.kumar@gmail.com",
"amitmohan@ymail.com",
"ashis0302@gamil.com",
"ayanansari702@gmail.com",
"chaturvedivikas63@gmail.com",
"das_raju2002@yahoo.com",
"devkg.18@gmail.com",
"dkpatel719@gmail.com",
"intesharkhan95@gmail.com",
"ishanuenterprise@gmail.com",
"Jaikynigam015@gmail.com",
"kumargdhiman@gmail.com",
"Ladhanedd @gmail.com",
"ladhanedd@gmail.com",
"mevaram75166@gmail.com",
"parsuramegk@gmail.com",
"pk.verma2094@gamil.com",
"ravi.atta370@gmail.com",
"rockykumarfzd@gmail.com",
"shashi.patel@techtreeit.com",
"singhmks056@gmail.com",
"vpwankhede.msme@gmail.com",
"vsmsme@rediffmail.com",
"yashshrichandu8355@gmail.com",
"amitkumarrsharmai1@gmail.com",
"balianwali@gmail.com",
"bindravansinghk965@gmail.con",
"binoykottayam@gmail.om",
"cjmukesh1989@gmail.com",
"IMI_SAAN@MSN.COM",
"js489966@gmail.com",
"judepalani@gmail.com",
"kalawati.os@gov.in",
"kkpd888@gmail.com",
"ksimbhu84@gmail.com",
"mukeshbilwal676@gmail.com",
"Narindermann1959@gov.in",
"rzapliana@rediffmail.com",
"sandipsahoo.2010@rediffmail.com",
"sbhobhamsme1961@gmail.com",
"scorpion19862004@yahoo.com",
"tiwarianant75@gmain.com"
};

Connection con=null;
ResultSet res=null;
try{
    con=DriverManager.getConnection(connectionUrl+dbName, userId, password);
    Statement st=con.createStatement();
    for(int i=0; i<email.length; i++)
        {
    String sql= "delete from eis_register where email='"+email[i]+"'";
   int rs=st.executeUpdate(sql);
    if(rs>0)
        {
    out.print("Email has been deleted ::"+email[i]);
       // System.out.println("Email has been deleted ::"+sql);
}
   else{
      out.print("Email has not been deleted ::"+email[i]);
       
   }
   }
    }
catch(Exception ex){
ex.printStackTrace();
}

%>
