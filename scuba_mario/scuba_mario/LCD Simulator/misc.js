// preload all imgs
pix0  = new Image();
pix1  = new Image();
pix2  = new Image();
pix3  = new Image();
pix4  = new Image();
pix5  = new Image();
pix6  = new Image();
pix7  = new Image();
pix8  = new Image();
pix9  = new Image();
pix10 = new Image();
pix11 = new Image();
pix12 = new Image();
pix13 = new Image();
pix14 = new Image();
pix15 = new Image();

pix0a  = new Image();
pix1a  = new Image();
pix2a  = new Image();
pix3a  = new Image();
pix4a  = new Image();
pix5a  = new Image();
pix6a  = new Image();
pix7a  = new Image();
pix8a  = new Image();
pix9a  = new Image();
pix10a = new Image();
pix11a = new Image();
pix12a = new Image();
pix13a = new Image();
pix14a = new Image();
pix15a = new Image();

b1 = new Image();
b2 = new Image();
b3 = new Image();
b4 = new Image();
b5 = new Image();
b6 = new Image();
b7 = new Image();
b8 = new Image();
b9 = new Image();
b1.src = "b0d.gif";
b2.src = "b1u.gif";
b3.src = "b0gd.gif";
b4.src = "b0gu.gif";
b5.src = "b0u.gif";
b6.src = "b1d.gif";
b7.src = "b1gd.gif";
b8.src = "b1gu.gif";
b9.src = "b1t.gif"		   

pix0.src  = "0.gif";
pix1.src  = "1.gif";
pix2.src  = "2.gif";
pix3.src  = "3.gif";
pix4.src  = "4.gif";
pix5.src  = "5.gif";
pix6.src  = "6.gif";
pix7.src  = "7.gif";
pix8.src  = "8.gif";
pix9.src  = "9.gif";
pix10.src = "10.gif";
pix11.src = "11.gif";
pix12.src = "12.gif";
pix13.src = "13.gif";
pix14.src = "14.gif";
pix15.src = "15.gif";

pix0a.src  = "0a.gif";
pix1a.src  = "1a.gif";
pix2a.src  = "2a.gif";
pix3a.src  = "3a.gif";
pix4a.src  = "4a.gif";
pix5a.src  = "5a.gif";
pix6a.src  = "6a.gif";
pix7a.src  = "7a.gif";
pix8a.src  = "8a.gif";
pix9a.src  = "9a.gif";
pix10a.src = "10a.gif";
pix11a.src = "11a.gif";
pix12a.src = "12a.gif";
pix13a.src = "13a.gif";
pix14a.src = "14a.gif";
pix15a.src = "15a.gif";

function evaluator() {
	window.status = 'Please wait while executing the script.'
	clearMsgs();
	addMsg('Running scripted instruction. \n No tips for scripted instructions.');
  	eval(document.ctrl.scriptBox.value);
	window.status = 'Script executed.'

}

function Evaluator() {
	window.status = 'Please wait while executing the script.'
  	document.debug.evalOut.value = eval(document.debug.evaluator.value);
	window.status = 'Script executed.'

}


function togImage(imgName) {
	var newVal=0
	var pixState = document[imgName].src.charAt((document[imgName].src.length) - 6)
	//alert(document[imgName].src.charAt((document[imgName].src.length) - 6))
	if (pixState == "0") { 
		document[imgName].src = 'b1u.gif'
	}
	else{ 
		document[imgName].src = 'b0u.gif'
	}
	
	for(i=0;i<8;i++){
		pixState = document['d'+i].src.charAt((document['d'+i].src.length) - 6)
		if(pixState == 1){
			newVal += Math.pow(2,i)
		}
	} 
	
	//alert(newVal)
	document.pupnib.src = ((newVal & 0xf0) >> 4) + xtnsn
	document.plownib.src = (newVal & 0xf) + xtnsn
	
	document.ctrl.lcdpinsHex.value = baseDisp(newVal,16)
	document.ctrl.lcdpinsDec.value = baseDisp(newVal,10)
	instrpeek(newVal)
}

function inpChanged(box){
	var tmpVal = 0;
	
	if(box == 'hex'){
		tmpVal = baseConv(document.ctrl.lcdpinsHex.value,16);
		document.ctrl.lcdpinsDec.value = baseDisp(tmpVal,10)
	}
	else{
		tmpVal = baseConv(document.ctrl.lcdpinsDec.value,10);	
		document.ctrl.lcdpinsHex.value = baseDisp(tmpVal,16)
	}
	
	if(tmpVal > 0xff){
		alert('input too big !')
		tmpVal = 0 //reset tmpVal
		document.ctrl.lcdpinsHex.value = tmpVal
		document.ctrl.lcdpinsDec.value = tmpVal
	}	
		
	var binValStr = baseDisp(tmpVal,2);
	var DataLen = 8
	for(var i=7;i >= 0;i--){
		if(i > binValStr.length-1){
			document['d'+i].src = 'b0u.gif';
		}
		else{
			document['d'+i].src = 'b'+ binValStr.charAt(binValStr.length -1 -i) +'u.gif';
		}
	}
		
	instrpeek(tmpVal)
}


var rwState = 0
var rsState = 0
var eState  = 0
var csaState = 0
var csbState = 0

function togImageC(imgName) {
	var pixState = document[imgName].src.charAt((document[imgName].src.length) - 7)
	if (pixState == "0") { 
		document[imgName].src = 'b1gu.gif'
	}
	else { 
		document[imgName].src = 'b0gu.gif'
	}
	rwState = document.rw.src.charAt((document[imgName].src.length) - 7)
	rsState = document.rs.src.charAt((document[imgName].src.length) - 7)
	eState  = document.e.src.charAt((document[imgName].src.length) - 7)
	csaState  = document.csa.src.charAt((document[imgName].src.length) - 7)
	csbState  = document.csb.src.charAt((document[imgName].src.length) - 7)
	
	
	var statusMsg = ''
	if(rsState == 1 & rwState == 1)
		statusMsg = 'read DR'
	else if (rsState == 1 & rwState == 0)
		statusMsg = 'write to DR'
	else if (rsState == 0 & rwState == 0)
		statusMsg = 'write to IR'
	else if (rsState == 0 & rwState == 1)
		statusMsg = 'status read'
		
	
	
	if (eState == 1){
		statusMsg = 'Enabled, ' + statusMsg
		lcd(parseInt(document.ctrl.lcdpinsHex.value,16), 0, rwState, rsState)
	}
	else{
		statusMsg = 'Disabled, ' + statusMsg
		if(imgName == 'e'){
			lcd(parseInt(document.ctrl.lcdpinsHex.value,16), 1,rwState, rsState)
		}
	}
	
	
	if(csaState == 0 && csbState == 0){
		statusMsg += ', both sides'
		side = 2
		document.ctrl.csaState.value = 'YES';
		document.ctrl.csbState.value = 'YES';
	}
	else{
		if(csaState == 1 && csbState == 1){
			statusMsg = ' Both controllers disabled.'
			side = 3 // means both disabled
			document.ctrl.csaState.value = 'NO';
			document.ctrl.csbState.value = 'NO';
			
		}
		
		if(csaState == 0 && csbState == 1){
			statusMsg += ', left side'
			side = 0
			document.ctrl.csaState.value = 'YES';
			document.ctrl.csbState.value = 'NO';
		}
		
		if(csaState == 1 && csbState == 0){
			statusMsg += ', right side'
			side = 1
			document.ctrl.csaState.value = 'NO';
			document.ctrl.csbState.value = 'YES';
			
		}

	}
	
	if(imgName == 'rs'){
		instrpeek(baseConv(document.ctrl.lcdpinsHex.value,16))
	}
	
	document.ctrl.ctrlpins.value = statusMsg
	//instrpeek(baseConv(document.ctrl.lcdpinsHex.value,16))
	//alert(rwState+' '+rsState+' '+eState)
}


function baseDisp(v,bn) // value, base. returns tring s representing value in given base
{
	var digitString = "0123456789ABCDEF";
	var s = ""; // string to return
	s = digitString.charAt(v % bn) + s; //this is DO and below is WHILE
	v = Math.floor(v/bn);				//JavaScript1.1 does not have DO WHILE loops !!!!!!!!!
	while(v)
	{
		s = digitString.charAt(v % bn) + s;
		v = Math.floor(v/bn);
	}

	return s;
}

function baseConv(s,b) // string, base
{
	var digitString = "0123456789abcdef";
	var v = 0; // value to return
	s = s.toLowerCase();
	for(var i = 0; i < s.length; i++) {
		v = v * b;
		var c = s.charAt(i);
		var d = digitString.indexOf(c);
		if((d != -1) && (d < b)) {
			v += d;
		}
		else {

			v = 'error'; //string is not of the correct base
			break;
		}
	}
	return v; //return the value of the string in base 10
}


function addMsg(str)
{
  document.ctrl.outpMsgs.value += str;
}

function clearMsgs(){
	document.ctrl.outpMsgs.value = ''
}

function  statBar(str){
	window.status = str;
}

function instrpeek(instr){
	//alert(rsState)
	if(rwState == 1){
		clearMsgs();
		return;
	}
	
	clearMsgs();
	
	
	if(rsState == 1){
		addMsg('D/I is 1, data is: ' +  baseConv(document.ctrl.lcdpinsHex.value,16))
		if(side == 0){
			addMsg('\n If written, data will go to: ')
			addMsg('\n left controller >' + ' address: ' + AC_L + ', page:'+ page_L);
		}	

		if(side == 1){
			addMsg('\n If written, data will go to: ')
			addMsg('\n right controller >' + ' address: ' + AC_R + ', page:'+ page_R);
		}

		if(side == 2){
			addMsg('\n If written, data will go to both controllers: ')
			addMsg('\n the left one >' + ' address: ' + AC_L + ', page:'+ page_L);
			addMsg('\n the right one >' + ' address: ' + AC_R + ', page:'+ page_R);
		}
		return;
	}
	
	addMsg('D/I is 0, the instruction is: ')
	
	if((instr & maskDispOnOff) == instrDispOnOff){
		addMsg('\n Display ON/OFF control: ')
		if(instr & displayOn){
			addMsg('display ON, ')
		}
		else{
			addMsg('display OFF, ')
		}
		return
	}
	
	if((instr & maskSetAdrs) == instrSetAdrs){
		addMsg('\n Set Y address to ' + (instr & 0x3f));
		return;
	}
	
	if((instr & maskSetPage) == instrSetPage){
		addMsg('\n Set page to ' + (instr & 0x7));
		return;
	}

	if((instr & maskDispStrtLn) == instrDispStrtLn){
		addMsg('\n Set display start line to ' + (instr & 0x3f));
		addMsg('\n This instruction is not supported. It is used to scroll the display. Scrolling about 2000 images with JavaScript takes a long time...')
		return;
	}

	
	addMsg('This is not a valid instruction !'
		+'\nAvailable instructions are:'
		+'\n  Display ON/OFF control: 62 OFF, 63 ON '
		+'\n  Set address: 64 + address '
		+'\n  Set page: 184 + page'
		+'\n\nUnsupported:'
		+'\n  Set display start line: 192 + startLine');
}

var pixType = 0;
var xtnsn = '.gif'
function changePixelType(){
	if(pixType == 0){
		xtnsn = 'a.gif'
		for(var i = offset; i < offset+2048; i++){
			document.images[i].src = document.images[i].src.substring(0,(document.images[i].src.indexOf('.')-pixType))+ xtnsn;
		}
		pixType = 1;
	}
	else{
		xtnsn = '.gif'
		for(var i = offset; i < offset+2048; i++){
			document.images[i].src = document.images[i].src.substring(0,(document.images[i].src.indexOf('.')-pixType))+ xtnsn;
		}
		pixType = 0;
	}	
}

function changeLook(){
	changePixelType(); // replace pixel bitmaps
}



/******************* instructions *************************/
/**********************************************************/
	// LCD Command "Display ON/OFF" = 0 0 1 1 1 1 1 L/H   L=OFF H=ON
	var instrDispOnOff  = 0x3e;
	var maskDispOnOff = 0xFE;
	
	var displayOn  = 0x1


	//LCD Command "Set address" = 0 1 a a a a a a
	var instrSetAdrs  = 0x40;
	var maskSetAdrs = 0xc0;

	// LCD Command "Set page" =   1 0 1 1 1 p p p
	var instrSetPage   = 0xB8;     // LCD Command "Function Set"
	var maskSetPage  = 0xF8;     // 

	// LCD Command "Display Start Line" = 1 1 s s s s s s 
	var instrDispStrtLn = 0xc0;   // LCD Command "Cursor Display"
	var maskDispStrtLn  = 0xc0;   // 
	

/**********************************************************/
/****************** instructions end **********************/
