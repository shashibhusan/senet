var fieldObj;
var bCaps=false;
var focus_count=0;
var sHTML="";
var tempVk ="";
function getArr()
{
var keyArr=[['~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+'],
			  		['`', ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'], '-', '='],
			  		[['q', 'w', 'e', 'r', 't'], ['y', 'u', 'i', 'o', 'p'], '{', '}', '|'],
			  		[['a', 's', 'd', 'f', 'g'], ['h', 'j', 'k', 'l'], '[', ']', '\\', '/'],
			  		[['z', 'x', 'c', 'v'], ['b', 'n', 'm'], '<', '>', ';', ':', '\'', '"'],
			  		[',', '.', '?']];

return (keyArr);
}
function getFocus(x) {
	
	fieldObj=document.getElementById(x);
}
function constructKeyboard(bool) {
	
	var check;
	if(typeof(bool) == 'undefined')
		check= document.getElementById('chkbox').checked;
	else
		check = bool;
	var keyArr = getArr();
	//var check = document.getElementById('chkbox').checked;
	var str_trco="</tr><tr>";
	sHTML="<table	border='0' class='keyboardtbl' cellspacing='3px' id='keypad' width='100%'><tr>";
	for (var i=0; i<keyArr.length-1; i++){
		//alert(keyArr[i].length)
		for (var j=0; j<keyArr[i].length; j++){
			var code;
			if(typeof(keyArr[i][j])=='object'){
				while(keyArr[i][j].length>0){
					var ix=Math.floor(Math.random()*keyArr[i][j].length);
					var ch=keyArr[i][j].splice(ix,1);
					code=ch[0].charCodeAt(0);
					if(!check){
						sHTML+="<td class='keyboardtbldis'>" + ch + "</td>";
					}
					else
					{
						sHTML+="<td onClick='putChar(" + code + ")' class='keyboardtblenb'>" + ch + "</td>";
					}
				}
			}else{
				code=keyArr[i][j].charCodeAt(0);
				if(check)
					sHTML+="<td onClick='putChar(" + code + ")' class='keyboardtblenb'>" + keyArr[i][j] + "</td>";
				else
					sHTML+="<td class='keyboardtbldis'>" + keyArr[i][j] + "</td>";
			}
		}
		sHTML+=str_trco;
	}
	if(check){
	sHTML+="<td colspan='5' id='cap' onClick='setCaps(this)' class='keyboardtblenb' style='background:#E9EFF3;padding:3px 8px 3px 8px; width:100px; font-size:85%;'>CAPS LOCK</td>";
	sHTML+="<td colspan='5' id='clr' onClick='setClearAll()' class='keyboardtblenb' style='background:#E9EFF3;padding:3px 8px 3px 8px; width:100px; font-size:85%;'>CLEAR</td>";}
	else{
		sHTML+="<td colspan='5' id='cap'  class='keyboardtbldis' style='padding:3px 8px 3px 8px; width:100px; font-size:85%;'>CAPS LOCK</td>";
		sHTML+="<td colspan='5' id='clr'  class='keyboardtbldis' style='padding:3px 8px 3px 8px; width:100px; font-size:85%;'>CLEAR</td>";
	}
	var codeArray = new Array();
	for (var i=0; i<3; i++){
		codeArray[i]=keyArr[5][i];
	}
	shuffle(codeArray);
	for (var i=0; i<3; i++){
		var code=codeArray[i].charCodeAt(0);
		if(check)
			sHTML+="<td onClick='putChar(" + code + ")' class='keyboardtblenb' >" + codeArray[i] + "</td>";
		else
			sHTML+="<td  class='keyboardtbldis'>" + codeArray[i] + "</td>";
	}
	sHTML+="</tr></table>";
	document.getElementById('kbplaceholder').innerHTML = sHTML;
}
shuffle = function(v){
    for(var j, x, i = v.length; i; j = parseInt(Math.random() * i), x = v[--i], v[i] = v[j], v[j] = x);
    return v;
};
function putChar(code){
	if(fieldObj.value.length < 20){
		var keycode=(code>96 && code<123 && bCaps) ? code-32 : code;
		var text=String.fromCharCode(keycode);
			fieldObj.value += text;
			setCaretTo();
	}
}
function setCaretTo(){
	var pos=fieldObj.value.length;
	if(fieldObj.createTextRange){
		var range=fieldObj.createTextRange();
		range.move('character', pos);
		range.select();
	}else if(fieldObj.selectionStart){
		fieldObj.focus();
		fieldObj.setSelectionRange(pos, pos);
	}
}
function changeCase(){
	var alphabets = document.getElementById('keypad').getElementsByTagName('TD');
	for(var i=0; i<alphabets.length; i++){
		var ch = alphabets[i].innerHTML;
		if((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') && ch.length==1){
			alphabets[i].innerHTML = bCaps ? ch.toUpperCase() : ch.toLowerCase();
		}
	}
}
function setCaps(obj){
	bCaps = !(bCaps);
	toggleCap(obj);
	changeCase();
}
function toggleCap(obj){
	 var str = bCaps ? "CAPS LOCK" : "CAPS LOCK";
	 obj.innerHTML = str;
}
function setClearAll(){
	fieldObj.value = "";
	fieldObj.focus();
}

/* virtual Keyboard */




function showImages(){
	var display = document.getElementById('hideShow').style.display;
	if(display=='none'){
		document.getElementById('hideShow').style.display = 'block';
	}else{
		document.getElementById('hideShow').style.display = 'none';
	}
}





function backspacevk(){
	var profpass;  
	profpass = document.getElementsByName(fieldObj.name+'enc')[0];
	//alert(profpass.value);
	var pfvaluevk = profpass.value;
	var len = pfvaluevk.length;
	if(pfvaluevk.lastIndexOf("|^|") == -1){
		profpass.value = "";
		fieldObj.value = "";
		return;
	}else if(pfvaluevk.lastIndexOf("|^|") == (pfvaluevk.length-3)){
		pfvaluevk = pfvaluevk.substring(0,pfvaluevk.lastIndexOf("|^|"));	
	}else{
		alert("error while doing backspace");
	} 
	
	if(pfvaluevk.lastIndexOf("|^|")!= -1){
		profpass.value = pfvaluevk.substring(0,pfvaluevk.lastIndexOf("|^|") +3);
	}else{
		profpass.value = "";
	}
	
	//alert(profpass.value);
	fieldObj.value = fieldObj.value.substring(0,fieldObj.value.length-1);
}




function constructKeyboardEng(){
	sHTML="<div class='boardOutervk'> <span>Multilingual Image-based Virtual Key Board</span> <div class='keyArea'> <div style='padding-left:1px;'>";
	var keyArrEng = vkeyArrEng.clone();
	var encArray = vencArray.clone();
	bCaps=false;
	for (var i=0; i<keyArrEng.length; i++){
		for (var j=0; keyArrEng[i].length >0; j++){
			if(true){
				var ix=Math.floor(Math.random()*keyArrEng[i].length);
				var ch=keyArrEng[i].splice(ix,1);
				var chv = encArray[i].splice(ix,1);
				//alert(ch); alert(keyArrHindi[i]);
			}else{
				ch = keyArrEng[i].splice(0,1);
				chv = encArray[i].splice(0,1);
			}
			
			if(i==4 && j==0){
				sHTML+="<div id='capsLockId'>";				
			}
			sHTML+="<span><a href='#' onClick='populateEng(\""+chv+"\",\"" + ch + "\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"'/></a></span>";			
		}
	}
	sHTML+=" </div> <span><a href='#' onClick='setCapsVK(this)'> <img style='height: 17px; width: 121px;' id='h!' src='/sbijava/images/virtualkeys_img/caps_e.gif'></a></span>" +
			"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 121px;'   src='/sbijava/images/virtualkeys_img/clear_e.gif'></a></span>" +
			"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 121px;'   src='/sbijava/images/virtualkeys_img/backspace_e.gif'/></a></span>";
	sHTML+="</div>  </div></div>";
	//alert(sHTML);
	//sHTML = "hindi";
	document.getElementById('kbplaceholder').innerHTML = sHTML;

}


function constructKeyboardHindi(){
	bCaps=false;
	sHTML=" <div class='boardOuterhvk'> " +
			"<span>Multilingual Image-based Virtual Key Board</span> " +
			"<div class='keyAreahvk'> " +
			"<div style='padding-left:1px;'>";
	var keyArrHindi = vkeyArrHindi.clone();
	var encArray = vencArrayHinid.clone();
	for (var i=0; i<keyArrHindi.length; i++){
		for (var j=0; keyArrHindi[i].length >0; j++){
			
			var ix; var ch; var chv;
			if(i < 5){
				ix=Math.floor(Math.random()*keyArrHindi[i].length);
				ch=keyArrHindi[i].splice(ix,1);
				chv = encArray[i].splice(ix,1);
				//alert(ch); alert(keyArrHindi[i]);
			}else{
				ch = keyArrHindi[i].splice(0,1);
				chv = encArray[i].splice(0,1);
			}
			//alert(i + '--' + ch + '--' + chv + '--'+ j);
			if(i==6 && j==0){
				sHTML+="<div id='normalImagesId' style='display:block;'>";
			}
			
			if(i==9 && j==0){
				sHTML+="</div> <div id='shiftImagesId' style='display:none;'>";
			}
			sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";			
		}
	}
	sHTML+=" </div> " +
			"<span><a href='#' onclick='toggleImages(this);'><img style='height: 17px; width: 123px;' id='h!' src='/sbijava/images/virtualkeys_img/shift_h.gif'></a></span>" +
			"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 123px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_h.gif'></a></span>" +
			"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 123px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_h.gif'></a></span></div>";
	sHTML+="</div></div>";
	//alert(sHTML);
	//sHTML = "hindi";
	document.getElementById('kbplaceholder').innerHTML = sHTML;

}

//tamil keyboard
function constructKeyboardTamil(){

	bCaps=false;
	sHTML=" <div class='boardOutertvk'> " +
			"<span>Multilingual Image-based Virtual Key Board</span> " +
			"<div class='keyAreatvk'> " +
			"<div style='padding-left:1px;'>";
	var keyArrTamil = vkeyArrTamil.clone();
	var encArray = vencArrayTamil.clone();
	for (var i=0; i<keyArrTamil.length; i++){
		for (var j=0; keyArrTamil[i].length >0; j++){
			
			var ix; var ch; var chv;
			if(i < 5){
				ix=Math.floor(Math.random()*keyArrTamil[i].length);
				ch=keyArrTamil[i].splice(ix,1);
				chv = encArray[i].splice(ix,1);
			}else{
				ch = keyArrTamil[i].splice(0,1);
				chv = encArray[i].splice(0,1);
			}
			
			if(i==5 && j==0){
				sHTML+="<div id='normalImagesId' style='display:block;'>";
			}  
			
			if(i==8 && j==0){
				sHTML+="</div> <div id='shiftImagesId' style='display:none;'>";
			}
			
			sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";			
		}
	}
	sHTML+=" </div> " +
			"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_t.gif'></a></span>" +
			"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_t.gif'></a></span></div>";
	sHTML+="</div></div>";
	document.getElementById('kbplaceholder').innerHTML = sHTML;

}


/* Marathi keyboard - Martin */
	
	function constructKeyboardMarathi(){
		bCaps=false;
		sHTML=" <div class='boardOutermvk'> " +
				"<span>Multilingual Image-based Virtual Key Board</span> " +
				"<div class='keyAreamvk'> " +
				"<div style='padding-left:1px;'>";
		
		var keyArrMarathi = vkeyArrMarathi.clone();
		var encArray = vencArrayMarath.clone();
		for (var i=0; i<keyArrMarathi.length; i++){
			for (var j=0; keyArrMarathi[i].length >0; j++){
				
				var ix; var ch; var chv;
				if(i < 5){
					ix=Math.floor(Math.random()*keyArrMarathi[i].length);
					ch=keyArrMarathi[i].splice(ix,1);
					chv = encArray[i].splice(ix,1);
					//alert(ch); alert(keyArrMarathi[i]);
				}else{
					ch = keyArrMarathi[i].splice(0,1);
					chv = encArray[i].splice(0,1);
				}
				//console.log("i val ="+ i+ " j aval = "+j+ " Img val = "+ ch + " == chv = "+chv);
				if(i==6 && j==0){
					sHTML+="<div id='normalImagesId' style='display:block;'>";
				}
				if(i==9 && j==0){
					sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span> </div><div style='clear:both; display:none' id='shiftImagesId'>	";
				}else{
					sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";
				}
				
			}
		}
		sHTML+=" </div> <div style='clear:both;  padding-bottom:4px'>" +
				"<span><a href='#' onclick='toggleImages(this);'><img style='height: 17px; width: 123px;' id='h!' src='/sbijava/images/virtualkeys_img/shift_h.gif'></a></span>" +
				"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 123px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_h.gif'></a></span>" +
				"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 123px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_h.gif'></a></span></div>";
		sHTML+="</div></div>";
		//alert(sHTML);
		/*sHTML = "marathi";*/
		document.getElementById('kbplaceholder').innerHTML = sHTML;

	}
	
	/* Telugu keyboard - Martin */
	function constructKeyboardTelugu(){

		bCaps=false;
		sHTML=" <div class='boardOuterteluguvk'> " +
		"<span>Multilingual Image-based Virtual Key Board</span> " +
		"<div class='keyAreateluguvk'> " +
		"<div style='padding-left:1px;'>";
		
		var keyArrTelugu = vkeyArrTelugu.clone();
		var encArray = vencArrayTelug.clone();
		for (var i=0; i<keyArrTelugu.length; i++){
			for (var j=0; keyArrTelugu[i].length >0; j++){
				
				var ix; var ch; var chv;
				if(i < 5){
					ix=Math.floor(Math.random()*keyArrTelugu[i].length);
					ch=keyArrTelugu[i].splice(ix,1);
					chv = encArray[i].splice(ix,1);
					//alert(ch); alert(keyArrTelugu[i]);
				}else{
					ch = keyArrTelugu[i].splice(0,1);
					chv = encArray[i].splice(0,1);
				}
				
				if(i==5 && j==0){
					sHTML+="<div id='normalImagesId' style='display:block;'>";
				}  
				
				if(i==8 && j==0){
					sHTML+="</div> <div id='shiftImagesId' style='display:none;'>";
				}
				
				sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";			
			}
		}
		sHTML+=" </div> " +
				"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_t.gif'></a></span>" +
				"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_t.gif'></a></span></div>";
		sHTML+="</div></div>";
		document.getElementById('kbplaceholder').innerHTML = sHTML;

	}
	
	/* Gujarati keyboard - Martin */
	function constructKeyboardGujarati(){
		
		bCaps=false;
		sHTML=" <div class='boardOutergujarativk'> " +
		"<span>Online Virtual Keyboard</span> " +
		"<div class='keyAreagujarativk'> " +
		"<div style='padding-left:1px;'>";
		
		var keyArrGujarati = vkeyArrGujarati.clone();
		var encArray = vencArrayGujarat.clone();
		for (var i=0; i<keyArrGujarati.length; i++){
			for (var j=0; keyArrGujarati[i].length >0; j++){
				
				var ix; var ch; var chv;
				if(i < 5){
					ix=Math.floor(Math.random()*keyArrGujarati[i].length);
					ch=keyArrGujarati[i].splice(ix,1);
					chv = encArray[i].splice(ix,1);
					//alert(ch); alert(keyArrGujarati[i]);
				}else{
					ch = keyArrGujarati[i].splice(0,1);
					chv = encArray[i].splice(0,1);
				}
				
				if(i==6 && j==0){
					sHTML+="<div id='normalImagesId' style='display:block;'>";
				}  
				
				if(i==9 && j==0){
					sHTML+="</div> <div id='shiftImagesId' style='display:none;'>";
				}
				
				sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";			
			}
		}
		sHTML+=" </div> <div style='clear:both;  padding-bottom:4px'>" +
		//sHTML+=" </div> " +
		"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_t.gif'></a></span>" +
		"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_t.gif'></a></span></div>";
		sHTML+="</div></div>";
		document.getElementById('kbplaceholder').innerHTML = sHTML;
		
	}
	
	
	/* Punjabi keyboard - Martin */
	function constructKeyboardPunjabi(){
		
		bCaps=false;
		sHTML=" <div class='boardOuterpunjabivk'> " +
		"<span>Online Virtual Keyboard</span> " +
		"<div class='keyAreapunjabivk'> " +
		"<div style='padding-left:1px;'>";
		
		var keyArrPunjabi = vkeyArrPunjabi.clone();
		var encArray = vencArrayPunjab.clone();
		for (var i=0; i<keyArrPunjabi.length; i++){
			for (var j=0; keyArrPunjabi[i].length >0; j++){
				
				var ix; var ch; var chv;
				if(i < 5){
					ix=Math.floor(Math.random()*keyArrPunjabi[i].length);
					ch=keyArrPunjabi[i].splice(ix,1);
					chv = encArray[i].splice(ix,1);
					//alert(ch); alert(keyArrPunjabi[i]);
				}else{
					ch = keyArrPunjabi[i].splice(0,1);
					chv = encArray[i].splice(0,1);
				}
				
				if(i==5 && j==0){
					sHTML+="<div id='normalImagesId' style='display:block;'>";
				}  
				
				if(i==8 && j==0){
					sHTML+="</div> <div id='shiftImagesId' style='display:none;'>";
				}
				
				sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";			
			}
		}
		sHTML+=" </div> <div style='clear:both;  padding-bottom:4px'>" +
		//sHTML+=" </div> " +
		"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_t.gif'></a></span>" +
		"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_t.gif'></a></span></div>";
		sHTML+="</div></div>";
		document.getElementById('kbplaceholder').innerHTML = sHTML;
		
	}
	
	/* Bengali keyboard - Karthik Raju */
	function constructKeyboardBengali(){
		bCaps=false;
		sHTML=" <div class='boardOuterbengalivk'> " +
		"<span>Online Virtual Keyboard</span> " +
		"<div class='keyAreabengalivk'> " +
		"<div style='padding-left:1px;'>";
		
		var keyArrBengali = vkeyArrBengali.clone();
		var encArray = vencArrayBengali.clone();
		for (var i=0; i<keyArrBengali.length; i++){
			for (var j=0; keyArrBengali[i].length >0; j++){
				
				var ix; var ch; var chv;
				if(i < 5){
					ix=Math.floor(Math.random()*keyArrBengali[i].length);
					ch=keyArrBengali[i].splice(ix,1);
					chv = encArray[i].splice(ix,1);
				}else{
					ch = keyArrBengali[i].splice(0,1);
					chv = encArray[i].splice(0,1);
				}
				
				if(i==6 && j==0){
					sHTML+="<div id='normalImagesId' style='display:block;'>";
				}  
				
				if(i==9 && j==0){
					sHTML+="</div> <div id='shiftImagesId' style='display:none;'>";
				}
				
				sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";			
			}
		}
		sHTML+=" </div> <div style='clear:both;  padding-bottom:4px'>" +
		"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_t.gif'></a></span>" +
		"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_t.gif'></a></span></div>";
		sHTML+="</div></div>";
		document.getElementById('kbplaceholder').innerHTML = sHTML;
		
	}
	/* Kannada keyboard - Karthik Raju */
	function constructKeyboardKannada(){
		bCaps=false;
		sHTML=" <div class='boardOuterkannadavk'> " +
		"<span>Online Virtual Keyboard</span> " +
		"<div class='keyAreakannadavk'> " +
		"<div style='padding-left:1px;'>";
		
		var keyArrKannada = vkeyArrKannada.clone();
		var encArray = vencArrayKannada.clone();
		for (var i=0; i<keyArrKannada.length; i++){
			for (var j=0; keyArrKannada[i].length >0; j++){
				
				var ix; var ch; var chv;
				if(i < 5){
					ix=Math.floor(Math.random()*keyArrKannada[i].length);
					ch=keyArrKannada[i].splice(ix,1);
					chv = encArray[i].splice(ix,1);
				}else{
					ch = keyArrKannada[i].splice(0,1);
					chv = encArray[i].splice(0,1);
				}
				
				if(i==6 && j==0){
					sHTML+="<div id='normalImagesId' style='display:block;'>";
				}  
				
				if(i==9 && j==0){
					sHTML+="</div> <div id='shiftImagesId' style='display:none;'>";
				}
				
				sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";			
			}
		}
		sHTML+=" </div> <div style='clear:both;  padding-bottom:4px'>" +
		"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_t.gif'></a></span>" +
		"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_t.gif'></a></span></div>";
		sHTML+="</div></div>";
		document.getElementById('kbplaceholder').innerHTML = sHTML;
		
	}
	/* Malayalam keyboard - Karthik Raju */
	function constructKeyboardMalayalam(){
		bCaps=false;
		sHTML=" <div class='boardOutermalayalamvk'> " +
		"<span>Online Virtual Keyboard</span> " +
		"<div class='keyAreamalayalamvk'> " +
		"<div style='padding-left:1px;'>";
		
		var keyArrMalayalam = vkeyArrMalayalam.clone();
		var encArray = vencArrayMalayalam.clone();
		for (var i=0; i<keyArrMalayalam.length; i++){
			for (var j=0; keyArrMalayalam[i].length >0; j++){
				
				var ix; var ch; var chv;
				if(i < 5){
					ix=Math.floor(Math.random()*keyArrMalayalam[i].length);
					ch=keyArrMalayalam[i].splice(ix,1);
					chv = encArray[i].splice(ix,1);
				}else{
					ch = keyArrMalayalam[i].splice(0,1);
					chv = encArray[i].splice(0,1);
				}
				
				if(i==6 && j==0){
					sHTML+="<div id='normalImagesId' style='display:block;'>";
				}  
				
				if(i==9 && j==0){
					sHTML+="</div> <div id='shiftImagesId' style='display:none;'>";
				}
				
				sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";			
			}
		}
		sHTML+=" </div> <div style='clear:both;  padding-bottom:4px'>" +
		"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_t.gif'></a></span>" +
		"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_t.gif'></a></span></div>";
		sHTML+="</div></div>";
		document.getElementById('kbplaceholder').innerHTML = sHTML;
		
	}
	
	/* Author		:SM55551
	 * Date			:29-Oct-2012 
	 * Desc			: Assami keyboard
	 * */
	function constructKeyboardAssami(){
		bCaps=false;
		sHTML=" <div class='boardOuterassamivk'> " +
		"<span>Online Virtual Keyboard</span> " +
		"<div class='keyAreaassamivk'> " +
		"<div style='padding-left:1px;'>";
		
		var keyArrAssami = vkeyArrAssami.clone();
		var encArray = vencArrayAssami.clone();
		for (var i=0; i<keyArrAssami.length; i++){
			for (var j=0; keyArrAssami[i].length >0; j++){
				
				var ix; var ch; var chv;
				if(i < 5){
					ix=Math.floor(Math.random()*keyArrAssami[i].length);
					ch=keyArrAssami[i].splice(ix,1);
					chv = encArray[i].splice(ix,1);
				}else{
					ch = keyArrAssami[i].splice(0,1);
					chv = encArray[i].splice(0,1);
				}
				
				if(i==6 && j==0){
					sHTML+="<div id='normalImagesId' style='display:block;'>";
				}  
				
				if(i==9 && j==0){
					sHTML+="</div> <div id='shiftImagesId' style='display:none;'>";
				}
				
				sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";			
			}
		}
		sHTML+=" </div> <div style='clear:both;  padding-bottom:4px'>" +
		"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_t.gif'></a></span>" +
		"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_t.gif'></a></span></div>";
		sHTML+="</div></div>";
		document.getElementById('kbplaceholder').innerHTML = sHTML;
		
	}
	
	/* Author		: SM55551
	 * Date			: 29-Oct-2012 
	 * Desc			: Oriya keyboard
	 * */
	function constructKeyboardOriya(){
		bCaps=false;
		sHTML=" <div class='boardOuteroriyavk'> " +
		"<span>Online Virtual Keyboard</span> " +
		"<div class='keyAreaoriyavk'> " +
		"<div style='padding-left:1px;'>";
		
		var keyArrOriya = vkeyArrOriya.clone();
		var encArray = vencArrayOriya.clone();
		for (var i=0; i<keyArrOriya.length; i++){
			for (var j=0; keyArrOriya[i].length >0; j++){
				var ix; var ch; var chv;
				if(i < 5){
					ix=Math.floor(Math.random()*keyArrOriya[i].length);
					ch=keyArrOriya[i].splice(ix,1);
					chv = encArray[i].splice(ix,1);
				}else{
					ch = keyArrOriya[i].splice(0,1);
					chv = encArray[i].splice(0,1);
				}
				if(i==6 && j==0){
					sHTML+="<div id='normalImagesId' style='display:block;'>";
				}  
				
				if(i==9 && j==0){
					sHTML+="</div> <div id='shiftImagesId' style='display:none;'>";
				}
				
				sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";			
			}
		}
		sHTML+=" </div> <div style='clear:both;  padding-bottom:4px'>" +
		"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_t.gif'></a></span>" +
		"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_t.gif'></a></span></div>";
		sHTML+="</div></div>";
		document.getElementById('kbplaceholder').innerHTML = sHTML;
		
	}
	
	/* Author		: SM55551
	 * Date			: 29-Oct-2012 
	 * Desc			: Urdu keyboard
	 * */
	function constructKeyboardUrdu(){
		bCaps=false;
		sHTML=" <div class='boardOuterurduvk'> " +
		"<span>Online Virtual Keyboard</span> " +
		"<div class='keyAreaurduvk'> " +
		"<div style='padding-left:1px;'>";
		
		var keyArrUrdu = vkeyArrUrdu.clone();
		var encArray = vencArrayUrdu.clone();
		for (var i=0; i<keyArrUrdu.length; i++){
			for (var j=0; keyArrUrdu[i].length >0; j++){
				
				var ix; var ch; var chv;
				if(i < 5){
					ix=Math.floor(Math.random()*keyArrUrdu[i].length);
					ch=keyArrUrdu[i].splice(ix,1);
					chv = encArray[i].splice(ix,1);
				}else{
					ch = keyArrUrdu[i].splice(0,1);
					chv = encArray[i].splice(0,1);
				}
				
				if(i==6 && j==0){
					sHTML+="<div id='normalImagesId' style='display:block;'>";
				}  
				
				if(i==9 && j==0){
					sHTML+="</div> <div id='shiftImagesId' style='display:none;'>";
				}
				
				sHTML+="<span><a href='#' onClick='populate(\""+chv+"\")'><img src='/sbijava/images/virtualkeys_img/"+ch+"' id='h!'></a></span>";			
			}
		}
		sHTML+=" </div> <div style='clear:both;  padding-bottom:4px'>" +
		"<span><a href='#' onClick='vkClear()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/clear_t.gif'></a></span>" +
		"<span><a href='#' onClick='backspacevk()'><img style='height: 17px; width: 190px;' id='h!' src='/sbijava/images/virtualkeys_img/backspace_t.gif'></a></span></div>";
		sHTML+="</div></div>";
		document.getElementById('kbplaceholder').innerHTML = sHTML;
		
	}
function populateEng(char, obj){
	var encCaps = '';
	if(obj.indexOf("eng")!= -1 && bCaps){
			encCaps='@';
	}
	char = char + encCaps;
	populate(char)
}


function populate(char){
	var profpass;
	
	if(fieldObj.id == 'hintAnswer'){
		return false;
	}
		
	profpass = document.getElementsByName(fieldObj.name+'enc')[0];
	//alert(fieldObj.name + '--' + profpass);
	

	//by uday
	if(fieldObj.name.indexOf("old")!= -1 ) {
		var oldvkb = document.getElementById('virtualKeyhiddenOldVar').value; 
		if(oldvkb=='false') {
		alert("Use virtual Keyboard option is not enabled for the selected field");
	return false;	
		}
	}	
	if(fieldObj.name.indexOf("new")!= -1 || fieldObj.name.indexOf("confirmPassword")!= -1 ) {
		var vkb = document.getElementById('virtualKeyhiddenNewVar').value;
		if(vkb=='false') {
		alert("Use virtual Keyboard option is not enabled for the selected field");
	return false;	
		}
	}	
  //by uday
	
	profpass.value = profpass.value + char + "|^|";
	fieldObj.value += 'x';
	setCaretTo();

}




function setCapsVK(obj){
	bCaps = !(bCaps);
	//toggleCap(obj);
	changeCaseVK();
}


function changeCaseVK(){
	var alphabets = document.getElementById('capsLockId').getElementsByTagName('img');
	//var hfers =  document.getElementById('capsLockId').getElementsByTagName('a');

	for(var i=0; i<alphabets.length; i++){
		var ch = alphabets[i];
		 //ch.src = ch.src.replace(".jpg","c.jpg");
		//alert(hfers[i].onclick);
		 bCaps ? ch.src = ch.src.replace(".gif","c.gif") : ch.src = ch.src.replace("c.gif",".gif");
		//break;
	}
}




function getFocusVK(x,lang) {
	fieldObj=document.getElementById(x);
	if(tempVk != lang){
		if(lang=="Hindi"){
			constructKeyboardHindi();
		}else if(lang == "English"){
			constructKeyboard(true);
		}
		else if(lang == "Tamil"){
			constructKeyboardTamil();
		}
		else if(lang == "Marathi"){
			constructKeyboardMarathi();
		}
	}
	tempVk=lang;
	
}





function toggleImages(){
	var display = document.getElementById('normalImagesId').style.display;
	if(display=='none'){
		document.getElementById('normalImagesId').style.display = 'block';
		document.getElementById('shiftImagesId').style.display = 'none';
	}else{
		document.getElementById('shiftImagesId').style.display = 'block';
		document.getElementById('normalImagesId').style.display = 'none';
	}

}

function toggleImagesMarathi(){
	var display = document.getElementById('normalImagesId').style.display;
	if(display=='none'){
		document.getElementById('normalImagesId').style.display = 'block';
		document.getElementById('shiftImagesId').style.display = 'none';
	}else{
		document.getElementById('shiftImagesId').style.display = 'block';
		document.getElementById('normalImagesId').style.display = 'none';
	}

}







Object.prototype.clone = function() { 
	var newObj = (this instanceof Array) ? [] : {};
	for (i in this) {
		if (i == 'clone') continue;
		if (this[i] && typeof this[i] == "object") {
			newObj[i] = this[i].clone();
		} else newObj[i] = this[i]   } 
	return newObj; 
};


function vkClear(){
	fieldObj.value="";
	var encField= document.getElementById(fieldObj.name + 'enc');
	if(encField == null ) {
		encField= document.getElementById(fieldObj.id + 'enc');
	}	 
	encField.value="";
	return true;
}


