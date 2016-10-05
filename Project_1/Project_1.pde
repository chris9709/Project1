
void setup(){
  background(255);
  size(800,500);
  noStroke();
  
  
}
void draw(){
 moon(1);
  mountain();
 
}
void moon(int shape){
  int x, y;
   //sky
  fill(14, 44, 104);
  rect(0,0,800,300);
   //lake
  fill(29, 70 ,134);
  rect(0, 300, 800, 200); 
  stroke(255);
 strokeWeight(1);
 noFill();
 line(0, 300, width, 300);
  // shape: 1 for full moon, 2 for waning moon
  // direction: 1 for facing left and 2 for facing right
  if(mousePressed){
  x = mouseX;
  y = mouseY;
  smooth();
//moon
  fill(255, 252, 254);
  ellipse(x, y, 30, 30);
  if(shape == 2){
    fill(14, 44, 104);
    ellipse( x - 5, y - 3, 25, 25);
    }
//moponlight 
    for(int i = 30; i <= 100; i ++){
    noFill();
    strokeWeight(1);
    stroke( 255 - 2.4*i , 252 - 2.1 * i, 254 - 1.4 * i);
    ellipse(x, y, i, i);
    }}
  } 
void mountain(){
  for(int i = 0; i <= 200; i ++){
    stroke(10, 80);
    line(i, 300, i, 260 + 0.08 * i);
    stroke(10, 180);
  //light on mountain
    stroke(48, 85, 156, 100);
    line(i, 260 + 0.08 * i, i, 270 + 0.06 * i);
    for(int a = 0; a <= 5; a ++){
    stroke(50, 89, 146);
    point(random(0, i), random(260 + 0.08 * i, 270 + 0.06 * i));}}
  for(int i = 200; i <=250; i ++){
    stroke(10, 180);
    line(i, 300, i, 292 - 0.08 * i);}
  for(int i = 250; i <=300; i ++){
    stroke(10, 140);
    line(i, 300, i, 245 + 0.10 * i);}
  for(int i = 300; i <= 400; i ++){
    stroke(10, 140);
    line(i, 300, i, random(275, 277));}
  for(int i = 400; i <= 480; i ++){
    stroke(10, 150);
    line(i, 300, i, 211 + 0.16 * i);}
  for(int i = 480; i <= 520; i ++){
    stroke(10, 90);
    line(i, 300, i, 384 - 0.2 * i);}
  for(int i = 520; i <= 560; i ++){
    stroke(10, 90);
    line(i, 300, i, 175 + 0.2 * i);}
  for(int i = 560; i <= width; i ++){
    stroke(10, 120);
    line(i, 300, i, 309 - 0.04 * i);}
  
  }