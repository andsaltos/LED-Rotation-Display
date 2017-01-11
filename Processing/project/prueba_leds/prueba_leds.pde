import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

int receptor = 12;
int ledPin=13;
int i = 0, j = 0, contLetra = 0;
int t = 1700;
int val;
long tiempo;
boolean[][] leds = new boolean[40][10];
String texto = "";

boolean led = false;

void setup() {

  size(1200, 400);
  background(#9BDDFF);
  //Configuracion de pines
  arduino = new Arduino(this, Arduino.list()[0], 57600); //[Configurar puerto y velocidad de la comunicacion
  arduino.pinMode(1, Arduino.OUTPUT);
  arduino.pinMode(2, Arduino.OUTPUT);
  arduino.pinMode(3, Arduino.OUTPUT);
  arduino.pinMode(4, Arduino.OUTPUT);
  arduino.pinMode(5, Arduino.OUTPUT);
  arduino.pinMode(6, Arduino.OUTPUT);
  arduino.pinMode(7, Arduino.OUTPUT);
  arduino.pinMode(8, Arduino.OUTPUT);
  arduino.pinMode(9, Arduino.OUTPUT);
  arduino.pinMode(10, Arduino.OUTPUT);
  for (int i = 0; i < 40; i++) {
    for (int j = 0; j < 10; j++) {
      leds[i][j] = false;
    }
  }
  tiempo = millis();
}

void draw() {
  val = arduino.analogRead(receptor);

  //quad(20,20,width-20,20,width-20,height-20,20,height-20); //Dibuja un cuadrado
  fill(#ffffff); //Color del relleno
  stroke(0); //Color de la linea de contorno
  rect(50, 315, 995, 30);
  line(80, 20, 200, 20); //Dibuja una linea
  strokeWeight(20);
  point(60, 20); //Dibujar un punto
  fill(#ffffff);
  strokeWeight(1);
  while (j<10) {
    while (i < 40) {
      rect(50 + (i * 25), 50 + (j * 25), 20, 20, 20);
      i++;
    }
    i = 0;
    j++;
  }
  rect(50,350,200,30);
  //rect(270,350,200,30);
  fill(#000000);
  textSize(25);
  text("BORRAR", 55, 375);
  if (mousePressed) {
    if (mouseX >= 50 && mouseX <= 70 && mouseY >= 50 && mouseY <= 70 && millis() - tiempo > 200) {
      if (leds[0][0]) {
        fill(#FFFFFF);
        rect(50, 50, 20, 20, 20);
        leds[0][0] = false;
        tiempo = millis();
      } else {
        fill(#0900FF);
        rect(50, 50, 20, 20, 20);
        leds[0][0] = true;
        tiempo = millis();
      }
    }else if((mouseX >= 50 && mouseX <= 250 && mouseY >= 350 && mouseY <= 380 && millis() - tiempo > 200)){
      apagarTodos();
      texto = "";
      tiempo = millis();
    }
      
  }
  fill(#000000);
  textSize(25);
  text(texto, 55, 340);
}



void keyPressed() {
  while (val < 200) {
    if (contLetra < 6) {
      if (key >='A' && key <= 'Z') {
        texto += key;
        imprimirLetra(key);
        contLetra++;
      } else if (key == 'B') {
        texto += key;
        imprimirLetra(key);
        contLetra++;
      }
    }
    println(texto);
    val=arduino.analogRead(receptor);
  }
}

void imprimirLetra(char letra) {
  if (letra == 'A') {
    dibujarFila(0, 5);
    dibujarFila(5, 5);
    dibujarCol(0, 10);
    dibujarCol(4, 10);
    A();
  } else if (letra == 'B') {
    dibujarFila(0, 5);
    dibujarFila(5, 5);
    dibujarFila(9, 5);
    dibujarCol(0, 10);
    dibujarCol(4, 10);
    B();
  } else if (letra == 'C') {
    dibujarFila(0, 5);
    dibujarFila(9, 5);
    dibujarCol(0, 10);
    C();
  } else if (letra == 'D') {
    dibujarFila(0, 4);
    dibujarFila(9, 4);
    dibujarCol(0, 10);
    dibujarCol(4, 9);
    D();
  } else if (letra == 'E') {
    dibujarFila(0, 4);
    dibujarFila(5, 4);
    dibujarFila(9, 4);
    dibujarCol(0, 10);
    E();
  } else if (letra == 'F') {
    dibujarFila(0, 4);
    dibujarFila(5, 3);
    dibujarCol(0, 10);
    Fa();
  } else if (letra == 'G') {
    dibujarFila(0, 5);
    dibujarFila(9, 4);
    dibujarCol(0, 10);
    dibujarCol(4, 2);
    dibujarLed((contLetra * 6)+2, 5);
    dibujarLed((contLetra * 6)+3, 5);
    dibujarLed((contLetra * 6)+4, 5);
    dibujarLed((contLetra * 6)+4, 6);
    dibujarLed((contLetra * 6)+4, 7);
    dibujarLed((contLetra * 6)+4, 8);
    G();
  } else if (letra == 'H') {
    dibujarFila(5, 4);
    dibujarCol(0, 10);
    dibujarCol(4, 10);
    H();
  } else if (letra == 'I') {
    dibujarFila(0, 5);
    dibujarFila(9, 5);
    dibujarCol(2, 10);
    I();
  } else if (letra == 'J') {
    dibujarFila(0, 5);
    dibujarFila(9, 2);
    dibujarCol(2, 10);
    J();
  } else if (letra == 'K') {
    dibujarCol(0, 10);
    dibujarCol(4, 4);
    dibujarFila(5, 3);
    dibujarLed((contLetra * 6)+3, 4);
    dibujarLed((contLetra * 6)+3, 6);
    dibujarLed((contLetra * 6)+4, 7);
    dibujarLed((contLetra * 6)+4, 8);
    dibujarLed((contLetra * 6)+4, 9);
    K();
  } else if (letra == 'L') {
    dibujarFila(9, 5);
    dibujarCol(0, 10);
    L();
  } else if (letra == 'M') {
    dibujarCol(0, 10);
    dibujarCol(4, 10);
    dibujarLed((contLetra * 6)+1, 1);
    dibujarLed((contLetra * 6)+2, 2);
    dibujarLed((contLetra * 6)+3, 1);
    M();
  } else if (letra == 'N') {
    dibujarCol(0, 10);
    dibujarCol(4, 10);
    dibujarLed((contLetra * 6)+1, 1);
    dibujarLed((contLetra * 6)+1, 2);
    dibujarLed((contLetra * 6)+1, 3);
    dibujarLed((contLetra * 6)+2, 3);
    dibujarLed((contLetra * 6)+2, 4);
    dibujarLed((contLetra * 6)+2, 5);
    dibujarLed((contLetra * 6)+2, 6);
    dibujarLed((contLetra * 6)+3, 6);
    dibujarLed((contLetra * 6)+3, 7);
    dibujarLed((contLetra * 6)+3, 8);
    N();
  } else if (letra == 'O') {
    dibujarFila(0, 5);
    dibujarFila(9, 2);
    dibujarCol(0, 10);
    dibujarCol(4, 10);
    O();
  } else if (letra == 'P') {
    dibujarFila(0, 4);
    dibujarFila(4, 4);
    dibujarCol(0, 10);
    dibujarCol(4, 5);
    P();
  } else if (letra == 'Q') {
    dibujarFila(0, 4);
    dibujarFila(8, 4);
    dibujarCol(0, 9);
    dibujarCol(3, 9);
    dibujarLed((contLetra * 6)+2, 7);
    dibujarLed((contLetra * 6)+4, 9);
    Q();
  } else if (letra == 'R') {
    dibujarFila(0, 4);
    dibujarFila(4, 4);
    dibujarCol(0, 10);
    dibujarCol(4, 5);
    dibujarLed((contLetra * 6)+2, 5);
    dibujarLed((contLetra * 6)+3, 6);
    dibujarLed((contLetra * 6)+4, 7);
    dibujarLed((contLetra * 6)+4, 8);
    dibujarLed((contLetra * 6)+4, 9);
    R();
  } else if (letra == 'S') {
    dibujarFila(0, 5);
    dibujarFila(4, 5);
    dibujarFila(9, 5);
    dibujarCol(0, 4);
    dibujarLed((contLetra * 6)+4, 5);
    dibujarLed((contLetra * 6)+4, 6);
    dibujarLed((contLetra * 6)+4, 7);
    dibujarLed((contLetra * 6)+4, 8);
    S();
  } else if (letra == 'T') {
    dibujarFila(0, 5);
    dibujarCol(2, 10);
    T();
  } else if (letra == 'U') {
    dibujarFila(9, 5);
    dibujarCol(0, 10);
    dibujarCol(4, 10);
    U();
  } else if (letra == 'V') {
    dibujarCol(0, 7);
    dibujarCol(4, 7);
    dibujarLed((contLetra * 6)+1, 7);
    dibujarLed((contLetra * 6)+2, 9);
    dibujarLed((contLetra * 6)+3, 7);
    V();
  } else if (letra == 'W') {
    dibujarCol(0, 9);
    dibujarCol(4, 9);
    dibujarLed((contLetra * 6)+1, 9);
    dibujarLed((contLetra * 6)+2, 8);
    dibujarLed((contLetra * 6)+2, 7);
    dibujarLed((contLetra * 6)+3, 9);
    W();
  } else if (letra == 'X') {
    dibujarCol(0, 3);
    dibujarCol(4, 3);
    dibujarLed((contLetra * 6)+3, 3);
    dibujarLed((contLetra * 6)+1, 3);
    dibujarLed((contLetra * 6)+2, 4);
    dibujarLed((contLetra * 6)+3, 5);
    dibujarLed((contLetra * 6)+4, 6);
    dibujarLed((contLetra * 6)+1, 5);
    dibujarLed((contLetra * 6)+0, 6);
    dibujarLed((contLetra * 6)+0, 7);
    dibujarLed((contLetra * 6)+0, 8);
    dibujarLed((contLetra * 6)+0, 9);
    dibujarLed((contLetra * 6)+4, 6);
    dibujarLed((contLetra * 6)+4, 7);
    dibujarLed((contLetra * 6)+4, 8);
    dibujarLed((contLetra * 6)+4, 9);
    X();
  } else if (letra == 'Y') {
    dibujarCol(0, 3);
    dibujarCol(4, 3);
    dibujarLed((contLetra * 6)+3, 3);
    dibujarLed((contLetra * 6)+1, 3);
    dibujarLed((contLetra * 6)+2, 4);
    dibujarLed((contLetra * 6)+2, 5);
    dibujarLed((contLetra * 6)+2, 6);
    dibujarLed((contLetra * 6)+2, 7);
    dibujarLed((contLetra * 6)+2, 8);
    dibujarLed((contLetra * 6)+2, 9);
    Y();
  } else if (letra == 'Z') {
    dibujarFila(0, 5);
    dibujarFila(9, 5);
    dibujarLed((contLetra * 6)+4, 1);
    dibujarLed((contLetra * 6)+4, 2);
    dibujarLed((contLetra * 6)+4, 3);
    dibujarLed((contLetra * 6)+0, 8);
    dibujarLed((contLetra * 6)+0, 7);
    dibujarLed((contLetra * 6)+1, 6);
    dibujarLed((contLetra * 6)+2, 5);
    dibujarLed((contLetra * 6)+3, 4);
    Z();
  }
}

void dibujarLed(int x, int y) {
  fill(#0900FF);
  rect(50 + (x * 25), 50 + (y * 25), 20, 20, 20);
  leds[x][y] = true;
}

void dibujarFila(int origen, int tam) {
  int x = 0 + (contLetra * 6);
  fill(#0900FF);
  while (x < tam + (contLetra * 6)) {
    dibujarLed(x, origen);
    x++;
  }
}

void dibujarCol(int origen, int tam) {
  int y = 0;
  fill(#0900FF);
  while (y < tam) {
    dibujarLed(origen  + (contLetra * 6), y);
    y++;
  }
}



void A() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 0, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 0, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 0, 1, 1, 1, 1);
  signal(1, 0, 1, 1, 0, 1, 1, 1, 1);
  signal(1, 1, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void B() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 0, 0, 0, 1);
  signal(0, 0, 0, 0, 0, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 0, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 0, 1, 1, 1, 0);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void C() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(1, 0, 0, 0, 0, 0, 0, 0, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void D() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 0, 0, 0, 0, 0, 1, 1);
  signal(1, 0, 1, 1, 1, 1, 1, 0, 1);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void E() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 0, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 0, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 0, 1, 1, 1, 0);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void Fa() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 0, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 0, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 0, 1, 1, 1, 1, 1);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void G() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 0, 1, 1, 1);
  signal(1, 0, 1, 1, 1, 0, 0, 0, 1);
  signal(0, 1, 1, 1, 1, 0, 1, 1, 0);
  signal(0, 1, 1, 1, 1, 0, 1, 1, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(1, 0, 0, 0, 0, 0, 0, 0, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void H() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 0, 0, 1, 1, 1, 1);
  signal(1, 1, 1, 0, 0, 1, 1, 1, 1);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void I() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void J() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 1, 0, 0, 1);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void K() {//LOW=1 HIGH=0
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 0, 0, 1, 1, 1, 0, 0, 0);
  signal(1, 1, 1, 0, 1, 0, 1, 1, 1);
  signal(1, 1, 1, 1, 0, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 0, 1, 1, 1, 1);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
} 
void L() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void M() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 0, 0, 0, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void N() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 0, 1);
  signal(1, 1, 1, 1, 1, 1, 0, 1, 1);
  signal(1, 1, 1, 1, 1, 0, 1, 1, 1);
  signal(1, 1, 1, 1, 0, 1, 1, 1, 1);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void O() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void P() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 0, 0, 0, 0, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 0, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 0, 1, 1, 1);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void Q() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void R() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(1, 0, 0, 0, 0, 1, 1, 0, 1);
  signal(0, 1, 1, 1, 1, 0, 0, 1, 1);
  signal(0, 1, 1, 1, 1, 0, 1, 1, 1);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void S() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void T() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 0, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 0, 0, 0, 0, 0, 0, 0, 0);
  signal(0, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 0, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void U() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 0, 0, 0, 0, 0, 0, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 0, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 0, 1);
  signal(1, 0, 0, 0, 0, 0, 0, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  delay(t);
}
void V() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 0, 0, 0, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 0, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 0, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 0);
  signal(1, 1, 1, 1, 1, 1, 1, 0, 1);
  signal(1, 1, 1, 1, 1, 0, 1, 1, 1);
  signal(0, 0, 0, 0, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
}
void W() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
}
void X() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
}
void Y() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
}
void Z() {
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
  signal(0, 1, 1, 1, 1, 1, 1, 0, 1);
  signal(0, 0, 1, 1, 1, 1, 1, 0, 1);
  signal(0, 1, 0, 1, 1, 1, 1, 0, 1);
  signal(0, 1, 1, 0, 1, 1, 1, 0, 1);
  signal(0, 1, 1, 1, 0, 1, 1, 0, 1);
  signal(0, 1, 1, 1, 1, 0, 0, 0, 1);
  signal(1, 1, 1, 1, 1, 1, 1, 1, 1);
}

void signal(int a, int b, int c, int d, int e, int f, int p, int k, int n)
{
  /*Napomena 1=LOW 0=HIGH*/
  if (a==1)arduino.digitalWrite(2, Arduino.LOW);
  else arduino.digitalWrite(2, Arduino.HIGH);
  if (b==1)arduino.digitalWrite(3, Arduino.LOW);
  else arduino.digitalWrite(3, Arduino.HIGH);
  if (c==1)arduino.digitalWrite(4, Arduino.LOW);
  else arduino.digitalWrite(4, Arduino.HIGH);
  if (d==1)arduino.digitalWrite(5, Arduino.LOW);
  else arduino.digitalWrite(5, Arduino.HIGH);
  if (e==1)arduino.digitalWrite(6, Arduino.LOW);
  else arduino.digitalWrite(6, Arduino.HIGH);
  if (f==1)arduino.digitalWrite(1, Arduino.LOW);
  else arduino.digitalWrite(1, Arduino.HIGH);
  if (p==1)arduino.digitalWrite(8, Arduino.LOW);
  else arduino.digitalWrite(8, Arduino.HIGH);
  if (k==1)arduino.digitalWrite(9, Arduino.LOW);
  else arduino.digitalWrite(9, Arduino.HIGH);
  if (n==1)arduino.digitalWrite(10, Arduino.LOW);
  else arduino.digitalWrite(10, Arduino.HIGH);
  delay(t);
}

void apagarTodos(){
  fill(#ffffff);
  strokeWeight(1);
  while (j<10) {
    while (i < 40) {
      rect(50 + (i * 25), 50 + (j * 25), 20, 20, 20);
      i++;
    }
    i = 0;
    j++;
  }
  for (int i = 0; i < 40; i++) {
    for (int j = 0; j < 10; j++) {
      leds[i][j] = false;
    }
  }
  contLetra = 0;
}