class HtmlParser{
  
  String html;
  
  HtmlParser(String htmlData)
  {
    html = htmlData;    
  }
  
  void getLostItems()
  {
     String[] htmlChunks = html.split("<td headers=\"Fundort\">"); 
     
     for(int i = 0; i < htmlChunks.length; i++)
     {
       println(htmlChunks[i]);
       String htmlChunk = htmlChunks[i];
       String place = htmlChunk.substring(0, htmlChunk.indexOf("</td>")).trim();
       String date = "";
       println(htmlChunk.indexOf("</td>") );
       date = htmlChunk.substring(htmlChunk.indexOf("<td headers=\"Funddatum\">")).trim();
       String dateee = date.substring(24, date.indexOf("</td>")).trim();
          
       println(dateee);
       println("..........................");
     }
     println(htmlChunks.length);
     
  }      
  
  
}

