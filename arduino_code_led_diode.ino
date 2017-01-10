/*Arduino team politehnika
  Led display vazdušni
*/
int StartPin=A0;
int t=1700;
void setup(){
pinMode(2,OUTPUT); pinMode(3,OUTPUT);
pinMode(4,OUTPUT);  pinMode(5,OUTPUT);
pinMode(6,OUTPUT); pinMode(11,OUTPUT);
pinMode(8,OUTPUT); pinMode(9,OUTPUT);
pinMode(10,OUTPUT);
}
void loop(){
int val=analogRead(StartPin);
    while(val < 200){
     O();
     A();
     C();
    
  
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
if(f==1)digitalWrite(11,LOW);
else digitalWrite(11,HIGH);
if(p==1)digitalWrite(8,LOW);
else digitalWrite(8,HIGH);
if(k==1)digitalWrite(9,LOW);
else digitalWrite(9,HIGH);
if(n==1)digitalWrite(10,LOW);
else digitalWrite(10,HIGH);
delay(t);
}