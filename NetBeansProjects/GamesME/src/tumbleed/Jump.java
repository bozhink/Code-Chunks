/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tumbleed;

/*
 Title:  J2ME Games With MIDP2
 Authors:  Carol Hamer
 Publisher:  Apress
 ISBN:   1590593820
 */

import java.util.Random;
import javax.microedition.lcdui.*;
import javax.microedition.lcdui.game.*;
import javax.microedition.media.*;
import javax.microedition.media.control.*;
import javax.microedition.midlet.*;

/**
 * This is the main class of the tumbleweed game.
 * 
 * @author Carol Hamer
 */
public class Jump extends MIDlet implements CommandListener {

  //---------------------------------------------------------
  //   commands

  /**
   * the command to end the game.
   */
  private Command myExitCommand = new Command("Exit", Command.EXIT, 99);

  /**
   * the command to start moving when the game is paused.
   */
  private Command myGoCommand = new Command("Go", Command.SCREEN, 1);

  /**
   * the command to pause the game.
   */
  private Command myPauseCommand = new Command("Pause", Command.SCREEN, 1);

  /**
   * the command to start a new game.
   */
  private Command myNewCommand = new Command("Play Again", Command.SCREEN, 1);

  /**
   * The command to start/pause the music. (This command may appear in a menu)
   */
  private Command myMusicCommand = new Command("Music", Command.SCREEN, 2);

  //---------------------------------------------------------
  //   game object fields

  /**
   * the the canvas that all of the game will be drawn on.
   */
  private JumpCanvas myCanvas;

  //---------------------------------------------------------
  //   thread fields

  /**
   * the thread that advances the cowboy.
   */
  private GameThread myGameThread;

  /**
   * The class that plays music if the user wants.
   */
  //private MusicMaker myMusicMaker;
  private ToneControlMusicMaker myMusicMaker;

  /**
   * The thread tha sets tumbleweeds in motion at random intervals.
   */
  private TumbleweedThread myTumbleweedThread;

  /**
   * if the user has paused the game.
   */
  private boolean myGamePause;

  /**
   * if the game is paused because it is hidden.
   */
  private boolean myHiddenPause;

  //-----------------------------------------------------
  //    initialization and game state changes

  /**
   * Initialize the canvas and the commands.
   */
  public Jump() {
    try {
      myCanvas = new JumpCanvas(this);
      myCanvas.addCommand(myExitCommand);
      myCanvas.addCommand(myMusicCommand);
      myCanvas.addCommand(myPauseCommand);
      myCanvas.setCommandListener(this);
    } catch (Exception e) {
      errorMsg(e);
    }
  }

  /**
   * Switch the command to the play again command.
   */
  void setNewCommand() {
    myCanvas.removeCommand(myPauseCommand);
    myCanvas.removeCommand(myGoCommand);
    myCanvas.addCommand(myNewCommand);
  }

  /**
   * Switch the command to the go command.
   */
  private void setGoCommand() {
    myCanvas.removeCommand(myPauseCommand);
    myCanvas.removeCommand(myNewCommand);
    myCanvas.addCommand(myGoCommand);
  }

  /**
   * Switch the command to the pause command.
   */
  private void setPauseCommand() {
    myCanvas.removeCommand(myNewCommand);
    myCanvas.removeCommand(myGoCommand);
    myCanvas.addCommand(myPauseCommand);
  }

  //----------------------------------------------------------------
  //  implementation of MIDlet
  // these methods may be called by the application management
  // software at any time, so we always check fields for null
  // before calling methods on them.

  /**
   * Start the application.
   */
  public void startApp() throws MIDletStateChangeException {
    try {
      if (myCanvas != null) {
        myCanvas.start();
        myCanvas.flushKeys();
        systemStartThreads();
      }
    } catch (Exception e) {
      errorMsg(e);
    }
  }

  /**
   * stop and throw out the garbage.
   */
  public void destroyApp(boolean unconditional)
      throws MIDletStateChangeException {
    try {
      stopThreads();
      myCanvas = null;
      System.gc();
    } catch (Exception e) {
      errorMsg(e);
    }
  }

  /**
   * request the game to pause. This method is called by the application
   * management software, not in response to a user pausing the game.
   */
  public void pauseApp() {
    try {
      if (myCanvas != null) {
        setGoCommand();
        systemPauseThreads();
      }
    } catch (Exception e) {
      errorMsg(e);
    }
  }

  //----------------------------------------------------------------
  //  implementation of CommandListener

  /*
   * Respond to a command issued on the Canvas. (either reset or exit).
   */
  public void commandAction(Command c, Displayable s) {
    try {
      if (c == myGoCommand) {
        myCanvas.removeCommand(myGoCommand);
        myCanvas.addCommand(myPauseCommand);
        myCanvas.flushKeys();
        userStartThreads();
      } else if (c == myPauseCommand) {
        myCanvas.removeCommand(myPauseCommand);
        myCanvas.addCommand(myGoCommand);
        userPauseThreads();
      } else if (c == myNewCommand) {
        myCanvas.removeCommand(myNewCommand);
        myCanvas.addCommand(myPauseCommand);
        System.gc();
        myCanvas.reset();
        myCanvas.flushKeys();
        myHiddenPause = false;
        myGamePause = false;
        startThreads();
      } else if (c == myMusicCommand) {
        if (myMusicMaker != null) {
          myMusicMaker.toggle();
          myCanvas.repaint();
          myCanvas.serviceRepaints();
        }
      } else if ((c == myExitCommand)/* || (c == Alert.DISMISS_COMMAND)*/) {
        try {
          destroyApp(false);
          notifyDestroyed();
        } catch (MIDletStateChangeException ex) {
        }
      }
    } catch (Exception e) {
      errorMsg(e);
    }
  }

  //-------------------------------------------------------
  //  thread methods

  /**
   * start up all of the game's threads. Creates them if necessary. to be
   * called when the user hits the go command.
   */
  private synchronized void userStartThreads() throws Exception {
    myGamePause = false;
    if (!myHiddenPause) {
      startThreads();
    }
  }

  /**
   * start up all of the game's threads. Creates them if necessary. used by
   * showNotify
   */
  synchronized void systemStartThreads() throws Exception {
    myHiddenPause = false;
    if (!myGamePause) {
      startThreads();
    }
  }

  /**
   * start up all of the game's threads. Creates them if necessary. internal
   * version. note: if this were synchronized, whould it cause deadlock?
   */
  private void startThreads() throws Exception {
    if (myGameThread == null) {
      myGameThread = new GameThread(myCanvas);
      myGameThread.start();
    } else {
      myGameThread.resumeGame();
    }
    if (myTumbleweedThread == null) {
      myTumbleweedThread = new TumbleweedThread(myCanvas);
      myTumbleweedThread.start();
    } else {
      myTumbleweedThread.resumeGame();
    }
    if (myMusicMaker == null) {
      myMusicMaker = new ToneControlMusicMaker();
      //myMusicMaker = new MusicMaker();
      myMusicMaker.start();
    } else {
      myMusicMaker.resumeGame();
    }
  }

  /**
   * Pause all of the threads started by this game. to be called when the user
   * hits the pause command.
   */
  synchronized void userPauseThreads() {
    myGamePause = true;
    pauseThreads();
  }

  /**
   * Pause all of the threads started by this game. used by hideNotify
   */
  void systemPauseThreads() {
    myHiddenPause = true;
    pauseThreads();
  }

  /**
   * start up all of the game's threads. Creates them if necessary. internal
   * version. note: if this were synchronized, whould it cause deadlock?
   */
  private void pauseThreads() {
    if (myGameThread != null) {
      myGameThread.pauseGame();
    }
    if (myTumbleweedThread != null) {
      myTumbleweedThread.pauseGame();
    }
    if (myMusicMaker != null) {
      myMusicMaker.pauseGame();
    }
  }

  /**
   * Stop all of the threads started by this game and delete them as they are
   * no longer usable.
   */
  private synchronized void stopThreads() {
    if (myGameThread != null) {
      myGameThread.requestStop();
    }
    if (myTumbleweedThread != null) {
      myTumbleweedThread.requestStop();
    }
    if (myMusicMaker != null) {
      myMusicMaker.requestStop();
    }
    myGameThread = null;
    myTumbleweedThread = null;
    myMusicMaker = null;
  }

  //-------------------------------------------------------
  //  error methods

  /**
   * Converts an exception to a message and displays the message..
   */
  void errorMsg(Exception e) {
    if (e.getMessage() == null) {
      errorMsg(e.getClass().getName());
    } else {
      errorMsg(e.getClass().getName() + ":" + e.getMessage());
    }
  }

  /**
   * Displays an error message alert if something goes wrong.
   */
  void errorMsg(String msg) {
    Alert errorAlert = new Alert("error", msg, null, AlertType.ERROR);
    errorAlert.setCommandListener(this);
    errorAlert.setTimeout(Alert.FOREVER);
    Display.getDisplay(this).setCurrent(errorAlert);
  }

}

/**
 * This class is the display of the game.
 * 
 * @author Carol Hamer
 */

class JumpCanvas extends javax.microedition.lcdui.game.GameCanvas {

  //---------------------------------------------------------
  //   dimension fields
  //  (constant after initialization)

  /**
   * the height of the green region below the ground.
   */
  static final int GROUND_HEIGHT = 32;

  /**
   * a screen dimension.
   */
  static final int CORNER_X = 0;

  /**
   * a screen dimension.
   */
  static final int CORNER_Y = 0;

  /**
   * a screen dimension.
   */
  static int DISP_WIDTH;

  /**
   * a screen dimension.
   */
  static int DISP_HEIGHT;

  /**
   * a font dimension.
   */
  static int FONT_HEIGHT;

  /**
   * the default font.
   */
  static Font FONT;

  /**
   * a font dimension.
   */
  static int SCORE_WIDTH;

  /**
   * The width of the string that displays the time, saved for placement of
   * time display.
   */
  static int TIME_WIDTH;

  /**
   * color constant
   */
  public static final int BLACK = 0;

  /**
   * color constant
   */
  public static final int WHITE = 0xffffff;

  //---------------------------------------------------------
  //   game object fields

  /**
   * a handle to the display.
   */
  private Display myDisplay;

  /**
   * a handle to the MIDlet object (to keep track of buttons).
   */
  private Jump myJump;

  /**
   * the LayerManager that handles the game graphics.
   */
  private JumpManager myManager;

  /**
   * whether or not the game has ended.
   */
  private boolean myGameOver;

  /**
   * the player's score.
   */
  private int myScore = 0;

  /**
   * How many ticks we start with.
   */
  private int myInitialGameTicks = 950;

  /**
   * this is saved to determine if the time string needs to be recomputed.
   */
  private int myOldGameTicks = myInitialGameTicks;

  /**
   * the number of game ticks that have passed.
   */
  private int myGameTicks = myOldGameTicks;

  /**
   * we save the time string to avoid recreating it unnecessarily.
   */
  private static String myInitialString = "1:00";

  /**
   * we save the time string to avoid recreating it unnecessarily.
   */
  private String myTimeString = myInitialString;

  //-----------------------------------------------------
  //    gets/sets

  /**
   * This is called when the game ends.
   */
  void setGameOver() {
    myGameOver = true;
    myJump.userPauseThreads();
  }

  /**
   * @return a handle to the tumbleweed objects.
   */
  Tumbleweed[] getTumbleweeds() {
    return (myManager.getTumbleweeds());
  }

  //-----------------------------------------------------
  //    initialization and game state changes

  /**
   * Constructor sets the data, performs dimension calculations, and creates
   * the graphical objects.
   */
  public JumpCanvas(Jump midlet) throws Exception {
    super(false);
    myDisplay = Display.getDisplay(midlet);
    myJump = midlet;
    // calculate the dimensions
    DISP_WIDTH = getWidth();
    DISP_HEIGHT = getHeight();
    Display disp = Display.getDisplay(myJump);
    if (disp.numColors() < 256) {
      throw (new Exception("game requires 256 shades"));
    }
    if ((DISP_WIDTH < 150) || (DISP_HEIGHT < 170)) {
      throw (new Exception("Screen too small"));
    }
    if ((DISP_WIDTH > 250) || (DISP_HEIGHT > 250)) {
      throw (new Exception("Screen too large"));
    }
    FONT = getGraphics().getFont();
    FONT_HEIGHT = FONT.getHeight();
    SCORE_WIDTH = FONT.stringWidth("Score: 000");
    TIME_WIDTH = FONT.stringWidth("Time: " + myInitialString);
    if (myManager == null) {
      myManager = new JumpManager(CORNER_X, CORNER_Y + FONT_HEIGHT * 2,
          DISP_WIDTH, DISP_HEIGHT - FONT_HEIGHT * 2 - GROUND_HEIGHT);
    }
  }

  /**
   * This is called as soon as the application begins.
   */
  void start() {
    myGameOver = false;
    myDisplay.setCurrent(this);
    repaint();
  }

  /**
   * sets all variables back to their initial positions.
   */
  void reset() {
    myManager.reset();
    myScore = 0;
    myGameOver = false;
    myGameTicks = myInitialGameTicks;
    myOldGameTicks = myInitialGameTicks;
    repaint();
  }

  /**
   * clears the key states.
   */
  void flushKeys() {
    getKeyStates();
  }

  /**
   * pause the game when it's hidden.
   */
  protected void hideNotify() {
    try {
      myJump.systemPauseThreads();
    } catch (Exception oe) {
      myJump.errorMsg(oe);
    }
  }

  /**
   * When it comes back into view, unpause it.
   */
  protected void showNotify() {
    try {
      myJump.systemStartThreads();
    } catch (Exception oe) {
      myJump.errorMsg(oe);
    }
  }

  //-------------------------------------------------------
  //  graphics methods

  /**
   * paint the game graphic on the screen.
   */
  public void paint(Graphics g) {
    // clear the screen:
    g.setColor(WHITE);
    g.fillRect(CORNER_X, CORNER_Y, DISP_WIDTH, DISP_HEIGHT);
    // color the grass green
    g.setColor(0, 255, 0);
    g.fillRect(CORNER_X, CORNER_Y + DISP_HEIGHT - GROUND_HEIGHT,
        DISP_WIDTH, DISP_HEIGHT);
    // paint the layer manager:
    try {
      myManager.paint(g);
    } catch (Exception e) {
      myJump.errorMsg(e);
    }
    // draw the time and score
    g.setColor(BLACK);
    g.setFont(FONT);
    g.drawString("Score: " + myScore, (DISP_WIDTH - SCORE_WIDTH) / 2,
        DISP_HEIGHT + 5 - GROUND_HEIGHT, g.TOP | g.LEFT);
    g.drawString("Time: " + formatTime(), (DISP_WIDTH - TIME_WIDTH) / 2,
        CORNER_Y + FONT_HEIGHT, g.TOP | g.LEFT);
    // write game over if the game is over
    if (myGameOver) {
      myJump.setNewCommand();
      // clear the top region:
      g.setColor(WHITE);
      g.fillRect(CORNER_X, CORNER_Y, DISP_WIDTH, FONT_HEIGHT * 2 + 1);
      int goWidth = FONT.stringWidth("Game Over");
      g.setColor(BLACK);
      g.setFont(FONT);
      g.drawString("Game Over", (DISP_WIDTH - goWidth) / 2, CORNER_Y
          + FONT_HEIGHT, g.TOP | g.LEFT);
    }
  }

  /**
   * a simple utility to make the number of ticks look like a time...
   */
  public String formatTime() {
    if ((myGameTicks / 16) + 1 != myOldGameTicks) {
      myTimeString = "";
      myOldGameTicks = (myGameTicks / 16) + 1;
      int smallPart = myOldGameTicks % 60;
      int bigPart = myOldGameTicks / 60;
      myTimeString += bigPart + ":";
      if (smallPart / 10 < 1) {
        myTimeString += "0";
      }
      myTimeString += smallPart;
    }
    return (myTimeString);
  }

  //-------------------------------------------------------
  //  game movements

  /**
   * Tell the layer manager to advance the layers and then update the display.
   */
  void advance() {
    myGameTicks--;
    myScore += myManager.advance(myGameTicks);
    if (myGameTicks == 0) {
      setGameOver();
    }
    // paint the display
    try {
      paint(getGraphics());
      flushGraphics();
    } catch (Exception e) {
      myJump.errorMsg(e);
    }
  }

  /**
   * Respond to keystrokes.
   */
  public void checkKeys() {
    if (!myGameOver) {
      int keyState = getKeyStates();
      if ((keyState & LEFT_PRESSED) != 0) {
        myManager.setLeft(true);
      }
      if ((keyState & RIGHT_PRESSED) != 0) {
        myManager.setLeft(false);
      }
      if ((keyState & UP_PRESSED) != 0) {
        myManager.jump();
      }
    }
  }

}

/**
 * This class draws the background grass.
 * 
 * @author Carol Hamer
 */

class Grass extends TiledLayer {

  //---------------------------------------------------------
  //    dimension fields
  //  (constant after initialization)

  /**
   * The width of the square tiles that make up this layer..
   */
  static final int TILE_WIDTH = 20;

  /**
   * This is the order that the frames should be displayed for the animation.
   */
  static final int[] FRAME_SEQUENCE = { 2, 3, 2, 4 };

  /**
   * This gives the number of squares of grass to put along the bottom of the
   * screen.
   */
  static int COLUMNS;

  /**
   * After how many tiles does the background repeat.
   */
  static final int CYCLE = 5;

  /**
   * the fixed Y coordinate of the strip of grass.
   */
  static int TOP_Y;

  //---------------------------------------------------------
  //    instance fields

  /**
   * Which tile we are currently on in the frame sequence.
   */
  private int mySequenceIndex = 0;

  /**
   * The index to use in the static tiles array to get the animated tile..
   */
  private int myAnimatedTileIndex;

  //---------------------------------------------------------
  //   gets / sets

  /**
   * Takes the width of the screen and sets my columns to the correct
   * corresponding number
   */
  static int setColumns(int screenWidth) {
    COLUMNS = ((screenWidth / 20) + 1) * 3;
    return (COLUMNS);
  }

  //---------------------------------------------------------
  //   initialization

  /**
   * constructor initializes the image and animation.
   */
  public Grass() throws Exception {
    super(setColumns(JumpCanvas.DISP_WIDTH), 1, Image
        .createImage("/images/grass.png"), TILE_WIDTH, TILE_WIDTH);
    TOP_Y = JumpManager.DISP_HEIGHT - TILE_WIDTH;
    setPosition(0, TOP_Y);
    myAnimatedTileIndex = createAnimatedTile(2);
    for (int i = 0; i < COLUMNS; i++) {
      if ((i % CYCLE == 0) || (i % CYCLE == 2)) {
        setCell(i, 0, myAnimatedTileIndex);
      } else {
        setCell(i, 0, 1);
      }
    }
  }

  //---------------------------------------------------------
  //   graphics

  /**
   * sets the grass back to its initial position..
   */
  void reset() {
    setPosition(-(TILE_WIDTH * CYCLE), TOP_Y);
    mySequenceIndex = 0;
    setAnimatedTile(myAnimatedTileIndex, FRAME_SEQUENCE[mySequenceIndex]);
  }

  /**
   * alter the background image appropriately for this frame..
   * 
   * @param left
   *            whether or not the player is moving left
   */
  void advance(int tickCount) {
    if (tickCount % 2 == 0) { // slow the animation down a little
      mySequenceIndex++;
      mySequenceIndex %= 4;
      setAnimatedTile(myAnimatedTileIndex,
          FRAME_SEQUENCE[mySequenceIndex]);
    }
  }

}

/**
 * This class contains the loop that keeps the game running.
 * 
 * @author Carol Hamer
 */

class GameThread extends Thread {

  //---------------------------------------------------------
  //   fields

  /**
   * Whether or not the main thread would like this thread to pause.
   */
  private boolean myShouldPause;

  /**
   * Whether or not the main thread would like this thread to stop.
   */
  private boolean myShouldStop;

  /**
   * A handle back to the graphical components.
   */
  private JumpCanvas myJumpCanvas;

  /**
   * The System.time of the last screen refresh, used to regulate refresh
   * speed.
   */
  private long myLastRefreshTime;

  //----------------------------------------------------------
  //   initialization

  /**
   * standard constructor.
   */
  GameThread(JumpCanvas canvas) {
    myJumpCanvas = canvas;
  }

  //----------------------------------------------------------
  //   utilities

  /**
   * Get the amount of time to wait between screen refreshes. Normally we wait
   * only a single millisecond just to give the main thread a chance to update
   * the keystroke info, but this method ensures that the game will not
   * attempt to show too many frames per second.
   */
  private long getWaitTime() {
    long retVal = 1;
    long difference = System.currentTimeMillis() - myLastRefreshTime;
    if (difference < 75) {
      retVal = 75 - difference;
    }
    return (retVal);
  }

  //----------------------------------------------------------
  //   actions

  /**
   * pause the game.
   */
  void pauseGame() {
    myShouldPause = true;
  }

  /**
   * restart the game after a pause.
   */
  synchronized void resumeGame() {
    myShouldPause = false;
    notify();
  }

  /**
   * stops the game.
   */
  synchronized void requestStop() {
    myShouldStop = true;
    notify();
  }

  /**
   * start the game..
   */
  public void run() {
    // flush any keystrokes that occurred before the
    // game started:
    myJumpCanvas.flushKeys();
    myShouldStop = false;
    myShouldPause = false;
    while (true) {
      myLastRefreshTime = System.currentTimeMillis();
      if (myShouldStop) {
        break;
      }
      synchronized (this) {
        while (myShouldPause) {
          try {
            wait();
          } catch (Exception e) {
          }
        }
      }
      myJumpCanvas.checkKeys();
      myJumpCanvas.advance();
      // we do a very short pause to allow the other thread
      // to update the information about which keys are pressed:
      synchronized (this) {
        try {
          wait(getWaitTime());
        } catch (Exception e) {
        }
      }
    }
  }

}
/**
 * This class represents the player.
 * 
 * @author Carol Hamer
 */

class Cowboy extends Sprite {

  //---------------------------------------------------------
  //    dimension fields

  /**
   * The width of the cowboy's bounding rectangle.
   */
  static final int WIDTH = 32;

  /**
   * The height of the cowboy's bounding rectangle.
   */
  static final int HEIGHT = 48;

  /**
   * This is the order that the frames should be displayed for the animation.
   */
  static final int[] FRAME_SEQUENCE = { 3, 2, 1, 2 };

  //---------------------------------------------------------
  //    instance fields

  /**
   * the X coordinate of the cowboy where the cowboy starts the game.
   */
  private int myInitialX;

  /**
   * the Y coordinate of the cowboy when not jumping.
   */
  private int myInitialY;

  /**
   * The jump index that indicates that no jump is currently in progress..
   */
  private int myNoJumpInt = -6;

  /**
   * Where the cowboy is in the jump sequence.
   */
  private int myIsJumping = myNoJumpInt;

  /**
   * If the cowboy is currently jumping, this keeps track of how many points
   * have been scored so far during the jump. This helps the calculation of
   * bonus points since the points being scored depend on how many tumbleweeds
   * are jumped in a single jump.
   */
  private int myScoreThisJump = 0;

  //---------------------------------------------------------
  //   initialization

  /**
   * constructor initializes the image and animation.
   */
  public Cowboy(int initialX, int initialY) throws Exception {
    super(Image.createImage("/images/cowboy.png"), WIDTH, HEIGHT);
    myInitialX = initialX;
    myInitialY = initialY;
    // we define the reference pixel to be in the middle
    // of the cowboy image so that when the cowboy turns
    // from right to left (and vice versa) he does not
    // appear to move to a different location.
    defineReferencePixel(WIDTH / 2, 0);
    setRefPixelPosition(myInitialX, myInitialY);
    setFrameSequence(FRAME_SEQUENCE);
  }

  //---------------------------------------------------------
  //   game methods

  /**
   * If the cowboy has landed on a tumbleweed, we decrease the score.
   */
  int checkCollision(Tumbleweed tumbleweed) {
    int retVal = 0;
    if (collidesWith(tumbleweed, true)) {
      retVal = 1;
      // once the cowboy has collided with the tumbleweed,
      // that tumbleweed is done for now, so we call reset
      // which makes it invisible and ready to be reused.
      tumbleweed.reset();
    }
    return (retVal);
  }

  /**
   * set the cowboy back to its initial position.
   */
  void reset() {
    myIsJumping = myNoJumpInt;
    setRefPixelPosition(myInitialX, myInitialY);
    setFrameSequence(FRAME_SEQUENCE);
    myScoreThisJump = 0;
    // at first the cowboy faces right:
    setTransform(TRANS_NONE);
  }

  //---------------------------------------------------------
  //   graphics

  /**
   * alter the cowboy image appropriately for this frame..
   */
  void advance(int tickCount, boolean left) {
    if (left) {
      // use the mirror image of the cowboy graphic when
      // the cowboy is going towards the left.
      setTransform(TRANS_MIRROR);
      move(-1, 0);
    } else {
      // use the (normal, untransformed) image of the cowboy
      // graphic when the cowboy is going towards the right.
      setTransform(TRANS_NONE);
      move(1, 0);
    }
    // this section advances the animation:
    // every third time through the loop, the cowboy
    // image is changed to the next image in the walking
    // animation sequence:
    if (tickCount % 3 == 0) { // slow the animation down a little
      if (myIsJumping == myNoJumpInt) {
        // if he's not jumping, set the image to the next
        // frame in the walking animation:
        nextFrame();
      } else {
        // if he's jumping, advance the jump:
        // the jump continues for several passes through
        // the main game loop, and myIsJumping keeps track
        // of where we are in the jump:
        myIsJumping++;
        if (myIsJumping < 0) {
          // myIsJumping starts negative, and while it's
          // still negative, the cowboy is going up.
          // here we use a shift to make the cowboy go up a
          // lot in the beginning of the jump, and ascend
          // more and more slowly as he reaches his highest
          // position:
          setRefPixelPosition(getRefPixelX(), getRefPixelY()
              - (2 << (-myIsJumping)));
        } else {
          // once myIsJumping is negative, the cowboy starts
          // going back down until he reaches the end of the
          // jump sequence:
          if (myIsJumping != -myNoJumpInt - 1) {
            setRefPixelPosition(getRefPixelX(), getRefPixelY()
                + (2 << myIsJumping));
          } else {
            // once the jump is done, we reset the cowboy to
            // his non-jumping position:
            myIsJumping = myNoJumpInt;
            setRefPixelPosition(getRefPixelX(), myInitialY);
            // we set the image back to being the walking
            // animation sequence rather than the jumping image:
            setFrameSequence(FRAME_SEQUENCE);
            // myScoreThisJump keeps track of how many points
            // were scored during the current jump (to keep
            // track of the bonus points earned for jumping
            // multiple tumbleweeds). Once the current jump is done,
            // we set it back to zero.
            myScoreThisJump = 0;
          }
        }
      }
    }
  }

  /**
   * makes the cowboy jump.
   */
  void jump() {
    if (myIsJumping == myNoJumpInt) {
      myIsJumping++;
      // switch the cowboy to use the jumping image
      // rather than the walking animation images:
      setFrameSequence(null);
      setFrame(0);
    }
  }

  /**
   * This is called whenever the cowboy clears a tumbleweed so that more
   * points are scored when more tumbleweeds are cleared in a single jump.
   */
  int increaseScoreThisJump() {
    if (myScoreThisJump == 0) {
      myScoreThisJump++;
    } else {
      myScoreThisJump *= 2;
    }
    return (myScoreThisJump);
  }

}

/**
 * This class contains the loop that keeps the game running.
 * 
 * @author Carol Hamer
 */

class TumbleweedThread extends Thread {

  //---------------------------------------------------------
  //   fields

  /**
   * Whether or not the main thread would like this thread to pause.
   */
  private boolean myShouldPause;

  /**
   * Whether or not the main thread would like this thread to stop.
   */
  private boolean myShouldStop;

  /**
   * A handle back to the graphical components.
   */
  private Tumbleweed[] myTumbleweeds;

  /**
   * Random number generator to randomly decide when to appear.
   */
  private Random myRandom = new Random();

  //----------------------------------------------------------
  //   initialization

  /**
   * standard constructor, sets data.
   */
  TumbleweedThread(JumpCanvas canvas) throws Exception {
    myTumbleweeds = canvas.getTumbleweeds();
  }

  //----------------------------------------------------------
  //   actions

  /**
   * pause the thread.
   */
  void pauseGame() {
    myShouldPause = true;
  }

  /**
   * restart the thread after a pause.
   */
  synchronized void resumeGame() {
    myShouldPause = false;
    notify();
  }

  /**
   * stops the thread.
   */
  synchronized void requestStop() {
    myShouldStop = true;
    notify();
  }

  /**
   * start the thread..
   */
  public void run() {
    myShouldStop = false;
    myShouldPause = false;
    while (true) {
      if (myShouldStop) {
        break;
      }
      synchronized (this) {
        while (myShouldPause) {
          try {
            wait();
          } catch (Exception e) {
          }
        }
      }
      // wait a random length of time:
      int waitTime = (1 + getRandomInt(10)) * 100;
      synchronized (this) {
        try {
          wait(waitTime);
        } catch (Exception e) {
        }
      }
      if (!myShouldPause) {
        // randomly select which one to set in motion and
        // tell it to go. If the chosen tumbleweed is
        // currently visible, it will not be affected
        int whichWeed = getRandomInt(myTumbleweeds.length);
        myTumbleweeds[whichWeed].go();
      }
    }
  }

  //----------------------------------------------------------
  //   randomization utilities

  /**
   * Gets a random int between zero and the param upper (exclusive).
   */
  public int getRandomInt(int upper) {
    int retVal = myRandom.nextInt() % upper;
    if (retVal < 0) {
      retVal += upper;
    }
    return (retVal);
  }

}

/**
 * This class represents the tumbleweeds that the player must jump over.
 * 
 * @author Carol Hamer
 */

class Tumbleweed extends Sprite {

  //---------------------------------------------------------
  //   dimension fields

  /**
   * The width of the tumbleweed's bounding square.
   */
  static final int WIDTH = 16;

  //---------------------------------------------------------
  //    instance fields

  /**
   * whether or not this tumbleweed has been jumped over. This is used to
   * calculate the score.
   */
  private boolean myJumpedOver;

  /**
   * whether or not this tumbleweed enters from the left.
   */
  private boolean myLeft;

  /**
   * the Y coordinate of the tumbleweed.
   */
  private int myY;

  /**
   * the leftmost visible pixel.
   */
  private int myCurrentLeftBound;

  /**
   * the rightmost visible pixel.
   */
  private int myCurrentRightBound;

  //---------------------------------------------------------
  //   initialization

  /**
   * constructor initializes the image and animation.
   * 
   * @param left
   *            whether or not this tumbleweed enters from the left.
   */
  public Tumbleweed(boolean left) throws Exception {
    super(Image.createImage("/images/tumbleweed.png"), WIDTH, WIDTH);
    myY = JumpManager.DISP_HEIGHT - WIDTH - 2;
    myLeft = left;
    if (!myLeft) {
      setTransform(TRANS_MIRROR);
    }
    myJumpedOver = false;
    setVisible(false);
  }

  //---------------------------------------------------------
  //   game actions

  /**
   * Set the tumbleweed in motion if it is not currently visible.
   */
  synchronized boolean go() {
    boolean retVal = false;
    if (!isVisible()) {
      retVal = true;
      //System.out.println("Tumbleweed.go-->not visible");
      myJumpedOver = false;
      setVisible(true);
      // set the tumbleweed's position to the point
      // where it just barely appears on the screen
      // to that it can start approaching the cowboy:
      if (myLeft) {
        setRefPixelPosition(myCurrentRightBound, myY);
        move(-1, 0);
      } else {
        setRefPixelPosition(myCurrentLeftBound, myY);
        move(1, 0);
      }
    } else {
      //System.out.println("Tumbleweed.go-->visible");
    }
    return (retVal);
  }

  //---------------------------------------------------------
  //   graphics

  /**
   * move the tumbleweed back to its initial (inactive) state.
   */
  void reset() {
    setVisible(false);
    myJumpedOver = false;
  }

  /**
   * alter the tumbleweed image appropriately for this frame..
   * 
   * @param left
   *            whether or not the player is moving left
   * @return how much the score should change by after this advance.
   */
  synchronized int advance(Cowboy cowboy, int tickCount, boolean left,
      int currentLeftBound, int currentRightBound) {
    int retVal = 0;
    myCurrentLeftBound = currentLeftBound;
    myCurrentRightBound = currentRightBound;
    // if the tumbleweed goes outside of the display
    // region, set it to invisible since it is
    // no longer in use.
    if ((getRefPixelX() - WIDTH >= currentRightBound) && (!myLeft)) {
      setVisible(false);
    }
    if ((getRefPixelX() + WIDTH <= currentLeftBound) && myLeft) {
      setVisible(false);
    }
    if (isVisible()) {
      // when the tumbleweed is active, we advance the
      // rolling animation to the next frame and then
      // move the tumbleweed in the right direction across
      // the screen.
      if (tickCount % 2 == 0) { // slow the animation down a little
        nextFrame();
      }
      if (myLeft) {
        move(-3, 0);
        // if the cowboy just passed the tumbleweed
        // (without colliding with it) we increase the
        // cowboy's score and set myJumpedOver to true
        // so that no further points will be awarded
        // for this tumbleweed until it goes offscreen
        // and then is later reactivated:
        if ((!myJumpedOver) && (getRefPixelX() < cowboy.getRefPixelX())) {
          myJumpedOver = true;
          retVal = cowboy.increaseScoreThisJump();
        }
      } else {
        move(3, 0);
        if ((!myJumpedOver)
            && (getRefPixelX() > cowboy.getRefPixelX()
                + Cowboy.WIDTH)) {
          myJumpedOver = true;
          retVal = cowboy.increaseScoreThisJump();
        }
      }
    }
    return (retVal);
  }

}

/**
 * This is the class that plays a little tune while you play the game. This
 * version uses the Player and Control interfaces.
 * 
 * @author Carol Hamer
 */

class ToneControlMusicMaker implements PlayerListener {

  //---------------------------------------------------------
  //   fields

  /**
   * The player object that plays the tune.
   */
  private Player myPlayer;

  /**
   * Whether or not the player wants to pause the music.
   */
  private boolean myShouldPause;

  /**
   * Whether or not the system wants to pause the music.
   */
  private boolean myGamePause;

  /**
   * The tune played by the game, stored as an array of bytes in BNF notation.
   */
  private byte[] myTune = {
  // first set the version
      ToneControl.VERSION, 1,
      // set the tempo
      ToneControl.TEMPO, 30,
      // define the first line of the song
      ToneControl.BLOCK_START, 0, 69, 8, 69, 8, 69, 8, 71, 8, 73, 16, 71,
      16, 69, 8, 73, 8, 71, 8, 71, 8, 69, 32, ToneControl.BLOCK_END, 0,
      // define the other line of the song
      ToneControl.BLOCK_START, 1, 71, 8, 71, 8, 71, 8, 71, 8, 66, 16, 66,
      16, 71, 8, 69, 8, 68, 8, 66, 8, 64, 32, ToneControl.BLOCK_END, 1,
      // play the song
      ToneControl.PLAY_BLOCK, 0, ToneControl.PLAY_BLOCK, 0,
      ToneControl.PLAY_BLOCK, 1, ToneControl.PLAY_BLOCK, 0, };

  //----------------------------------------------------------
  //   actions

  /**
   * call this when the game pauses. This method does not affect the field
   * myShouldPause because this method is called only when the system pauses
   * the music, not when the player pauses the music.
   */
  void pauseGame() {
    try {
      myGamePause = true;
      myPlayer.stop();
      // when the application pauses the game, resources
      // are supposed to be released, so we close the
      // player and throw it away.
      myPlayer.close();
      myPlayer = null;
    } catch (Exception e) {
      // the music isn't necessary, so we ignore exceptions.
    }
  }

  /**
   * call this when the game resumes. This method does not affect the field
   * myShouldPause because this method is called only when the system reusmes
   * the music, not when the player pauses the music.
   */
  synchronized void resumeGame() {
    try {
      myGamePause = false;
      if (!myShouldPause) {
        // if the player is null, we create a new one.
        if (myPlayer == null) {
          start();
        }
        // start the music.
        myPlayer.start();
      }
    } catch (Exception e) {
      // the music isn't necessary, so we ignore exceptions.
    }
  }

  /**
   * toggle the music. (pause it if it's going, start it again if it's
   * paused).
   */
  synchronized void toggle() {
    try {
      myShouldPause = !myShouldPause;
      if (myShouldPause) {
        if (myPlayer != null) {
          myPlayer.stop();
        }
      } else if (!myGamePause) {
        // if the player is null, we create a new one.
        if (myPlayer == null) {
          start();
        }
        // start the music.
        myPlayer.start();
      }
    } catch (Exception e) {
      // the music isn't necessary, so we ignore exceptions.
    }
  }

  /**
   * stops the music.
   */
  synchronized void requestStop() {
    try {
      myPlayer.stop();
      // this is called when the game is over, to we close
      // up the player to release the resources.
      myPlayer.close();
    } catch (Exception e) {
      // the music isn't necessary, so we ignore exceptions.
    }
  }

  //----------------------------------------------------------
  //   initialization

  /**
   * start the music.. Here the method is "start" instead of "run" because it
   * is not necessary to create a thread for the Player. the Player runs on
   * its own thread.
   */
  public void start() {
    ToneControl control = null;
    try {
      myPlayer = Manager.createPlayer(Manager.TONE_DEVICE_LOCATOR);
      // do the preliminary set-up:
      myPlayer.realize();
      // set a listener to listen for the end of the tune:
      myPlayer.addPlayerListener(this);
      // get the ToneControl object in order to set the tune data:
      control = (ToneControl) myPlayer.getControl("ToneControl");
      control.setSequence(myTune);
      // set the volume to the highest possible volume:
      VolumeControl vc = (VolumeControl) myPlayer
          .getControl("VolumeControl");
      vc.setLevel(100);
    } catch (Exception e) {
      // the music isn't necessary, so we ignore exceptions.
    }
  }

  //----------------------------------------------------------
  //   implementation of PlayerListener

  /**
   * If we reach the end of the song, play it again...
   */
  public void playerUpdate(Player player, String event, Object eventData) {
    if (event.equals(PlayerListener.END_OF_MEDIA)) {
      if ((!myShouldPause) && (!myGamePause)) {
        try {
          myPlayer.start();
        } catch (Exception e) {
          // the music isn't necessary, so we ignore exceptions.
        }
      }
    }
  }

}
/**
 * This is the class that plays a little tune while you play the game.
 * 
 * @author Carol Hamer
 */

class MusicMaker extends Thread {

  //---------------------------------------------------------
  //   fields

  /**
   * Whether or not the main thread would like this thread to stop.
   */
  public static final int NOTE_LENGTH = 250;

  /**
   * Whether or not the main thread would like this thread to pause.
   */
  private boolean myShouldPause;

  /**
   * If the whole game is paused, we pause the music too..
   */
  private boolean myGamePause;

  /**
   * Whether or not the main thread would like this thread to stop.
   */
  private static boolean myShouldStop;

  /**
   * The tune played by the game, stored as an array of notes and durations.
   * 
   * NOTE: 69 is A. To get other notes, just add or subtract their difference
   * from A on the keyboard including the black keys in the calculation. See
   * the scales below for an idea.
   *  
   */
  private byte[][] myTune = { { 69, 1 }, { 69, 1 }, { 69, 1 }, { 71, 1 },
      { 73, 2 }, { 71, 2 }, { 69, 1 }, { 73, 1 }, { 71, 1 }, { 71, 1 },
      { 69, 4 }, { 69, 1 }, { 69, 1 }, { 69, 1 }, { 71, 1 }, { 73, 2 },
      { 71, 2 }, { 69, 1 }, { 73, 1 }, { 71, 1 }, { 71, 1 }, { 69, 4 },
      { 71, 1 }, { 71, 1 }, { 71, 1 }, { 71, 1 }, { 66, 2 }, { 66, 2 },
      { 71, 1 }, { 69, 1 }, { 68, 1 }, { 66, 1 }, { 64, 4 }, { 69, 1 },
      { 69, 1 }, { 69, 1 }, { 71, 1 }, { 73, 2 }, { 71, 2 }, { 69, 1 },
      { 73, 1 }, { 71, 1 }, { 71, 1 }, { 69, 4 } };

  /**
   * An example "tune" that is just a scale.. not used.
   */
  private byte[][] myScale = { { 69, 1 }, { 71, 1 }, { 73, 1 }, { 74, 1 },
      { 76, 1 }, { 78, 1 }, { 80, 1 }, { 81, 1 } };

  /**
   * An example "tune" that is just a scale.. not used.
   */
  private byte[][] myScale2 = { { 57, 1 }, { 59, 1 }, { 61, 1 }, { 62, 1 },
      { 64, 1 }, { 66, 1 }, { 68, 1 }, { 69, 1 } };

  //----------------------------------------------------------
  //   actions

  /**
   * call this when the game pauses.
   */
  void pauseGame() {
    myGamePause = true;
  }

  /**
   * call this when the game resumes.
   */
  synchronized void resumeGame() {
    myGamePause = false;
    this.notify();
  }

  /**
   * toggle the music. (pause it if it's going, start it again if it's
   * paused).
   */
  synchronized void toggle() {
    myShouldPause = !myShouldPause;
    this.notify();
  }

  /**
   * stops the music.
   */
  synchronized void requestStop() {
    myShouldStop = true;
    this.notify();
  }

  /**
   * start the music..
   */
  public void run() {
    myShouldStop = false;
    myShouldPause = true;
    myGamePause = false;
    int counter = 0;
    while (true) {
      if (myShouldStop) {
        break;
      }
      synchronized (this) {
        while ((myShouldPause) || (myGamePause)) {
          try {
            wait();
          } catch (Exception e) {
          }
        }
      }
      try {
        Manager.playTone(myTune[counter][0], myTune[counter][1]
            * NOTE_LENGTH, 50);
      } catch (Exception e) {
        // the music isn't necessary, so we ignore exceptions.
      }
      synchronized (this) {
        try {
          wait(myTune[counter][1] * NOTE_LENGTH);
        } catch (Exception e) {
        }
      }
      counter++;
      if (counter >= myTune.length) {
        counter = 0;
      }
    }
  }

}
/**
 * This handles the graphics objects.
 * 
 * @author Carol Hamer
 */

class JumpManager extends javax.microedition.lcdui.game.LayerManager {

  //---------------------------------------------------------
  //   dimension fields
  //  (constant after initialization)

  /**
   * The x-coordinate of the place on the game canvas where the LayerManager
   * window should appear, in terms of the coordiantes of the game canvas.
   */
  static int CANVAS_X;

  /**
   * The y-coordinate of the place on the game canvas where the LayerManager
   * window should appear, in terms of the coordiantes of the game canvas.
   */
  static int CANVAS_Y;

  /**
   * The width of the display window.
   */
  static int DISP_WIDTH;

  /**
   * The height of this object's graphical region. This is the same as the
   * height of the visible part because in this game the layer manager's
   * visible part scrolls only left and right but not up and down.
   */
  static int DISP_HEIGHT;

  //   game object fields

  // the player's object.
  private Cowboy myCowboy;

  /**
   * the tumbleweeds that enter from the left.
   */
  private Tumbleweed[] myLeftTumbleweeds;

  /**
   * the tumbleweeds that enter from the right.
   */
  private Tumbleweed[] myRightTumbleweeds;

  /**
   * the object representing the grass in the background..
   */
  private Grass myGrass;

  /**
   * Whether or not the player is currently going left.
   */
  private boolean myLeft;

  /**
   * The leftmost x-coordinate that should be visible on the screen in terms
   * of this objects internal coordinates.
   */
  private int myCurrentLeftX;

  //-----------------------------------------------------
  //    gets/sets

  /**
   * This tells the player to turn left or right.
   * 
   * @param left
   *            whether or not the turn is towards the left..
   */
  void setLeft(boolean left) {
    myLeft = left;
  }

  /**
   * @return a handle to the tumbleweed objects.
   */
  Tumbleweed[] getTumbleweeds() {
    Tumbleweed[] retArray = new Tumbleweed[myLeftTumbleweeds.length
        + myRightTumbleweeds.length];
    for (int i = 0; i < myLeftTumbleweeds.length; i++) {
      retArray[i] = myLeftTumbleweeds[i];
    }
    for (int i = 0; i < myRightTumbleweeds.length; i++) {
      retArray[i + myLeftTumbleweeds.length] = myRightTumbleweeds[i];
    }
    return (retArray);
  }

  //-----------------------------------------------------
  //    initialization and game state changes

  /**
   * Constructor sets the data and constructs the graphical objects..
   * 
   * @param x
   *            The x-coordinate of the place on the game canvas where the
   *            LayerManager window should appear, in terms of the coordiantes
   *            of the game canvas.
   * @param y
   *            The y-coordinate of the place on the game canvas where the
   *            LayerManager window should appear, in terms of the coordiantes
   *            of the game canvas.
   * @param width
   *            the width of the region that is to be occupied by the
   *            LayoutManager.
   * @param height
   *            the height of the region that is to be occupied by the
   *            LayoutManager.
   */
  public JumpManager(int x, int y, int width, int height) throws Exception {
    CANVAS_X = x;
    CANVAS_Y = y;
    DISP_WIDTH = width;
    DISP_HEIGHT = height;
    myCurrentLeftX = Grass.CYCLE * Grass.TILE_WIDTH;
    setViewWindow(0, 0, DISP_WIDTH, DISP_HEIGHT);
    // create the player:
    if (myCowboy == null) {
      myCowboy = new Cowboy(myCurrentLeftX + DISP_WIDTH / 2, DISP_HEIGHT
          - Cowboy.HEIGHT - 2);
      append(myCowboy);
    }
    // create the tumbleweeds to jump over:
    if (myLeftTumbleweeds == null) {
      myLeftTumbleweeds = new Tumbleweed[2];
      for (int i = 0; i < myLeftTumbleweeds.length; i++) {
        myLeftTumbleweeds[i] = new Tumbleweed(true);
        append(myLeftTumbleweeds[i]);
      }
    }
    if (myRightTumbleweeds == null) {
      myRightTumbleweeds = new Tumbleweed[2];
      for (int i = 0; i < myRightTumbleweeds.length; i++) {
        myRightTumbleweeds[i] = new Tumbleweed(false);
        append(myRightTumbleweeds[i]);
      }
    }
    // create the background object:
    if (myGrass == null) {
      myGrass = new Grass();
      append(myGrass);
    }
  }

  /**
   * sets all variables back to their initial positions.
   */
  void reset() {
    if (myGrass != null) {
      myGrass.reset();
    }
    if (myCowboy != null) {
      myCowboy.reset();
    }
    if (myLeftTumbleweeds != null) {
      for (int i = 0; i < myLeftTumbleweeds.length; i++) {
        myLeftTumbleweeds[i].reset();
      }
    }
    if (myRightTumbleweeds != null) {
      for (int i = 0; i < myRightTumbleweeds.length; i++) {
        myRightTumbleweeds[i].reset();
      }
    }
    myLeft = false;
    myCurrentLeftX = Grass.CYCLE * Grass.TILE_WIDTH;
  }

  //-------------------------------------------------------
  //  graphics methods

  /**
   * paint the game graphic on the screen.
   */
  public void paint(Graphics g) {
    setViewWindow(myCurrentLeftX, 0, DISP_WIDTH, DISP_HEIGHT);
    paint(g, CANVAS_X, CANVAS_Y);
  }

  /**
   * If the cowboy gets to the end of the graphical region, move all of the
   * pieces so that the screen appears to wrap.
   */
  private void wrap() {
    if (myCurrentLeftX % (Grass.TILE_WIDTH * Grass.CYCLE) == 0) {
      if (myLeft) {
        myCowboy.move(Grass.TILE_WIDTH * Grass.CYCLE, 0);
        myCurrentLeftX += (Grass.TILE_WIDTH * Grass.CYCLE);
        for (int i = 0; i < myLeftTumbleweeds.length; i++) {
          myLeftTumbleweeds[i]
              .move(Grass.TILE_WIDTH * Grass.CYCLE, 0);
        }
        for (int i = 0; i < myRightTumbleweeds.length; i++) {
          myRightTumbleweeds[i].move(Grass.TILE_WIDTH * Grass.CYCLE,
              0);
        }
      } else {
        myCowboy.move(-(Grass.TILE_WIDTH * Grass.CYCLE), 0);
        myCurrentLeftX -= (Grass.TILE_WIDTH * Grass.CYCLE);
        for (int i = 0; i < myLeftTumbleweeds.length; i++) {
          myLeftTumbleweeds[i].move(-Grass.TILE_WIDTH * Grass.CYCLE,
              0);
        }
        for (int i = 0; i < myRightTumbleweeds.length; i++) {
          myRightTumbleweeds[i].move(-Grass.TILE_WIDTH * Grass.CYCLE,
              0);
        }
      }
    }
  }

  //-------------------------------------------------------
  //  game movements

  /**
   * Tell all of the moving components to advance.
   * 
   * @param gameTicks
   *            the remainaing number of times that the main loop of the game
   *            will be executed before the game ends.
   * @return the change in the score after the pieces have advanced.
   */
  int advance(int gameTicks) {
    int retVal = 0;
    // first we move the view window
    // (so we are showing a slightly different view of
    // the manager's graphical area.)
    if (myLeft) {
      myCurrentLeftX--;
    } else {
      myCurrentLeftX++;
    }
    // now we tell the game objects to move accordingly.
    myGrass.advance(gameTicks);
    myCowboy.advance(gameTicks, myLeft);
    for (int i = 0; i < myLeftTumbleweeds.length; i++) {
      retVal += myLeftTumbleweeds[i].advance(myCowboy, gameTicks, myLeft,
          myCurrentLeftX, myCurrentLeftX + DISP_WIDTH);
      retVal -= myCowboy.checkCollision(myLeftTumbleweeds[i]);
    }
    for (int i = 0; i < myLeftTumbleweeds.length; i++) {
      retVal += myRightTumbleweeds[i].advance(myCowboy, gameTicks,
          myLeft, myCurrentLeftX, myCurrentLeftX + DISP_WIDTH);
      retVal -= myCowboy.checkCollision(myRightTumbleweeds[i]);
    }
    // now we check if we have reached an edge of the viewable
    // area, and if so we move the view area and all of the
    // game objects so that the game appears to wrap.
    wrap();
    return (retVal);
  }

  /**
   * Tell the cowboy to jump..
   */
  void jump() {
    myCowboy.jump();
  }

}
