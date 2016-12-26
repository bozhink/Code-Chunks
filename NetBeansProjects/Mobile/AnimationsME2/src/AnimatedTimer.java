/*--------------------------------------------------
 * AnimatedTimer - Main midlet.
 * Shows canvas with an animated timer. Includes
 * configuration options to start/stop the timer
 * and to adjust the sleep interval of the thread
 *
 * Example from the book:     Core J2ME Technology
 * Copyright John W. Muchow   http://www.CoreJ2ME.com
 * You may use/modify for any non-commercial purpose 
 *-------------------------------------------------*/

import java.util.Stack;

import javax.microedition.lcdui.Alert;
import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.Form;
import javax.microedition.lcdui.Gauge;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.List;
import javax.microedition.midlet.MIDlet;

public class AnimatedTimer extends MIDlet {
  private Display display; // The display

  protected TimerCanvas cvTimer; // Canvas to display timer

  protected OptionsList lsOptions; // List to change timer options

  protected SleepForm fmSleep; // Form with gauge to set timer sleep

  protected DisplayManager displayMgr; // Class to help manage screens

  public AnimatedTimer() {
    display = Display.getDisplay(this);
    cvTimer = new TimerCanvas(this);
    lsOptions = new OptionsList("Timer options", List.IMPLICIT, this);
    fmSleep = new SleepForm("Adjust sleep", this);

    // Create a display manager object
    displayMgr = new DisplayManager(display, cvTimer);
  }

  protected void startApp() {
    // Start with the canvas
    display.setCurrent(cvTimer);
  }

  protected void pauseApp() {
  }

  protected void destroyApp(boolean unconditional) {
  }

  public void exitMIDlet() {
    destroyApp(true);
    notifyDestroyed();
  }
}

/*--------------------------------------------------
 * Use a stack to push and pop displayable objects
 *
 * public void pushDisplayable(Displayable)
 * public void popDisplayable()
 * public void home()  
 *
 * Example from the book:     Core J2ME Technology
 * Copyright John W. Muchow   http://www.CoreJ2ME.com
 * You may use/modify for any non-commercial purpose 
 *-------------------------------------------------*/

class DisplayManager extends Stack {
  private Display display; // Reference to Display object

  private Displayable mainDisplayable; // Main displayable for MIDlet

  private Alert alStackError; // Alert for error conditions

  /*--------------------------------------------------
   * Display manager constructor
   *-------------------------------------------------*/
  public DisplayManager(Display display, Displayable mainDisplayable) {
    // Only one display object per midlet, this is it
    this.display = display;
    this.mainDisplayable = mainDisplayable;

    // Create an alert displayed when an error occurs
    alStackError = new Alert("Displayable Stack Error");
    alStackError.setTimeout(Alert.FOREVER); // Modal
  }

  /*--------------------------------------------------
   * Push the current displayable onto stack and set
   * the passed in displayable as active
   *-------------------------------------------------*/
  public void pushDisplayable(Displayable newDisplayable) {
    push(display.getCurrent());
    display.setCurrent(newDisplayable);
  }

  /*--------------------------------------------------
   * Return to the main displayable object of MIDlet
   *-------------------------------------------------*/
  public void home() {
    while (elementCount > 1)
      pop();
    display.setCurrent(mainDisplayable);
  }

  /*--------------------------------------------------
   * Pop displayable from stack and set as active
   *-------------------------------------------------*/
  public void popDisplayable() {
    // If the stack is not empty, pop next displayable
    if (empty() == false)
      display.setCurrent((Displayable) pop());
    else
      // On error show an alert
      // Once acknowledged, set 'mainDisplayable' as active
      display.setCurrent(alStackError, mainDisplayable);
  }
}

/*--------------------------------------------------
 * Class TimerCanvas
 *
 * Animate a sequence of images to simulate 
 * a moving timer
 *
 * Example from the book:     Core J2ME Technology
 * Copyright John W. Muchow   http://www.CoreJ2ME.com
 * You may use/modify for any non-commercial purpose 
 *-------------------------------------------------*/

class TimerCanvas extends Canvas implements Runnable, CommandListener {
  private AnimatedTimer midlet; // Main midlet

  private Command cmExit; // Exit midlet

  private Command cmOptions; // Display options list

  private Image im = null; // Sequence of images

  private int imageCount = 4; // Four images in the sequence

  private int imageWidth; // Width of one image in the sequence

  private int imageHeight; // Height of one image in the sequence

  private int imageIndex; // Current image in the sequence

  private int translate_x; // Translated x and y

  private int translate_y;

  private int viewport_x; // Location of the viewport

  private int viewport_y;

  private boolean active = false; // Timer active?

  private boolean requestedToStop = false; // Did user request to stop timer

  private int sleepTime = 400; // Current sleep time (milliseconds)

  public TimerCanvas(AnimatedTimer midlet) {
    // Call canvas constructor
    super();

    // Save reference to MIDlet so we can
    // access the display manager class
    this.midlet = midlet;

    // Create commands & listen for events
    cmExit = new Command("Exit", Command.EXIT, 1);
    cmOptions = new Command("Config", Command.SCREEN, 2);
    addCommand(cmExit);
    addCommand(cmOptions);
    setCommandListener(this);
  }

  /*--------------------------------------------------
   * Application manager is about to display canvas
   *-------------------------------------------------*/
  protected void showNotify() {
    if (im == null) {
      try {
        // Read the png from a file and get width and
        // height of one image in the sequence
        im = Image.createImage("/timer.png");
        imageHeight = im.getHeight();
        imageWidth = im.getWidth() / imageCount;

        // Get the coordinates for x/y of viewport
        // Viewport is centered on the display
        viewport_x = (getWidth() / 2) - (imageWidth / 2);
        viewport_y = (getHeight() / 2) - (imageHeight / 2);

        // Set first translated coordinate to match viewport
        translate_x = viewport_x;
        translate_y = viewport_y;
      } catch (Exception e) {
        System.err.println("Unable to read png file.");
      }

      // Begin with the first image in the sequence
      imageIndex = 0;
    }

    // If the user has not requested to stop the timer...
    if (!requestedToStop)
      active = true;

    new Thread(this).start();
  }

  /*--------------------------------------------------
   * Application manager is no longer displaying canvas
   *-------------------------------------------------*/
  protected void hideNotify() {
    active = false;
  }

  /*--------------------------------------------------
   * Draw next timer in sequence
   *-------------------------------------------------*/
  protected void paint(Graphics g) {
    if (im != null) {
      // Due to a bug in MIDP 1.0.3 we need to
      // force a clear of the display
      g.setColor(255, 255, 255); // White pen
      g.fillRect(0, 0, getWidth(), getHeight());
      g.setColor(0, 0, 0); // Black pen

      // Viewport at center of display
      g.setClip(viewport_x, viewport_y, imageWidth, imageHeight);

      // Draw image at translated coordinates
      g.drawImage(im, translate_x, translate_y, Graphics.TOP
          | Graphics.LEFT);
    }
  }

  /*--------------------------------------------------
   * Loop forever, translating image coordinates
   *-------------------------------------------------*/
  public void run() {
    try {
      while (active) {
        Thread.sleep(sleepTime);
        repaint();

        // Reached the last image in sequence
        if (imageIndex == imageCount - 1) {
          // Reset translated coordinates
          translate_x = viewport_x;
          translate_y = viewport_y;
        } else {
          // Translate coordinate system to the left
          translate_x -= imageWidth;
        }

        // Which image in the sequence is next
        imageIndex = (imageIndex + 1) % imageCount;
      }
    } catch (InterruptedException e) {
    }
  }

  /*--------------------------------------------------
   * Called from the "Config" options menu
   *-------------------------------------------------*/
  public void startTimer() {
    requestedToStop = false;
    active = true;
    repaint();
  }

  /*--------------------------------------------------
   * Called from the "Config" options menu
   *-------------------------------------------------*/
  public void stopTimer() {
    requestedToStop = true;
    active = false;
    repaint();
  }

  /*--------------------------------------------------
   * Called from form/gauge to adjust sleep
   *-------------------------------------------------*/
  public void setSleep(int sleepTime) {
    this.sleepTime = sleepTime;
  }

  /*--------------------------------------------------
   * Called from form/gauge to adjust sleep
   *-------------------------------------------------*/
  public int getSleep() {
    return sleepTime;
  }

  /*--------------------------------------------------
   * Command event handling
   *-------------------------------------------------*/
  public void commandAction(Command c, Displayable s) {
    if (c == cmOptions) {
      // Push current displayable and show the options list
      midlet.displayMgr.pushDisplayable(midlet.lsOptions);
    } else if (c == cmExit) {
      midlet.exitMIDlet();
    }
  }
}

/*--------------------------------------------------
 * Class SleepForm
 *
 * Form with gauge to adjust sleep interval of timer
 *
 * Example from the book:     Core J2ME Technology
 * Copyright John W. Muchow   http://www.CoreJ2ME.com
 * You may use/modify for any non-commercial purpose 
 *-------------------------------------------------*/

class SleepForm extends Form implements CommandListener {
  private AnimatedTimer midlet; // Main midlet

  private Command cmBack, // Back to options list
      cmHome, // Go to main displayable (canvas)
      cmSave; // Save new sleep time

  private Gauge gaSleep; // Gauge to adjust sleep

  public SleepForm(String title, AnimatedTimer midlet) {
    // Call the form constructor
    super(title);

    // Save reference to MIDlet so we can
    // access the display manager class
    this.midlet = midlet;

    // Commands
    cmSave = new Command("Save", Command.SCREEN, 1);
    cmBack = new Command("Back", Command.BACK, 2);
    cmHome = new Command("Home", Command.SCREEN, 2);

    // Gauge to adjust the length of timer sleep
    gaSleep = new Gauge("Timer Sleep", true, 100, 1000);

    // Set to current sleep. Gauge holds values 0 to 100,
    // divide the current sleep (milliseconds) by 10
    gaSleep.setValue(midlet.cvTimer.getSleep() / 10);

    // Add to form and listen for events
    append(gaSleep);
    addCommand(cmSave);
    addCommand(cmBack);
    addCommand(cmHome);
    setCommandListener(this);
  }

  /*--------------------------------------------------
   * Command event handling
   *-------------------------------------------------*/
  public void commandAction(Command c, Displayable s) {
    if (c == cmSave) {
      // Gauge returns a value between 0 and 100
      // We want milliseconds, so multiply by 10
      midlet.cvTimer.setSleep(gaSleep.getValue() * 10);

      // Return to main midlet
      midlet.displayMgr.home();

    } else if (c == cmBack) {
      // Pop the last displayable off the stack
      midlet.displayMgr.popDisplayable();
    } else if (c == cmHome) {
      // Return to main midlet
      midlet.displayMgr.home();
    }
  }
}

/*--------------------------------------------------
 * Class OptionsList
 *
 * List to provide options for configuring of timer
 *
 * Example from the book:     Core J2ME Technology
 * Copyright John W. Muchow   http://www.CoreJ2ME.com
 * You may use/modify for any non-commercial purpose 
 *-------------------------------------------------*/

class OptionsList extends List implements CommandListener {
  private AnimatedTimer midlet; // Main midlet

  private Command cmBack;

  public OptionsList(String title, int listType, AnimatedTimer midlet) {
    // Call list constructor
    super(title, listType);

    // Save reference to MIDlet so we can
    // access the display manager class
    this.midlet = midlet;

    // Create the list entries
    append("Sleep interval", null);
    append("Start", null);
    append("Stop", null);

    // Create command and listen for events
    cmBack = new Command("Back", Command.BACK, 1);
    addCommand(cmBack);
    setCommandListener(this);
  }

  /*--------------------------------------------------
   * Command event handling
   *-------------------------------------------------*/
  public void commandAction(Command c, Displayable s) {
    // Event generated by the implicit list
    if (c == List.SELECT_COMMAND) {
      switch (getSelectedIndex()) {
      case 0:
        // Push current displayable and show the form
        // to adjust the timer sleep
        midlet.displayMgr.pushDisplayable(midlet.fmSleep);
        break;

      case 1:
        // Start timer and return to previous displayable
        midlet.cvTimer.startTimer();
        midlet.displayMgr.popDisplayable();
        break;

      case 2:
        // Stop timer and return to previous displayable
        midlet.cvTimer.stopTimer();
        midlet.displayMgr.popDisplayable();
        break;
      }
    } else if (c == cmBack) {
      // Return to previous displayable
      midlet.displayMgr.popDisplayable();
    }
  }
}