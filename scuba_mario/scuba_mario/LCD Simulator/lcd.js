var DDRAM_L = new Array(8);
var DDRAM_R = new Array(8);

var offset = 3

var AC_L = 0;
var AC_R = 0;
var page_L = 0;
var page_R = 0;
var side = 3

//Display on/off control:
var D_L = 0;   //  Display off
var D_R = 0;   //  Display off

function reset(){
	DDRAM_L = new Array(8);
	DDRAM_R = new Array(8);
	AC_L = 0;
	AC_R = 0;
	page_L = 0;
	page_R = 0;
	side = 3
	for(var i = 0; i < document.images.length; i++){
		if(document.images[i].src.indexOf('0.gif') != -1){
			offset = i
			break;
		}
	}
	document.ctrl.lcdpinsHex.value = 0;
	document.ctrl.lcdpinsDec.value = 0;
	//scriptBoxHelp = document.ctrl.scriptBox.value;

	for(var q=0;q<8;q++){
		DDRAM_L[q]= new Array(64);
		DDRAM_R[q]= new Array(64);
		for(var i=0; i<64; i++){
			DDRAM_L[q][i]= 0;
			DDRAM_R[q][i]= 0;
		}	
	}
	
	document.ctrl.D_L.value = 'OFF';
	document.ctrl.D_R.value = 'OFF';
	document.ctrl.page_L.value = 0;
	document.ctrl.page_R.value = 0;
	document.ctrl.csaState.value = 'NO';
	document.ctrl.csbState.value = 'NO';	
	document.ctrl.csaState.value = 'NO';
	document.ctrl.csbState.value = 'NO';
	document.ctrl.AC_L.value = 0;
	document.ctrl.AC_R.value = 0;


	// alert('reset done !')
}



function lcd(data,eGoLow,rwState,rsState){	
	if(side == 3){
		clearMsgs();
		addMsg('No controller is selected. \n If either CSA or CSB is not active data and control pins are ignored.');
		return;
	}
	if(eGoLow == 1){ // E goes LOW, this is when instructions are evaluated, chars written 
		if(rsState == 0 & rwState == 0){
			//alert('write to IR, \n evaluate instruction')
			evalInstr(data);
		}
		if(rsState == 1 & rwState == 0){
			//alert('write to DR, \n print character')
			writeData(data);		
			instrpeek(baseConv(document.ctrl.lcdpinsHex.value,16));
		}
		return;
	}
	
	if(eGoLow != 1 & rwState == 1){ // E is 1. Data or address reads are done 
		if(rsState == 0 & rwState == 1){
			alert('Read BF & address, \n Reads are not implemented! \n         Yet !');
			if(side == 2){
				alert('Ooops !!! Trying to read while both controllers are enabled ?\n If you do this with a real LCD, data from both controllers may clash\n and your LCD take a trip to heaven.')
			}
		}
		if(rsState == 1 & rwState == 1){
			alert('Read Data Register, \n Reads are not implemented! \n         Yet !');
			if(side == 2){
				alert('Ooops !!! Trying to read while both controllers are enabled ?\n If you do this with a real LCD, data from both controllers may clash\n and your LCD take a trip to heaven.')
			}
		}
		return;
	}
}

function evalInstr(instr){
	clearMsgs();
	addMsg('On E going LOW, executed instruction was:');
	
	if((instr & maskDispOnOff) == instrDispOnOff){
		addMsg('\n Display ON/OFF control: ');
		if(instr & displayOn){
			addMsg('display ON, ');
			if(side == 0){
				addMsg(' left controller');
				D_L = 1;
				document.ctrl.D_L.value = 'ON';
				//alert(document.ctrl.D_L.value)
			}	

			if(side == 1){
				addMsg(' right controller');
				D_R = 1;
				document.ctrl.D_R.value = 'ON';
			}

			if(side == 2){
				addMsg(' both controllers');
				D_R = 1;
				D_L = 1;
				document.ctrl.D_R.value = 'ON';
				document.ctrl.D_L.value = 'ON';
			}
			
			restoreDisp();

			
		}
		else{
			addMsg('display OFF, ');
			if(side == 0){
				addMsg(' left controller');
				D_L = 0;
				document.ctrl.D_L.value = 'OFF';
			}	

			if(side == 1){
				addMsg(' right controller');
				D_R = 0;
				document.ctrl.D_R.value = 'OFF';

			}

			if(side == 2){
				addMsg(' both controllers');
				D_R = 0;
				D_L = 0;
				document.ctrl.D_L.value = 'OFF';
				document.ctrl.D_R.value = 'OFF';
			}
			
			blankDisp();
			
		}
		return;
	}
	
	if((instr & maskSetAdrs) == instrSetAdrs){
		addMsg('\n Set Y address to ' + (instr & 0x3f));
		if(side == 0){
			AC_L = instr & 0x3f
			addMsg(' for left controller');	
			document.ctrl.AC_L.value = AC_L;
		}	

		if(side == 1){
			AC_R = instr & 0x3f
			addMsg(' for right controller');
			document.ctrl.AC_R.value = AC_R;
		}

		if(side == 2){
			AC_L = instr & 0x3f
			AC_R = instr & 0x3f
			addMsg(' for both controllers');
			document.ctrl.AC_L.value = AC_L;
			document.ctrl.AC_R.value = AC_R;
		}	
		return;
	}
	
	if((instr & maskSetPage) == instrSetPage){
		addMsg('\n Set page to ' + (instr & 0x7));
		if(side == 0){
			page_L = instr & 0x7
			addMsg(' for left controller');	
			document.ctrl.page_L.value = page_L;
		}	

		if(side == 1){
			page_R = instr & 0x7
			addMsg(' for right controller');
			document.ctrl.page_R.value = page_R;
		}

		if(side == 2){
			page_L = instr & 0x7
			page_R = instr & 0x7
			addMsg(' for both controllers');
			document.ctrl.page_L.value = page_L;
			document.ctrl.page_R.value = page_R;
		}
		return;
	}

	if((instr & maskDispStrtLn) == instrDispStrtLn){
		addMsg('\n Set display start line to ' + (instr & 0x3f));
		addMsg('\n This instruction is not supported and was not executed. It is used to scroll the display. Scrolling about 2000 images with JavaScript takes a long time...')

		return;
	}

	addMsg('\nInvalid instruction !');
	return;
}

var byts = 0;
var dts = ''
function writeData(data){
	if(side > 2){
		return;
	}
	if(side == 0){
		if(D_L == 1 && DDRAM_L[page_L][AC_L] != data){
			document.images[offset + page_L*256+ AC_L ].src = parseInt(data & 0xf) + xtnsn
			document.images[offset + page_L*256 + AC_L + 128].src = parseInt((data & 0xf0) >> 4) + xtnsn
			dts += 'DDR > ' + DDRAM_L[page_L][AC_L] + ', data > '+ data
			byts++
		}
		DDRAM_L[page_L][AC_L] = data;
		increaseAC(side)
	}
	
	if(side == 1){
		if(D_R == 1 && DDRAM_R[page_R][AC_R] != data){
			document.images[offset + page_R*256+ AC_R + 64].src = parseInt(data & 0xf) + xtnsn
			document.images[offset + page_R*256 + AC_R + 192].src = parseInt((data & 0xf0) >> 4) + xtnsn
		}
		DDRAM_R[page_R][AC_R] = data;
		increaseAC(side)
	}

	if(side == 2){
		if(D_R == 1 && DDRAM_R[page_R][AC_R] != data){
			document.images[offset + page_R*256+ AC_R + 64].src = parseInt(data & 0xf) + xtnsn
			document.images[offset + page_R*256 + AC_R + 192].src = parseInt((data & 0xf0) >> 4) + xtnsn
		}
		if(D_L == 1 && DDRAM_L[page_L][AC_L] != data){
			document.images[offset + page_L*256+ AC_L ].src = parseInt(data & 0xf) + xtnsn
			document.images[offset + page_L*256 + AC_L + 128].src = parseInt((data & 0xf0) >> 4) + xtnsn
		}
		DDRAM_R[page_R][AC_R] = data;
		DDRAM_L[page_L][AC_L] = data;
		increaseAC(side)
	}

}

function readBfAndAdr(){

}

function readDataReg(){

}


var dispBlanked_L = 0;
var dispBlanked_R = 0;
function blankDisp(){
	if(side == 0){
		for(var i=0; i< 8; i++){
			for(var j=0; j < 64; j++){
				if(DDRAM_L[i][j] != 0 ){
					document.images[offset + i*256 + j ].src='0' + xtnsn;
					document.images[offset + i*256 + j + 128].src='0' + xtnsn;
				}
			}
		}
		dispBlanked_L = 1;
	}
	
	if(side == 1){
		for(var i=0; i < 8; i++){
			for(var j=0; j < 64; j++){
				if(DDRAM_R[i][j] != 0 ){
					document.images[offset + i*256 + j + 64 ].src='0' + xtnsn;
					document.images[offset + i*256 + j + 192].src='0' + xtnsn;
				}
			}
		}
		dispBlanked_R = 1;
	}	
	
	if(side == 2){
		for(var i=0; i< 8; i++){
			for(var j=0; j < 64; j++){
				if(DDRAM_L[i][j] != 0 ){
					document.images[offset + i*256 + j ].src='0' + xtnsn;
					document.images[offset + i*256 + j + 128].src='0' + xtnsn;
				}
			}
		}

		for(var i=0; i < 8; i++){
			for(var j=0; j < 64; j++){
				if(DDRAM_R[i][j] != 0 ){
					document.images[offset + i*256 + j + 64 ].src='0' + xtnsn;
					document.images[offset + i*256 + j + 192].src='0' + xtnsn;
				}
			}
		}
		dispBlanked_L = 1;
		dispBlanked_R = 1;
		
	}
}

function restoreDisp(){
	if(side == 0 && dispBlanked_L == 1){
		for(var i=0; i< 8; i++){
			for(var j=0; j < 64; j++){
				if(DDRAM_L[i][j] != 0 ){
					document.images[offset + i*256 + j ].src = parseInt(DDRAM_L[i][j] & 0xf) + xtnsn;
					document.images[offset + i*256 + j + 128].src = parseInt((DDRAM_L[i][j] & 0xf0) >> 4) + xtnsn;
				}
			}
		}
		dispBlanked_L = 0
	}
	
	if(side == 1 && dispBlanked_R == 1){
		for(var i=0; i < 8; i++){
			for(var j=0; j < 64; j++){
				if(DDRAM_R[i][j] != 0 ){
					document.images[offset + i*256 + j + 64].src = parseInt(DDRAM_R[i][j] & 0xf) + xtnsn
					document.images[offset + i*256 + j + 192].src = parseInt((DDRAM_R[i][j] & 0xf0) >> 4) + xtnsn
				}
			}
		}
		dispBlanked_R = 0
	}	
	
	if(side == 2){
		if(dispBlanked_L == 1){
			for(var i=0; i< 8; i++){
				for(var j=0; j < 64; j++){
					if(DDRAM_L[i][j] != 0 ){
						document.images[offset + i*256 + j ].src = parseInt(DDRAM_L[i][j] & 0xf) + xtnsn
						document.images[offset + i*256 + j + 128].src = parseInt((DDRAM_L[i][j] & 0xf0) >> 4) + xtnsn
					}
				}
			}
		}
		
		if(dispBlanked_R == 1){
			for(var i=0; i < 8; i++){
				for(var j=0; j < 64; j++){
					if(DDRAM_R[i][j] != 0 ){
						document.images[offset + i*256 + j +64].src = parseInt(DDRAM_R[i][j] & 0xf) + xtnsn
						document.images[offset + i*256 + j + 192].src = parseInt((DDRAM_R[i][j] & 0xf0) >> 4) + xtnsn
					}
				}
			}
		}
		
		dispBlanked_L = 0
		dispBlanked_R = 0

	}
}


function increaseAC(side){ // side == 1 >>> left controller, 1 reight controller, 2 both controllers
	if(side == 0){
		AC_L += 1
		if(AC_L > 63){AC_L = 0}
	}
	if(side == 1){
		AC_R += 1
		if(AC_R > 63){AC_R = 0}
	
	}
	 if(side == 2){
		AC_L += 1
		if(AC_L > 63){AC_L = 0}
		
		AC_R += 1
		if(AC_R > 63){AC_R = 0}
	}
	document.ctrl.AC_L.value = AC_L;
	document.ctrl.AC_R.value = AC_R;

}

