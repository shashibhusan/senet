<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="Styling Select Elements" />
<title>Login Page.... prakash</title>
	 <script language="JavaScript">
var chrsz   = 8; 
var hexcase = 0;

function safe_add (x, y) {
  var lsw = (x & 0xFFFF) + (y & 0xFFFF);
  var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
  return (msw << 16) | (lsw & 0xFFFF);
}

function S (X, n) {return ( X >>> n ) | (X << (32 - n));}

function R (X, n) {return ( X >>> n );}

function Ch(x, y, z) {return ((x & y) ^ ((~x) & z));}

function Maj(x, y, z) {return ((x & y) ^ (x & z) ^ (y & z));}

function Sigma0256(x) {return (S(x, 2) ^ S(x, 13) ^ S(x, 22));}

function Sigma1256(x) {return (S(x, 6) ^ S(x, 11) ^ S(x, 25));}

function Gamma0256(x) {return (S(x, 7) ^ S(x, 18) ^ R(x, 3));}

function Gamma1256(x) {return (S(x, 17) ^ S(x, 19) ^ R(x, 10));}

function Sigma0512(x) {return (S(x, 28) ^ S(x, 34) ^ S(x, 39));}

function Sigma1512(x) {return (S(x, 14) ^ S(x, 18) ^ S(x, 41));}

function Gamma0512(x) {return (S(x, 1) ^ S(x, 8) ^ R(x, 7));}

function Gamma1512(x) {return (S(x, 19) ^ S(x, 61) ^ R(x, 6));}

function core_sha256 (m, l) {
    var K = new Array(0x428A2F98,0x71374491,0xB5C0FBCF,0xE9B5DBA5,0x3956C25B,0x59F111F1,0x923F82A4,0xAB1C5ED5,0xD807AA98,0x12835B01,0x243185BE,0x550C7DC3,0x72BE5D74,0x80DEB1FE,0x9BDC06A7,0xC19BF174,0xE49B69C1,0xEFBE4786,0xFC19DC6,0x240CA1CC,0x2DE92C6F,0x4A7484AA,0x5CB0A9DC,0x76F988DA,0x983E5152,0xA831C66D,0xB00327C8,0xBF597FC7,0xC6E00BF3,0xD5A79147,0x6CA6351,0x14292967,0x27B70A85,0x2E1B2138,0x4D2C6DFC,0x53380D13,0x650A7354,0x766A0ABB,0x81C2C92E,0x92722C85,0xA2BFE8A1,0xA81A664B,0xC24B8B70,0xC76C51A3,0xD192E819,0xD6990624,0xF40E3585,0x106AA070,0x19A4C116,0x1E376C08,0x2748774C,0x34B0BCB5,0x391C0CB3,0x4ED8AA4A,0x5B9CCA4F,0x682E6FF3,0x748F82EE,0x78A5636F,0x84C87814,0x8CC70208,0x90BEFFFA,0xA4506CEB,0xBEF9A3F7,0xC67178F2);
    var HASH = new Array(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19);
    var W = new Array(64);
    var a, b, c, d, e, f, g, h, i, j;
    var T1, T2;

    m[l >> 5] |= 0x80 << (24 - l % 32);
    m[((l + 64 >> 9) << 4) + 15] = l;

    for ( var i = 0; i<m.length; i+=16 ) {
        a = HASH[0];
        b = HASH[1];
        c = HASH[2];
        d = HASH[3];
        e = HASH[4];
        f = HASH[5];
        g = HASH[6];
        h = HASH[7];

        for ( var j = 0; j<64; j++) {
            if (j < 16) W[j] = m[j + i];
            else W[j] = safe_add(safe_add(safe_add(Gamma1256(W[j - 2]), W[j - 7]), Gamma0256(W[j - 15])), W[j - 16]);

            T1 = safe_add(safe_add(safe_add(safe_add(h, Sigma1256(e)), Ch(e, f, g)), K[j]), W[j]);
            T2 = safe_add(Sigma0256(a), Maj(a, b, c));

            h = g;
            g = f;
            f = e;
            e = safe_add(d, T1);
            d = c;
            c = b;
            b = a;
            a = safe_add(T1, T2);
        }
        
        HASH[0] = safe_add(a, HASH[0]);
        HASH[1] = safe_add(b, HASH[1]);
        HASH[2] = safe_add(c, HASH[2]);
        HASH[3] = safe_add(d, HASH[3]);
        HASH[4] = safe_add(e, HASH[4]);
        HASH[5] = safe_add(f, HASH[5]);
        HASH[6] = safe_add(g, HASH[6]);
        HASH[7] = safe_add(h, HASH[7]);
    }
    return HASH;
}

function core_sha512 (m, l) {
    var K = new Array(0x428a2f98d728ae22, 0x7137449123ef65cd, 0xb5c0fbcfec4d3b2f, 0xe9b5dba58189dbbc, 0x3956c25bf348b538, 0x59f111f1b605d019, 0x923f82a4af194f9b, 0xab1c5ed5da6d8118, 0xd807aa98a3030242, 0x12835b0145706fbe, 0x243185be4ee4b28c, 0x550c7dc3d5ffb4e2, 0x72be5d74f27b896f, 0x80deb1fe3b1696b1, 0x9bdc06a725c71235, 0xc19bf174cf692694, 0xe49b69c19ef14ad2, 0xefbe4786384f25e3, 0x0fc19dc68b8cd5b5, 0x240ca1cc77ac9c65, 0x2de92c6f592b0275, 0x4a7484aa6ea6e483, 0x5cb0a9dcbd41fbd4, 0x76f988da831153b5, 0x983e5152ee66dfab, 0xa831c66d2db43210, 0xb00327c898fb213f, 0xbf597fc7beef0ee4, 0xc6e00bf33da88fc2, 0xd5a79147930aa725, 0x06ca6351e003826f, 0x142929670a0e6e70, 0x27b70a8546d22ffc, 0x2e1b21385c26c926, 0x4d2c6dfc5ac42aed, 0x53380d139d95b3df, 0x650a73548baf63de, 0x766a0abb3c77b2a8, 0x81c2c92e47edaee6, 0x92722c851482353b, 0xa2bfe8a14cf10364, 0xa81a664bbc423001, 0xc24b8b70d0f89791, 0xc76c51a30654be30, 0xd192e819d6ef5218, 0xd69906245565a910, 0xf40e35855771202a, 0x106aa07032bbd1b8, 0x19a4c116b8d2d0c8, 0x1e376c085141ab53, 0x2748774cdf8eeb99, 0x34b0bcb5e19b48a8, 0x391c0cb3c5c95a63, 0x4ed8aa4ae3418acb, 0x5b9cca4f7763e373, 0x682e6ff3d6b2b8a3, 0x748f82ee5defb2fc, 0x78a5636f43172f60, 0x84c87814a1f0ab72, 0x8cc702081a6439ec, 0x90befffa23631e28, 0xa4506cebde82bde9, 0xbef9a3f7b2c67915, 0xc67178f2e372532b, 0xca273eceea26619c, 0xd186b8c721c0c207, 0xeada7dd6cde0eb1e, 0xf57d4f7fee6ed178, 0x06f067aa72176fba, 0x0a637dc5a2c898a6, 0x113f9804bef90dae, 0x1b710b35131c471b, 0x28db77f523047d84, 0x32caab7b40c72493, 0x3c9ebe0a15c9bebc, 0x431d67c49c100d4c, 0x4cc5d4becb3e42b6, 0x597f299cfc657e2a, 0x5fcb6fab3ad6faec, 0x6c44198c4a475817);
    var HASH = new Array(0x6a09e667f3bcc908, 0xbb67ae8584caa73b, 0x3c6ef372fe94f82b, 0xa54ff53a5f1d36f1, 0x510e527fade682d1, 0x9b05688c2b3e6c1f, 0x1f83d9abfb41bd6b, 0x5be0cd19137e2179);
    var W = new Array(80);
    var a, b, c, d, e, f, g, h, i, j;
    var T1, T2;

}

function str2binb (str) {
  var bin = Array();
  var mask = (1 << chrsz) - 1;
  for(var i = 0; i < str.length * chrsz; i += chrsz)
    bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (24 - i%32);
  return bin;
}

function binb2str (bin) {
  var str = "";
  var mask = (1 << chrsz) - 1;
  for(var i = 0; i < bin.length * 32; i += chrsz)
    str += String.fromCharCode((bin[i>>5] >>> (24 - i%32)) & mask);
  return str;
}

function binb2hex (binarray) {
  var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
  var str = "";
  for(var i = 0; i < binarray.length * 4; i++)
  {
    str += hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8+4)) & 0xF) +
           hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8  )) & 0xF);
  }
  return str;
}

function binb2b64 (binarray) {
  var tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  var str = "";
  for(var i = 0; i < binarray.length * 4; i += 3)
  {
    var triplet = (((binarray[i   >> 2] >> 8 * (3 -  i   %4)) & 0xFF) << 16)
                | (((binarray[i+1 >> 2] >> 8 * (3 - (i+1)%4)) & 0xFF) << 8 )
                |  ((binarray[i+2 >> 2] >> 8 * (3 - (i+2)%4)) & 0xFF);
    for(var j = 0; j < 4; j++)
    {
      if(i * 8 + j * 6 > binarray.length * 32) str += "";
      else str += tab.charAt((triplet >> 6*(3-j)) & 0x3F);
    }
  }
  return str;
}

function hex_sha2(s){return binb2hex(core_sha256(str2binb(s),s.length * chrsz));}
function b64_sha2(s){return binb2b64(core_sha256(str2binb(s),s.length * chrsz));}
function str_sha2(s){return binb2str(core_sha256(str2binb(s),s.length * chrsz));}

    </script>
	</head>
		 <form><body onload="hash.value = hex_sha2(input.value)">
<%

try{
  Connection conn = ConnectionManager.getConnectionDirectForMySQL();
			if(conn != null){
				Statement stmt = conn.createStatement();
				 CallableStatement stmt1 = null;
				//String userName=request.getParameter("uid");
				//String passWord=request.getParameter("pwd");
				
				
				String sessionid = request.getSession().getId();
				System.out.println("prakash---------- old session"+sessionid);
				
				String Name=(String)session.getAttribute("Name");
                                
				//String Passwordd=(String)session.getAttribute("Passwordd");
				String Password=(String)session.getAttribute("Password");
				//String Random=(String)session.getAttribute("Random");
				String Random1=(String)session.getAttribute("Random1");
if ( (Password.matches("[a-zA-Z_0-9 ]+")) && ( Random1.matches("[0-9]+") &&(Name.substring(0, 1).matches("[a-zA-Z_0-9 ]+")))) {
	System.out.println("pattern matches");
				session.invalidate();  
				session = request.getSession();
				String sessionid1 = request.getSession().getId();
				System.out.println("prakash---------- new  session"+sessionid1);
				
				
			System.out.println("prakash chandra"+Name);
			System.out.println("prakash chandrapasss genaeration ---"+Random1);
			System.out.println("prakash chandra------------11@@@@@=="+Password);
			//System.out.println("prakash chandra"+Random);
			
			// String userSql=" SELECT  PASSWORD FROM msme_di_users WHERE USER_ID ='"+Name+"'";
			String userSql="SELECT mu.PASSWORD ,mu.INSTITUTE ,mu.USER_ID,mu.ROLE,uim.inst_id FROM msme_di_users mu, user_di_mapping uim WHERE mu.USER_ID = uim.USER_ID AND mu.USER_ID='"+Name+"'";
			System.out.println(userSql);
			
				//String userSql = "call msme_didii (?)";
				//System.out.println(userSql);
				//stmt1 = (CallableStatement) con.prepareCall(sql);

				//stmt1.setString(1, Name);
				
			
			
			String cum_mon1 ="jhj";
			String USER_ID ="jhj";
			String ROLE ="jhj";
			String cmbIns ="jhj";
			String cmbInst ="jhj";
			
			ResultSet resultSet = stmt.executeQuery(userSql);
			while(resultSet.next())
	      {
		  cum_mon1=resultSet.getString("PASSWORD");
		  USER_ID=resultSet.getString("USER_ID");
		  ROLE=resultSet.getString("ROLE");
		  cmbIns=resultSet.getString("inst_id");
		   cmbInst=resultSet.getString("INSTITUTE");
		  }
		  String abdd = cum_mon1 + Random1;
		   String user = USER_ID;
		    String rol = ROLE;
			 String ins = cmbIns;
			 String inst = cmbInst;
			 
		  %>
			
			
			<% System.out.println("jhjghjhgjhgjhgjghjh-----"+inst);%>
			<% 
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(abdd.getBytes());
 
        byte byteData[] = md.digest();
 
        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
 
        System.out.println("Hex format : " + sb.toString());
 
        //convert the byte to hex format method 2
        StringBuffer hexString = new StringBuffer();
    	for (int i=0;i<byteData.length;i++) {
    		String hex=Integer.toHexString(0xff & byteData[i]);
   	     	if(hex.length()==1) hexString.append('0');
   	     	hexString.append(hex);
			
    	}
		String prakash = hexString.toString();
    	System.out.println("Hex format prakash =@@@@@@===: " +prakash);
		
		
		
		System.out.println("Hex format prakashvvvvvvvvvvv------------22 ===: " +prakash);
		//System.out.println("Hex format prakashbbbbbbbbbbbbb : " +Passwordd);
		System.out.println("Hex format prakashbbbbbbbbbbbbb : " +user);
		System.out.println("Hex format prakashbbbbbbbbbbbbb : " +rol);
		System.out.println("Hex format prakashbbbbbbbbbbbbb : " +ins);
			System.out.println("Hex format prakashbbbbbbbbbbbbb   institute : " +inst);
	
	//session.setAttribute("pswd",psw);
		
		String IP_ADDRESS = request.getRemoteAddr();	
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    Date date = new Date();
                    String time=dateFormat.format(date);
		String status="Login success";
		
			if(prakash.equals(Password))
			{ 
                            
                            Connection  con = ConnectionManager.getConnectionDirectForMySQL();
PreparedStatement stmt4 = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_login_detail_senet(`Name`,`cmbIns`,`role`,`IP_ADDRESS`,`Datetim`,`status`)"
                                                                                       + " VALUES (?,?,?,?,?,?) ");


				stmt4.setString(1, Name);
				stmt4.setString(2, cmbIns);
                                stmt4.setString(3, rol);
				stmt4.setString(4, IP_ADDRESS);
                                stmt4.setString(5, time);
                                stmt4.setString(6, status);
				// ResultSet rs = stmt.executeQuery(sql);
                                System.out.println(stmt4);
                                stmt4.execute();


                         System.out.println("1 row affected");


                        con.commit();
                        con.close();

                            
                            
                            
                                session.setAttribute("prakash",prakash);
				session.setAttribute("user",user);
				session.setAttribute("rol",rol);
				session.setAttribute("ins",ins);
				session.setAttribute("inst",inst);
			response.sendRedirect("main.jsp");
			%>
		
			
			<%
			} else
			{
                         session.setAttribute("Name",Name);   
                         session.setAttribute("cmbIns",cmbIns);   
                         session.setAttribute("rol",rol);   
                            
                            
                            response.sendRedirect("invalid.jsp");
			%>
			
			<% }
			
			
			
			
		
		%>
			
			<% } else {
    response.sendRedirect("/stat.jsp");
}

 %>
			
			<%	
			}
			else{
				System.out.println("Not Found");
				// Connection Not Found
			}
		}
		catch(SQLException e){
			//e.printStackTrace();
			System.out.println(e.getErrorCode()+" = "+e.getMessage());
				%>
				<jsp:forward page="invalid.jsp"></jsp:forward>
			<%
		}
		catch(Exception e){
			//e.printStackTrace();
			System.out.println("pc Tagged Error "+e.getMessage());
				%>
				<jsp:forward page="invalid.jsp"></jsp:forward>
			<%
		}
%>


</body></form>
</html>	
