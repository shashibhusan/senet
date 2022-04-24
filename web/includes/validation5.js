			var xmlHttp

            function showHint2()

            {
                     xmlHttp=GetXmlHttpObject()

                        if (xmlHttp==null) {

                                    alert ("Please fill the right varification code")

                                    return

                        } 

                        var url="ajax.html"                       

                        url=url+"?code="+document.contact.sec_code.value

                        xmlHttp.onreadystatechange=stateChanged1 

                        xmlHttp.open("GET",url,true)

                        xmlHttp.send(null)

            } 

            

            

            function stateChanged1()

            { 

                        if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete") {

                                    var get=xmlHttp.responseText;
									if(get == "fail")
									{
									 document.getElementById('xyz').style.visibility='visible';
									 }
									 else {
									  document.contact.action = 'request-quote.html';
									 
									  document.contact.submit();
									 }

                        } 

            } 

            

            function GetXmlHttpObject()

            { 

                        var objXMLHttp=null

                        if (window.XMLHttpRequest) {

                                    objXMLHttp=new XMLHttpRequest()

                        }

                        else if (window.ActiveXObject) {

                                    objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP")

                        }

                        return objXMLHttp

            } 