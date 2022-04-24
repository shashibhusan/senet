
var tableObj = new Object();

function onClickRadio(hitID, tableID,prefix)
{
	var setID = hitID.substring(2,hitID.length);
	var rowID = prefix + "r" + setID;
	hiliteRow(rowID, tableID,prefix);	   
}

function changeRowColor(rowID,evnt, tableID,prefix){
	hiliteRow(rowID,tableID,prefix);
	
	if(evnt == "click"){
			var radioID = prefix + "rd" + rowID.substring(2,rowID.length);
		updateRadioButtons(radioID, tableID,prefix);
	}
}

function hiliteRow(rowID, tableID,prefix){
	tableObj = document.getElementById(tableID)
	var totRows = tableObj.rows;
	for (var i=0; i<totRows.length; ++i)
	{
		var trID = prefix + "r" + i;
		var trObj = new Object(document.getElementById(trID));
		var cName = trObj.className
		if( cName != 'selectedRow'){
			if(rowID == trID)
			{
				trObj.className = 'ActiveRow';
			}
			else
			{
				trObj.className = 'dActiveRow';
			}
		}
	}
}

function updateRadioButtons(radioID, tableID,prefix){

	tableObj = document.getElementById(tableID)
	var totRows = tableObj.rows;
	for (var i=0; i<totRows.length; ++i){
		var tempID = prefix + "rd" + i;
		var radioObj = new Object(document.getElementById(tempID));
		if(tempID == radioID && radioObj.disabled == false){
		if(document.getElementById("seld")!=null)
			document.getElementById("seld").style.display = "";			
			radioObj.checked="true";
			selectRow(prefix + "r" + i, tableID,prefix);
		}
	} 
}

function selectRow(rowID, tableID,prefix){
	tableObj = document.getElementById(tableID)
	var totRows = tableObj.rows;
	for (var i=0; i<totRows.length; ++i){
		var tempID = prefix + "r" + i;
		var trObj = new Object(document.getElementById(tempID));
		if(tempID == rowID){
			trObj.className = 'selectedRow';
		}else{
			trObj.className = 'dActiveRow';
		}
	}
}

function setDefaultColor(rowID){
	var trObj = new Object(document.getElementById(rowID));
	var cName = trObj.className;
	if( cName != 'selectedRow'){
		trObj.className = 'dActiveRow';
	}
} 
function statusChange()
{
	defaultStatus="";
}  
 
function helpWindow(fileName)
{
 var fileFullPath;
 var hostName = window.location.hostname;

 if(hostName=="www.onlinesbi.com"){
 	fileFullPath="/sbijava/help/" + fileName;
 }else if(hostName=="www.sbbjonline.com"){
 	fileFullPath="/sbijava/help_sbbj/"+ fileName;
 }else if(hostName=="www.onlinesbh.com"){
 	fileFullPath="/sbijava/help_sbh/"+ fileName;
 }else if(hostName=="www.onlinesbindore.com"){
 	fileFullPath="/sbijava/help_sbindore/"+ fileName;
 }else if(hostName=="www.onlinesbm.com"){
 	fileFullPath="/sbijava/help_sbm/"+ fileName;
 }else if(hostName=="www.onlinesbp.com"){
 	fileFullPath="/sbijava/help_sbp/"+ fileName;
 }else if(hostName=="www.onlinesbs.com"){
 	fileFullPath="/sbijava/help_sbs/"+ fileName;
 }else if(hostName=="www.sbtonline.in"){
 	fileFullPath="/sbijava/help_sbt/"+ fileName;
 } 
 window.open(fileFullPath,'productservice','width=780, height=500 ,status=1, scrollbars=1, resizable=yes,location=0');
}
function saralHelpWindow(fileName)
{
var fileFullPath="/sbijava/corporate/help/saral/" + fileName;
window.open(fileFullPath,'productservice','width=780, height=500 ,status=1, scrollbars=1, resizable=yes,location=0');
}
 
