import java.lang.*;

PImage firstSampleImage,secondSampleImage, thirdSampleImage, fourthSampleImage;
float gx = 0;
float gy =0;
float Magnitude =0;
float angle =0;
float num =0;
float deno=0;
float deno1=0;
float deno2=0;
float result =0;
float [][] Image1= new float [81][16];
float [][] Image2= new float [81][16];

void setup()
{
  size(1200,1000);
  
  firstSampleImage = loadImage("Sig2.jpg");
  secondSampleImage = loadImage("Sig5.jpg");
  
  firstSampleImage.resize(600,400);
  firstSampleImage.loadPixels();
  thirdSampleImage=Gray_convertion(firstSampleImage);
  secondSampleImage.resize(600,400);
  secondSampleImage.loadPixels();
  fourthSampleImage=Gray_convertion(secondSampleImage);
  
  image(thirdSampleImage, 0, 0) ;
  image(fourthSampleImage,600,400) ;
  
  tuppleForFirstImage = tuppleCalculation(thirdSampleImage); 
  tuppleForSecondImage = tuppleCalculation(fourthSampleImage);
  
  similarityFactor = similarityCalculation (tuppleForFirstImage,tuppleForSecondImage);
  printResult(similarityFactor);
  
}

float [] [] tuppleCalculation(PImage img)
{
  float[][] horizonatalFilter = {{ -1, -2, -1 }, 
                             {0, 0, 0 }, 
                            { 1, 2, 1 }};

  float[][] verticalFilter  = {{ -1, 0, 1 }, 
                         { -2, 0, 2 }, 
                         { -1, 0, 1}};

  float [][] magnitudeMatrix = new float [img.height-2][img.width-2];
  float [][] angleMatrix = new float [img.height-2][img.width-2];


  for (int y = 1; y < img.height-1; y++) 
    for (int x = 1; x < img.width-1; x++){
      float gx = 0;
      float gy =0;
      float magnitudeAbsolute =0;
      float angle =0;
        for (int ky = -1; ky <= 1; ky++) 
        for (int kx = -1; kx <= 1; kx++){
          int index = (y + ky) * img.width + (x + kx);  
          float r = brightness(img.pixels[index]);
          gy += horizonatalFilter [ky+1][kx+1] * r;
          gx += verticalFilter [ky+1][kx+1] * r;  
        }

      magnitudeAbsolute = abs (gx)+abs (gy);
      magnitudeMatrix[y -1][x -1]= magnitudeAbsolute;
      
      angle= atan2 (gy, gx);
      if (angle<0.0){
		  angle +=TWO_PI;
		}
      angleMatrix[y -1][x -1]= angle;
    }
	updatePixels();
  
  float [][] tuppleMatrixMatrix =new float [(img.height -2)*(img.width-2)][16];
  float [][] blockTupple= new float [81][16];
  float e0=0,e1=0,e2=0,e3=0,e4=0,e5=0,e6=0,e7=0,e8=0,e9=0,e10=0,e11=0,e12=0,e13=0,e14=0,e15=0;
  int indexForBlockTupple =0;
  
  for (int y = 0; y <img.height-2; y++) 
    for (int x = 0; x < img.width-2; x++){
      int index = (y) * (img.width-2)+ (x);
	  {
        if (angleMatrix[y][x]> 0 && angleMatrix[y][x]<(0.3926991))
        {
          e0=magnitudeMatrix[y][x];
          e1=0;
          e2=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e7=0;
          e8=0;
          e9=0;
          e10=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        } 
        else if (angleMatrix[y ][x]>(0.3926991) && angleMatrix[y ][x ]<(0.785398))
        {
          e1=magnitudeMatrix[y][x];
          e0=0;
          e2=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e7=0;
          e8=0;
          e9=0;
          e10=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y ][x ]>(0.785398) && angleMatrix[y ][x]<(1.178097))
        {
          e2=magnitudeMatrix[y][x ];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e7=0;
          e8=0;
          e9=0;
          e10=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        } 
        else if (angleMatrix[y][x]>(1.178097) && angleMatrix[y][x]<(1.5708))
        {
          e3=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e2=0;
          e4=0;
          e5=0;
          e6=0;
          e7=0;
          e8=0;
          e9=0;
          e10=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(1.5708) && angleMatrix[y][x]<(1.9634954))
        {
          e4=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e2=0;
          e5=0;
          e6=0;
          e7=0;
          e8=0;
          e9=0;
          e10=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(1.9634954) && angleMatrix[y][x]<(2.35619))
        {
          e5=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e2=0;
          e6=0;
          e7=0;
          e8=0;
          e9=0;
          e10=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(2.35619) && angleMatrix[y][x]<(2.7488936))
        {
          e6=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e5=0;
          e2=0;
          e7=0;
          e8=0;
          e9=0;
          e10=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(2.7488936) && angleMatrix[y][x]<(3.14159))
        {
          e7=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e2=0;
          e8=0;
          e9=0;
          e10=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(3.14159) && angleMatrix[y][x]<(3.5342917))
        {
          e8=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e2=0;
          e7=0;
          e9=0;
          e10=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(3.5342917) && angleMatrix[y][x]<(3.92699))
        {
          e9=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e2=0;
          e7=0;
          e8=0;
          e10=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(3.92699) && angleMatrix[y][x]<(4.3196899))
        {
          e10=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e2=0;
          e7=0;
          e8=0;
          e9=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(4.3196899) && angleMatrix[y][x]<(4.71239))
        {
          e11=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e2=0;
          e7=0;
          e8=0;
          e9=0;
          e10=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(4.71239) && angleMatrix[y][x]<(5.1050881))
        {
          e12=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e2=0;
          e7=0;
          e8=0;
          e9=0;
          e10=0;
          e12=0;
          e13=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(5.1050881) && angleMatrix[y][x]<(5.49779))
        {
          e13=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e2=0;
          e7=0;
          e8=0;
          e9=0;
          e11=0;
          e12=0;
          e10=0;
          e14=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(5.49779) && angleMatrix[y][x]<(5.8904862))
        {
          e14=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e2=0;
          e7=0;
          e8=0;
          e9=0;
          e11=0;
          e12=0;
          e13=0;
          e10=0;
          e15=0;
        }
        else if (angleMatrix[y][x]>(5.8904862) && angleMatrix[y][x]<(6.28319))
        {
          e15=magnitudeMatrix[y ][x];
          e0=0;
          e1=0;
          e3=0;
          e4=0;
          e5=0;
          e6=0;
          e2=0;
          e7=0;
          e8=0;
          e9=0;
          e11=0;
          e12=0;
          e13=0;
          e14=0;
          e10=0;
        }
      }
     
      tuppleMatrix[index][0]= e0;
      tuppleMatrix[index][1]= e1;
      tuppleMatrix[index][2]= e2;
      tuppleMatrix[index][3]= e3;
      tuppleMatrix[index][4]= e4;
      tuppleMatrix[index][4]= e5;
      tuppleMatrix[index][6]= e6;
      tuppleMatrix[index][7]= e7;
      tuppleMatrix[index][8]= e8;
      tuppleMatrix[index][9]= e9;
      tuppleMatrix[index][10]= e10;
      tuppleMatrix[index][11]= e11;
      tuppleMatrix[index][12]= e12;
      tuppleMatrix[index][13]= e13;
      tuppleMatrix[index][14]= e14;
      tuppleMatrix[index][15]= e15;
     

      int p = 9 * x/img.width;
      int q = 9 * y/img.height;
      indexForBlockTupple = q * 9 + p;

      blockTupple [indexForBlockTupple][0] += tuppleMatrix[index][0];
      blockTupple [indexForBlockTupple][1] += tuppleMatrix[index][1];
      blockTupple [indexForBlockTupple][2] += tuppleMatrix[index][2];
      blockTupple [indexForBlockTupple][3] += tuppleMatrix[index][3];
      blockTupple [indexForBlockTupple][4] += tuppleMatrix[index][4];
      blockTupple [indexForBlockTupple][5] += tuppleMatrix[index][5];
      blockTupple [indexForBlockTupple][6] += tuppleMatrix[index][6];
      blockTupple [indexForBlockTupple][7] += tuppleMatrix[index][7];
      blockTupple [indexForBlockTupple][8] += tuppleMatrix[index][8];
      blockTupple [indexForBlockTupple][9] += tuppleMatrix[index][9];
      blockTupple [indexForBlockTupple][10] += tuppleMatrix[index][10];
      blockTupple [indexForBlockTupple][11] += tuppleMatrix[index][11];
      blockTupple [indexForBlockTupple][12] += tuppleMatrix[index][12];
      blockTupple [indexForBlockTupple][13] += tuppleMatrix[index][13];
      blockTupple [indexForBlockTupple][14] += tuppleMatrix[index][14];
      blockTupple [indexForBlockTupple][15] += tuppleMatrix[index][15];
   }
  return blockTupple ;
}

PImage  Gray_convertion(PImage img)
{

  for (int y = 0; y < img.height; y++)
    for (int x = 0; x < img.width; x++){
    int imgIndex = x + y * img.width;
    float r = red (img.pixels[imgIndex]);
    float g = green(img.pixels[imgIndex]);
    float b = blue(img.pixels[imgIndex]);      
    img.pixels[imgIndex]= color(0.21*r + 0.72*g + 0.07*b);
    }
  updatePixels();
  return img;
}

float  similarityCalculation (float [][]Image1,float[][] Image2)
{
 for (int y = 0; y < 81; y++) 
    for (int x = 0; x < 16; x++){
      numerator  +=   (Image1 [y][x] * Image2 [y][x]) ;
      denomenatorFirstTerm  += (Image1 [y][x])*(Image1 [y][x]);
      denomenatorSecondTerm  += (Image2 [y][x])*(Image2 [y][x]) ; 
    }
  denomenator  = ( sqrt(denomenatorFirstTerm) * sqrt(denomenatorSecondTerm) );
  return (numerator/denomenator);
}

void printResult (Float result )
{
    if ((result*100) > 75 ){
		System.out.println("The signature given in ImageB belongs to a person whose signature is given in ImageA.Similarity Factor is  "+ (result*100) +" %");
	} else {
		System.out.println("The signature given in ImageB does not belongs to a person whose signature is given in ImageA.Similarity Factor is "+ (result*100) +" %");
	}
}
