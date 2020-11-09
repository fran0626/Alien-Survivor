class Shape{
  private int [] [] cuadrado = { {0,0} , {1,0} , {0,1} , {1,1} }; // TETROMINOS
  private int [] [] linea = { {0,0} , {1,0} , {2,0} , {3,0} };
  private int [] [] tetromino = { {0,0} , {1,0} , {2,0} , {1,1} };
  private int [] [] Lizquierda = { {0,0} , {0,1} , {1,0} , {2,0} };
  private int [] [] Lderecha = { {0,0} , {1,0} , {2,0} , {2,1} };
  private int [] [] S1 = { {0,0} , {1,0} , {1,1} , {2,1} };
  private int [] [] S2 = { {0,1} , {1,1} , {1,0} , {2,0} };
  private int [][]figura,oF;
  private int r,g,b,turno,crot;
  private boolean on=true;
  private float w=600/47;
  private int c;
  private int x,y;
  
  public Shape(){
    w = 600/47;
    turno = tn;
    switch(turno){
      case 0:
        figura = cuadrado;
        r = 255;
        g = 255;
        b = 0;
        break;
      case 1:
        figura = linea;
        r=0;
        g = 170;
        b=228;
        break;
      case 2:
        figura = tetromino;
        r= 255;
        g = 0;
        b = 128;
        break;
      case 3:
        figura =  Lizquierda;
        r = 155;
        g = 155;
        break;
      case 4:
        figura = Lderecha;
        r=255;
        g = 128;
        b = 0;
        break;
      case 5:
        figura = S1;
        r = 119;
        g=221;
        b = 119;
        break;
      case 6:
        figura = S2;
        r = 155;
        g = 60;
        b=60;
        break;
    }
    c=1;
    oF=figura;
    crot=0;
  }
  public void display(){
    fill (r,g,b);
    for(int i =0; i<4;i++){
      rect(figura[i][0]*w+(w*86),figura[i][1]*w+(w*4),w,w);
      
     }
  }
  public void bajar(){
    if(c%15 == 0){ 
      mover("abajo");
    }
    c++;
  }
  public boolean limite (String dir){
     switch(dir){
       case "derecha":
          for(int i=0;i<4;i++){
             if(figura[i][0]>10){
                return false;
             }
          }
          break;
       case "izquierda":
          for(int i =0; i<4;i++){
            if(figura[i][0]<1){
                 return false;
            }
          }
          break;
       case "abajo":
          for(int i=0;i<4;i++){
            if(figura[i][1]>22){
               on = false;
              return false;
            }
          }
          break;
       
    }
    return true;
  }
  public void mover(String dir){ // MOVIMIENTO TETROMINOS
     if(limite(dir)){
       if(dir == "derecha"){
           for(int i =0;i<4;i++){
             figura[i][0]++;
           }
        }else if(dir == "izquierda"){
           for(int i =0;i<4;i++){
             figura[i][0]--;
           }
        }else if(dir == "abajo"){
           for(int i =0;i<4;i++){
             
             figura[i][1]++;
           }
        }else if(dir == "arriba"){
           for(int i =0;i<4;i++){
             
             figura[i][1]--;
           }
        }
    }
  }
  
  public void rotate(){ // ROTACION
    if(figura != cuadrado){   
        int[][] rotar = new int [4][2];
        if(crot % 4 == 0){  
            for(int i =0;i<4;i++){
               rotar[i][0] =oF[i][1]-figura[1][0];
               rotar[i][1] = -oF[i][0] -figura[1][1] ;
            }
        }else if(crot % 4 == 1){
            for(int i =0;i<4;i++){
               rotar[i][0] =oF[i][0]-figura[1][0];
               rotar[i][1] = -oF[i][1] -figura[1][1] ;
            }
        }else if(crot % 4 == 2){
            for(int i =0;i<4;i++){
               rotar[i][0] =-oF[i][1]-figura[1][0];
               rotar[i][1] = oF[i][0] -figura[1][1] ;
            }
        }else if(crot % 4 == 3){
            for(int i =0;i<4;i++){
               rotar[i][0] = oF[i][0]-figura[1][0];
               rotar[i][1] = oF[i][1] -figura[1][1] ;
            }
        }
        figura = rotar;
    }
  }
  public boolean fondo(Background b){ // LIMITE DE ALCANCE DEL TETROMINO
     for(int i=0;i<4;i++){
        x=figura[i][0];
        y=figura[i][1];
        if(x >= 0 && x<12 && y>=0 && y<23){
          for(int a=0;a<3;a++){
            if(b.colores[x][y+1][a]!=0){
              return false;
            }
          }
        }
     }
     return true;
  }
}
