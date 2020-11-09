
public class Background{ // CLASE DEL FONDO DEL TABLERO
 private int [][][] colores;
 private int r,g,b;
 private int w;
 private int x,y;
  

public Background(){
  colores = new int [12] [24] [3];
  w = 600/47;
}

public void display(){
    for(int i=0;i<12;i++){
       for(int j=0;j<24;j++){
         r=colores[i][j][0];
         g=colores[i][j][1];
         b=colores[i][j][2];
         fill(r,g,b);
         rect(i*w+w*86,j*w+w*4,w,w);
       }
    }
 

  
    for(int i=0;i<24;i++){
      if(Checkfila(i)){
         println("Fila Completada");
         borrar(i);
          if(n.vida<80){
           n.vida+=20;
           puntaje+=30;
          }else{
            n.vida = 100;
           puntaje+=30;
          }
      }
    }
}
 public void eFigura(Shape s){
    for(int i=0;i<4;i++){
      x=s.figura[i][0];
      y=s.figura[i][1];
      colores[x][y][0] = s.r;
      colores[x][y][1] = s.g;
      colores[x][y][2] = s.b;     
      cont++;
    }
 }
 public boolean Checkfila (int fila){
   for(int i=0;i<12;i++){
     if(colores[i][fila][0]==0 && colores[i][fila][1]==0 && colores[i][fila][2]==0){
        return false;
      }
   }
   return true;
 }
 public void borrar(int fila){
   int [][][] actualizar = new int[12][24][3];
   for(int i = 0;i<12;i++){
     for(int j=23; j>fila;j--){
       for(int a = 0;a<3;a++){
         actualizar[i][j][a] = colores[i][j][a];
       }
     }
   }
   for(int r = fila;r>=1;r--){
     for(int j=0;j<12;j++){
       actualizar[j][r][0] = colores[j][r-1][0];
       actualizar[j][r][1] = colores[j][r-1][1];
       actualizar[j][r][2] = colores[j][r-1][2];
     }
   }
   colores = actualizar;
 }
}
