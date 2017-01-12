# LED-Rotation-Display
##
###Integrantes
* **RENZO COCHA**
* **ANDRES SALTOS**
* **ALEJANDRO TIRADO**

###OBJETIVO GENERAL
Construcción una pantalla giratorio de unos 15cm de diámetro, compuesto por una línea de unos 10 diodos emisores de luz (LED), que al girar a altas velocidades, y aprovechando la persistencia del ojo humano, logra crear palabras en el espacio

###OBJETIVOS ESPECÍFICO

* Realizar una interfaz gráfica para facilitar los ingresos de palabras al micro controlador. 
* Visualizar diferentes tipos palabras a grandes velocidades de giro.
* Informar y hacer uso de la electrónica a los estudiantes.


###DESARROLLO

El proyecto presenta un motor DC el cuál va conectado a un soporte de aluminio que a su vez sirve de base para una placa plástica la misma que se encarga de hacer de soporte para el arduino mega 2360 y la fila de LEDs (PWM 2, 3, 4, 5, 6, 7, 8, 9, 10) con sus respectivas conexiones, el arduino mega contendrá la programación para el funcionamiento del proyecto.
Para que el arduino mega reconozca que dado una vuelta se utilizara fotorresistencias las cuales al pasar por un LED enviaran una señal al arduino mega (A0) indicando que ha dado una vuelta completa.
Gracias a la velocidad que tiene el motor, éste hace que el mensaje aparezca de forma constante como si se observara en unos displays.
Algo que se debe tener muy en cuenta es que el motor gira a gran velocidad, sin embargo si no se consigue una velocidad adecuada para formar las letras en los LEDs, se puede aumentar la velocidad de cambio en la programación del arduino mega.
En la placa plástica  se encuentra el circuito de alimentación que consta de una batería de 9 Voltios que proporciona la energía para el funcionamiento del arduino mega.

###MATERIALES
![10 Led color azul](https://www.google.com.ec/search?hl=es&site=imghp&tbm=isch&source=hp&biw=1517&bih=681&q=arduino+mega+2560&oq=arduino+me&gs_l=img.3.1.0l10.56.2976.0.4152.9.7.1.1.1.0.211.927.0j4j1.5.0....0...1ac.1.64.img..2.7.942...0i10k1j0i30k1j0i5i10i30k1.Y8XZC7Ez0is#hl=es&tbm=isch&q=led+de+color+azul&imgrc=0BBYLCyCO5eeKM%3A.png)
![Arduino MEGA 2560](https://www.google.com.ec/search?hl=es&site=imghp&tbm=isch&source=hp&biw=1517&bih=681&q=arduino+mega+2560&oq=arduino+me&gs_l=img.3.1.0l10.56.2976.0.4152.9.7.1.1.1.0.211.927.0j4j1.5.0....0...1ac.1.64.img..2.7.942...0i10k1j0i30k1j0i5i10i30k1.Y8XZC7Ez0is#hl=es&tbm=isch&q=led+de+color+azul&imgrc=0BBYLCyCO5eeKM%3A.png)

![Motor de 12V](https://www.google.com.ec/search?hl=es&site=imghp&tbm=isch&source=hp&biw=1517&bih=681&q=arduino+mega+2560&oq=arduino+me&gs_l=img.3.1.0l10.56.2976.0.4152.9.7.1.1.1.0.211.927.0j4j1.5.0....0...1ac.1.64.img..2.7.942...0i10k1j0i30k1j0i5i10i30k1.Y8XZC7Ez0is#hl=es&tbm=isch&q=motor+de+12+voltios&imgrc=v_BZjuaBhPSFCM%3A.png)


###CONCLUSIÓN


* Este proyecto nos deja ver la aplicabilidad tanto en sistemas robustos como en sistemas pequeños pero vistosos de un micro controlador.
* Con este proyecto se pueden hacer diseños de publicidad porque tiene buena acogida entre el mercado y es una manera de innovar y llamar la atención al usuario.
* Este diseño constituye una forma más de innovación en el amplio campo de la electrónica y aplicaciones de la vida cotidiana.



###CODIGO
~~~
/*Arduino team politehnika
  Led display vazdušni
*/
int StartPin=A0;
int t=1;
void setup(){
pinMode(2,OUTPUT); pinMode(3,OUTPUT);
pinMode(4,OUTPUT);  pinMode(5,OUTPUT);
pinMode(6,OUTPUT); pinMode(7,OUTPUT);
pinMode(8,OUTPUT); pinMode(9,OUTPUT);
pinMode(10,OUTPUT);
}
void loop(){
int val=analogRead(StartPin);
    while(val < 200){
    H();
    O();
    L();
    A();
    
  
    val=analogRead(StartPin);
   
    }
}
void A(){
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,0,0,0,0,0,0,0);
signal(1,0,1,1,1,1,1,1,1);
signal(0,1,1,1,0,1,1,1,1);
signal(0,1,1,1,0,1,1,1,1);
signal(1,0,1,1,0,1,1,1,1);
signal(1,1,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void B(){
  signal(1,1,1,1,1,1,1,1,1);
  signal(1,1,1,1,1,0,0,0,1);
  signal(0,0,0,0,0,1,1,1,0);
  signal(0,1,1,1,0,1,1,1,0);
  signal(0,1,1,1,0,1,1,1,0);
  signal(0,0,0,0,0,0,0,0,0);
  signal(1,1,1,1,1,1,1,1,1);
  delay(t);
  }
void C(){
signal(1,1,1,1,1,1,1,1,1);
signal(0,1,1,1,1,1,1,1,0);
signal(0,1,1,1,1,1,1,1,0);
signal(0,1,1,1,1,1,1,1,0);
signal(0,1,1,1,1,1,1,1,0);
signal(1,0,0,0,0,0,0,0,1);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void D(){
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,0,0,0,0,0,1,1);
signal(1,0,1,1,1,1,1,0,1);
signal(0,1,1,1,1,1,1,1,0);
signal(0,1,1,1,1,1,1,1,0);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void E(){
signal(1,1,1,1,1,1,1,1,1);
signal(0,1,1,1,1,1,1,1,0);
signal(0,1,1,1,0,1,1,1,0);
signal(0,1,1,1,0,1,1,1,0);
signal(0,1,1,1,0,1,1,1,0);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void Fa(){
signal(1,1,1,1,1,1,1,1,1);
signal(0,1,1,1,1,1,1,1,1);
signal(0,1,1,0,1,1,1,1,1);
signal(0,1,1,0,1,1,1,1,1);
signal(0,1,1,0,1,1,1,1,1);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void G(){
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,1,1,1,0,1,1,1);
signal(1,0,1,1,1,0,0,0,1);
signal(0,1,1,1,1,0,1,1,0);
signal(0,1,1,1,1,0,1,1,0);
signal(0,1,1,1,1,1,1,1,0);
signal(1,0,0,0,0,0,0,0,1);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void H(){
signal(1,1,1,1,1,1,1,1,1);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,0,0,1,1,1,1);
signal(1,1,1,0,0,1,1,1,1);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void I(){
signal(1,1,1,1,1,1,1,1,1);
signal(0,1,1,1,1,1,1,1,0);
signal(0,0,0,0,0,0,0,0,0);
signal(0,1,1,1,1,1,1,1,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void J(){
signal(1,1,1,1,1,1,1,1,1);
signal(0,1,1,1,1,1,0,0,1);
signal(0,1,1,1,1,1,1,1,0);
signal(0,1,1,1,1,1,1,1,0);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void K(){//LOW=1 HIGH=0
signal(1,1,1,1,1,1,1,1,1);
signal(0,0,0,1,1,1,0,0,0);
signal(1,1,1,0,1,0,1,1,1);
signal(1,1,1,1,0,1,1,1,1);
signal(1,1,1,1,0,1,1,1,1);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
} 
void L(){
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,1,1,1,1,1,1,0);
signal(1,1,1,1,1,1,1,1,0);
signal(1,1,1,1,1,1,1,1,0);
signal(1,1,1,1,1,1,1,1,0);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void M(){
signal(1,1,1,1,1,1,1,1,1);
signal(1,0,0,0,0,0,0,0,0);
signal(0,1,1,1,1,1,1,1,1);
signal(0,1,1,1,1,1,1,1,1);
signal(1,0,0,0,1,1,1,1,1);
signal(0,1,1,1,1,1,1,1,1);
signal(0,1,1,1,1,1,1,1,1);
signal(1,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void N(){
signal(1,1,1,1,1,1,1,1,1);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,0,1);
signal(1,1,1,1,1,1,0,1,1);
signal(1,1,1,1,1,0,1,1,1);
signal(1,1,1,1,0,1,1,1,1);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void O(){
signal(1,1,1,1,1,1,1,1,1);
signal(0,0,0,0,0,0,0,0,0);
signal(0,1,1,1,1,1,1,1,0);
signal(0,1,1,1,1,1,1,1,0);
signal(0,1,1,1,1,1,1,1,0);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void P(){
signal(1,1,1,1,1,1,1,1,1);
signal(1,0,0,0,0,1,1,1,1);
signal(0,1,1,1,1,0,1,1,1);
signal(0,1,1,1,1,0,1,1,1);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void R(){
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,1,1,1,1,1,1,0);
signal(1,0,0,0,0,1,1,0,1);
signal(0,1,1,1,1,0,0,1,1);
signal(0,1,1,1,1,0,1,1,1);
signal(0,0,0,0,0,0,0,0,0);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void S(){
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,1,1,1,1,1,1,1);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void T(){
signal(1,1,1,1,1,1,1,1,1);
signal(0,0,1,1,1,1,1,1,1);
signal(0,1,1,1,1,1,1,1,1);
signal(0,0,0,0,0,0,0,0,0);
signal(0,1,1,1,1,1,1,1,1);
signal(0,0,1,1,1,1,1,1,1);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void U(){
signal(1,1,1,1,1,1,1,1,1);
signal(1,0,0,0,0,0,0,1,1);
signal(1,1,1,1,1,1,1,0,1);
signal(1,1,1,1,1,1,1,1,0);
signal(1,1,1,1,1,1,1,1,0);
signal(1,1,1,1,1,1,1,0,1);
signal(1,0,0,0,0,0,0,1,1);
signal(1,1,1,1,1,1,1,1,1);
delay(t);
}
void V(){
signal(1,1,1,1,1,1,1,1,1);
signal(0,0,0,0,1,1,1,1,1);
signal(1,1,1,1,1,0,1,1,1);
signal(1,1,1,1,1,1,1,0,1);
signal(1,1,1,1,1,1,1,1,0);
signal(1,1,1,1,1,1,1,0,1);
signal(1,1,1,1,1,0,1,1,1);
signal(0,0,0,0,1,1,1,1,1);
signal(1,1,1,1,1,1,1,1,1);
}
void Z(){
signal(1,1,1,1,1,1,1,1,1);
signal(0,1,1,1,1,1,1,0,1);
signal(0,0,1,1,1,1,1,0,1);
signal(0,1,0,1,1,1,1,0,1);
signal(0,1,1,0,1,1,1,0,1);
signal(0,1,1,1,0,1,1,0,1);
signal(0,1,1,1,1,0,0,0,1);
signal(1,1,1,1,1,1,1,1,1);
}

void signal(int a,int b,int c,int d,int e,int f,int p,int k,int n){
  /*Napomena 1=LOW 0=HIGH*/
if(a==1)digitalWrite(2,LOW);
else digitalWrite(2,HIGH);
if(b==1)digitalWrite(3,LOW);
else digitalWrite(3,HIGH);
if(c==1)digitalWrite(4,LOW);
else digitalWrite(4,HIGH);
if(d==1)digitalWrite(5,LOW);
else digitalWrite(5,HIGH);
if(e==1)digitalWrite(6,LOW);
else digitalWrite(6,HIGH);
if(f==1)digitalWrite(7,LOW);
else digitalWrite(7,HIGH);
if(p==1)digitalWrite(8,LOW);
else digitalWrite(8,HIGH);
if(k==1)digitalWrite(9,LOW);
else digitalWrite(9,HIGH);
if(n==1)digitalWrite(10,LOW);
else digitalWrite(10,HIGH);
delay(t);
}
~~~





###BIBLIOGRAFIA

<https://www.hackster.io/PoliArdo/led-rotation-display-9e646a?ref=channel&ref_id=424_trending__beginner_&offset=25>

