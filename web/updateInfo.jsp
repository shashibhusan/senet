<%-- 
    Document   : sidenav
    Created on : 29 Jan, 2019, 11:45:13 AM
    Author     : Senet
--%>

<html>
    <head>
        <meta charset="utf-8">
        <title>title</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function() {
    $(".link1").click(function(event){
       event.preventDefault();
       var url =$(this).attr("href");

        $('.right-pane').load(url, function(data) {
        console.log(data);
    });
       console.log(url);
    });
});
        </script>
        <style>
            #menu-div{float: left; align:center;}
.style2 ul
{
    padding:0px;
    margin-left:0px;
    font-family:"Times New Roman", Times, serif;
    font-size:15px;
    color:#F7F7F7;
    list-style:none;
    text-indent:20px;
	width:230px;
}
.style2 ul li
{
    background:#EFEFEF;
    line-height:28px;
    border-bottom:1px solid #333;
}
.style2 ul li a
{
    text-decoration:none;
    color:#FFFFFF;
	size:auto;
	
	
    display:block;
}
.style2 ul li a:hover
{
    background:#DFC4A8;
}
.style2 ul li#active
{
    background:#073354;
	color:#333333
}
.right-pane
{
    border: 1px #ccc solid;
    margin-left: 5px;
    align:center;
    width: 890px;
    margin-top: 15px;
    
}
body{
    background-color:  #ececec ;
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
}


    </style>
    </head>
    <body>
        <div id="main" align="center" style="width: 1150px; border:1px #ccc solid;  margin: auto; height: 850px; background-color:  #ffffff ; overflow: auto;">
          
        <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div class="hide1" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <div class="hide1" style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEES' INFORMATION SYSTEM </font>
         </div>    
            
        <div style="height: 15px;">&nbsp;</div>
        <div align="left"  id="menu-div" class="style2" >
            <ul style="border: 1px green solid;">
                <li>
                    <a href="sidenav.jsp"><font color="#EF2100">Home</font></a>
                </li>
                <li > <a href="myInfo.jsp" class="link1"><font color="#EF2100"> my account</font> </a></li>
                <li>
                    <a href="updatetransfer.jsp" class="link1"><font color="#EF2100">update transfer</font></a>
                </li>
                <li>
                    <a href="updatepromotion.jsp" class="link1"><font color="#EF2100">update promotion</font></a>
                </li>
                
            </ul>
            
        </div> 
            <div id="menu-div" class="right-pane" >
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>
                this is to update transfer and promotion.<br/>

                
            </div>
        </div>
    </body>
</html>