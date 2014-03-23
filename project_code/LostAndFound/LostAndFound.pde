/*Testing access to fundbureau page*/
//
import simpleML.*;

HTMLRequest source1;

String htmlsource1 = "";
int interval = 10000;

// we'll use this for timing in draw()
float startTime;

// is the requested HTML data ready yet?
boolean gotnew = false;

// setup the basics
void setup() {
  size(500, 500);
  smooth();
 // frameRate(fps);
  source1 = new HTMLRequest(this,"http://fundsuche02.kivbf.de/MyApp.asp?wci=FundHeader&Mdt=berlin-ZFB&format=&PLZ=12101&KM=50&KATEGORIE=%7BA26562A9-1100-4783-B043-7EF641A665DA%7D&DATUM=08.01.2014&ANZAHLMERKMALE=2&T1=&C1=&T2=&C2=WWFWF%7BB59B1303-73FB-45BF-9F6A-5B8E7442F1BC%7D&MerkmaleData=");  
  source1.makeRequest();  
}

// draw it out
void draw() {
  
  float now = millis();

  if (now > startTime + interval) {
    source1.makeRequest();   
    startTime = now;
  }
  
  if (gotnew) {    
    gotnew = false;
  }
}

void netEvent(HTMLRequest r) {
  htmlsource1 = source1.readRawSource();
  //println(htmlsource1); 
  HtmlParser prser = new HtmlParser(htmlsource1);
  //println(prser);
  prser.getLostItems();
  gotnew = true;
}




