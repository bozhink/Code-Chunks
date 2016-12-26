package animation;
/*--------------------------------------------------
* Animation.java
*
* Demonstrate simple animation using
* a Timer and TimerTask
*
* Example from the book:     Core J2ME Technology
* Copyright John W. Muchow   http://www.CoreJ2ME.com
* You may use/modify for any non-commercial purpose
*-------------------------------------------------*/  
import java.util.*;
import javax.microedition.lcdui.*;
import javax.microedition.midlet.*;

public class Animation extends MIDlet
{
  private Display  display;       // The display
  private AnimationCanvas canvas; // Canvas 
  private Timer tm;               // Timer
  private AnimateTimerTask tt;    // Task
 
  public Animation()
  {
    display = Display.getDisplay(this);
    canvas  = new AnimationCanvas(this);

    // Create task that fires off every 1/10 second    
    tm = new Timer();
    tt = new AnimateTimerTask(canvas);
    tm.schedule(tt, 0, 100);    
  }
 
  protected void startApp()
  {
    display.setCurrent(canvas);
  }
 
  protected void pauseApp()
  { }

  protected void destroyApp(boolean unconditional)
  { }
 
  public void exitMIDlet()
  {
    destroyApp(true);
    notifyDestroyed();
  }
}


/*--------------------------------------------------
* AnimateTimerTask.java
*
* Change location of bouncing ball on the canvas
*
* Example from the book:     Core J2ME Technology
* Copyright John W. Muchow   http://www.CoreJ2ME.com
* You may use/modify for any non-commercial purpose
*-------------------------------------------------*/  


class AnimateTimerTask extends TimerTask
{
  private AnimationCanvas canvas;
  
  public AnimateTimerTask(AnimationCanvas canvas)
  {
    this.canvas = canvas;
  }

  /*--------------------------------------------------
  * Determine next location of the ball.
  * If the ball reaches any edge, change the color
  * Track how many times we've switced directions
  *-------------------------------------------------*/  
  public final void run()
  {
    // If past the right edge or prior to left edge...
    if ((canvas.x_loc + canvas.radius +  canvas.x_dir > canvas.getWidth()) ||
        (canvas.x_loc - canvas.radius +  canvas.x_dir < 0))
    {                
      canvas.x_dir = -canvas.x_dir;
      canvas.changeColor();
      canvas.directionChanged++;
    }

    // If past the bottom or before the top...
    if ((canvas.y_loc + canvas.radius +  canvas.y_dir > canvas.getHeight()) ||
        (canvas.y_loc - canvas.radius + canvas.y_dir < 0))      
    {          
      canvas.y_dir = -canvas.y_dir;
      canvas.changeColor();
      canvas.directionChanged++;      
    }

    // Update the new x and y locations
    canvas.x_loc += canvas.x_dir;
    canvas.y_loc += canvas.y_dir;
 
    canvas.repaint();            
  }
}

/*--------------------------------------------------
* AnimationCanvas.java
*
* Show a ball that bounces around on a canvas 
* Each time we hit a wall we change the ball color
* We also clear the screen after 'n' number of
* hits against the wall
* The "left" and "right" keys change the ball size
* The "Fire" key resets the display, however,
* it leaves the ball size the same.
*
* Example from the book:     Core J2ME Technology
* Copyright John W. Muchow   http://www.CoreJ2ME.com
* You may use/modify for any non-commercial purpose
*-------------------------------------------------*/

class AnimationCanvas extends Canvas implements CommandListener
{
  private Animation midlet;         // Main midlet
  private Command cmExit;          // Exit midlet
  private int    keyFire,           // Reset ball            
                 keyRight,          // Increase ball radius
                 keyLeft;           // Decrease ball radius
  private boolean clearBackground = false; // Clear background
  private Random random;            // Random number
  int x_loc,                        // Current x & y locations
      y_loc,                        
      radius,                       // Ball radius
      red,                          // rgb colors
      green,                       
      blue,                       
      x_dir,                // Next x & y positions of ball
      y_dir,                
      start_x,              // Where ball starts 
      start_y,
      directionChanged = 0; // How many times we've hit a wall
  private static final int MAX_CHANGES = 50;

  /*--------------------------------------------------
  * Constructor
  *-------------------------------------------------*/
  public AnimationCanvas(Animation midlet)
  {
    // Save reference to main midlet
    this.midlet = midlet;

    random = new java.util.Random();
    
    // Determine starting location and direction of ball
    init();
    radius = 7;
    
    // Create exit command and "Fire" key
    cmExit = new Command("Exit", Command.EXIT, 1);

    keyFire =  getKeyCode(FIRE);
    keyRight = getKeyCode(RIGHT);
    keyLeft = getKeyCode(LEFT);
    
    addCommand(cmExit);
    setCommandListener(this);
  } 

  /*--------------------------------------------------
  * Paint a new ball, clearing the screen as asked
  *-------------------------------------------------*/
  protected void paint(Graphics g)
  {
    // Max edge hits, reset everything
    if (directionChanged > MAX_CHANGES)
      init();
    
    // Clear the background
    if (clearBackground)
    {
      g.setColor(255, 255, 255);
      g.fillRect(0, 0, getWidth(), getHeight());
      clearBackground = !clearBackground;
    }
    
    // Set color and draw another ball
    g.setColor(red, green, blue);                    
    g.fillArc( x_loc, y_loc, radius, radius, 0, 360);
  }

  /*--------------------------------------------------
  * Initialize starting location and direction of ball
  *-------------------------------------------------*/
  private void init()
  {
    // Start close to the middle
    x_loc = getWidth() / 2;
    y_loc = getHeight() / 2;      

    // The direction the ball is heading
    x_dir = (random.nextInt() % 10);
    if (x_dir == 0)  x_dir = 1;
    
    y_dir = (random.nextInt() % 10);
    if (y_dir == 0)  y_dir = 1;

    directionChanged = 0;    
    clearBackground = true;      
    changeColor();      
  }
  
  /*--------------------------------------------------
  * Change the colors.
  * I am counting on the implemention to substitute
  * a use-able color if any of these are out of the 
  * devices supported range
  *-------------------------------------------------*/
  protected void changeColor()
  {
    // The shift is to remove any sign (negative) bit    
    red = (random.nextInt() >>> 1) % 256;
    green = (random.nextInt() >>> 1) % 256;
    blue = (random.nextInt() >>> 1) % 256;
  }

  /*--------------------------------------------------
  * Event handling
  *-------------------------------------------------*/  
  public void commandAction(Command c, Displayable d)
  {
    if (c == cmExit)
      midlet.exitMIDlet();
  }

  /*--------------------------------------------------
  * Reset ball is "Fire" key is pressed
  *-------------------------------------------------*/  
  protected void keyPressed(int keyCode)
  {
    // Restart
    if (keyCode == keyFire)
      init();
    // Decrease ball size
    else if (keyCode == keyLeft)
      radius = Math.max(1, --radius);
    else if (keyCode == keyRight)
    // Increase ball size
     radius = Math.min(getWidth() / 4, ++radius);
  }
}