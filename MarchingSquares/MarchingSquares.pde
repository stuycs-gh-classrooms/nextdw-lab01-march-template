/*================================
  When run, this program should display an image and
  modify it according to the following keyboard commands:

  `r`: reset back to the original image.
  `h`: toggle highlight red value display.
  `i`: toggle display of the image.
  'd': toggle display of marching square dots.
  'm': toggle display of marching square lines.
================================*/

//Leave these constants alone.
int DOT_RESOLUTION = 20;
String PICFILE = "us-temps.png";

//Driver variables
//The booleans control what processing will be doing during draw()
PImage art;
boolean showDots;
boolean showLines;
boolean showImage;
int resolution;

/*================================
  You should leave setup alone.
================================*/
void setup() {
  size(770, 550);
  showDots = false;
  showLines = false;
  showImage = true;
  resolution = DOT_RESOLUTION;
  art = loadImage(PICFILE);
  art.loadPixels();
}//setup

/*================================
  draw() should display different things based on the
  values of the boolean driver variables. For example, if
  showImage is true, then draw the current value of art, if
  showDots is true, run the dots() method (which should draw
  circles to the screen).
  Theses options are NOT mutually exclusive. i.e. showImage,
  and showLines could both be true, so we would see the image
  and the lines.
  If showDots or showLines is true, also call displayResolution()
================================*/
void draw() {
  background(255);
  image(art, 0, 0);
}//draw

/*================================
  keyPressed
  `r`: reset back to the original image.
  `h`: run highlightRed, should modify art
  `i`: toggle showImage true/false
  'd': toggle showDots true/false
  'm': toggle showLines true/false
  UP ARROW (keyCode == UP): Decrease the value of resolution (thus increasing the sample size).
                            Do not go below 2.
  DOWN ARROW (keyCode == DOWN):  Increase the value of resolution (thus decreasing the sample size).

  Do not work on UP or DOWN until after you have completed all the methods.
================================*/
void keyPressed() {
  if (key == 'r') {
    art = loadImage(PICFILE);
    art.loadPixels();
  }//reset imag
}//keyPressed


//These two methods are provided for untility
/*================================
  Return the grayscale value of the parameter color.

  Note this method returns an int, not a color.
================================*/
int calculateGray(color c) {
  int g = int((red(c) + green(c) + blue(c)))/3;
  return g;
}//calculateGray
/*================================
  Returns the correct pixel index for img based
  on the provided x and y values.
================================*/
int getIndexFromXY(int x, int y, PImage img) {
  return y * img.width + x;
}//getIndexFromXY


/*================================
  Returns true if the pixel at x,y has a significant red value.
  We will deifne a significant red value if the red color component
  is greater than the average of all the color components.
================================*/
boolean aboveRedThreshold(int x, int y, PImage img) {
  color c = img.pixels[getIndexFromXY(x, y, img)];
  //check if the red value is higher than the others
  return red(c) > calculateGray(c);
}//aboveRedThreshold


/*================================
  Return a new PImage based on the paramter.

  If a pixel has a significant red value (as defined above in
  aboveRedThreshold), the new pixel should retain the original
  red color value, with blue and green set to its gray value.

  If a pixel does not have a significant red value, then
  the new pixel should just be the gray value.
================================*/
PImage highlightRed(PImage img) {
  PImage newImg = new PImage(img.width, img.height);
  newImg.loadPixels();
  return newImg;
}//higlightRed

/*================================
  Look at each pixel in img resolution spaces across
  in both x and y.
  i.e. if resolution is 20, then look at pixels (0, 0),
  (20, 0), (40, 0) ... (0, 20), (20, 20), (40, 20) ...

  If the pixel being examined has a significant red value,
  draw a red circle at (x, y).
  If the pixel does not have a significant red value,
  draw a blue circle at (x, y).
  The diameter of the circle should be half the value of
  resolution.

  Note this method does not modify img.
================================*/
void dots(PImage img, int resolution) {
}//dots

/*================================
  Draw a rectangle at the top left corner
  of the screen and display the current value of resolution.
================================*/
void displayResolution() {

}//displayResolution

/*================================
  Imagine that (x, y) is the upper-left corner of a square
  with sides of length resolution.
  The neighbors of (x, y) are the pixels that represent the
  other three corners of the square.
  i.e. The neighbors of (0, 0) with a resolution of 20 are
  (20, 0), (20, 20), and (0, 20).

  Return an array of 4 boolean values, which should represent
  if the pixel, and each of its neighbors have a significant
  red value.
================================*/
boolean[] getNeighbors(int x, int y, PImage img, int resolution) {
  boolean[] neighbors = new boolean[4];
  return neighbors;
}//getNeighbors

/*================================
  Draw the appropriate marching square line for the square with
  an upper-left corner at (x, y) and side length of resolution.

  grid is an array of boolean values to be used to base the line
  to be drawn on.

  Use the provided reference image of gird options to lines as
  your guide.
================================*/
void drawMarchingLine(int x, int y, boolean[] grid, int resolution) {

}//drawMarchingLine

/*================================
  Look at each pixel in img resolution spaces across
  in both x and y.
  i.e. if resolution is 20, then look at pixels (0, 0),
  (20, 0), (40, 0) ... (0, 20), (20, 20), (40, 20) ...

  Use getNeighbors() and drawMarchingLine() to perform
  the marching squares algorithm.

  be careful to not go out of bounds of the image.
================================*/
void march(PImage img, int resolution, color edge) {

}//dots
