			var xmlHttp

            function showHint()

            {
                     xmlHttp=GetXmlHttpObject()

                        if (xmlHttp==null) {

                                    alert ("Please fill the right varification code")

                                    return

                        } 

                        var url="ajax.html"                       

                        url=url+"?code="+document.tmp.sec_code.value

                        xmlHttp.onreadystatechange=stateChanged 

                        xmlHttp.open("GET",url,true)

                        xmlHttp.send(null)

            } 

            

            

            function stateChanged()

            { 

                        if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete") {

                                    var get=xmlHttp.responseText;
									if(get == "fail")
									{
									 document.getElementById('xxx').style.visibility='visible';
									 }
									 else {
									  document.tmp.action = 'quickform.html';
									 
									  document.tmp.submit();
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