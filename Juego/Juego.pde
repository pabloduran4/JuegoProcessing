float posX[];
float posY[];

float distancia = 0;
float distancia2 = 0;
int estado[];


PImage bicho;
PImage piso;
PImage abeja;
PImage matar;
PImage perder;
PImage ganar;
int velocidad = 2;

float posXab[];
float posYab[];
int estadoAb[];
int velocidad2 = 1;

int vidas = 5;

//boton fin
int SizeX = 380;
int SizeY = 250;
int ImgX = 110;
int ImgY = 190;

int contador = 0;

void setup(){
  size(600,600);
  
  posX = new float [100];
  posY = new float [100];
  estado = new int[100];
  
  posXab = new float [100];
  posYab = new float [100];
  estadoAb = new int[100];
  
   bicho = loadImage("bicho.png");
 
   piso = loadImage("piso.png");
   abeja = loadImage("abeja.png");
   matar = loadImage("matar.png");
   perder = loadImage("perder.png");
   ganar = loadImage("ganar.png");
 
   
  for(int i= 0; i<8; i++){
      posX[i] = random(480);
      posY[i] = random(350);
      estado[i] = 1;
   }
   
   for(int i= 0; i<3; i++){
      posXab[i] = random(480);
      posYab[i] = random(350);
      estadoAb[i] = 1;
   }
 
 noCursor();
}


void draw(){
 
  background(piso);
 
  //dibuje los bichos
  
  contador = 0;
  fill(230,10,85);
  for(int i = 0;i<8;i++){
    
    if(posY[i] >= 500 || posY[i] <= 1){
     velocidad = velocidad *-1; 
   }
    posY[i] = posY[i] + velocidad;
    
    
      if(estado[i] == 1){
       image(bicho,posX[i],posY[i],60,60); 
      }else{
        contador++;
      }
 
    }
    
    println(contador);
    
    
    //dibujar abejas
     for(int i = 0;i<3;i++){
    
    if(posYab[i] >= 600){
     vidas--;
     posYab[i] = random(100);
     posXab[i] = random(550);
   }
   
    
    posYab[i] = posYab[i] + velocidad2;
      
    
      if(estadoAb[i] == 1){
       image(abeja,posXab[i],posYab[i],60,60); 
      }
      
    }
     
     
     
    //algoritmo para matar bichos
    for(int i=0;i<8;i++){
      
        if(mousePressed == true){
            distancia = dist(mouseX,mouseY,posX[i],posY[i]);
              
            if(distancia<40){
                estado[i] = 0;
                
              }     
               
          }  
     }
     
      

     //matar abejas
      for(int i=0;i<3;i++){
        if(mousePressed == true){
            distancia2 = dist(mouseX,mouseY,posXab[i],posYab[i]);
           
            if(distancia2<40){
                estadoAb[i] = 0;
             
              }
          }  
     }
     
 
    
     
    
   fill(#D81A1A);
   textSize(35);
   text("vidas: "+vidas,450,550);

       if(vidas == 0){
         image(perder,ImgX,ImgY,SizeX,SizeY); 
          velocidad = 0;
          velocidad2 = 0;
          resetear(ImgX,ImgY);
       }
       
       if(contador == 8){
         image(ganar,ImgX,ImgY,SizeX,SizeY);
         velocidad2 = 0;
         apagar(ImgX,ImgY);
       }
       
        image(matar,mouseX,mouseY,100,100); 
 }
 
 void resetear(int posX , int posY){
  
  //algoritmo para detectar la ubicacion del mouse y q haga algo
  if(mousePressed == true){
      if( mouseX >=posX  && mouseX <= posX+SizeX){
         if( mouseY >=posY && mouseY <= posY+SizeX){
             vidas = 5;
             velocidad = 2; 
             velocidad2 = 1;
           }      
       }
  }
}



 void apagar(int posX , int posY){
  
  //algoritmo para detectar la ubicacion del mouse y q haga algo
  if(mousePressed == true){
      if( mouseX >=posX  && mouseX <= posX+SizeX){
         if( mouseY >=posY && mouseY <= posY+SizeX){
             exit();
           }      
       }
  }
}


 
