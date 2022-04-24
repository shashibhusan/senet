function len(field,ll,nm){
	if(field.value.length>ll){
		alert(nm)
		field.focus()
		return false
	}
	return true
 }


function required(field,nm)
{
 
if(field.value == ""){
		alert(nm)
		field.focus()
		return false
	}
	return true

}


function blank(field,nm)
{
if(field.value!=""){

	var crlf="\r\n"
	text=false
	
	var arr=new Array()
	arr=field.value.split(crlf)
	for(j=0;j<arr.length&&!text;j++){
		a=arr[j]
		if ((a!=crlf)){
			for(i=0;i<a.length&&!text;i++){
				str=a.substring(i,i+1)
				if((str!=" ")&&(str!=""))
					text=true
			}
		}
	}

	if (!text){
		alert(nm)
		field.focus()
		return false;
	}
	return true
}
return true
}

function lenword(field,nm){
	if (field.value!=""){
		var arr=new Array()
		arr=field.value.split(" ")
		for(i=0;i<arr.length;i++){
			if(arr[i].length>70){
				//alert("Sorry, the word '"+arr[i]+"' is too long.  Please enter another word. [max 70 char]")
				alert("Sorry, the word is too long.  Please enter another word. [one word max 70 char]")
				field.focus()
				return false;
			}
		}
	}

	return true
 }
 
 
function dateval(sdate){

var val=sdate.value;
if(val != "")
{

if((val.length>10) ||(val.length<8))
{
	alert(" Please enter the date in (mm/dd/yyyy) format. ")
	sdate.focus();
	return false;
}
else {
	slash1=val.indexOf("index-2.html")
	if(slash1==-1)
	{
		alert(" Please enter the date in (mm/dd/yyyy) format.")
		sdate.focus();
		return false;
	}	
	slash2=val.lastIndexOf("index-2.html")
	if((slash2==-1)||(slash2==slash1))
	{
		alert(" Please enter the date in (mm/dd/yyyy) format.")
		sdate.focus();
		return false;
	}	
	
	var two=(val.substring(0,slash1));
	if ((two>=0)&&(two<=12))
	{

		mm=two;
	}
	else
	{	
		alert(" Please enter the date in (mm/dd/yyyy) format.")
		
		sdate.focus();
		return false;
	}
	two=(val.substring(slash1+1,slash2));

	if ((two>=0)&&(two<=31))
	{
		dd=two;
	}
	else
	{	
		alert(" Please enter the date in (mm/dd/yyyy) format.")
		
		sdate.focus();
		return false;
	}
	two=(val.substring(slash2+1,slash2+5));
	if ((two>=1900)&&(two<=2075))
	{
		yy=two;
	}
	else
	{	
		alert(" Please enter the date in (mm/dd/yyyy) format.")

		sdate.focus();
		return false;
	}

	if(((dd==29)&&(mm==02))||((dd==29)&&(mm==2)))
	{
	
		if(((yy%4)==0)||((yy%400)==0))
		{
		//valid
		}
		else
		{
		alert(" Please enter the date in (mm/dd/yyyy) format.")
		sdate.focus();
		return false;
		}
	}
	if (((dd>29)&&(mm==2))||((dd==31)&&((mm==2)||(mm==4)||(mm==6)||(mm==9)||(mm==11))))
	{	
		alert(" Please enter the date in (mm/dd/yyyy) format.")
		sdate.focus();
		return false;
	}
}	
return true;
}	
return true;
}


function ValidateEMail(objName)
{
	var sobjValue;
	var iobjLength;
	
	sobjValue=objName.value;
	
	iobjLength=sobjValue.length;
	
	iFposition=sobjValue.indexOf("@");
	iSposition=sobjValue.indexOf(".");
	iTmp=sobjValue.lastIndexOf(".");	
	
	if (iobjLength!=0)
	{
		if ((iFposition == -1)||(iSposition == -1))
		{
			alert("Please enter the Email address in correct format (yourname@company.com)")
			objName.focus();
			return false;
		}
		else if(sobjValue.charAt(0) == "@" || sobjValue.charAt(0)==".")
		{
			alert("Please enter the Email address in correct format (yourname@company.com)")
			objName.focus();
			return false;				
		}
		else if(sobjValue.charAt(iobjLength) == "@" || sobjValue.charAt(iobjLength)==".")
		{
			alert("Please enter the Email address in correct format (yourname@company.com)");
			objName.focus();
			return false;				
		}	
		else if((sobjValue.indexOf("@",(iFposition+1)))!=-1)
		{	
			alert("Please enter the Email address in correct format (yourname@company.com)")
			objName.focus();
			return false;
		}
		else if ((iobjLength-(iTmp+1)<2)||(iobjLength-(iTmp+1)>3))
		{
			alert("Please enter the Email address in correct format (yourname@company.com)")
			objName.focus();
			return false;
		}
		else if(sobjValue.indexOf(" ") != -1)
		{	
			alert("Please remove the space between the words")
			objName.focus();
			return false;
		}
		
		else
		{
			return true;
		}		
	}		
}    


function year_validation(field)
{
var valid = "1234567890."
if(field.value!="")
{
		var len=field.value.length;
		var chk=field.value;
		for(i=0;i<len;i++)
		{
			x = chk.charAt(i)
			if(valid.indexOf(x) == -1)
			{
				field.focus()
				field.select()
				alert("Please enter only numeric values in year field.")
				return false;
			}
		}
		if((chk<1900)||(chk>2075)){
			field.focus()
			field.select()
			alert("Please enter the Year between 1900 to 2075.")
			return false;
		}
		
}
return true;
}

function numeric(field)
{
var valid = "1234567890-,."
if(field.value!="")
{
		var len=field.value.length;
		var chk=field.value;
		for(i=0;i<len;i++)
		{
			x = chk.charAt(i)
			if(valid.indexOf(x) == -1)
			{
				field.focus()
				field.select()
				alert("Please enter only numeric values")
				return false;
			}
		}
}
return true;
}  

function isapostrophe(field) {
var str
str = field.value 
var len =str.length
//alert(str+len)
	var i
	for(i=0; i<len;++i){
		if(str.charAt(i)=="'"){
		field.focus()
		field.select()
		alert("cannot insert  APOSTROPHE ( ' ) into any field.")
		return true
		}
	}
	return false
}


function specialcheck(field,nm)
{    
								
	var mikExp = /[$?\\@\\\#%\^\&\*\(\)\[\]\+\_\!\{\}\`\~\=\|]/;
	var strPass = field.value;
	var sFldval = field.value;
	var strLength = strPass.len;
				
	var lchar = strPass.charAt((strLength) - 1);
					
	var lchar1 = strPass.charAt(0)
					
	if((lchar.search(mikExp) != -1)|| (lchar1.search(mikExp) != -1))
	{
	alert("Please enter the valid characters only!");
	field.focus()
	return false;
	}
					
	if(sFldval.indexOf('"') != -1) 
	{
		alert("Please remove the double Quotes");
		field.focus()
		return false;
	}
	if(sFldval.indexOf("'") != -1) 
	{
		alert("please remove the single Quote");
		field.focus()
		return false;
	}
					
	if(sFldval.indexOf(" ") != -1) 
	{
		alert("Please remove the space between the words");
		field.focus()
		return false;
	}
	return true
} 	