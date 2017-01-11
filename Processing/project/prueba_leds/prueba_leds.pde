import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

int ledPin=13;
int i = 0, j = 0, contLetra = 0;
long tiempo;
boolean[][] leds = new boolean[40][10];
String texto = "";

boolean led = false;

void setup(){
  size(1200,400);
  background(#9BDDFF);
  for(int i = 0; i < 40; i++){
    for(int j = 0; j < 10; j++){
      leds[i][j] = false;
    }
  }
  tiempo = millis();
}

void draw(){
  //quad(20,20,width-20,20,width-20,height-20,20,height-20); //Dibuja un cuadrado
  fill(#ffffff); //Color del relleno
  stroke(0); //Color de la linea de contorno
  rect(50,315,995,30);
  line(80,20,200,20); //Dibuja una linea
  strokeWeight(20);
  point(60,20); //Dibujar un punto
  fill(#ffffff);
  strokeWeight(1);
  while(j<10){
    while(i < 40){
      rect(50 + (i * 25), 50 + (j * 25),20,20,20);
      i++;
    }
    i = 0;
    j++;
  }
  if(mousePressed){
    if(mouseX >= 50 && mouseX <= 70 && mouseY >= 50 && mouseY <= 70 && millis() - tiempo > 200){
      if(leds[0][0]){
        fill(#FFFFFF);
        rect(50, 50, 20, 20, 20);
        leds[0][0] = false;
        tiempo = millis();
      }else{
        fill(#0900FF);
        rect(50, 50, 20, 20, 20);
        leds[0][0] = true;
        tiempo = millis();
      }
    }
  }
  fill(#000000);
  textSize(25);
  text(texto,55,340);
}



void keyPressed(){
  if(contLetra < 6){
    if(key >='A' && key <= 'Z'){
      texto += key;
      imprimirLetra(key);
      contLetra++;
    }else if(key == 'B'){
      texto += key;
      imprimirLetra(key);
      contLetra++;
    }
  }
  println(texto);
}

void imprimirLetra(char letra){
  if(letra == 'A'){
    dibujarFila(0,5);
    dibujarFila(5,5);
    dibujarCol(0,10);
    dibujarCol(4,10);
  }else if(letra == 'B'){
    dibujarFila(0,5);
    dibujarFila(5,5);
    dibujarFila(9,5);
    dibujarCol(0,10);
    dibujarCol(4,10);
  }else if(letra == 'C'){
    dibujarFila(0,5);
    dibujarFila(9,5);
    dibujarCol(0,10);
  }else if(letra == 'D'){
    dibujarFila(0,4);
    dibujarFila(9,4);
    dibujarCol(0,10);
    dibujarCol(4,9);
  }else if(letra == 'E'){
    dibujarFila(0,4);
    dibujarFila(5,4);
    dibujarFila(9,4);
    dibujarCol(0,10);
  }else if(letra == 'F'){
    dibujarFila(0,4);
    dibujarFila(5,3);
    dibujarCol(0,10);
  }else if(letra == 'G'){
    dibujarFila(0,5);
    dibujarFila(9,4);
    dibujarCol(0,10);
    dibujarCol(4,2);
    dibujarLed((contLetra * 6)+2,5);
    dibujarLed((contLetra * 6)+3,5);
    dibujarLed((contLetra * 6)+4,5);
    dibujarLed((contLetra * 6)+4,6);
    dibujarLed((contLetra * 6)+4,7);
    dibujarLed((contLetra * 6)+4,8);
  }else if(letra == 'H'){
    dibujarFila(5,4);
    dibujarCol(0,10);
    dibujarCol(4,10);
  }else if(letra == 'I'){
    dibujarFila(0,5);
    dibujarFila(9,5);
    dibujarCol(2,10);
  }else if(letra == 'J'){
    dibujarFila(0,5);
    dibujarFila(9,2);
    dibujarCol(2,10);
  }
  else if(letra == 'K'){
    dibujarCol(0,10);
    dibujarCol(4,4);
    dibujarFila(5,3);
    dibujarLed((contLetra * 6)+3,4);
    dibujarLed((contLetra * 6)+3,6);
    dibujarLed((contLetra * 6)+4,7);
    dibujarLed((contLetra * 6)+4,8);
    dibujarLed((contLetra * 6)+4,9);
  }else if(letra == 'L'){
    dibujarFila(9,5);
    dibujarCol(0,10);
  }else if(letra == 'M'){
    dibujarCol(0,10);
    dibujarCol(4,10);
    dibujarLed((contLetra * 6)+1,1);
    dibujarLed((contLetra * 6)+2,2);
    dibujarLed((contLetra * 6)+3,1);
  }else if(letra == 'N'){
    dibujarCol(0,10);
    dibujarCol(4,10);
    dibujarLed((contLetra * 6)+1,1);
    dibujarLed((contLetra * 6)+1,2);
    dibujarLed((contLetra * 6)+1,3);
    dibujarLed((contLetra * 6)+2,3);
    dibujarLed((contLetra * 6)+2,4);
    dibujarLed((contLetra * 6)+2,5);
    dibujarLed((contLetra * 6)+2,6);
    dibujarLed((contLetra * 6)+3,6);
    dibujarLed((contLetra * 6)+3,7);
    dibujarLed((contLetra * 6)+3,8);
  }else if(letra == 'O'){
    dibujarFila(0,5);
    dibujarFila(9,2);
    dibujarCol(0,10);
    dibujarCol(4,10);
  }else if(letra == 'P'){
    dibujarFila(0,4);
    dibujarFila(4,4);
    dibujarCol(0,10);
    dibujarCol(4,5);
  }else if(letra == 'Q'){
    dibujarFila(0,4);
    dibujarFila(8,4);
    dibujarCol(0,9);
    dibujarCol(3,9);
    dibujarLed((contLetra * 6)+2,7);
    dibujarLed((contLetra * 6)+4,9);
  }else if(letra == 'R'){
    dibujarFila(0,4);
    dibujarFila(4,4);
    dibujarCol(0,10);
    dibujarCol(4,5);
    dibujarLed((contLetra * 6)+2,5);
    dibujarLed((contLetra * 6)+3,6);
    dibujarLed((contLetra * 6)+4,7);
    dibujarLed((contLetra * 6)+4,8);
    dibujarLed((contLetra * 6)+4,9);
  }else if(letra == 'S'){
    dibujarFila(0,5);
    dibujarFila(4,5);
    dibujarFila(9,5);
    dibujarCol(0,4);
    dibujarLed((contLetra * 6)+4,5);
    dibujarLed((contLetra * 6)+4,6);
    dibujarLed((contLetra * 6)+4,7);
    dibujarLed((contLetra * 6)+4,8);
  }else if(letra == 'T'){
    dibujarFila(0,5);
    dibujarCol(2,10);
  }else if(letra == 'U'){
    dibujarFila(9,5);
    dibujarCol(0,10);
    dibujarCol(4,10);
  }else if(letra == 'V'){
    dibujarCol(0,7);
    dibujarCol(4,7);
    dibujarLed((contLetra * 6)+1,7);
    dibujarLed((contLetra * 6)+2,9);
    dibujarLed((contLetra * 6)+3,7);
  }else if(letra == 'W'){
    dibujarCol(0,9);
    dibujarCol(4,9);
    dibujarLed((contLetra * 6)+1,9);
    dibujarLed((contLetra * 6)+2,8);
    dibujarLed((contLetra * 6)+2,7);
    dibujarLed((contLetra * 6)+3,9);
  }else if(letra == 'X'){
    dibujarCol(0,3);
    dibujarCol(4,3);
    dibujarLed((contLetra * 6)+3,3);
    dibujarLed((contLetra * 6)+1,3);
    dibujarLed((contLetra * 6)+2,4);
    dibujarLed((contLetra * 6)+3,5);
    dibujarLed((contLetra * 6)+4,6);
    dibujarLed((contLetra * 6)+1,5);
    dibujarLed((contLetra * 6)+0,6);
    dibujarLed((contLetra * 6)+0,7);
    dibujarLed((contLetra * 6)+0,8);
    dibujarLed((contLetra * 6)+0,9);
    dibujarLed((contLetra * 6)+4,6);
    dibujarLed((contLetra * 6)+4,7);
    dibujarLed((contLetra * 6)+4,8);
    dibujarLed((contLetra * 6)+4,9);
  }else if(letra == 'Y'){
    dibujarCol(0,3);
    dibujarCol(4,3);
    dibujarLed((contLetra * 6)+3,3);
    dibujarLed((contLetra * 6)+1,3);
    dibujarLed((contLetra * 6)+2,4);
    dibujarLed((contLetra * 6)+2,5);
    dibujarLed((contLetra * 6)+2,6);
    dibujarLed((contLetra * 6)+2,7);
    dibujarLed((contLetra * 6)+2,8);
    dibujarLed((contLetra * 6)+2,9);
  }else if(letra == 'Z'){
    dibujarFila(0,5);
    dibujarFila(9,5);
    dibujarLed((contLetra * 6)+4,1);
    dibujarLed((contLetra * 6)+4,2);
    dibujarLed((contLetra * 6)+4,3);
    dibujarLed((contLetra * 6)+0,8);
    dibujarLed((contLetra * 6)+0,7);
    dibujarLed((contLetra * 6)+1,6);
    dibujarLed((contLetra * 6)+2,5);
    dibujarLed((contLetra * 6)+3,4);
  }
  
}

void dibujarLed(int x, int y){
  fill(#0900FF);
  rect(50 + (x * 25), 50 + (y * 25), 20, 20, 20);
  leds[x][y] = true;
}

void dibujarFila(int origen, int tam){
  int x = 0 + (contLetra * 6);
  fill(#0900FF);
  while(x < tam + (contLetra * 6)){
    dibujarLed(x,origen);
    x++;
  } 
}

void dibujarCol(int origen, int tam){
  int y = 0;
  fill(#0900FF);
  while(y < tam){
    dibujarLed(origen  + (contLetra * 6),y);
    y++;
  } 
}