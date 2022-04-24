/*
 * creates a new XMLHttpRequest object which is the backbone of AJAX,
 * or returns false if the browser doesn't support it
 */
function getXMLHttpRequest() {
	var xmlHttpReq = false;
	// to create XMLHttpRequest object in non-Microsoft browsers
	if (window.XMLHttpRequest) {
		xmlHttpReq = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		try {
			// to create XMLHttpRequest object in later versions
			// of Internet Explorer
			xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (exp1) {
			try {
				// to create XMLHttpRequest object in older versions
				// of Internet Explorer
				xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (exp2) {
				xmlHttpReq = false;
			}
		}
	}
	return xmlHttpReq;
}
/*
 * AJAX call starts with this function
 */
function makeRequest() {

   //  var year=document.getElementById("cmbYear").value;
   //   var month=document.getElementById("cmbMonth").value;
   //   var msme=document.getElementById("institute").value;
     // if((year>0)&&(month>0))
       //   {
          
	var xmlHttpRequest = getXMLHttpRequest();
	xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
	xmlHttpRequest.open("POST", "HelloWorld.do", true);
	xmlHttpRequest.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	xmlHttpRequest.send(null);
         // }
}

/*
 * Returns a function that waits for the state change in XMLHttpRequest
 */
function getReadyStateHandler(xmlHttpRequest) {

	// an anonymous function returned
	// it listens to the XMLHttpRequest instance
	return function() {
		if (xmlHttpRequest.readyState == 4) {
			if (xmlHttpRequest.status == 200) {

                               var rext=xmlHttpRequest.responseText.value;
                               alert(rext);
                           //   var dom=(new DOMParser()).parseFromString(xmlHttpRequest.responseText,"text/xml");
                              //   var javatopic=dom.getElementsByTagName("topics")[0].childNodes[1].childNodes[0].nodeValue;

                               //  alert("++++++"+javatopic+"       " );

           
			} else {
				alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
			}
		}
	};
}