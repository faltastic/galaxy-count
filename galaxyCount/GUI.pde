
int btnH;
int btnW;
int x;
int y, statsY;

void initGUI() {
  
  cp5 = new ControlP5(this);
  List l = java.util.Arrays.asList(samples);

  btnH = 25;
  btnW = int(0.75*(width - imgW));
  x = imgW + int(0.125*(width - imgW)) ;
  y= btnH+5;
  
  stroke(0, 170, 255);
  line(imgW, 0, imgW, 810);
  noStroke();

  fill(0, 170, 255);
  textSize(17);
  text("GALAXY COUNT", x, y);

  y+= btnH;
  
  Group g3 = cp5.addGroup("g3")
    .setLabel("")
    .setPosition(x, y)
    .setSize(btnW, 6*btnH)
    .setBackgroundColor(color(0));

  cp5.addScrollableList("SampleList")
    .setPosition(0, 0)
    .setPosition(x, y)
    .setSize(btnW, 6*btnH)
    .setBarHeight(btnH)
    .setItemHeight(btnH)
    .addItems(l)
    .setType(ScrollableList.DROPDOWN) 
    .setOpen(true);

  y+= 8*btnH;              

  thresholdKnob = cp5.addKnob("thresholdValue")
    .setRange(0, 1)
    .setValue(0.5)
    .setPosition(20+x, y)
    .setRadius(2*btnH)
    .setDragDirection(Knob.VERTICAL);

  y+=5.5*btnH;
  
  cp5.addBang("FilterImage")
    .setLabel("Filter")
    .setPosition(x, y)
    .setSize(btnW/2-5, btnH);

  cp5.addBang("loadImage")
    .setLabel("unfilter")
    .setPosition(x+btnW/2, y)
    .setSize(btnW/2, btnH);

  y+= 2*btnH;  

  cp5.addBang("countBlobs")
    .setLabel("Count")
    .setPosition(x, y)
    .setSize(btnW, btnH);

  y+= 2*btnH;  

  cp5.addBang("FilterCountStats")
    .setLabel("Filter + Count + Statistics")
    .setPosition(x, y)
    .setSize(btnW, 2*btnH);

  statsY = y+4*btnH;
  
  cp5.addBang("saveCSV")
    .setLabel("Download Data")
    .setPosition(x, height-2*btnH)
    .setSize(btnW, btnH);
}

public void SampleList(int n) {
  imgName = samples[n];
  loadImage();
}

void thresholdValue(float theValue) {
  thresholdValue = theValue;
}