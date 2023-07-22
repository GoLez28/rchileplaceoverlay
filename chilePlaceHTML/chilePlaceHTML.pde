void setup () {
  PrintWriter output;
  output = createWriter("ChielanFlagPorcay.html");
  BufferedReader reader = createReader("firstHalf.txt");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      output.print(line + "\n");
    }
    reader.close();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
  output.close();
  int startIndex = 53;
  PImage img = loadImage("https://raw.githubusercontent.com/GoLez28/rchileplaceoverlay/main/placeChileTemplate.png");
  PVector coords = new PVector(830, 962);
  for (int y = 0; y < img.height; y++) {
    boolean newY = true;
    for (int x = 0; x < img.width; x++) {
      output.write("<tr>\n\t\t\t\t\t\t\t<td class=\"line-number\" value=\"" + startIndex + "\"/>\t\t\t\t\t\t\t<td class=\"line-content\">\n");
      if (newY) {
        if (y != 0)
          output.write("                  <span class=\"html-tag\">&lt;/div&gt;</span>");
        output.write("                  <span class=\"html-tag\">&lt;div <span class=\"html-attribute-name\">class</span>='<span class=\"html-attribute-value\">row</span>' <span class=\"html-attribute-name\">style</span>='<span class=\"html-attribute-value\">top: " + (y*8) + "px;</span>'&gt;</span>\n");
      }
      output.write("                  <span class=\"html-tag\">&lt;a <span class=\"html-attribute-name\">style</span>='<span class=\"html-attribute-value\">background-color: rgba(0.0,0.0,0.0,1.0);left: " + (x*8) + "px; pointer-events: none</span>' <span class=\"html-attribute-name\">class</span>='<span class=\"html-attribute-value\">square</span>' <span class=\"html-attribute-name\">href</span>='<a class=\"html-attribute-value html-external-link\" target=\"_blank\" href=\"https://new.reddit.com/r/place/?cx=" + (coords.x + x) + "&amp;cy=" + (coords.y + y) + "&amp;px=20\" rel=\"noreferrer noopener\">https://new.reddit.com/r/place/?cx=" + (coords.x + x) + "&amp;cy=" + (coords.y + y) + "&amp;px=20</a>' <span class=\"html-attribute-name\">onMouseOver</span>='<span class=\"html-attribute-value\">onTileHovered(" + x + ", " + y + ")</span>'&gt;</span>\n");
      output.write("                  <span class=\"html-tag\">&lt;/a&gt;</span>\n");
      output.write("</td></tr>");
      //output.write("[" + (int)(x + coords.x) + ", " + (int)(y + coords.y) + ", 1]");
      if (x < img.width-1) output.write(", ");
    }
  }
  output.close();
  exit();
}
