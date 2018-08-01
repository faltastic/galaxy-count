TableRow thisRow;

void loadCSV() {

  dataCSV = loadTable("count.csv", "header");
  dataCSV.clearRows();

  for (int i=0; i< samples.length; i++) {
    dataCSV.setString(i, "Sample", samples[i]); 
    dataCSV.setInt(i, "id", i);
  }
  saveTable(dataCSV, "data/count.csv");

  imgName = samples[0];    // load first image
  pickRow();
}

TableRow pickRow() {
  for (TableRow row : dataCSV.matchRows(imgName, "Sample")) {
    thisRow = row;
  }
  return thisRow;
}

void updateCSV() {

  thisRow = pickRow();

  thisRow.setInt("Count", N);
  thisRow.setFloat("MeanSize", mean);
  thisRow.setFloat("StdDev", stdDev);
  thisRow.setFloat("MedianSize", median);
  thisRow.setFloat("Smallest", dMin);
  thisRow.setFloat("Biggest", dMax);

  // temp save
  String timeNow = month() +"-"+ day() + "/"+hour() +"h"+ minute() +"m";
  saveTable(dataCSV, "data/" + timeNow +".csv");
}


void saveCSV() {
  String timeNow = month() +"-"+ day() + " at "+hour() +"h"+ minute() +"m";
  saveTable(dataCSV, "data/count "+timeNow+".csv");
}


String[] listFileNames(String dir) {
  File file = new File(dataPath(dir));
  if (file.isDirectory()) {
    String allNames[] = file.list();
    String names[]= {};
    for (String n : allNames) {
      // pick only jpg or png files
      if ( n.indexOf(".jpg") > 0 || n.indexOf(".png") > 0) {
        names = append(names, n);
      }
    }  
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}