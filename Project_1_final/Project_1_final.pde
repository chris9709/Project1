
  boolean moo = true;  //control when the night begins at
  float x, y;    //control the process
  boolean mou = true;  // draw mountain only once
  float [] h = new float[101]; // the height of mountain
  float rm = 0;  //the color of moon
  float gm = 0;
  float bm = 0;
  float r = 0;   //the color of lake
  float g = 0;
  float b = 0;
  float transx = -1.24;  // the speed we translate
  float transy = -0.66;
  boolean trans = false; // the beginning of zoom in
  float time = 0; //the time of zoom in
  boolean moonstop = false; // the moon sets
 
  
 void setup(){
   background(255);
  size(800,500);
  fill(56, 52, 126);
  rect(0, 0, width, 300);
   
 }
  void draw(){
   
     frameRate = 1;
     if( x > 790){
       trans = true;}
       if(trans){
         if(time <= 300){
         time ++;}}


   translate(transx * time, transy * time);
  
   

  if(moo){
    if(mousePressed){
  x = mouseX;
  moo = false;}} // begin drawing when press the mouse
if(!moo){
  y = sq(x - 400) * 3/1600 ;
  
 moon(1);}
//move
if(x <= 800){
   x+= 2; 
   }

   sun();
   lake();
   mountain();
   if(!moo){
     pushMatrix();
      translate(640, 350);
      scale(1 + 0.04*time);
   boat();
 popMatrix();}
    
   
   if(key == '1'){ //restart by pressing key "1" then pressing any other key
     moo = true;}
   if(x >= 800){
     moonstop = true;}
  }

   
  //everything should have a changing color due to the moon and the sun
   void boat(){
   //hull
   noStroke();
   fill(116, 68, 6);
   if(x <= 650){
     fill(r, g, b);}
     if(( x > 650)&&(x <= 725)){
       fill(r - (x - 650) * (r - 116) / 75, g - (x - 650) * (g - 68) / 75, b - (x - 650) * (b - 6) / 75);}
   quad(-10, 0, 10, 0, 5, 4, -5, 4);
   
   //mast
   strokeWeight(2);
   stroke(116, 68, 6);
   if( x <= 650){
     stroke(r, g, b);}
     if(( x > 650)&&(x <= 725)){
       stroke(r - (x - 650) * (r - 116) / 75, g - (x - 650) * (g - 68) / 75, b - (x - 650) * (b - 6) / 75);}
   line(5, 0, 5, -9);
   
   //flag
   noStroke();
   noFill();
   if((400 <= x) && (x < 725)){
     fill(255, 255 - 255/ 325 * (x - 400));
   }
   if(x >=725){
     fill(255);}
   triangle(4, -10, -2, -7.5, 4, -5);
   }

  
  void moon(int shape){
    
  //sky
  noStroke();
  if( x <= 400){
    rm = 56 - 0.13 * x;
    gm = 52 - 0.09 * x;
    bm = 126 - 0.15 * x;}
  if(( x > 400)&&(x <= 800)){
    rm = 14 + 0.39 * ( x - 400);
    gm = 16 + 0.46 * ( x - 400);
    bm = 67 + 0.45 * ( x - 400);}
    fill(rm, gm, bm);
  rect(0,0,800,300);
   
       
  // shape: 1 for full moon, 2 for waning moon
  // direction: 1 for facing left and 2 for facing right
  smooth();
  if(!moonstop){
//moon
  fill(255, 252, 254);
  ellipse(x, y, 30, 30);
  if(shape == 2){
    fill(rm, gm, bm);
    ellipse( x - 5, y - 3, 25, 25);
    }
//moonlight 
    float i = 100 - y / 6;
    for(int a = 0; a <= i; a ++){
    noFill();
    strokeWeight(1);
    stroke( 255 - a * ( 255 - rm)/i , 252 - a * ( 252 - gm)/i, 254 - a * ( 254 - bm)/i);
    ellipse(x, y, a, a);
    }
  }  
  }
  void lake(){
    
    strokeWeight(3);
    stroke(255);
    line(0, 300, width, 300);
    noStroke();
    //befor midnight
    if( x <= 400){
      r = 48 - 0.05 * x;
      g = 46 + 0.06 * x;
      b = 83 + 0.15 * x;}
      //midnight to daylight
    if(( x > 400)&&(x <= 650)){
      r = 29 + 0.14 * (x - 400);
      g = 70 + 0.07 * (x - 400);
      b = 134 - 0.04 * (x - 400);}
     fill( r, g, b);
     rect(0, 300, width, 200);
     //the sun rises
     if(x > 650){
       float z = x - 650;
       noFill();
       strokeWeight(1);
       for( int s = 300; s <= height; s ++ ){
         int sc = s - 300;
         if( sc <= 20){
           stroke( 64 + z * (148 - 1.25 * sc - 64 ) / 150, 88 + z * (153 - 1.3 * sc - 88 ) / 150, 124 + z * ( 157 - 0.95 * sc - 124 ) / 150);
           line(0, s, 20000, s);}
         if ((sc > 20)&&(sc <= 100)){
           int sc1 = sc - 20;
           stroke( 64 + z * (123 - 1.55 / 4 * sc1 - 64 ) / 150, 88 + z * (127 - 1.1 / 4 * sc1 - 88 ) / 150, 124 + z * ( 138 - 1.2 /4* sc1 - 124 ) / 150);
           line(0, s, 20000, s);}
         if ((sc > 100)&&(sc <= 200)){
           int sc2 = sc - 100;
           stroke( 64 + z * (92 - 0.48 * sc2 - 64 ) / 150, 88 + z * (105 - 0.205 * sc2 - 88 ) / 150, 124 + z * ( 124 - 0.185 * sc2 - 124 ) / 150);
           line(0, s, 20000, s);}
           
            }}
        
          
         }
      
    void mountain(){
  for(int i = 0; i <= 200; i ++){
    strokeWeight(1);
    stroke(30);
    if(x > 600){
    stroke(30 + 0.485 * ( x - 600), 30 + 0.545 * ( x - 600), 30 + 0.625 * ( x - 600));}
    line(i, 300, i, 260 + 0.08 * i);
    stroke(10, 180);
  //light on mountain
    stroke(48, 85, 156, 100);
    line(i, 260 + 0.08 * i, i, 270 + 0.06 * i);}
  for(int i = 200; i <=250; i ++){
    stroke(10, 180);
    line(i, 300, i, 292 - 0.08 * i);}  
  for(int i = 250; i <=300; i ++){
    stroke(10, 140); 
    line(i, 300, i, 245 + 0.10 * i);} 
    for(int i = 300; i <= 400; i += 5){  
      if(mou){
      for(int ii = 0; ii <= 100; ii ++){      
    h[ii] = random(275, 280);
    mou = false;}}
      strokeWeight(5);
    stroke(10, 140);
    line(i, 300, i, h[i - 300]);}
  for(int i = 400; i <= 480; i ++){
    strokeWeight(1);
     stroke(10, 150);
     if( x > 600){
       stroke( (x - 580 ) / 2, 150);}
    line(i, 300, i, 211 + 0.16 * i);}
  for(int i = 480; i <= 520; i ++){
    stroke(10, 90);
    if( x > 600){
       stroke( (x - 580 ) / 2, 90);}
    line(i, 300, i, 384 - 0.2 * i);} 
  for(int i = 520; i <= 560; i ++){
    stroke(10, 90);
    if( x > 600){
       stroke( (x - 580 ) / 2, 90);}
    line(i, 300, i, 175 + 0.2 * i);}
  for(int i = 560; i <= 20000; i ++){
    stroke(10, 120);
    if( x > 600){
       stroke( (x - 580 ) / 2, 120);}
    line(i, 300, i, 309 - 0.04 * i);}
      }
      
      void sun(){
        float sunx = 0.3 * (x - 650);
        float suny = 300 - 0.3 * (x - 650);
        strokeWeight(1);
        stroke(0);
        if(x >= 650){ // control the time when sun rises
        for(int i = 0; i <= 120; i ++){
        noFill();
        //sunlight
          if((i > 50)&&(i <=80)){
         noFill();
         stroke(254  , 219 + ( i + 50 ) * 36 / 30, 129 + ( i + 50 ) * 4.2);
         ellipse(sunx, suny, i, i);
       }
       if(i <= 120){
      stroke(255 - (i-80) * (255-170)/40, 255 - (i-80) * (255-200)/40, 255 - (i-80) * (255-247)/40);
       ellipse(sunx, suny, 2 * i, i);}
       
     noStroke();
          fill(255, 253, 167);
        ellipse(sunx, suny, 50, 50);
       }}
     }