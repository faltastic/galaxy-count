float mean = 0;
float stdDev = 0;
float median;
float dMin, dMax;

float pxScale = imgWOriginal/imgW;

void calcStats(int[] d) {

  int dSize = d.length;
  println();
  println( "N: " + dSize);

  // calculate stats only if N > 2
  if (N > 2) {
    
    for (int a : d) {
      mean += a;
    }
    mean = mean/dSize;
    println("mean: " + mean);

    for (int a : d) {
      stdDev += (a-mean)*(a-mean);
    }
    stdDev = sqrt(stdDev/(dSize-1));
    println("std dev: " + stdDev);

    d=sort(d);
    dMin = d[0];
    dMax = d[dSize-1];
    println("min, max:  " + dMin + ", " + dMax);

    if (dSize % 2 == 0) {
      median = (d[(dSize/2) - 1] + d[dSize/2]) / 2;
    } else {
      median = d[dSize/2];
    }
    println("median: " + median);
    
    // original scale
    mean *= pxScale;
    stdDev *= pxScale;
    dMin *= pxScale;
    dMax *= pxScale;
    median *= pxScale;
  } 
  
  else {
    mean =0;
    stdDev =0;
    dMin =0;
    dMax =0;
    median =0;
  }
}