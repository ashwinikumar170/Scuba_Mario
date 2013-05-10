
function data(data){
  writeData(data);
}

function putstr(str,font){ // font = 0 > thick font, font = 1 > thin font
  var fontArry = font88thick;
  if(font == 1){
    fontArry = font88thin;
  }
  if(side > 1)
    left()
  for(var i=0; i< str.length;i++){
    for(var j=0; j<8;j++){
      data(fontArry[ascii.indexOf(str.charAt(i))*8+j]);
      if(AC_L == 0 && side == 0){
        right()
        setPage(page_L)
        continue;
      }
      if(AC_R == 0 && side == 1){
        left()
        setPage(page_R + 1)
      }
    }
  }
}

function putDot(x,y){
  var tmpData = 0;
  if(x < 64){
    left()
    setPage(Math.floor(y/8))
    tmpData = DDRAM_L[page_L][x]
    tmpData |= (1 << (y % 8))
    setAdrs(x)
    data(tmpData)
  }
  else{
    right()
    setPage(Math.floor(y/8))
    tmpData = DDRAM_R[page_R][x%64]
    tmpData |= (1 << (y % 8))
    setAdrs(x%64)
    data(tmpData)
  }
}

function drawCircle(xcenter,ycenter,radius){
  var tswitch = 0;
  var y = 0;
  var x = 0;
  var d = 0;

  d = ycenter - xcenter;
  y = radius;
  tswitch = 3 - 2 * radius;
  while (x <= y) {
    putDot(xcenter + x, ycenter + y);
    putDot(xcenter + x, ycenter - y);
    putDot(xcenter - x, ycenter + y);
    putDot(xcenter - x, ycenter - y);
    putDot(ycenter + y - d, ycenter + x); 
    putDot(ycenter + y - d, ycenter - x);
    putDot(ycenter - y - d, ycenter + x);
    putDot(ycenter - y - d, ycenter - x);

    if (tswitch < 0){
      tswitch += (4 * x + 6);
    }
    else{
      tswitch += (4 * (x - y) + 10);
      y--;
    }
    x++;
  }
}

function drawRectangle(x, y, a, b){
  for (var j = 0; j < a; j++) {
    putDot(x, y + j);
    putDot(x + b - 1, y + j);
  }
  for (var j = 0; j < b; j++)   {
    putDot(x + j, y);
    putDot(x + j, y + a - 1);
  }
}

function circleDemo(){
  both()
  on()
  left()
  setAdrs(0)
  setPage(0)
  putstr('Circles:',1)
  for(var i=1; i < 5; i++){
    drawCircle(64,32,i*5)
  }

}

function rectangleDemo(){
  both()
  on()
  left()
  setAdrs(0)
  setPage(0)
  putstr('Rectangles:')

  for(var i=3; i < 10; i+=2){
    drawRectangle(40+i,12+i,i*4,i*4)
  }
}

function showThinFont_1(){
  both();
  on();
  setAdrs(0);
  for(var i=0; i<8; i++){
    left();
    setPage(i);
    for(var j=0; j<64; j++){
      data(font88thin[i*128 + j]);
    }
    right();
    setPage(i);
    for(var j=64; j<128; j++){
      data(font88thin[i*128 + j]);
    }
  }
}

function showThinFont_2(){
  both();
  on();
  setAdrs(0);
  for(var i=0; i<8; i++){
    left();
    setPage(i);
    for(var j=0; j<64; j++){
      data(font88thin[1024 + i*128 + j]);
    }
    right();
    setPage(i);
    for(var j=64; j<128; j++){
      data(font88thin[1024 + i*128 + j]);
    }
  }
}

function showThickFont_1(){
  both();
  on();
  setAdrs(0);
  for(var i=0; i<8; i++){
    left();
    setPage(i);
    for(var j=0; j<64; j++){
      data(font88thick[i*128 + j]);
    }
    right();
    setPage(i);
    for(var j=64; j<128; j++){
      data(font88thick[i*128 + j]);
    }
  }
}

function showThickFont_2(){
  both();
  on();
  setAdrs(0);
  for(var i=0; i<8; i++){
    left();
    setPage(i);
    for(var j=0; j<64; j++){
      data(font88thick[1024 + i*128 + j]);
    }
    right();
    setPage(i);
    for(var j=64; j<128; j++){
      data(font88thick[1024 + i*128 + j]);
    }
  }
}



function on(){ // display on
  instr(63)
}
function off(){ // display off
  instr(62)
}

function left(){
  side = 0
}

function right(){
  side = 1
}

function both(){
  side = 2
}
function setAdrs(address){
   instr(64 + address);
}

function setPage(address){
   instr(184 + address);
}



function scripter(script){
  var funcText = eval(script);
  funcText = funcText.toString();
  document.ctrl.scriptBox.value = funcText.substring(funcText.indexOf('{')+1,funcText.lastIndexOf('}')) ;
}

function image1(){
  both()  // enable both controllers
  on()    // open display
  setAdrs(0) // set address to 0
  for(var page = 0; page < 8; page++){ // page loop
    left()          // left controller enabled
    setPage(page); 
    for (var col = 0; col <= 63; col++) // address loop     
      data(imgData_1[(128*page)+col]); // send data
      
    right();        // right controller enabled
    setPage(page);
    for (var col = 64; col <= 127; col++) // address loop 
      data(imgData_1[(128*page)+col]); // send data   
  }
}

function image2(){
  both()  // enable both controllers
  on()    // open display
  setAdrs(0) // set address to 0
  for(var page = 0; page < 8; page++){ // page loop
    left()          // left controller enabled
    setPage(page); 
    for (var col = 0; col <= 63; col++) // address loop     
      data(imgData_2[(128*page)+col]); // send data
      
    right();        // right controller enabled
    setPage(page);
    for (var col = 64; col <= 127; col++) // address loop 
      data(imgData_2[(128*page)+col]); // send data   
  }
}

function image3(){
  both()  // enable both controllers
  on()    // open display
  setAdrs(0) // set address to 0
  for(var page = 0; page < 8; page++){ // page loop
    left()          // left controller enabled
    setPage(page); 
    for (var col = 0; col <= 63; col++) // address loop     
      data(imgData_3[(128*page)+col]); // send data
      
    right();        // right controller enabled
    setPage(page);
    for (var col = 64; col <= 127; col++) // address loop 
      data(imgData_3[(128*page)+col]); // send data   
  }
}

function clear(){
  both()  // enable both controllers
  on()    // open display
  setAdrs(0) // set address to 0
  for(var page = 0; page < 8; page++){ // page loop
    left()          // left controller enabled
    setPage(page); 
    for (var col = 0; col <= 63; col++) // address loop     
      data(0); // clear column
      
    right();        // right controller enabled
    setPage(page);
    for (var col = 64; col <= 127; col++) // address loop 
      data(0); // clear column
  }
}



function instr(instrc){ 
  if((instrc & maskDispOnOff) == instrDispOnOff){
    if(instrc & displayOn){
      if(side == 0){
        D_L = 1
      }   

      if(side == 1){
        D_R = 1
      }

      if(side == 2){
        D_R = 1
        D_L = 1
      }
      
      restoreDisp();
    }
    else{
      if(side == 0){
        D_L = 0
      }   

      if(side == 1){
        D_R = 0
      }

      if(side == 2){
        D_R = 0
        D_L = 0
      }
      blankDisp();
    }
    return;
  }
  
  if((instrc & maskSetAdrs) == instrSetAdrs){
    if(side == 0){
      AC_L = instrc & 0x3f
    }   

    if(side == 1){
      AC_R = instrc & 0x3f
    }

    if(side == 2){
      AC_L = instrc & 0x3f
      AC_R = instrc & 0x3f
    }
    
    return;
  }
  
  if((instrc & maskSetPage) == instrSetPage){
    if(side == 0){
      page_L = instrc & 0x7
    }   

    if(side == 1){
      page_R = instrc & 0x7
    }

    if(side == 2){
      page_L = instrc & 0x7
      page_R = instrc & 0x7
    }
    return;
  }

  if((instrc & maskDispStrtLn) == instrDispStrtLn){
    return;
  }
  addMsg('\nInvalid instruction !');
  return;

}

