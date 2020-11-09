public class ovni extends cosmo{
  public boolean der, iz, disparo=false,t;
  public ovni(int _x, int _y, int _d, int _a, int _vida,boolean _der, boolean _iz,boolean _muerte,boolean _t){
    x=_x;
    y=_y;
    d=_d;
    a= _a;
    vida=_vida;
    der=_der;
    iz= _iz;
    muerte=_muerte;
    t=_t;
    
  }
  public void display(){
    if(!t){
      image(ovni,x,y,60,60);
    }else{
      image(ovni2,x,y,80,50);
    }
    if(vida<8 && !t){
    fill(41,49,51);
    rect(x,y-13,60,13);
    }
    if(vida<=7 && vida>5 && !t){
      fill(57,255,20);
      rect(x,y-13,45,13);
       fill(57,255,20);
    }
    if(vida<=5 && vida>3 && !t){
      fill(229,190,1);
      rect(x,y-13,30,13);
    }
    if(vida<=3 && vida>0 && !t){
     fill(255,0,0);
     rect(x,y-13,15,13);
    }
    if(vida<20 && t){
      fill(41,49,51);
      rect(x,y-13,60,13);
      if(vida==18){  
        fill(57,255,20);
        rect(x,y-13,54,13);
      }
    }
    if(vida<=16 && vida >=14 &&  t){
      fill(57,255,20);
      if(vida==18){
       rect(x,y-13,54,13);
      }else if(vida==16){
       rect(x,y-13,48,13);
      }else if(vida == 14){
       rect(x,y-13,42,13);
      }
    }
    if(vida<14 && vida >=6 &&  t){
      fill(229,190,1);
      if(vida==12){
       rect(x,y-13,36,13);
      }else if(vida==10){
       rect(x,y-13,30,13);
      }else if(vida == 8){
       rect(x,y-13,24,13);
      }else if(vida==6){
       rect(x,y-13,18,13);
      }
    }
    if(vida<6 && vida >=1 &&  t){
      fill(255,0,0);
      if(vida==4){
       rect(x,y-13,12,13);
      }else if(vida==2){
       rect(x,y-13,6,13);
      }
    }
    if(vida==0){
      muerte=true;
      image(implosion,x-50,y-50,200,200);
       if(t){
         puntaje+=50;
       }else{
         puntaje+=20;
       }
       
    }
  }
  public void mover(){
    if(der){
       if(x<=950){
         x+=5;
       }else{
         der=false;
         iz=true;
       }
    }
    if(iz){
       if(x>=170){
         x-=5;
       }else{
         der=true;
         iz=false;
       }
    }
  }
  public void disparar(){
   for(int i=n.x;i<n.x+n.d;i++){
     if(x==i){
       disparo=true;
       break;
     }
   }   
  }
  
  public void colision(){
     for(int i=x-d/2;i<=x+d+m1.d;i++){
       for(int j=y;j<y+a;j++){
             if(m1.x==i && m1.y==j){
               m1.contacto=true;
               vida--;
               puntaje+=3;
             }else if(m2.x==i && m2.y==j){
               m2.contacto=true;
               vida--;
               puntaje+=3;
             }
       }
     }
  }
}
