PImage in;
PImage out;
PImage osu;
void setup () {
  //load gimp render
  in = loadImage("overlayPre.png");
  //create output image
  out = createImage(in.width*3, in.height*3, ARGB);
  out.loadPixels();
  //clear output
  for (int i = 0; i < out.pixels.length; i++) {
    out.pixels[i] = color(0, 0);
  }
  in.loadPixels();
  //copy render to out by 3
  for (int y = 1; y < in.height; y++) {
    for (int x = 1; x < in.width; x++) {
      int xx = x*3+1 -3;
      int yy = y*3+1 -3;
      out.pixels[xx+yy*out.width] = in.pixels[x+y*in.width];
    }
  }
  //add the original template
  osu = loadImage("dotted-place-template.png");
  osu.loadPixels();
  for (int y = 1; y < out.height; y++) {
    for (int x = 1; x < out.width; x++) {
      color osc =  osu.pixels[x+y*osu.width];
      color outc =  out.pixels[x+y*out.width];
      if (alpha(osc) > 1 && alpha(outc) < 1)
        out.pixels[x+y*out.width] = osc;
    }
  }
  out.updatePixels();
  //save
  out.save("overlayPost.png");
  exit();
}
