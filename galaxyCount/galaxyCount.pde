/* 
 * Galaxy Count 
 * by Youssef Faltas 01/2018
 *
 * Blob Detection for a collection of image samples
 * Integrated count Statistics in csv format
 *
 */

import blobscanner.*;
import controlP5.*;
import java.util.*;

ControlP5 cp5;
Knob thresholdKnob;
Detector bd;

Table dataCSV;

String[] samples;
String imgName;
PImage img;  // 4x3 photos

int imgW = 1024;
int imgWOriginal = 2048;
float thresholdValue = 0.5;

int[] blobSizes;
int N;
float massRatio;

void setup() {

  size(1224, 768);
  smooth();
  background(0);
    
  samples = listFileNames("samples"); 

  File csvFile = new File(dataPath("count.csv"));
  if (csvFile.exists()) {
    
    println("Galaxy Count");
    println("Loading ... \n");
    
    loadCSV();
    
    // load first image
    imgName = samples[0];   
    loadImage();

    // Setup Blob Detector
    img.loadPixels();
    bd = new Detector( this, 255 );

    // Load the GUI
    initGUI();
  } 
  else
  { // no CSV file
    fill(0, 170, 255);
    text("Error!", 100, height/2);
    text( "No file at: data/count.csv", 100, height/2+30);
  }
}

void draw() {
  // nothing to draw
}

//////////////////////
// Main Functions
//////////////////////

// Load Image Preview
void loadImage() {

  String imgPath= "samples/"+ imgName;
  File f = new File(dataPath(imgPath));
  if (f.exists()) {
    img = loadImage(imgPath); 
    img.resize(imgW, 0);
    image(img, 0, 0);
  } else { // no image
    fill(0);
    rect(0, 0, imgW, height);
    fill(0, 170, 255);
    text("Error!", 100, height/2);
    text( "No Image at: "+imgPath, 100, height/2+30);
  }
}

// Filter Image 
void FilterImage() { 
  loadImage();
  img.filter(THRESHOLD, thresholdValue );
  image(img, 0, 0);
}

// Calculates and Displays Blob Count
void countBlobs() {

  bd = new Detector( this, 255 );

  bd.findBlobs(img.pixels, img.width, img.height);
  N = bd.getBlobsNumber();

  bd.drawContours(color(0, 170, 255), 1);
  rectMode(CORNER);
  fill(0);
  rect(1050, statsY-20, 200, 200);
  fill(0, 170, 255);
  textSize(16);
  text("Blobs     " + N, 1050, statsY);
}

// Calcuates and Displays Stats
void getBlobStats() {

  bd.loadBlobsFeatures();
  blobSizes = new int[N];

  for (int i = 0; i < N; i++) {
    blobSizes[i] = bd.getBlobWidth(i)*bd.getBlobHeight(i);
  }

  calcStats(blobSizes);

  massRatio = bd.getGlobalWeight();
  massRatio = 1000*massRatio/(imgW*height) ;

  text("Mean     "+ nf(mean, 3, 3), 1050, statsY+30);
  text("Density  "+ nf(massRatio, 1, 4), 1050, statsY+60);
  //text("(x 1000)", 1050, statsY+90);
}


// Filters Image, 
// Calculates Stats, 
// and Updates Data

void FilterCountStats() {

  FilterImage();
  countBlobs();
  getBlobStats();
  updateCSV();
  
}