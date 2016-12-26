/*
 * @(#)PhotoAlbum.java  1.6 01/04/04
 *
 * Copyright (c) 2000-2001 Sun Microsystems, Inc. All Rights Reserved.
 *
 * This software is the confidential and proprietary information of Sun
 * Microsystems, Inc. ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with Sun.
 *
 * SUN MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF THE
 * SOFTWARE, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE, OR NON-INFRINGEMENT. SUN SHALL NOT BE LIABLE FOR ANY DAMAGES
 * SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR DISTRIBUTING
 * THIS SOFTWARE OR ITS DERIVATIVES.
 */

import java.io.IOException;
import java.util.Vector;
import javax.microedition.lcdui.*;
import javax.microedition.midlet.*;

/**
 * The PhotoAlbum MIDlet class provides the commands and screens
 * that implement a simple Photo and Animation Album.
 * The images and animations to be displayed are configured
 * in the descriptor file with attributes.
 * <p>
 * It provides simple options to vary the speed of display
 * and the picture frames used.
 *
 */
public class PhotoAlbum extends MIDlet 
  implements CommandListener, ItemStateListener
{

  private Display display;    // The display for this MIDlet
  private PhotoFrame frame; // The Frame and Canvas for images

  private ChoiceGroup borderChoice; // List of border choices
  private ChoiceGroup speedChoice;  // List of speed choices

  private Form optionsForm; // The form holding the options
  private Alert alert;    // The Alert used for errors

  private Vector imageNames;  // Strings with the image names
  private List imageList;   // List of Image titles

  private Command exitCommand;  // The exit command
  private Command okCommand;  // The ok command
  private Command optionsCommand; // The command to edit options
  private Command backCommand;  // The command to go back

  /**
   * Construct a new PhotoAlbum MIDlet and initialize the base
   * options and main PhotoFrame to be used when the MIDlet is
   * started.
   */
  public PhotoAlbum() {  
    display = Display.getDisplay(this);
    exitCommand = new Command("Exit", Command.EXIT, 1);
    optionsCommand = new Command("Options", Command.SCREEN, 1);
    okCommand = new Command("Ok", Command.OK, 3);
    backCommand = new Command("Back", Command.SCREEN, 3);

    frame = new PhotoFrame();
    frame.setStyle(2);
    frame.setSpeed(2);
    frame.addCommand(optionsCommand);
    frame.addCommand(backCommand);
    frame.setCommandListener(this);
    alert = new Alert("Warning");
    setupImages();
  }

  /**
   * Start up the MIDlet by setting the display
   * to show the image name list.
   */
  protected void startApp() {
    display.setCurrent(imageList);
  }

  /**
   * Pausing is easy since there are no background activities
   * or record stores that need to be closed.
   */
  protected void pauseApp() {
    frame.reset();    // Discard images cached in the frame
  }

  /**
   * Destroy must cleanup everything not handled by the garbage
   * collector.
   */
  protected void destroyApp(boolean unconditional) {
    frame.reset();    // Discard images cached in the frame
  }

  /**
   * Respond to commands, including exit.
   * On the exit command, cleanup and notify that
   * the MIDlet has been destroyed.
   */
  public void commandAction(Command c, Displayable s) {
    if (c == exitCommand) {
      destroyApp(false);
      notifyDestroyed();
    } else if (c == optionsCommand) {
      display.setCurrent(genOptions());
    } else if (c == okCommand && s == optionsForm) {
      display.setCurrent(frame);
    } else if (c == List.SELECT_COMMAND) {
      int i = imageList.getSelectedIndex();
      String image = (String)imageNames.elementAt(i);

      try {
        frame.setImage(image);
        display.setCurrent(frame);
      } catch (java.io.IOException e) {
        alert.setString("Unable to locate " + image);
        display.setCurrent(alert, imageList);
      }

    } else if (c == backCommand) {
      display.setCurrent(imageList);
    }
  }

  /**
   * Listener for changes to options.
   */
  public void itemStateChanged(Item item) {
    if (item == borderChoice) {
      frame.setStyle(borderChoice.getSelectedIndex());
    } else if (item == speedChoice) {
      frame.setSpeed(speedChoice.getSelectedIndex());
    }
  }

  /**
   * Generate the options form with speed and style choices.
   * Speed choices are stop, slow, medium, and fast.
   * Style choices for borders are none, plain, fancy.
   */
  private Screen genOptions() {
    if (optionsForm == null) {
      optionsForm = new Form("Options");
      optionsForm.addCommand(okCommand);
      optionsForm.setCommandListener(this);
      optionsForm.setItemStateListener(this);

      speedChoice = new ChoiceGroup("Speed", 
                  Choice.EXCLUSIVE);
      speedChoice.append("Stop", null);
      speedChoice.append("Slow", null);
      speedChoice.append("Medium", null);
      speedChoice.append("Fast", null);
      speedChoice.setSelectedIndex(2, true);
      optionsForm.append(speedChoice);

      borderChoice = new ChoiceGroup("Borders",
                   Choice.EXCLUSIVE);
      borderChoice.append("None", null);
      borderChoice.append("Plain",  null);
      borderChoice.append("Fancy", null);
      borderChoice.setSelectedIndex(2, true);
      optionsForm.append(borderChoice);
    }

    return optionsForm;
  }
    
  /**
   * Check the attributes in the Descriptor that identify
   * images and titles and initialize the lists imageNames
   * and imageList.
   */
  private void setupImages() {
    imageNames = new Vector();
    imageList = new List("Images", List.IMPLICIT);
    imageList.addCommand(exitCommand);
    imageList.setCommandListener(this);

    for (int n = 1; n < 100; n++) {
      String nthImage = "PhotoImage-"+ n;
      String image = getAppProperty(nthImage);
      if (image == null || image.length() == 0)
        break;

      String nthTitle = "PhotoTitle-" + n;
      String title = getAppProperty(nthTitle);
      if (title == null || title.length() == 0)
        title = image;

      imageNames.addElement(image);
      imageList.append(title, null);
    }
  }
}

/*
 * @(#)Animation.java 1.5 01/04/04
 *
 * Copyright (c) 2000-2001 Sun Microsystems, Inc. All Rights Reserved.
 *
 * This software is the confidential and proprietary information of Sun
 * Microsystems, Inc. ("Confidential Information"). You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with Sun.
 *
 * SUN MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF THE
 * SOFTWARE, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE, OR NON-INFRINGEMENT. SUN SHALL NOT BE LIABLE FOR ANY DAMAGES
 * SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR DISTRIBUTING
 * THIS SOFTWARE OR ITS DERIVATIVES.
 */


/**
 * An Animation contains the set of images to display.
 * Images are read from resource files supplied in the
 * JAR file.
 * <p> 
 * This implementation keeps the Images in the heap.
 * If memory is short, a more deliberate management
 * of Image may be required.
 */
class Animation {

  /** 
   * Location to draw the animation, set these fields to
   * change the location where the image is drawn.
   */
  int x, y;

  /**
   * The width and the height of the images (max of all if they
   * are different).
   * They are set when images are loaded and should not be changed.
   */
  int width, height;

  /**
   * Vector of images in the sequence.
   */
  private Vector images;

  /**
   * Current index into the sequence of images.
   */
  private int index;

  /**
   * Size of sequence of images.
   * Set to a large number until the last image of
   * the sequence has been read.
   */
  private int size;

  /**
   * Prefix or name of the image.
   */
  private String prefix;

  /**
   * Create a new Animation.
   */
  Animation() {
    images = new Vector(30);
  }

  /**
   * Advance to the next image.
   * If the number of images is known then just advance
   * and wrap around if necessary.
   * If the number of images is not known then when 
   * advancing off the end of the known images try to
   * create a new image using the pattern.
   * When an attempt fails that sets the number of images.
   */
  void next() {
    int nextindex = index + 1;
    if (nextindex >= size) {
      index = 0;
    } else if (nextindex >= images.size()) {
      // Try to read the next image
      // If that works put it into the images vector
      try {
        String name = prefix + nextindex + ".png";
        Image image = Image.createImage(name);
        images.setSize(nextindex+1);
        images.setElementAt(image, nextindex);
        index = nextindex;
      } catch (IOException ex) {
        // No more images, set the size of the sequence.
        size = nextindex;
        index = 0;
      } catch (Exception e) {
        size = nextindex;
        index = 0;
      }
    } else {
      // Index is within range of Images already read
      index = nextindex;
    }
  }

  /**
   * Back up to the previous image.
   * Wrap around to the end if at the beginning.
   */
  void previous() {
    index--;
    if (index < 0) {
      index = images.size()-1;
    }
  }

  /**
   * Paint the current image in the sequence.
   * The image is drawn to the target graphics context
   * at the x, and y of the Animation.
   * @param g graphics context to which the next image is drawn.
   */
  public void paint(Graphics g) {
    if (images.size() > 0) {
      g.drawImage((Image)images.elementAt(index), x, y, 0);
    }
  }

  /**
   * Load Images from resource files using 
   * <code>Image.createImage</code>.
   * The first image is loaded to determine whether it is a
   * single image or a sequence of images and to make sure it exists.
   * Subsequent images are loaded on demand when they are needed.
   * If the name given is the complete name of the image then
   * it is a singleton.
   * Otherwise it is assumed to be a sequence of images 
   * with the name as a prefix. Sequence numbers (n) are
   * 0, 1, 2, 3, .... The full resource name is the concatenation
   * of name + n + ".png".
   * <p>
   * Subsequent images are loaded when they are needed. See
   * <code>next</code> and <code>previous</code> for details.
   * @param name the name or prefix of the resource image names
   * @exception IOException is thrown if the image or the first
   * of the sequence cannot be found.
   * @exception OutOfMemoryError if no memory can be allocated for
   * the image.
   */
  void loadImage(String prefix) throws IOException {
    this.prefix = prefix;
    Image image = null;
    images.setSize(0);
    index = 0;
    try {
      // Try the name supplied for the single image case.
      // If it is found then do the setup and return
      image = Image.createImage(prefix);
      size = 1;
    } catch (IOException ex) {
      // Use the prefix + "0.png" to locate the first of
      // a series of images.
      String name = prefix + "0.png";
      image = Image.createImage(name);
      size = 999999999;
    } 

    width = image.getWidth();
    height = image.getHeight();
    images.addElement(image);
  }

  /**
   * Reset the Animation to reduce memory usage.
   * Discard all but the first image.
   */
  void reset() {
    if (images.size() > 0) {
      for (int i = 0; i < images.size(); i++)
        images.setElementAt(null, i);
    }
  }
}


/*
 * @(#)PhotoFrame.java  1.6 01/04/04
 * Copyright (c) 2000-2001 Sun Microsystems, Inc. All Rights Reserved.
 *
 * This software is the confidential and proprietary information of Sun
 * Microsystems, Inc. ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with Sun.
 *
 * SUN MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF THE
 * SOFTWARE, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE, OR NON-INFRINGEMENT. SUN SHALL NOT BE LIABLE FOR ANY DAMAGES
 * SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR DISTRIBUTING
 * THIS SOFTWARE OR ITS DERIVATIVES.
 */


/**
 * This class provides the picture frame and drives the animation
 * of the frames and the picture. It handles the starting and stopping
 * of the Animation and contains the Thread used to do
 * the timing and requests that the Canvas is repainted
 * periodically. Additionally, it has controls for border
 * style and animation speed.
 */
class PhotoFrame extends Canvas implements Runnable {

  private Animation animation;  // The Animation sequencer.
  private int speed;    // Animation speed set

  private Thread thread;    // Thread used for triggering repaints
  private long paintTime;   // Time of most recent paint

  private Image image;      // Buffer image of screen
  private Image bimage;   // Pattern used for border
  private int style;    // Border style

  /*
   * Mapping of speed values to delays in milliseconds.
   * Indices map to those in the ChoiceGroup.
   */
  private final static int speeds[] = {999999999, 500, 250, 100};

  /**
   * Create a new PhotoFrame. Creates an offscreen mutable
   * image into which the border is drawn.
   * Border style is none (0).
   * Speed is stopped (0) until set.
   */
  PhotoFrame() {
    animation = new Animation();
    image = Image.createImage(getWidth(), getHeight());
    setStyle(0);
    setSpeed(0);
  }
    
  /**
   * Load a new photo into the frame.
   * Load the images into the Animation and pick
   * where the image should be placed on the canvas.
   * Also draw the frame into the buffered image based
   * on the animation size.
   * If the images can't be loaded, just reset the origin
   * and throw an IOException.
   * @param name the prefix of the resource to load.
   * @throws IOException when no images can be loaded.
   */
  void setImage(String prefix) throws IOException {
    try {
      animation.loadImage(prefix);
      animation.x = (getWidth() - animation.width) / 2;
      animation.y = (getHeight() - animation.height) / 2;
      paintFrame(style, animation.x, animation.y,
           animation.width, animation.height);
    } catch (java.io.IOException ex) {
      // No image to display just show an empty frame.
      animation.x = 0;
      animation.y = 0;
      paintFrame(style, 10, 10, 
           getWidth()-20, getHeight()-20);
      throw ex;
    }
  }

  /**
   * Reset the PhotoFrame so it holds minimal resources
   * by resetting the animation.
   * The animation thread is stopped.
   */
  void reset() {
    animation.reset();
    image = null;
    thread = null;
  }

  /**
   * Handle key events. FIRE events toggle between
   * running and stopped.  LEFT and RIGHT key events
   * when stopped show the previous or next image.
   */
  protected void keyPressed(int keyCode) {
    int action = getGameAction(keyCode);

    switch (action) {
    case RIGHT:
      if (thread == null) {
        animation.next();
        repaint();
      }
      break;
    case LEFT:
      if (thread == null) {
        animation.previous();
        repaint();
      }
      break;
    case FIRE:
      // Use FIRE to toggle the activity of the thread
      if (thread == null) {
        thread = new Thread(this);
        thread.start();
      } else {
        synchronized (this) {
          // Wake up the thread
          this.notify();
          thread = null;
        }
      }
      break;
    }
  }

  /**
   * Handle key repeat events as regular key events.
   */
  protected void keyRepeated(int keyCode) {
    keyPressed(keyCode);
  }

  /**
   * Set the animation speed.
   * @param speed speedo of animation 0-3;
   * 0 == stop; 1 = slow, 2 = medium, 3 = fast.
   */
  void setSpeed(int speed) {
    this.speed = speed;
  }

  /**
   * Set the frame style.
   * Recreate the photo frame image from the current animation
   * and the new style.
   */
  void setStyle(int style) {
    this.style = style;
    paintFrame(style, animation.x, animation.y,
         animation.width, animation.height);
  }

  /**
   * Notified when Canvas is made visible.
   * Create the thread to run the animation timing.
   */
  protected void showNotify() {
    thread = new Thread(this);
    thread.start();
  }

  /**
   * Notified when the Canvas is no longer visible.
   * Signal the running Thread that it should stop.
   */
  protected void hideNotify() {
    thread = null;
  }

  /** 
   * Paint is called whenever the canvas should be redrawn.
   * It clears the canvas and draws the frame and the  
   * current frame from the animation.
   * @param g the Graphics context to which to draw
   */
  protected void paint(Graphics g) {
    paintTime = System.currentTimeMillis();
    if (image != null) {
      // Draw the frame unless only the picture is being
      // re-drawn.
      // This is the inverse of the usual clip check.
      int cx = 0, cy = 0, cw = 0, ch = 0;
      if ((cx = g.getClipX()) < animation.x || 
          (cy = g.getClipY()) < animation.y ||
          ((cx + (cw = g.getClipWidth())) >
           (animation.x + animation.width)) ||
          ((cy + (ch = g.getClipHeight())) >
           (animation.y + animation.height))) {
        g.drawImage(image, 0, 0,
              Graphics.LEFT|Graphics.TOP);
      }
      // Draw the image if it intersects the clipping region
      if (intersectsClip(g, animation.x, animation.y, 
             animation.width, animation.height)) {
        animation.paint(g);
      }
    }
  }

  /**
   * Return true if the specified rectangle does intersect the
   * clipping rectangle of the graphics object.  If it returns true
   * then the object must be drawn otherwise it would be clipped
   * completely.
   * The checks are done in a order with early exits to make this
   * as inexpensive as possible.
   * @param g the Graphics context to check
   * @param x the upper left corner of the rectangle
   * @param y the upper left corner of the rectangle
   * @param w the width of the rectangle
   * @param h the height of the rectangle
   * @return true if the rectangle intersects the clipping region
   */
  boolean intersectsClip(Graphics g, int x, int y, int w, int h) {
    int cx = g.getClipX();
    if (x + w <= cx)
      return false;

    int cw = g.getClipWidth();
    if (x > cx + cw)
      return false;

    int cy = g.getClipY();
    if (y + h <= cy)
      return false;

    int ch = g.getClipHeight();
    if (y > cy + ch)
      return false;
    return true;
  }

  /**
   * Paint the photo frame into the buffered screen image.
   * This will avoid drawing each of its parts on each repaint.
   * Paint will only need to put the image into the frame.
   * @param style the style of frame to draw.
   * @param x the x offset of the image.
   * @param y the y offset of the image
   * @param width the width of the anmiation image
   * @param height the height of the animation image
   */
  private void paintFrame(int style, int x, int y,
        int width, int height) {
    Graphics g = image.getGraphics();

    // Clear the entire canvas to white
    g.setColor(0xffffff);
    g.fillRect(0, 0, getWidth()+1, getHeight()+1);

    // Set the origin of the image and paint the border and image.
    g.translate(x, y);
    paintBorder(g, style, width, height);
  }

  /**
   * Runs the animation and makes the repaint requests.
   * The thread will exit when it is no longer the current
   * Animation thread.
   */
  public void run() {
    Thread me = Thread.currentThread();
    long scheduled = System.currentTimeMillis();
    paintTime = scheduled;
    while (me == thread) {
      synchronized (this) {
        try {
          // Update when the next frame should
          // be drawn and compute the delta
          scheduled += speeds[speed];
          long delta = scheduled - paintTime;
          if (delta > 0)  {
            this.wait(delta);
          }
          animation.next();
          // Request a repaint only of the image
          repaint(animation.x, animation.y,
            animation.width,
            animation.height);
        } catch (InterruptedException e) {
        }
      }
    }
  }

  /**
   * Draw a border of the selected style.
   * Style:
   * <OL>
   * <LI> Style 0: No border is drawn.
   * <LI> Style 1: A simple border is drawn
   * <LI> Style 2: The border is outlined and an image
   * is created to tile within the border.
   * </OL>
   * @param g graphics context to which to draw.
   * @param x the horizontal offset in the frame of the image.
   * @param y the vertical offset in the frame
   * @param w the width reserved for the image
   * @param h the height reserved of the image
   */
  private void paintBorder(Graphics g, int style, int w, int h) {
    if (style == 1) {
      g.setColor(0x808080);
      g.drawRect(-1, -1, w + 1, h + 1);
      g.drawRect(-2, -2, w + 3, h + 3);
    }

    if (style == 2) {
      // Draw fancy border with image between outer 
      // and inner rectangles
      if (bimage == null) 
        bimage = genBorder();
      int bw = bimage.getWidth();
      int bh = bimage.getHeight();
      int i;

      // Draw the inner and outer solid border
      g.setColor(0x808080);
      g.drawRect(-1, -1, w + 1, h + 1);
      g.drawRect(-bw - 2, -bh - 2,
           w + bw * 2 + 3, h + bh * 2 + 3);

      // Draw it in each corner
      g.drawImage(bimage, -1, -1,
            Graphics.BOTTOM|Graphics.RIGHT);
      g.drawImage(bimage, -1, h + 1,
            Graphics.TOP|Graphics.RIGHT);
      g.drawImage(bimage, w + 1, -1,
            Graphics.BOTTOM|Graphics.LEFT);
      g.drawImage(bimage, w + 1, h + 1,
            Graphics.TOP|Graphics.LEFT);

      // Draw the embedded image down left and right sides
      for (i = ((h % bh) / 2); i < h - bh; i += bh) {
        g.drawImage(bimage, -1, i,
              Graphics.RIGHT|Graphics.TOP);
        g.drawImage(bimage, w + 1, i,
              Graphics.LEFT|Graphics.TOP);
      }

      // Draw the embedded image across the top and bottom
      for (i = ((w % bw) / 2); i < w - bw; i += bw) {
        g.drawImage(bimage, i, -1,
              Graphics.LEFT|Graphics.BOTTOM);
        g.drawImage(bimage, i, h + 1, 
              Graphics.LEFT|Graphics.TOP);
      }
    }
  }

  /**
   * Create an image for the border.
   * The border consists of a simple "+" drawn in a 5x5 image.
   * Fill the image with white and draw the "+" as magenta.
   */
  private Image genBorder() {
    Image image = Image.createImage(5, 5);
    Graphics g = image.getGraphics();
    g.setColor(255, 255, 255);
    g.fillRect(0, 0, 5, 5);
    g.setColor(128, 0, 255);
    g.drawLine(2, 1, 2, 3);   // vertical
    g.drawLine(1, 2, 3, 2);   // horizontal
    return image;
  }
   
}