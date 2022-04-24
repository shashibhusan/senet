<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
String sessionid = request.getSession().getId();
response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; HttpOnly");
%>
<%
           // Set to expire far in the past.
      response.setDateHeader("Expires", 0);
  // Set standard HTTP/1.1 no-cache headers.
     response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
  // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
     response.addHeader("Cache-Control", "post-check=0, pre-check=0");
  // Set standard HTTP/1.0 no-cache header.
      response.setHeader("Pragma", "no-cache");
          request.getSession(false);
        %>
		<%
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = sloginlog.jsp");
Cookie[] cookies = request.getCookies();
if(cookies!=null)
for (int i = 0; i < cookies.length; i++) {
 cookies[i].setMaxAge(0);
}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="Styling Select Elements" />
<title>Login Page....</title>

<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");
if(sds == null){alert("You are using a free package.\n You are not allowed to remove the tag.\n");}
}

</script>

	




	

	
	<script src="TCS%20Worldwide%20%20India%20Office%20Locations_files/init.js"></script>
<script type="text/javascript" language="javascript" src="TCS%20Worldwide%20%20India%20Office%20Locations_files/core.js" defer="defer"></script>
<script type="text/javascript" language="javascript" src="TCS%20Worldwide%20%20India%20Office%20Locations_files/non_ie.js"></script>
<script language="javascript" type="text/javascript">
	function fnTotal(obj1,obj2,obj3){
	// sc_dtm  st_dtm wmn_dtm obc_dtm ph_dtm min_dtm total_dtm
	var temp;
	var target1=obj1.value;
	var target2=obj2.value;
	temp=target1.concat(target2);
	obj3.value=temp;
}






	</script>
	
	
	<script language="javascript" type="text/javascript">
		function load(){}
		function GUnload(){}
		
		var arrLocations = [];
		function locationData(title,description,region,telephone,officeType,address1,city,country,stateProvince,postalCode,contact1Label,contact1Email,contact2Label,contact2Email,contact3Label,contact3Email,moreInfoLink,moreInfoLinkCopy,fax){
			this.title = title;
			this.description = description;
			this.region = region;
			this.telephone = telephone;
			this.officeType = officeType;
			this.address1 = address1;
			this.city = city;
			this.country = country;
			this.stateProvince = stateProvince;
			this.postalCode = postalCode;
			this.contact1Label = contact1Label;
			this.contact1Email = contact1Email;
			this.contact2Label = contact2Label;
			this.contact2Email = contact2Email;
			this.contact3Label = contact3Label;
			this.contact3Email = contact3Email;
			this.moreInfoLink = moreInfoLink;
    		this.moreInfoLinkCopy = moreInfoLinkCopy;
    		this.fax = fax;
       	}
		
	</script>
			
		<script language="javascript" type="text/javascript">
		function setActiveStyle() {
			thisPage = window.location.href.toLowerCase();
		
			if (thisPage.indexOf("worldwide") != -1) {
				document.getElementById("worldwide_link").className = "selected";
			} else if (thisPage.indexOf("contact") != -1) {
				document.getElementById("contact_link").className = "selected";
			} else if (thisPage.indexOf("career") != -1) {
				document.getElementById("career_link").className = "selected";
			} else if (thisPage.indexOf("investors") != -1) {
				document.getElementById("investors_link").className = "selected";
			} else if (thisPage.indexOf("multimedia") != -1) {
				document.getElementById("resources_link").className = "selected";
			} else if (thisPage.indexOf("offerings") != -1) {
				document.getElementById("offerings_active").className = "selected";
				if(document.getElementById("az_index")!=null){
					document.getElementById("az_index").style.display = "block";
				}
			} else if (thisPage.indexOf("industries") != -1) {
				document.getElementById("industries_active").className = "selected";
			} else if (thisPage.indexOf("thought") != -1) {
				document.getElementById("thought_active").className = "selected";
			} else if (thisPage.indexOf("about") != -1) {
				document.getElementById("about_active").className = "selected";
			} else if (thisPage.indexOf("resources") != -1) {
				document.getElementById("resources_active").className = "selected";
			} else if (thisPage.indexOf("media") != -1) {
				document.getElementById("media_active").className = "selected";
			} else if (thisPage.indexOf("news") != -1) {
				document.getElementById("news_active").className = "selected";
			} 
		}
	

		function conditionalClear(current){
			if(current == " Search TCS.com" || current == " Please enter search term(s)"){		
				document.getElementById('searchinput').value = " "; 			
			}
		}
		
		function submitEnter(e){
			var keycode;
			if (window.event) keycode = window.event.keyCode;
			else if (e) keycode = e.which;
			else return true;
			if (keycode == 13 || keycode == 3)
			{
   				siteSearch();
   				return false;
   			}
			else
			   return true;
		}
		
		function openCenteredWindow(mypage, w, h, scroll, resizable, menubar, toolbar) {
		    var winl = (screen.width - w) / 2;
		    var wint = (screen.height - h) / 2;
		    winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable='+resizable+',menubar='+menubar+',toolbar='+toolbar
		    win = window.open(mypage,'',winprops)
		}
		function showPopup(path)
		{
		    openCenteredWindow("/Pages/tell_a_friend.aspx?src=" + path,'600','570','yes','no','no','no');
		}
	</script>
	
	<meta name="title" content="TCS Worldwide: India Office Locations"><meta name="description" content="Learn about TCS' office locations in India"><meta name="keywords" content="TCS, TCS Offices, TCS Offices in India"><style type="text/css">
	.zz1_LeftTopNav_0 { background-color:white;visibility:hidden;display:none;position:absolute;left:0px;top:0px; }
	.zz1_LeftTopNav_1 { text-decoration:none; }
	.zz1_LeftTopNav_2 { width:180px; }
	.zz1_LeftTopNav_3 { border-style:none; }
	.zz1_LeftTopNav_4 {  }
	.zz2_LeftNavMenu_0 { background-color:white;visibility:hidden;display:none;position:absolute;left:0px;top:0px; }
	.zz2_LeftNavMenu_1 { text-decoration:none; }
	.zz2_LeftNavMenu_2 { background-color:#F3F3F3;width:180px; }
	.zz2_LeftNavMenu_3 { border-style:none; }
	.zz2_LeftNavMenu_4 {  }
	.zz2_LeftNavMenu_5 { border-style:none; }
	.zz2_LeftNavMenu_6 {  }
	.zz2_LeftNavMenu_7 { border-style:none; }
	.zz2_LeftNavMenu_8 {  }
	.zz2_LeftNavMenu_9 { border-style:none; }
	.zz2_LeftNavMenu_10 {  }
	.ctl00_PlaceHolderMain_g_ACB8D8BFB552450B84149EC25258675B_0 { border-color:Black;border-width:1px;border-style:Solid; }

    </style><div id="_atssh" style="visibility: hidden; height: 1px; width: 1px; position: absolute; z-index: 100000;"><iframe src="TCS%20Worldwide%20%20India%20Office%20Locations_files/sh114.htm" style="height: 1px; width: 1px; position: absolute; z-index: 100000; border: 0px none; left: 0px; top: 0px;" title="AddThis utility frame" id="_atssh145"></iframe>
    </div>
    <script src="TCS%20Worldwide%20%20India%20Office%20Locations_files/core065.js" type="text/javascript"></script><script src="TCS%20Worldwide%20%20India%20Office%20Locations_files/jquery-latest.js" async="" type="text/javascript"></script></head>


<link href="style.css" rel="stylesheet" type="text/css" />


<script src="md5.js" type="text/javascript"></script>

<script src="jcap.js" type="text/javascript"></script>

	<script language="JavaScript" src="validate.js" type="text/javascript"></script>

    <script language="javascript" src="includes/validation2.js" type="text/javascript"></script>

    <script language="javascript" src="includes/validation5.js" type="text/javascript"></script>
    
<script language="JavaScript" type="text/javascript">
function PasswdRemindWin()
{
window.open("#","win1","toolbar=no,directories=no,resize=yes,menubar=no,location=no,scrollbars=yes,width=490,height=480,maximize=null,top=70,left=80");
}
function checkLogin()
{
	var usr = document.loginform.login.value;
	if(usr == "")
	{
		alert("Please enter a valid User Name");
		return false;
	}
	var seclogin = document.loginform.seclogin;
	if(seclogin.checked == true)
	{
		document.loginform.action = "#";
	}
	else
	{
		document.loginform.action = "#";
	}
	return true;
}
</script>
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
    <script language="JavaScript" type="text/javascript">

        function validate()
{

		if(document.getElementById('uword').value=="")
			{
			alert("Please enter the code shown in Image");
			document.getElementById('uword').focus();
			return false
			}
			else{
			return jcap();
			}



} 

    </script>
    <style>
.error {
background-color: #b9ecfd;}


    </style>
	</head>
	
	<body bgcolor="#F4F4F4" >
	 <%  long a=4534545345345445L;
	 String Random = Long.toString((long) (Math.random() * a));

System.out.println("hjhjhjghjjhjhg"+Random);

  session.setAttribute("Random1",Random);	 %>
<center>
		<table width="1030" style="border:1px dotted black;"  >
  <tr>
    <td colspan="2" bgcolor="#073354" height="79">
	<table width='100%' border='0' cellspacing='0' cellpadding='0'  height="85px">
	<tr>
				<td width='18%' align='center' bgcolor="#297E43"><font color="#FFFFFF" size="+3">MPR</font><BR/><font color="#FFFFFF" size="+1">Development Institutes</font></td>
				<td width='6%' valign="middle" bgcolor="#FFFFFF"><img src="images/images (1).jpg" width="53" height="63"/></td>
				<td width='57%' valign="middle" bgcolor="#FFFFFF">
<font color="#181818" face="garamond" size="+1" style="font-weight:bold">
				Office of Development Commissioner(MSME)<br />
				Ministry of Micro, Small & Medium Enterprises
			</font></td>
				<td width='19%' align='center' bgcolor="#FFFFFF"><img src="images/imagesmsme.jpg" width="179" height="73"/></td>	   					
		  </tr>
</table>
</td>
    </tr>
<tr>
    <td height="27" colspan="2" align="center" background="images/bg-grad-long-sml.png" bgcolor="#FFFFCC"><strong><font color="#FFFFFF"> Welcome to MPR Portal of Development Institutes</font></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>
    </tr>  <tr>
    <td height="128" colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <div align="center"><marquee behavior="alternate"><font color="#0066FF" size="-1"><STRONG>MONTHLY PROGRESS REPORT(MPR)</STRONG></font>
	   <font color="#0066FF" size="-1"><STRONG> OF
	    DC-MSME DEVELOPMENT INSTITUTES</STRONG></font></marquee>      </div>	
		<html:form action="/FileUploadAndSave" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return validate();">
		
		<table align="center" style="border: 1px dotted"   width="489" height="185" bgcolor="#FFFCF9">
                            <tr>
                              <td width="314" height="21" align="center" background="images/download.jpg"  ><font color="#0000FF" size="-1.0">&nbsp;<strong>&nbsp;Enter Your User ID &amp; Password</strong></font></td>
                            </tr>
                            <tr>
                              <td height="21"  align="left" ><font color="#FF0000" size="+0.2">*</font><font color="#990000"  style="font-family:"Times New Roman", Times, serif">  <strong>User Name:</strong></font>&nbsp;</td>
                            </tr>
                            <tr>
                              <td height="24"  align="left" ><input name="uid" type="text" autocomplete="off" id="uid" title="Enter User Name" size="40" maxlength="45" tabindex="1" errorstyleclass="error" errorkey="org.apache.struts.action.ERROR"  class="tb5" />                              </td>
                            </tr><tr>
							  <td>
                              <font color="#990000">  <html:errors property="uid" />   </font>                           </td>
                            </tr>
                            <tr>
                              <td height="21" align="left"><font color="#FF0000" size="+0.2">*</font><font color="990000"  style="font-family:"Times New Roman", Times, serif"><strong>Password:</strong></font>&nbsp; </td>
                            </tr>
                            <tr>
                              <td height="24" align="left">
							  
							  <input type="password" name=hash  autocomplete="off" size="40" maxlength="45"   class="tb5"  errorstyleclass="error" errorkey="org.apache.struts.action.ERROR" /> 


							  </td></tr><tr>
                              
							  <td>  <font color="#990000"> <html:errors property="hash" />    </font>                          </td>
                            </tr>
                            <tr>
                              <td align="left" ><font color="#FF0000" size="+0.2">*</font><font color="990000" >Please Enter code</font></td>
                            </tr>
                            <tr>
                              <td align="left" >
<table width="478" align="center" bgcolor="">
<tr> <td width="434"  align="left"><img src="Cap_Img.jsp"> &nbsp;&nbsp;


<a href="JavaScript:window.location.href=window.location.href"><img src="images/refresh.png" style="border:none" width="25" height="25"></a>
</td>
</tr>

<td align="left"><input name="number" type="text" autocomplete="off" ></td>

</table>
                            </td>
                            </tr>
                            <tr>
                              <td align="center"  ><input name="submit" type="submit" onclick="hash.value = hex_sha2(hash.value),hash.value = hex_sha2(hash.value + <%=Random%>)" value="submit"/></td>
                            </tr>
          </table>
		
		</html:form>
	  </td>
    </tr>
	 <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" bgcolor="#0099FF" align="center"><strong><font color="#FFFFFF" size="-1">Created & Designed by O/O DC-MSME</font></strong></td>
    </tr>
</table>

</center>

	


</body></html>