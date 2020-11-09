PImage nave,espacio,misil,ovni,meteorito,explosion,implosion,fuego,z,panel,x,puzzle,escudo,marco,salud,campo,T1,T2,click,q,cuadrado,tetromino,L,S,linea,T3,T4,T5,ovni2,danger; // IMAGENES
int cont=0,puntaje=0,duracion=0,tn=(int)random(7),tempo,s=0,n1=0,n2=0,n3=0,resist=20;
boolean armas=true,tetris=false,orden= false,par=true, impar=false,game=false;
float w=600/47;
Shape shape,onDeck;
nave n;
misil m1;
misil m2;
meteorito a1,b1,c1;
ovni r,t,y;
fuego f1,f2;
Background bg;
void setup(){
  println(tempo);
  size(1200,600); 
  shape = new Shape();
  shape.on = true;
  textSize(45);
  //--CARGA DE IMAGENES
  danger = loadImage("danger.jpg");
  cuadrado = loadImage("cuadrado.png");
  tetromino = loadImage("Tetromino.png");
  ovni2 = loadImage("ovni2.png");
  L = loadImage("L.png");
  S = loadImage("S.png");
  linea = loadImage("Linea.png");
  T1= loadImage("Tecla1.png");
  T2= loadImage("Tecla2.png");
  T3= loadImage("Tecla3.png");
  T4= loadImage("Tecla4.png");
  T5= loadImage("Tecla5.png");
  q= loadImage("q.png");
  click = loadImage("Click.png");
  salud = loadImage("230-salud.png");
  panel=loadImage("panel.png");
  nave = loadImage("nave.png");
  espacio = loadImage("espacio.jpg");
  misil = loadImage("misil.png");
  ovni = loadImage("ovni.png");
  campo = loadImage("campo.png");
  meteorito = loadImage("meteorito.png");
  explosion = loadImage("explosion.png");
  implosion = loadImage("implosion.png");
  fuego = loadImage("fuego.png");
  puzzle = loadImage("puzzle.png");
  z = loadImage("z.png");
  x= loadImage("x.png");
  escudo = loadImage("escudo.png");
  marco = loadImage("marco.png");
  //-- SENTENCIA DE OBJETOS---//
  n = new nave(600,420,100,74,100,false);
  m1 = new misil(n.x,n.y-30,20,43,true,false);
  m2 = new misil(n.x+20,n.y-30,20,43,false,true);
  r = new ovni(400,200,30,30,8,true,false,false,false);
  t = new ovni(900,240,30,30,8,false,true,false,false);
  y = new ovni(600,130,30,30,20,false,true,false,true);
  f1= new fuego(r.x,r.y,30,37,true,false);
  f2= new fuego(t.x,t.y,30,37,false,true);
  a1= new meteorito(300,50,60,90,false);
  b1= new meteorito(600,50,60,90,false);
  c1= new meteorito(800,50,60,90,false);
  shape = new Shape();
  onDeck = new Shape();
  bg = new Background();
}

void draw(){  
  println("puntaje: "+puntaje);
  tempo = second(); // TEMPORIZADOR
  if(!n.campo){
    resist=20;
  }
  if(resist<=0){
    n.campo=false;
  }
  if(tempo%2==0 && par && !impar && !n.muerte){
     par=false;
     impar=true;
     s++;
     if(r.muerte){
        n1++;
     }
     if(t.muerte){
        n2++;
     }
     if(y.muerte){
        n3++;
     }
     if(n1==10){
       r.muerte=false;
       r.vida=8;
     }
     if(n2==10){
       t.muerte=false;
       t.vida=8;
     }
     if(n3==10){
       y.muerte=false;
       y.vida=20;
     }
     if(s%5==0){
         puntaje+=3;
     }
     
  }else if(tempo%2==1 && impar && !par && !n.muerte){
     par=true;
     impar=false;
     s++;
     if(n1==10){
       r.muerte=false;
       r.vida=8;
     }
     if(n2==10){
       t.muerte=false;
       r.vida=8;
     }
     if(n3==10){
       y.muerte=false;
       y.vida=20;
     }
     if(r.muerte){
        n1++;
     }
     if(t.muerte){
        n2++;
     }
     if(y.muerte){
        n3++;
     }
     if(s%5==0){
          puntaje+=3;
     }
  }
  if(n.vida>0){
  stroke(0);
  comandos();
  controlador();
  meteoritos();
  ovnis();
  nave();
 
   if(cont!=0 && bg.y==0 || bg.y==1){
      fill(0);
      image(danger,800,600,120,90);
      fill(243,159,24);
      textSize(25);
      text("DANGER:",1037,180);
      text("NO OPTION",1035,220);
      text("TO RECOVER",1035,260);
      text("HEALTH",1035,300);
   }else{
      bg.display();
      cuadricula();
      dfigura();
   }
  
  
  }else{
     background(0);
      textSize(100);
      fill(255,193,34);
      text("GAME OVER",330,230);
      textSize(50);
      fill(255,255,255);
      text("Tu Puntaje es: "+puntaje,300,350);
      text("Sigue así :D",300,440);
     
  } 
}
void controlador(){
  image(panel,1025,320,175,250);
  if(armas && !tetris){
    image(marco,1088,450,100,70);
  }
  if(!armas && tetris){
    image(marco,1088,385,100,70);
  }
  image(z,1045,400,40,40);
  image(x,1045,465,40,40);
  image(puzzle,1092,391,90,60);
  image(escudo,1115,465,50,50);
}
void nave(){
 
  if(!n.muerte){
    if(!armas){
     n.campo=false;
    }
    if(n.campo==true){
    image(campo,n.x-10,n.y-30,120,120);
    }
    n.display();
    n.colision();
  
  if(n.disparo1==true){
    m1.disparo();
    
  }else{
    m1.contacto=false;
    m1.x=n.x;
    m1.y=n.y-30;
  }
  if(n.disparo2==true){
   m2.disparo();
  }else{
    m2.contacto=false;
    m2.x=n.x+80;
    m2.y=n.y-30;
  }
 }
}
void meteoritos(){
  if(!a1.muerte){
    a1.caer();
  }else{
    a1.muerte=false;
    a1.x=(int)random(280)+175;
    a1.y=30; 
  }
  if(!b1.muerte){
    b1.caer();
  }else{
    b1.muerte=false;
    b1.x=(int)random(280)+455;
    b1.y=30;
  }
  if(!c1.muerte){
    c1.caer();
  }else{
    c1.muerte=false;
    c1.x=(int)random(280)+680;
    c1.y=30;
  }

}
void ovnis(){ // COMPORTAMIENTO DE OVNIS SEGUN SU ATRIBUTO DE VIDA
  if(!y.muerte){
    y.display();
    y.colision();
    y.mover();
  }
  if(!r.muerte){
   r.display();
   r.colision();
   r.disparar();
   r.mover();
  }
  if(!t.muerte){
   t.display();
   t.disparar();
   t.colision();
   t.mover();
  }
  if(r.disparo){
    f1.disparo();
  }else{
    f1.contacto=false;
    f1.x=r.x;
    f1.y=r.y;
  }
  if(t.disparo){
    f2.disparo();
  }else{
    f2.contacto=false;
    f2.x=t.x;
    f2.y=t.y;
  }
}
void espacio(){
 image(espacio,172,30,857,510);
}
void keyPressed(){ // CONTROLES
  if(keyCode == RIGHT && !armas && shape.on){
      shape.mover("derecha");
   }
   if(keyCode== LEFT && !armas && shape.on){
      shape.mover("izquierda");
   }
   if(keyCode== DOWN && !armas && shape.on){
      shape.mover("abajo");
   }
  if(keyCode==49 && !n.campo){ // TECLA 1
    if(armas && !n.campo){
      n.disparo1=true;
    }else{
      tn=1;
      orden=true;
    }
  }
  if(keyCode==50){ // TECLA 2
    if(armas && !n.campo){
      n.disparo2=true;
    }else{
      tn=2;
      orden = true;
    }
  }
  if(keyCode==51){ // TECLA 3
    if(!armas){
      tn=0;
      orden = true;
    }
  }
  if(keyCode==52){ // TECLA 4
    if(!armas){
      tn=4; 
      orden = true;
    }
  }
  if(keyCode==53){ // TECLA 5
    if(!armas){
      tn = 5;
      orden = true;
    }
  }
  if(keyCode == 81){ //TECLA Q
      if(armas && !n.campo){
        if(duracion<5){
          n.campo=true;
          duracion++;
        }
      }else if(armas && n.campo){
        n.campo=false;
      }
   }
  if(keyCode==90){ // TECLA Z
     armas=false;
     tetris=true;
   }
   if(keyCode==88){ //TECLA X
     armas=true;
     tetris=false;
   }
   if(keyCode==68){ //TECLA D
      n.derecha();
   }
   if(keyCode==65){ // TECLA A
      n.izquierda();
   }
   if(keyCode==87){ //TECLA W
     n.arriba();
   }
   if(keyCode==83){ // TECLA S
     n.abajo();
   }
}
void keyReleased(){ // ROTACIONES TETROMINOS
   if(keyCode == UP && !armas){
     shape.rotate();
     shape.rotate();
   }
   shape.crot++;
}
void mouseClicked(){ // DISPARO DE MISILES
  if(mouseX>172 && mouseX<1029 && mouseY>30 && mouseY<540){   
      if(armas && !n.campo){
          n.disparo1 = true;
          n.disparo2 = true;
      }
  }
}
void comandos(){ // CONTROLES Y ARSENAL
  izquierda();
  derecha();
  arriba();
  abajo();
  espacio();
}
void izquierda(){
  fill(40,40,40);
  rect(0,0,width/7,height);
}
void derecha(){
  fill(40,40,40);
  rect(width-(width/7),0,width/7,height);
  if(armas){
    image(misil,10,100,30,60); image(T1,60,100,50,50); image(T2,100,100,50,50);
    image(misil,10,260,30,60); image(misil,30,260,30,60); image(click,80,260,50,50);
    image(campo,10,400,80,80); fill(255,0,255);rect(110,420,50,50);image(q,110,420,50,50); fill(255,255,255);
    textSize(35);text(5-duracion,30,515); textSize(15); 
      if(n.campo){
        fill(255,0,255); text("Shield resistence: "+resist,20,537);
      }
  }else{
    if(orden){
      fill(0,143,57);
          if(tn==0){
              rect(15,240,60,60);
          }    
          if(tn==1){
              rect(15,100,60,60);
          }    
          if(tn == 2){
              rect(15,160,60,60);
          }
          if(tn == 3){   
          
              rect(15,300,60,60);
          }
          if(tn==4){
             rect(15,300,60,60);
          }
          if(tn==5){
              rect(15,370,60,60);
          }
    }
    image(linea,10,100,70,40); image(T1,100,100,50,50);
    image(tetromino,7,160,70,50); image(T2,100,170,50,50);
    image(cuadrado,15,240,50,50); image(T3,100,240,50,50);
    image(L,25,300,50,60); image(T4,100,310,50,50);
    image(S,25,370,50,60);image(T5,100,380,50,50); 
    
  }
}
void arriba(){
  fill(40,40,40);
  rect(0,0,width,30);
}
void abajo(){
  fill(40,40,40);
  rect(0,height-60,width,60);
  fill(255,255,255);
  rect(320,height-50,700,43);
  textSize(40);
  text(n.vida+" %",180,height-10);
  image(salud,90,height-55,60,50);
  if(n.vida<=100 && n.vida>75){
     fill(0,143,57);
  }
  if(n.vida<=75 && n.vida>50){
     fill(57,255,20);
  }
  if(n.vida<=50 && n.vida>30){
     fill(255,255,0);
  }
  if(n.vida<=30 && n.vida>0){
     fill(255,0,0);
  }
  if(n.vida>0){
    rect(320,height-50,n.vida*7,43);
  }
}
void cuadricula(){
    stroke(244,244,244);
    for(int i=2;i<27;i++){
     line(height/1.61+w*55,(i*w)+w*2,height-w*8+w*56,(i*w)+w*2);
      if(i<15){
     line(i*w+w*84,w*4,i*w+w*84,height-w*22);
      }
    }
}
void dfigura(){ // TETRIS
  shape.display();
  
  if(shape.fondo(bg)){
   shape.bajar();
 }else{
    shape.on = false;
 }
 if(!shape.on){
    bg.eFigura(shape);
    shape = onDeck;
    shape.on = true;
     
    if(!orden){
      tn = (int)random(7);
    }else{
      orden = false;
    }
    onDeck = new Shape(); 
 }
 
}  
