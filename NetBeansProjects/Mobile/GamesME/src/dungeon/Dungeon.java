package dungeon;

/*
 Title:  J2ME Games With MIDP2
 Authors:  Carol Hamer
 Publisher:  Apress
 ISBN:   1590593820
 */

import dungeon.DataConverter;
import java.io.*;
import javax.microedition.lcdui.*;
import javax.microedition.lcdui.game.*;
import javax.microedition.midlet.*;
import javax.microedition.rms.*;

/**
 * This is the main class of the dungeon game.
 * 
 * @author Carol Hamer
 */
public class Dungeon extends MIDlet implements CommandListener {

  //-----------------------------------------------------
  //    game object fields

  /**
   * The canvas that the dungeon is drawn on.
   */
  private DungeonCanvas myCanvas;

  /**
   * the thread that advances the game clock.
   */
  private GameThread myGameThread;

  //-----------------------------------------------------
  //    command fields

  /**
   * The button to exit the game.
   */
  private Command myExitCommand = new Command("Exit", Command.EXIT, 99);

  /**
   * The command to save the game in progress.
   */
  private Command mySaveCommand = new Command("Save Game", Command.SCREEN, 2);

  /**
   * The command to restore a previously saved game.
   */
  private Command myRestoreCommand = new Command("Restore Game",
      Command.SCREEN, 2);

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
  private Command myNewCommand = new Command("Next Board", Command.SCREEN, 1);

  //-----------------------------------------------------
  //    initialization and game state changes

  /**
   * Initialize the canvas and the commands.
   */
  public Dungeon() {
    try {
      // create the canvas and set up the commands:
      myCanvas = new DungeonCanvas(this);
      myCanvas.addCommand(myExitCommand);
      myCanvas.addCommand(mySaveCommand);
      myCanvas.addCommand(myRestoreCommand);
      myCanvas.addCommand(myPauseCommand);
      myCanvas.setCommandListener(this);
    } catch (Exception e) {
      // if there's an error during creation, display it as an alert.
      errorMsg(e);
    }
  }

  /**
   * Switch the command to the play again command. (removing other commands
   * that are no longer relevant)
   */
  void setNewCommand() {
    myCanvas.removeCommand(myPauseCommand);
    myCanvas.removeCommand(myGoCommand);
    myCanvas.addCommand(myNewCommand);
  }

  /**
   * Switch the command to the go command. (removing other commands that are
   * no longer relevant)
   */
  void setGoCommand() {
    myCanvas.removeCommand(myPauseCommand);
    myCanvas.removeCommand(myNewCommand);
    myCanvas.addCommand(myGoCommand);
  }

  /**
   * Switch the command to the pause command. (removing other commands that
   * are no longer relevant)
   */
  void setPauseCommand() {
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
    if (myCanvas != null) {
      if (myGameThread == null) {
        // create the thread and start the game:
        myGameThread = new GameThread(myCanvas);
        myCanvas.start();
        myGameThread.start();
      } else {
        // in case this gets called again after
        // the application has been started once:
        myCanvas.removeCommand(myGoCommand);
        myCanvas.addCommand(myPauseCommand);
        myCanvas.flushKeys();
        myGameThread.resumeGame();
      }
    }
  }

  /**
   * Stop the threads and throw out the garbage.
   */
  public void destroyApp(boolean unconditional)
      throws MIDletStateChangeException {
    myCanvas = null;
    if (myGameThread != null) {
      myGameThread.requestStop();
    }
    myGameThread = null;
    System.gc();
  }

  /**
   * Pause the game.
   */
  public void pauseApp() {
    if (myCanvas != null) {
      setGoCommand();
    }
    if (myGameThread != null) {
      myGameThread.pause();
    }
  }

  //----------------------------------------------------------------
  //  implementation of CommandListener

  /*
   * Respond to a command issued on the Canvas. (reset, exit, or change size
   * prefs).
   */
  public void commandAction(Command c, Displayable s) {
    try {
      if (c == myGoCommand) {
        myCanvas.setNeedsRepaint();
        myCanvas.removeCommand(myGoCommand);
        myCanvas.addCommand(myPauseCommand);
        myCanvas.flushKeys();
        myGameThread.resumeGame();
      } else if (c == myPauseCommand) {
        myCanvas.setNeedsRepaint();
        myCanvas.removeCommand(myPauseCommand);
        myCanvas.addCommand(myGoCommand);
        myGameThread.pause();
      } else if (c == myNewCommand) {
        myCanvas.setNeedsRepaint();
        // go to the next board and restart the game
        myCanvas.removeCommand(myNewCommand);
        myCanvas.addCommand(myPauseCommand);
        myCanvas.reset();
        myGameThread.resumeGame();
      /*} else if (c == Alert.DISMISS_COMMAND) {
        // if there was a serious enough error to
        // cause an alert, then we end the game
        // when the user is done reading the alert:
        // (Alert.DISMISS_COMMAND is the default
        // command that is placed on an Alert
        // whose timeout is FOREVER)
        destroyApp(false);
        notifyDestroyed();*/
      } else if (c == mySaveCommand) {
        myCanvas.setNeedsRepaint();
        myCanvas.saveGame();
      } else if (c == myRestoreCommand) {
        myCanvas.setNeedsRepaint();
        myCanvas.removeCommand(myNewCommand);
        myCanvas.removeCommand(myGoCommand);
        myCanvas.addCommand(myPauseCommand);
        myCanvas.revertToSaved();
      } else if (c == myExitCommand) {
        destroyApp(false);
        notifyDestroyed();
      }
    } catch (Exception e) {
      errorMsg(e);
    }
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
 * This class represents doors and keys.
 * 
 * @author Carol Hamer
 */

class DoorKey extends Sprite {

  //---------------------------------------------------------
  //    fields

  /**
   * The image file shared by all doors and keys.
   */
  public static Image myImage;

  /**
   * A code int that indicates the door or key's color.
   */
  private int myColor;

  //---------------------------------------------------------
  //    get/set data

  /**
   * @return the door or key's color.
   */
  public int getColor() {
    return (myColor);
  }

  //---------------------------------------------------------
  //    constructor and initializer

  static {
    try {
      myImage = Image.createImage("/images/keys.png");
    } catch (Exception e) {
      throw (new RuntimeException(
          "DoorKey.<init>-->failed to load image, caught "
              + e.getClass() + ": " + e.getMessage()));
    }
  }

  /**
   * Standard constructor sets the image to the correct frame (according to
   * whether this is a door or a key and what color it should be) and then
   * puts it in the correct location.
   */
  public DoorKey(int color, boolean isKey, int[] gridCoordinates) {
    super(myImage, DungeonManager.SQUARE_WIDTH, DungeonManager.SQUARE_WIDTH);
    myColor = color;
    int imageIndex = color * 2;
    if (isKey) {
      imageIndex++;
    }
    setFrame(imageIndex);
    setPosition(gridCoordinates[0] * DungeonManager.SQUARE_WIDTH,
        gridCoordinates[1] * DungeonManager.SQUARE_WIDTH);
  }

}

/**
 * This class is a set of simple utility functions that can be used to convert
 * standard data types to bytes and back again. It is used especially for data
 * storage, but also for sending and receiving data.
 * 
 * @author Carol Hamer
 */

class DataConverter {

  //--------------------------------------------------------
  //  utilities to encode small, compactly-stored small ints.

  /**
   * Encodes a coordinate pair into a byte.
   * 
   * @param coordPair
   *            a pair of integers to be compacted into a single byte for
   *            storage. WARNING: each of the two values MUST BE between 0 and
   *            15 (inclusive). This method does not verify the length of the
   *            array (which must be 2!) nor does it verify that the ints are
   *            of the right size.
   */
  public static byte encodeCoords(int[] coordPair) {
    // get the byte value of the first coordinate:
    byte retVal = (new Integer(coordPair[0])).byteValue();
    // move the first coordinate's value up to the top
    // half of the storage byte:
    retVal = (new Integer(retVal << 4)).byteValue();
    // store the second coordinate in the lower half
    // of the byte:
    retVal += (new Integer(coordPair[1])).byteValue();
    return (retVal);
  }

  /**
   * Encodes eight ints into a byte. This could be easily modified to encode
   * eight booleans.
   * 
   * @param eight
   *            an array of at least eight ints. WARNING: all values must be 0
   *            or 1! This method does not verify that the values are in the
   *            correct range nor does it verify that the array is long
   *            enough.
   * @param offset
   *            the index in the array eight to start reading data from.
   *            (should usually be 0)
   */
  public static byte encode8(int[] eight, int offset) {
    // get the byte value of the first int:
    byte retVal = (new Integer(eight[offset])).byteValue();
    // progressively move the data up one bit in the
    // storage byte and then record the next int in
    // the lowest spot in the storage byte:
    for (int i = offset + 1; i < 8 + offset; i++) {
      retVal = (new Integer(retVal << 1)).byteValue();
      retVal += (new Integer(eight[i])).byteValue();
    }
    return (retVal);
  }

  //--------------------------------------------------------
  //  utilities to decode small, compactly-stored small ints.

  /**
   * Turns a byte into a pair of coordinates.
   */
  public static int[] decodeCoords(byte coordByte) {
    int[] retArray = new int[2];
    // we perform a bitwise and with the value 15
    // in order to just get the bits of the lower
    // half of the byte:
    retArray[1] = coordByte & 15;
    // To get the bits of the upper half of the
    // byte, we perform a shift to move them down:
    retArray[0] = coordByte >> 4;
    // bytes in Java are generally assumed to be
    // signed, but in this coding algorithm we
    // would like to treat them as unsigned:
    if (retArray[0] < 0) {
      retArray[0] += 16;
    }
    return (retArray);
  }

  /**
   * Turns a byte into eight ints.
   */
  public static int[] decode8(byte data) {
    int[] retArray = new int[8];
    // The flag allows us to look at each bit individually
    // to determine if it is 1 or 0. The number 128
    // corresponds to the highest bit of a byte, so we
    // start with that one.
    int flag = 128;
    // We use a loop that checks
    // the data bit by bit by performing a bitwise
    // and (&) between the data byte and a flag:
    for (int i = 0; i < 8; i++) {
      if ((flag & data) != 0) {
        retArray[i] = 1;
      } else {
        retArray[i] = 0;
      }
      // move the flag down one bit so that we can
      // check the next bit of data on the next pass
      // through the loop:
      flag = flag >> 1;
    }
    return (retArray);
  }

  //--------------------------------------------------------
  //  standard integer interpretation

  /**
   * Uses an input stream to convert an array of bytes to an int.
   */
  public static int parseInt(byte[] data) throws IOException {
    DataInputStream stream = new DataInputStream(new ByteArrayInputStream(
        data));
    int retVal = stream.readInt();
    stream.close();
    return (retVal);
  }

  /**
   * Uses an output stream to convert an int to four bytes.
   */
  public static byte[] intToFourBytes(int i) throws IOException {
    ByteArrayOutputStream baos = new ByteArrayOutputStream(4);
    DataOutputStream dos = new DataOutputStream(baos);
    dos.writeInt(i);
    baos.close();
    dos.close();
    byte[] retArray = baos.toByteArray();
    return (retArray);
  }

  //--------------------------------------------------------
  //  integer interpretation illustrated

  /**
   * Java appears to treat a byte as being signed when returning it as an
   * int--this function converts from the signed value to the corresponding
   * unsigned value. This method is used by nostreamParseInt.
   */
  public static int unsign(int signed) {
    int retVal = signed;
    if (retVal < 0) {
      retVal += 256;
    }
    return (retVal);
  }

  /**
   * Takes an array of bytes and returns an int. This version will return the
   * same value as the method parseInt above. This version is included in
   * order to illustrate how Java encodes int values in terms of bytes.
   * 
   * @param data
   *            an array of 1, 2, or 4 bytes.
   */
  public static int nostreamParseInt(byte[] data) {
    // byte 0 is the high byte which is assumed
    // to be signed. As we add the lower bytes
    // one by one, we unsign them because because
    // a single byte alone is interpreted as signed,
    // but in an int only the top byte should be signed.
    // (note that the high byte is the first one in the array)
    int retVal = data[0];
    for (int i = 1; i < data.length; i++) {
      retVal = retVal << 8;
      retVal += unsign(data[i]);
    }
    return (retVal);
  }

  /**
   * Takes an arbitrary int and returns an array of four bytes. This version
   * will return the same byte array as the method intToFourBytes above. This
   * version is included in order to illustrate how Java encodes int values in
   * terms of bytes.
   */
  public static byte[] nostreamIntToFourBytes(int i) {
    byte[] fourBytes = new byte[4];
    // when you take the byte value of an int, it
    // only gives you the lowest byte. So we
    // get all four bytes by taking the lowest
    // byte four times and moving the whole int
    // down by one byte between each one.
    // (note that the high byte is the first one in the array)
    fourBytes[3] = (new Integer(i)).byteValue();
    i = i >> 8;
    fourBytes[2] = (new Integer(i)).byteValue();
    i = i >> 8;
    fourBytes[1] = (new Integer(i)).byteValue();
    i = i >> 8;
    fourBytes[0] = (new Integer(i)).byteValue();
    return (fourBytes);
  }

  /**
   * Takes an int between -32768 and 32767 and returns an array of two bytes.
   * This does not verify that the argument is of the right size. If the
   * absolute value of i is too high, it will not be encoded correctly.
   */
  public static byte[] nostreamIntToTwoBytes(int i) {
    byte[] twoBytes = new byte[2];
    // when you take the byte value of an int, it
    // only gives you the lowest byte. So we
    // get the lower two bytes by taking the lowest
    // byte twice and moving the whole int
    // down by one byte between each one.
    twoBytes[1] = (new Integer(i)).byteValue();
    i = i >> 8;
    twoBytes[0] = (new Integer(i)).byteValue();
    return (twoBytes);
  }

}
/**
 * This class contains the data for the map of the dungeon..
 * 
 * @author Carol Hamer
 */

class BoardDecoder {

  //--------------------------------------------------------
  //  fields

  /**
   * The coordinates of where the player starts on the map in terms of the
   * array indices.
   */
  private int[] myPlayerSquare;

  /**
   * The coordinates of the goal (crown).
   */
  private int[] myGoalSquare;

  /**
   * The coordinates of the doors. the there should be two in a row of each
   * color, following the same sequence as the keys.
   */
  private int[][] myDoors;

  /**
   * The coordinates of the Keys. the there should be of each color, following
   * the same sequence as the doors.
   */
  private int[][] myKeys;

  /**
   * The coordinates of the stone walls of the maze, encoded bit by bit.
   */
  private TiledLayer myLayer;

  /**
   * The data in bytes that gives the various boards. This was created using
   * EncodingUtils... This is a two-dimensional array: Each of the four main
   * sections corresponds to one of the four possible boards.
   */
  private static byte[][] myData = {
      { 0, 0, -108, -100, -24, 65, 21, 58, 53, -54, -116, -58, -56, -84,
          115, -118, -1, -1, -128, 1, -103, -15, -128, 25, -97, -127,
          -128, 79, -14, 1, -126, 121, -122, 1, -113, -49, -116, 1,
          -100, -3, -124, 5, -25, -27, -128, 1, -1, -1 },
      { 0, 1, 122, 90, -62, 34, -43, 72, -59, -29, 56, -55, 98, 126, -79,
          61, -1, -1, -125, 1, -128, 17, -26, 29, -31, 57, -72, 1,
          -128, -51, -100, 65, -124, 57, -2, 1, -126, 13, -113, 1,
          -97, 25, -127, -99, -8, 1, -1, -1 },
      { 0, 2, 108, -24, 18, -26, 102, 30, -58, 46, -28, -88, 34, -98, 97,
          -41, -1, -1, -96, 1, -126, 57, -9, 97, -127, 69, -119, 73,
          -127, 1, -109, 59, -126, 1, -26, 103, -127, 65, -103, 115,
          -127, 65, -25, 73, -128, 1, -1, -1 },
      { 0, 3, -114, 18, -34, 27, -39, -60, -76, -50, 118, 90, 82, -88,
          34, -74, -1, -1, -66, 1, -128, 121, -26, 125, -128, -123,
          -103, 29, -112, 1, -109, 49, -112, 1, -116, -31, -128, 5,
          -122, 5, -32, 13, -127, -51, -125, 1, -1, -1 }, };

  //--------------------------------------------------------
  //  initialization

  /**
   * Constructor fills data fields by interpreting the data bytes.
   */
  public BoardDecoder(int boardNum) throws Exception {
    // we start by selecting the two dimensional
    // array corresponding to the desired board:
    byte[] data = myData[boardNum];
    // The first two bytes give the version number and
    // the board number, but we ignore them because
    // they are assumed to be correct.
    // The third byte of the first array is the first one
    // we read: it gives the player's starting coordinates:
    myPlayerSquare = DataConverter.decodeCoords(data[2]);
    // the next byte gives the coordinates of the crown:
    myGoalSquare = DataConverter.decodeCoords(data[3]);
    // the next four bytes give the coordinates of the keys:
    myKeys = new int[4][];
    for (int i = 0; i < myKeys.length; i++) {
      myKeys[i] = DataConverter.decodeCoords(data[i + 4]);
    }
    // the next eight bytes give the coordinates of the doors:
    myDoors = new int[8][];
    for (int i = 0; i < myDoors.length; i++) {
      myDoors[i] = DataConverter.decodeCoords(data[i + 8]);
    }
    // now we create the TiledLayer object that is the
    // background dungeon map:
    myLayer = new TiledLayer(16, 16,
        Image.createImage("/images/stone.png"),
        DungeonManager.SQUARE_WIDTH, DungeonManager.SQUARE_WIDTH);
    // now we call an internal utility that reads the array
    // of data that gives the positions of the blocks in the
    // walls of this dungeon:
    decodeDungeon(data, myLayer, 16);
  }

  //--------------------------------------------------------
  //  get/set data

  /**
   * @return the number of boards currently stored in this class.
   */
  public static int getNumBoards() {
    return (myData.length);
  }

  /**
   * get the coordinates of where the player starts on the map in terms of the
   * array indices.
   */
  public int[] getPlayerSquare() {
    return (myPlayerSquare);
  }

  /**
   * get the coordinates of the goal crown in terms of the array indices.
   */
  public int[] getGoalSquare() {
    return (myGoalSquare);
  }

  /**
   * get the tiled layer that gives the map of the dungeon.
   */
  public TiledLayer getLayer() {
    return (myLayer);
  }

  /**
   * Creates the array of door sprites. (call this only once to avoid creating
   * redundant sprites).
   */
  DoorKey[] createDoors() {
    DoorKey[] retArray = new DoorKey[8];
    for (int i = 0; i < 4; i++) {
      retArray[2 * i] = new DoorKey(i, false, myDoors[2 * i]);
      retArray[2 * i + 1] = new DoorKey(i, false, myDoors[2 * i + 1]);
    }
    return (retArray);
  }

  /**
   * Creates the array of key sprites. (call this only once to avoid creating
   * redundant sprites.)
   */
  DoorKey[] createKeys() {
    DoorKey[] retArray = new DoorKey[4];
    for (int i = 0; i < 4; i++) {
      retArray[i] = new DoorKey(i, true, myKeys[i]);
    }
    return (retArray);
  }

  //--------------------------------------------------------
  //  decoding utilities

  /**
   * Takes a dungeon given as a byte array and uses it to set the tiles of a
   * tiled layer.
   * 
   * The TiledLayer in this case is a 16 x 16 grid in which each square can be
   * either blank (value of 0) or can be filled with a stone block (value of
   * 1). Therefore each square requires only one bit of information. Each byte
   * of data in the array called "data" records the frame indices of eight
   * squares in the grid.
   */
  private static void decodeDungeon(byte[] data, TiledLayer dungeon,
      int offset) throws Exception {
    if (data.length + offset < 32) {
      throw (new Exception(
          "BoardDecoder.decodeDungeon-->not enough data!!!"));
    }
    // a frame index of zero indicates a blank square
    // (this is always true in a TiledLayer).
    // This TiledLayer has only one possible (non-blank)
    // frame, so a frame index of 1 indicates a stone block
    int frame = 0;
    // Each of the 32 bytes in the data array records
    // the frame indices of eight block in the 16 x 16
    // grid. Two bytes give one row of the dungeon,
    // so we have the array index go from zero to 16
    // to set the frame indices fro each of the 16 rows.
    for (int i = 0; i < 16; i++) {
      // The flag allows us to look at each bit individually
      // to determine if it is 1 or 0. The number 128
      // corresponds to the highest bit of a byte, so we
      // start with that one.
      int flag = 128;
      // Here we check two bytes at the same time
      // (the two bytes together correspond to one row
      // of the dungeon). We use a loop that checks
      // the bytes bit by bit by performing a bitwise
      // and (&) between the data byte and a flag:
      for (int j = 0; j < 8; j++) {
        if ((data[offset + 2 * i] & flag) != 0) {
          frame = 1;
        } else {
          frame = 0;
        }
        dungeon.setCell(j, i, frame);
        if ((data[offset + 2 * i + 1] & flag) != 0) {
          frame = 1;
        } else {
          frame = 0;
        }
        dungeon.setCell(j + 8, i, frame);
        // move the flag down one bit so that we can
        // check the next bit of data on the next pass
        // through the loop:
        flag = flag >> 1;
      }
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
  private static boolean myShouldStop;

  /**
   * A handle back to the graphical components.
   */
  private DungeonCanvas myDungeonCanvas;

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
  GameThread(DungeonCanvas canvas) {
    myDungeonCanvas = canvas;
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
  void pause() {
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
    this.notify();
  }

  /**
   * start the game..
   */
  public void run() {
    // flush any keystrokes that occurred before the
    // game started:
    myDungeonCanvas.flushKeys();
    myShouldStop = false;
    myShouldPause = false;
    while (true) {
      myLastRefreshTime = System.currentTimeMillis();
      if (myShouldStop) {
        break;
      }
      myDungeonCanvas.checkKeys();
      myDungeonCanvas.updateScreen();
      // we do a very short pause to allow the other thread
      // to update the information about which keys are pressed:
      synchronized (this) {
        try {
          wait(getWaitTime());
        } catch (Exception e) {
        }
      }
      if (myShouldPause) {
        synchronized (this) {
          try {
            wait();
          } catch (Exception e) {
          }
        }
      }
    }
  }

}

/**
 * This class contains the data for a game currently in progress. used to store
 * a game and to resume a stored game.
 * 
 * @author Carol Hamer
 */

class GameInfo {

  //--------------------------------------------------------
  //  fields

  /**
   * The name of the datastore.
   */
  public static final String STORE = "GameInfo";

  /**
   * This is set to true if an attempt is made to read a game when no game has
   * been saved.
   */
  private boolean myNoDataSaved;

  /**
   * The number that indicates which board the player is currently on.
   */
  private int myBoardNum;

  /**
   * The amount of time that has passed.
   */
  private int myTime;

  /**
   * The coordinates of where the player is on the board. coordinate values
   * must be between 0 and 15.
   */
  private int[] myPlayerSquare;

  /**
   * The coordinates of where the keys are currently found. MUST BE four sets
   * of two integer coordinates. coordinate values must be between 0 and 15.
   */
  private int[][] myKeyCoords;

  /**
   * The list of which doors are currently open. 0 = open 1 = closed WARNING:
   * this array MUST have length 8.
   */
  private int[] myDoorsOpen;

  /**
   * The number of the key that is currently being held by the player. if no
   * key is held, then the value is -1.
   */
  private int myHeldKey;

  //--------------------------------------------------------
  //  data gets/sets

  /**
   * @return true if no saved game records were found.
   */
  boolean getIsEmpty() {
    return (myNoDataSaved);
  }

  /**
   * @return The number that indicates which board the player is currently on.
   */
  int getBoardNum() {
    return (myBoardNum);
  }

  /**
   * @return The number of the key that is currently being held by the player.
   *         if no key is held, then the value is -1.
   */
  int getHeldKey() {
    return (myHeldKey);
  }

  /**
   * @return The amount of time that has passed.
   */
  int getTime() {
    return (myTime);
  }

  /**
   * @return The coordinates of where the player is on the board. coordinate
   *         values must be between 0 and 15.
   */
  int[] getPlayerSquare() {
    return (myPlayerSquare);
  }

  /**
   * @return The coordinates of where the keys are currently found. MUST BE
   *         four sets of two integer coordinates. coordinate values must be
   *         between 0 and 15.
   */
  int[][] getKeyCoords() {
    return (myKeyCoords);
  }

  /**
   * @return The list of which doors are currently open. 0 = open 1 = closed
   *         WARNING: this array MUST have length 8.
   */
  int[] getDoorsOpen() {
    return (myDoorsOpen);
  }

  //--------------------------------------------------------
  //  constructors

  /**
   * This constructor records the game info of a game currently in progress.
   */
  GameInfo(int boardNum, int time, int[] playerSquare, int[][] keyCoords,
      int[] doorsOpen, int heldKey) throws Exception {
    myBoardNum = boardNum;
    myTime = time;
    myPlayerSquare = playerSquare;
    myKeyCoords = keyCoords;
    myDoorsOpen = doorsOpen;
    myHeldKey = heldKey;
    encodeInfo();
  }

  /**
   * This constructor reads the game configuration from memory. This is used
   * to reconstruct a saved game.
   */
  GameInfo() {
    RecordStore store = null;
    try {
      // if the record store does not yet exist, don't
      // create it
      store = RecordStore.openRecordStore(STORE, false);
      if ((store != null) && (store.getNumRecords() > 0)) {
        // the first record has id number 1
        // it should also be the only record since this
        // particular game stores only one game.
        byte[] data = store.getRecord(1);
        myBoardNum = data[0];
        myPlayerSquare = DataConverter.decodeCoords(data[1]);
        myKeyCoords = new int[4][];
        myKeyCoords[0] = DataConverter.decodeCoords(data[2]);
        myKeyCoords[1] = DataConverter.decodeCoords(data[3]);
        myKeyCoords[2] = DataConverter.decodeCoords(data[4]);
        myKeyCoords[3] = DataConverter.decodeCoords(data[5]);
        myDoorsOpen = DataConverter.decode8(data[6]);
        myHeldKey = data[7];
        byte[] fourBytes = new byte[4];
        System.arraycopy(data, 8, fourBytes, 0, 4);
        myTime = DataConverter.parseInt(fourBytes);
      } else {
        myNoDataSaved = true;
      }
    } catch (Exception e) {
      // this throws when the record store doesn't exist.
      // for that or any error, we assume no data is saved:
      myNoDataSaved = true;
    } finally {
      try {
        if (store != null) {
          store.closeRecordStore();
        }
      } catch (Exception e) {
        // if the record store is open this shouldn't throw.
      }
    }
  }

  //--------------------------------------------------------
  //  encoding method

  /**
   * Turn the data into a byte array and save it.
   */
  private void encodeInfo() throws Exception {
    RecordStore store = null;
    try {
      byte[] data = new byte[12];
      data[0] = (new Integer(myBoardNum)).byteValue();
      data[1] = DataConverter.encodeCoords(myPlayerSquare);
      data[2] = DataConverter.encodeCoords(myKeyCoords[0]);
      data[3] = DataConverter.encodeCoords(myKeyCoords[1]);
      data[4] = DataConverter.encodeCoords(myKeyCoords[2]);
      data[5] = DataConverter.encodeCoords(myKeyCoords[3]);
      data[6] = DataConverter.encode8(myDoorsOpen, 0);
      data[7] = (new Integer(myHeldKey)).byteValue();
      byte[] timeBytes = DataConverter.intToFourBytes(myTime);
      System.arraycopy(timeBytes, 0, data, 8, 4);
      // if the record store does not yet exist, the second
      // arg "true" tells it to create.
      store = RecordStore.openRecordStore(STORE, true);
      int numRecords = store.getNumRecords();
      if (numRecords > 0) {
        store.setRecord(1, data, 0, data.length);
      } else {
        store.addRecord(data, 0, data.length);
      }
    } catch (Exception e) {
      throw (e);
    } finally {
      try {
        if (store != null) {
          store.closeRecordStore();
        }
      } catch (Exception e) {
        // if the record store is open this shouldn't throw.
      }
    }
  }

}

/**
 * This class contains the data for the map of the dungeon. This is a utility
 * class that allows a developer to write the data for a board in a simple
 * format, then this class encodes the data in a format that the game can use.
 * 
 * note that the data that this class encodes is hard-coded. that is because
 * this class is intended to be used only a few times to encode the data. Once
 * the board data has been encoded, it never needs to be encoded again. The
 * encoding methods used in this class could be generalized to be used to create
 * a board editor which would allow a user to easily create new boards, but that
 * is an exercise for another day...
 * 
 * @author Carol Hamer
 */

class EncodingUtils {

  //--------------------------------------------------------
  //  fields

  /**
   * data for which squares are filled and which are blank. 0 = empty 1 =
   * filled
   */
  private int[][] mySquares = {
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
      { 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1 },
      { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1 },
      { 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1 },
      { 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1 },
      { 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
      { 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1 },
      { 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1 },
      { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1 },
      { 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
      { 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1 },
      { 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1 },
      { 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1 },
      { 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1 },
      { 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, };

  /**
   * The coordinates of where the player starts on the map in terms of the
   * array indices.
   */
  private int[] myPlayerSquare = { 7, 10 };

  /**
   * The coordinates of the goal (crown).
   */
  private int[] myGoalSquare = { 5, 10 };

  //--------------------------------------------------------
  //  get/set data

  /**
   * Creates the array of door sprites. (call this only once to avoid creating
   * redundant sprites).
   */
  int[][] getDoorCoords() {
    int[][] retArray = new int[8][];
    for (int i = 0; i < retArray.length; i++) {
      retArray[i] = new int[2];
    }
    // red
    retArray[0][0] = 12;
    retArray[0][1] = 5;
    retArray[1][0] = 14;
    retArray[1][1] = 3;
    // green
    retArray[2][0] = 3;
    retArray[2][1] = 8;
    retArray[3][0] = 12;
    retArray[3][1] = 9;
    // blue
    retArray[4][0] = 6;
    retArray[4][1] = 2;
    retArray[5][0] = 7;
    retArray[5][1] = 14;
    // yellow
    retArray[6][0] = 11;
    retArray[6][1] = 1;
    retArray[7][0] = 3;
    retArray[7][1] = 13;
    return (retArray);
  }

  /**
   * Creates the array of key sprites. (call this only once to avoid creating
   * redundant sprites.)
   */
  int[][] getKeyCoords() {
    int[][] retArray = new int[4][];
    for (int i = 0; i < retArray.length; i++) {
      retArray[i] = new int[2];
    }
    // red
    retArray[0][0] = 12;
    retArray[0][1] = 2;
    // green
    retArray[1][0] = 2;
    retArray[1][1] = 2;
    // blue
    retArray[2][0] = 13;
    retArray[2][1] = 5;
    // yellow
    retArray[3][0] = 4;
    retArray[3][1] = 8;
    return (retArray);
  }

  //--------------------------------------------------------
  //  encoding / decoding utilities

  /**
   * Encodes the entire dungeon.
   */
  byte[][] encodeDungeon() {
    byte[][] retArray = new byte[2][];
    retArray[0] = new byte[16];
    // the first byte is the version number:
    retArray[0][0] = 0;
    // the second byte is the board number:
    retArray[0][1] = 0;
    // the player's start square:
    retArray[0][2] = DataConverter.encodeCoords(myPlayerSquare);
    // the goal (crown) square:
    retArray[0][3] = DataConverter.encodeCoords(myGoalSquare);
    //encode the keys:
    int[][] keyCoords = getKeyCoords();
    for (int i = 0; i < keyCoords.length; i++) {
      retArray[0][i + 4] = DataConverter.encodeCoords(keyCoords[i]);
    }
    //encode the doors:
    int[][] doorCoords = getDoorCoords();
    for (int i = 0; i < doorCoords.length; i++) {
      retArray[0][i + 8] = DataConverter.encodeCoords(doorCoords[i]);
    }
    //encode the maze:
    try {
      retArray[1] = encodeDungeon(mySquares);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return (retArray);
  }

  /**
   * Takes a dungeon given in terms of an array of 1s and 0s and turns it into
   * an array of bytes. WARNING: the array MUST BE 16 X 16.
   */
  static byte[] encodeDungeon(int[][] dungeonMap) throws Exception {
    if ((dungeonMap.length != 16) || (dungeonMap[0].length != 16)) {
      throw (new Exception(
          "EncodingUtils.encodeDungeon-->must be 16x16!!!"));
    }
    byte[] retArray = new byte[32];
    for (int i = 0; i < 16; i++) {
      retArray[2 * i] = DataConverter.encode8(dungeonMap[i], 0);
      retArray[2 * i + 1] = DataConverter.encode8(dungeonMap[i], 8);
    }
    return (retArray);
  }

  //--------------------------------------------------------
  //  main prints the bytes to standard out.
  // (note that this class is not intended to be run as a MIDlet)

  /**
   * Prints the byte version of the board to standard out.
   */
  public static void main(String[] args) {
    try {
      EncodingUtils map = new EncodingUtils();
      byte[][] data = map.encodeDungeon();
      System.out.println("EncodingUtils.main-->dungeon encoded");
      System.out.print("{\n   " + data[0][0]);
      for (int i = 1; i < data[0].length; i++) {
        System.out.print(", " + data[0][i]);
      }
      for (int i = 1; i < data[1].length; i++) {
        System.out.print(", " + data[1][i]);
      }
      System.out.println("\n};");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

}
/**
 * This class handles the graphics objects.
 * 
 * @author Carol Hamer
 */

class DungeonManager extends LayerManager {

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
   * The height of this object's visible region.
   */
  static int DISP_HEIGHT;

  /**
   * the (right or left) distance the player goes in a single keystroke.
   */
  static final int MOVE_LENGTH = 8;

  /**
   * The width of the square tiles that this game is divided into. This is the
   * width of the stone walls as well as the princess and the ghost.
   */
  static final int SQUARE_WIDTH = 24;

  /**
   * The jump index that indicates that no jump is currently in progress..
   */
  static final int NO_JUMP = -6;

  /**
   * The maximum speed for the player's fall..
   */
  static final int MAX_FREE_FALL = 3;

  //---------------------------------------------------------
  //   game object fields

  /**
   * the handle back to the canvas.
   */
  private DungeonCanvas myCanvas;

  /**
   * the background dungeon.
   */
  private TiledLayer myBackground;

  /**
   * the player.
   */
  private Sprite myPrincess;

  /**
   * the goal.
   */
  private Sprite myCrown;

  /**
   * the doors.
   */
  private DoorKey[] myDoors;

  /**
   * the keys.
   */
  private DoorKey[] myKeys;

  /**
   * the key currently held by the player.
   */
  private DoorKey myHeldKey;

  /**
   * The leftmost x-coordinate that should be visible on the screen in terms
   * of this objects internal coordinates.
   */
  private int myViewWindowX;

  /**
   * The top y-coordinate that should be visible on the screen in terms of
   * this objects internal coordinates.
   */
  private int myViewWindowY;

  /**
   * Where the princess is in the jump sequence.
   */
  private int myIsJumping = NO_JUMP;

  /**
   * Whether or not the screen needs to be repainted.
   */
  private boolean myModifiedSinceLastPaint = true;

  /**
   * Which board we're playing on.
   */
  private int myCurrentBoardNum = 0;

  //-----------------------------------------------------
  //    gets/sets

  /**
   * Tell the layer manager that it needs to repaint.
   */
  public void setNeedsRepaint() {
    myModifiedSinceLastPaint = true;
  }

  //-----------------------------------------------------
  //    initialization
  //    set up or save game data.

  /**
   * Constructor merely sets the data.
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
   * @param canvas
   *            the DungeonCanvas that this LayerManager should appear on.
   */
  public DungeonManager(int x, int y, int width, int height,
      DungeonCanvas canvas) throws Exception {
    myCanvas = canvas;
    CANVAS_X = x;
    CANVAS_Y = y;
    DISP_WIDTH = width;
    DISP_HEIGHT = height;
    // create a decoder object that creates the dungeon and
    // its associated Sprites from data.
    BoardDecoder decoder = new BoardDecoder(myCurrentBoardNum);
    // get the background TiledLayer
    myBackground = decoder.getLayer();
    // get the coordinates of the square that the princess
    // starts on.
    int[] playerCoords = decoder.getPlayerSquare();
    // create the player sprite
    myPrincess = new Sprite(Image.createImage("/images/princess.png"),
        SQUARE_WIDTH, SQUARE_WIDTH);
    myPrincess.setFrame(1);
    // we define the reference pixel to be in the middle
    // of the princess image so that when the princess turns
    // from right to left (and vice versa) she does not
    // appear to move to a different location.
    myPrincess.defineReferencePixel(SQUARE_WIDTH / 2, 0);
    // the dungeon is a 16x16 grid, so the array playerCoords
    // gives the player's location in terms of the grid, and
    // then we multiply those coordinates by the SQUARE_WIDTH
    // to get the precise pixel where the player should be
    // placed (in terms of the LayerManager's coordinate system)
    myPrincess.setPosition(SQUARE_WIDTH * playerCoords[0], SQUARE_WIDTH
        * playerCoords[1]);
    // we append all of the Layers (TiledLayer and Sprite)
    // so that this LayerManager will paint them when
    // flushGraphics is called.
    append(myPrincess);
    // get the coordinates of the square where the crown
    // should be placed.
    int[] goalCoords = decoder.getGoalSquare();
    myCrown = new Sprite(Image.createImage("/images/crown.png"));
    myCrown.setPosition(
        (SQUARE_WIDTH * goalCoords[0]) + (SQUARE_WIDTH / 4),
        (SQUARE_WIDTH * goalCoords[1]) + (SQUARE_WIDTH / 2));
    append(myCrown);
    // The decoder creates the door and key sprites and places
    // them in the correct locations in terms of the LayerManager's
    // coordinate system.
    myDoors = decoder.createDoors();
    myKeys = decoder.createKeys();
    for (int i = 0; i < myDoors.length; i++) {
      append(myDoors[i]);
    }
    for (int i = 0; i < myKeys.length; i++) {
      append(myKeys[i]);
    }
    // append the background last so it will be painted first.
    append(myBackground);
    // this sets the view screen so that the player is
    // in the center.
    myViewWindowX = SQUARE_WIDTH * playerCoords[0]
        - ((DISP_WIDTH - SQUARE_WIDTH) / 2);
    myViewWindowY = SQUARE_WIDTH * playerCoords[1]
        - ((DISP_HEIGHT - SQUARE_WIDTH) / 2);
    // a number of objects are created in order to set up the game,
    // but they should be eliminated to free up memory:
    decoder = null;
    System.gc();
  }

  /**
   * sets all variables back to their initial positions.
   */
  void reset() throws Exception {
    // first get rid of the old board:
    for (int i = 0; i < myDoors.length; i++) {
      remove(myDoors[i]);
    }
    myHeldKey = null;
    for (int i = 0; i < myKeys.length; i++) {
      remove(myKeys[i]);
    }
    remove(myBackground);
    // now create the new board:
    myCurrentBoardNum++;
    // in this version we go back to the beginning if
    // all boards have been completed.
    if (myCurrentBoardNum == BoardDecoder.getNumBoards()) {
      myCurrentBoardNum = 0;
    }
    // we create a new decoder object to read and interpret
    // all of the data for the current board.
    BoardDecoder decoder = new BoardDecoder(myCurrentBoardNum);
    // get the background TiledLayer
    myBackground = decoder.getLayer();
    // get the coordinates of the square that the princess
    // starts on.
    int[] playerCoords = decoder.getPlayerSquare();
    // the dungeon is a 16x16 grid, so the array playerCoords
    // gives the player's location in terms of the grid, and
    // then we multiply those coordinates by the SQUARE_WIDTH
    // to get the precise pixel where the player should be
    // placed (in terms of the LayerManager's coordinate system)
    myPrincess.setPosition(SQUARE_WIDTH * playerCoords[0], SQUARE_WIDTH
        * playerCoords[1]);
    myPrincess.setFrame(1);
    // get the coordinates of the square where the crown
    // should be placed.
    int[] goalCoords = decoder.getGoalSquare();
    myCrown.setPosition(
        (SQUARE_WIDTH * goalCoords[0]) + (SQUARE_WIDTH / 4),
        (SQUARE_WIDTH * goalCoords[1]) + (SQUARE_WIDTH / 2));
    // The decoder creates the door and key sprites and places
    // them in the correct locations in terms of the LayerManager's
    // coordinate system.
    myDoors = decoder.createDoors();
    myKeys = decoder.createKeys();
    for (int i = 0; i < myDoors.length; i++) {
      append(myDoors[i]);
    }
    for (int i = 0; i < myKeys.length; i++) {
      append(myKeys[i]);
    }
    // append the background last so it will be painted first.
    append(myBackground);
    // this sets the view screen so that the player is
    // in the center.
    myViewWindowX = SQUARE_WIDTH * playerCoords[0]
        - ((DISP_WIDTH - SQUARE_WIDTH) / 2);
    myViewWindowY = SQUARE_WIDTH * playerCoords[1]
        - ((DISP_HEIGHT - SQUARE_WIDTH) / 2);
    // a number of objects are created in order to set up the game,
    // but they should be eliminated to free up memory:
    decoder = null;
    System.gc();
  }

  /**
   * sets all variables back to the position in the saved game.
   * 
   * @return the time on the clock of the saved game.
   */
  int revertToSaved() throws Exception {
    int retVal = 0;
    // first get rid of the old board:
    for (int i = 0; i < myDoors.length; i++) {
      remove(myDoors[i]);
    }
    myHeldKey = null;
    for (int i = 0; i < myKeys.length; i++) {
      remove(myKeys[i]);
    }
    remove(myBackground);
    // now get the info of the saved game
    // only one game is saved at a time, and the GameInfo object
    // will read the saved game's data from memory.
    GameInfo info = new GameInfo();
    if (info.getIsEmpty()) {
      // if no game has been saved, we start from the beginning.
      myCurrentBoardNum = 0;
      reset();
    } else {
      // get the time on the clock of the saved game.
      retVal = info.getTime();
      // get the number of the board the saved game was on.
      myCurrentBoardNum = info.getBoardNum();
      // create the BoradDecoder that gives the data for the
      // desired board.
      BoardDecoder decoder = new BoardDecoder(myCurrentBoardNum);
      // get the background TiledLayer
      myBackground = decoder.getLayer();
      // get the coordinates of the square that the princess
      // was on in the saved game.
      int[] playerCoords = info.getPlayerSquare();
      myPrincess.setPosition(SQUARE_WIDTH * playerCoords[0], SQUARE_WIDTH
          * playerCoords[1]);
      myPrincess.setFrame(1);
      // get the coordinates of the square where the crown
      // should be placed (this is given by the BoardDecoder
      // and not from the data of the saved game because the
      // crown does not move during the game.
      int[] goalCoords = decoder.getGoalSquare();
      myCrown.setPosition((SQUARE_WIDTH * goalCoords[0])
          + (SQUARE_WIDTH / 4), (SQUARE_WIDTH * goalCoords[1])
          + (SQUARE_WIDTH / 2));
      // The decoder creates the door and key sprites and places
      // them in the correct locations in terms of the LayerManager's
      // coordinate system.
      myDoors = decoder.createDoors();
      myKeys = decoder.createKeys();
      // get an array of ints that lists whether each door is
      // open or closed in the saved game
      int[] openDoors = info.getDoorsOpen();
      for (int i = 0; i < myDoors.length; i++) {
        append(myDoors[i]);
        if (openDoors[i] == 0) {
          // if the door was open, make it invisible
          myDoors[i].setVisible(false);
        }
      }
      // the keys can be moved by the player, so we get their
      // coordinates from the GameInfo saved data.
      int[][] keyCoords = info.getKeyCoords();
      for (int i = 0; i < myKeys.length; i++) {
        append(myKeys[i]);
        myKeys[i].setPosition(SQUARE_WIDTH * keyCoords[i][0],
            SQUARE_WIDTH * keyCoords[i][1]);
      }
      // if the player was holding a key in the saved game,
      // we have the player hold that key and set it to invisible.
      int heldKey = info.getHeldKey();
      if (heldKey != -1) {
        myHeldKey = myKeys[heldKey];
        myHeldKey.setVisible(false);
      }
      // append the background last so it will be painted first.
      append(myBackground);
      // this sets the view screen so that the player is
      // in the center.
      myViewWindowX = SQUARE_WIDTH * playerCoords[0]
          - ((DISP_WIDTH - SQUARE_WIDTH) / 2);
      myViewWindowY = SQUARE_WIDTH * playerCoords[1]
          - ((DISP_HEIGHT - SQUARE_WIDTH) / 2);
      // a number of objects are created in order to set up the game,
      // but they should be eliminated to free up memory:
      decoder = null;
      System.gc();
    }
    return (retVal);
  }

  /**
   * save the current game in progress.
   */
  void saveGame(int gameTicks) throws Exception {
    int[] playerSquare = new int[2];
    // the coordinates of the player are given in terms of
    // the 16 x 16 dungeon grid. We divide the player's
    // pixel coordinates to ge the right grid square.
    // If the player was not precisely alligned with a
    // grid square when the game was saved, the difference
    // will be shaved off.
    playerSquare[0] = myPrincess.getX() / SQUARE_WIDTH;
    playerSquare[1] = myPrincess.getY() / SQUARE_WIDTH;
    // save the coordinates of the current locations of
    // the keys, and if a key is currently held by the
    // player, we save the info of which one it was.
    int[][] keyCoords = new int[4][];
    int heldKey = -1;
    for (int i = 0; i < myKeys.length; i++) {
      keyCoords[i] = new int[2];
      keyCoords[i][0] = myKeys[i].getX() / SQUARE_WIDTH;
      keyCoords[i][1] = myKeys[i].getY() / SQUARE_WIDTH;
      if ((myHeldKey != null) && (myKeys[i] == myHeldKey)) {
        heldKey = i;
      }
    }
    // save the information of which doors were open.
    int[] doorsOpen = new int[8];
    for (int i = 0; i < myDoors.length; i++) {
      if (myDoors[i].isVisible()) {
        doorsOpen[i] = 1;
      }
    }
    // take all of the information we've gathered and
    // create a GameInfo object that will save the info
    // in the device's memory.
    GameInfo info = new GameInfo(myCurrentBoardNum, gameTicks,
        playerSquare, keyCoords, doorsOpen, heldKey);
  }

  //-------------------------------------------------------
  //  graphics methods

  /**
   * paint the game graphic on the screen.
   */
  public void paint(Graphics g) throws Exception {
    // only repaint if something has changed:
    if (myModifiedSinceLastPaint) {
      g.setColor(DungeonCanvas.WHITE);
      // paint the background white to cover old game objects
      // that have changed position since last paint.
      // here coordinates are given
      // with respect to the graphics (canvas) origin:
      g.fillRect(0, 0, DISP_WIDTH, DISP_HEIGHT);
      // here coordinates are given
      // with respect to the LayerManager origin:
      setViewWindow(myViewWindowX, myViewWindowY, DISP_WIDTH, DISP_HEIGHT);
      // call the paint funstion of the superclass LayerManager
      // to paint all of the Layers
      paint(g, CANVAS_X, CANVAS_Y);
      // don't paint again until something changes:
      myModifiedSinceLastPaint = false;
    }
  }

  //-------------------------------------------------------
  //  game movements

  /**
   * respond to keystrokes by deciding where to move and then moving the
   * pieces and the view window correspondingly.
   */
  void requestMove(int horizontal, int vertical) {
    if (horizontal != 0) {
      // see how far the princess can move in the desired
      // horizontal direction (if not blocked by a wall
      // or closed door)
      horizontal = requestHorizontal(horizontal);
    }
    // vertical < 0 indicates that the user has
    // pressed the UP button and would like to jump.
    // therefore, if we're not currently jumping,
    // we begin the jump.
    if ((myIsJumping == NO_JUMP) && (vertical < 0)) {
      myIsJumping++;
    } else if (myIsJumping == NO_JUMP) {
      // if we're not jumping at all, we need to check
      // if the princess should be falling:
      // we (temporarily) move the princess down and see if that
      // causes a collision with the floor:
      myPrincess.move(0, MOVE_LENGTH);
      // if the princess can move down without colliding
      // with the floor, then we set the princess to
      // be falling. The variable myIsJumping starts
      // negative while the princess is jumping up and
      // is zero or positive when the princess is coming
      // back down. We therefore set myIsJumping to
      // zero to indicate that the princess should start
      // falling.
      if (!checkCollision()) {
        myIsJumping = 0;
      }
      // we move the princess Sprite back to the correct
      // position she was at before we (temporarily) moved
      // her down to see if she would fall.
      myPrincess.move(0, -MOVE_LENGTH);
    }
    // if the princess is currently jumping or falling,
    // we calculate the vertical distance she should move
    // (taking into account the horizontal distance that
    // she is also moving).
    if (myIsJumping != NO_JUMP) {
      vertical = jumpOrFall(horizontal);
    }
    // now that we've calculated how far the princess
    // should move, we move her. (this is a call to
    // another internal method of this method
    // suite, it is not a built-in LayerManager method):
    move(horizontal, vertical);
  }

  /**
   * Internal to requestMove. Calculates what the real horizontal distance
   * moved should be after taking obstacles into account.
   * 
   * @return the horizontal distance that the player can move.
   */
  private int requestHorizontal(int horizontal) {
    // we (temporarily) move her to the right or left
    // and see if she hits a wall or a door:
    myPrincess.move(horizontal * MOVE_LENGTH, 0);
    if (checkCollision()) {
      // if she hits something, then she's not allowed
      // to go in that direction, so we set the horizontal
      // move distance to zero and then move the princess
      // back to where she was.
      myPrincess.move(-horizontal * MOVE_LENGTH, 0);
      horizontal = 0;
    } else {
      // if she doesn't hit anything then the move request
      // succeeds, but we still move her back to the
      // earlier position because this was just the checking
      // phase.
      myPrincess.move(-horizontal * MOVE_LENGTH, 0);
      horizontal *= MOVE_LENGTH;
    }
    return (horizontal);
  }

  /**
   * Internal to requestMove. Calculates the vertical change in the player's
   * position if jumping or falling. this method should only be called if the
   * player is currently jumping or falling.
   * 
   * @return the vertical distance that the player should move this turn.
   *         (negative moves up, positive moves down)
   */
  private int jumpOrFall(int horizontal) {
    // by default we do not move vertically
    int vertical = 0;
    // The speed of rise or descent is computed using
    // the int myIsJumping. Since we are in a jump or
    // fall, we advance the jump by one (which simulates
    // the downward pull of gravity by slowing the rise
    // or accellerating the fall) unless the player is
    // already falling at maximum speed. (a maximum
    // free fall speed is necessary because otherwise
    // it is possible for the player to fall right through
    // the bottom of the maze...)
    if (myIsJumping <= MAX_FREE_FALL) {
      myIsJumping++;
    }
    if (myIsJumping < 0) {
      // if myIsJumping is negative, that means that
      // the princess is rising. We calculate the
      // number of pixels to go up by raising 2 to
      // the power myIsJumping (absolute value).
      // note that we make the result negative because
      // the up and down coordinates in Java are the
      // reverse of the vertical coordinates we learned
      // in math class: as you go up, the coordinate
      // values go down, and as you go down the screen,
      // the coordinate numbers go up.
      vertical = -(2 << (-myIsJumping));
    } else {
      // if myIsJumping is positive, the princess is falling.
      // we calculate the distance to fall by raising two
      // to the power of the absolute value of myIsJumping.
      vertical = (2 << (myIsJumping));
    }
    // now we temporarily move the princess the desired
    // vertical distance (with the corresponding horizontal
    // distance also thrown in), and see if she hits anything:
    myPrincess.move(horizontal, vertical);
    if (checkCollision()) {
      // here we're in the case where she did hit something.
      // we move her back into position and then see what
      // to do about it.
      myPrincess.move(-horizontal, -vertical);
      if (vertical > 0) {
        // in this case the player is falling.
        // so we need to determine precisely how
        // far she can fall before she hit the bottom
        vertical = 0;
        // we temporarily move her the desired horizontal
        // distance while calculating the corresponding
        // vertical distance.
        myPrincess.move(horizontal, 0);
        while (!checkCollision()) {
          vertical++;
          myPrincess.move(0, 1);
        }
        // now that we've calculated how far she can fall,
        // we move her back to her earlier position
        myPrincess.move(-horizontal, -vertical);
        // we subtract 1 pixel from the distance calculated
        // because once she has actually collided with the
        // floor, she's gone one pixel too far...
        vertical--;
        // now that she's hit the floor, she's not jumping
        // anymore.
        myIsJumping = NO_JUMP;
      } else {
        // in this case we're going up, so she
        // must have hit her head.
        // This next if is checking for a special
        // case where there's room to jump up exactly
        // one square. In that case we increase the
        // value of myIsJumping in order to make the
        // princess not rise as high. The details
        // of the calculation in this case were found
        // through trial and error:
        if (myIsJumping == NO_JUMP + 2) {
          myIsJumping++;
          vertical = -(2 << (-myIsJumping));
          // now we see if the special shortened jump
          // still makes her hit her head:
          // (as usual, temporarily move her to test
          // for collisions)
          myPrincess.move(horizontal, vertical);
          if (checkCollision()) {
            // if she still hits her head even
            // with this special shortened jump,
            // then she was not meant to jump...
            myPrincess.move(-horizontal, -vertical);
            vertical = 0;
            myIsJumping = NO_JUMP;
          } else {
            // now that we've chhecked for collisions,
            // we move the player back to her earlier
            // position:
            myPrincess.move(-horizontal, -vertical);
          }
        } else {
          // if she hit her head, then she should not
          // jump up.
          vertical = 0;
          myIsJumping = NO_JUMP;
        }
      }
    } else {
      // since she didn't hit anything when we moved
      // her, then all we have to do is move her back.
      myPrincess.move(-horizontal, -vertical);
    }
    return (vertical);
  }

  /**
   * Internal to requestMove. Once the moves have been determined, actually
   * perform the move.
   */
  private void move(int horizontal, int vertical) {
    // repaint only if we actually change something:
    if ((horizontal != 0) || (vertical != 0)) {
      myModifiedSinceLastPaint = true;
    }
    // if the princess is moving left or right, we set
    // her image to be facing the right direction:
    if (horizontal > 0) {
      myPrincess.setTransform(Sprite.TRANS_NONE);
    } else if (horizontal < 0) {
      myPrincess.setTransform(Sprite.TRANS_MIRROR);
    }
    // if she's jumping or falling, we set the image to
    // the frame where the skirt is inflated:
    if (vertical != 0) {
      myPrincess.setFrame(0);
      // if she's just running, we alternate between the
      // two frames:
    } else if (horizontal != 0) {
      if (myPrincess.getFrame() == 1) {
        myPrincess.setFrame(0);
      } else {
        myPrincess.setFrame(1);
      }
    }
    // move the position of the view window so that
    // the player stays in the center:
    myViewWindowX += horizontal;
    myViewWindowY += vertical;
    // after all that work, we finally move the
    // princess for real!!!
    myPrincess.move(horizontal, vertical);
  }

  //-------------------------------------------------------
  //  sprite interactions

  /**
   * Drops the currently held key and picks up another.
   */
  void putDownPickUp() {
    // we do not want to allow the player to put
    // down the key in the air, so we verify that
    // we're not jumping or falling first:
    if ((myIsJumping == NO_JUMP) && (myPrincess.getY() % SQUARE_WIDTH == 0)) {
      // since we're picking something up or putting
      // something down, the display changes and needs
      // to be repainted:
      setNeedsRepaint();
      // if the thing we're picking up is the crown,
      // we're done, the player has won:
      if (myPrincess.collidesWith(myCrown, true)) {
        myCanvas.setGameOver();
        return;
      }
      // keep track of the key we're putting down in
      // order to place it correctly:
      DoorKey oldHeld = myHeldKey;
      myHeldKey = null;
      // if the princess is on top of another key,
      // that one becomes the held key and is hence
      // made invisible:
      for (int i = 0; i < myKeys.length; i++) {
        // we check myHeldKey for null because we don't
        // want to accidentally pick up two keys.
        if ((myPrincess.collidesWith(myKeys[i], true))
            && (myHeldKey == null)) {
          myHeldKey = myKeys[i];
          myHeldKey.setVisible(false);
        }
      }
      if (oldHeld != null) {
        // place the key we're putting down in the Princess's
        // current position and make it visible:
        oldHeld.setPosition(myPrincess.getX(), myPrincess.getY());
        oldHeld.setVisible(true);
      }
    }
  }

  /**
   * Checks of the player hits a stone wall or a door.
   */
  boolean checkCollision() {
    boolean retVal = false;
    // the "true" arg meand to check for a pixel-level
    // collision (so merely an overlap in image
    // squares does not register as a collision)
    if (myPrincess.collidesWith(myBackground, true)) {
      retVal = true;
    } else {
      // Note: it is not necessary to synchronize
      // this block because the thread that calls this
      // method is the same as the one that puts down the
      // keys, so there's no danger of the key being put down
      // between the moment we check for the key and
      // the moment we open the door:
      for (int i = 0; i < myDoors.length; i++) {
        // if she's holding the right key, then open the door
        // otherwise bounce off
        if (myPrincess.collidesWith(myDoors[i], true)) {
          if ((myHeldKey != null)
              && (myDoors[i].getColor() == myHeldKey.getColor())) {
            setNeedsRepaint();
            myDoors[i].setVisible(false);
          } else {
            // if she's not holding the right key, then
            // she has collided with the door just the same
            // as if she had collided with a wall:
            retVal = true;
          }
        }
      }
    }
    return (retVal);
  }

}

/**
 * This class is the display of the game.
 * 
 * @author Carol Hamer
 */

class DungeonCanvas extends GameCanvas {

  //---------------------------------------------------------
  //   dimension fields
  //  (constant after initialization)

  /**
   * the height of the black region below the play area.
   */
  static int TIMER_HEIGHT = 32;

  /**
   * the top corner x coordinate according to this object's coordinate
   * system:.
   */
  static final int CORNER_X = 0;

  /**
   * the top corner y coordinate according to this object's coordinate
   * system:.
   */
  static final int CORNER_Y = 0;

  /**
   * the width of the portion of the screen that this canvas can use.
   */
  static int DISP_WIDTH;

  /**
   * the height of the portion of the screen that this canvas can use.
   */
  static int DISP_HEIGHT;

  /**
   * the height of the font used for this game.
   */
  static int FONT_HEIGHT;

  /**
   * the font used for this game.
   */
  static Font FONT;

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
  private Dungeon myDungeon;

  /**
   * the LayerManager that handles the game graphics.
   */
  private DungeonManager myManager;

  /**
   * whether or not the game has ended.
   */
  private static boolean myGameOver;

  /**
   * The number of ticks on the clock the last time the time display was
   * updated. This is saved to determine if the time string needs to be
   * recomputed.
   */
  private int myOldGameTicks = 0;

  /**
   * the number of game ticks that have passed since the beginning of the
   * game.
   */
  private int myGameTicks = myOldGameTicks;

  /**
   * we save the time string to avoid recreating it unnecessarily.
   */
  private static String myInitialString = "0:00";

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
    myDungeon.pauseApp();
  }

  /**
   * Find out if the game has ended.
   */
  static boolean getGameOver() {
    return (myGameOver);
  }

  /**
   * Tell the layer manager that it needs to repaint.
   */
  public void setNeedsRepaint() {
    myManager.setNeedsRepaint();
  }

  //-----------------------------------------------------
  //    initialization and game state changes

  /**
   * Constructor sets the data, performs dimension calculations, and creates
   * the graphical objects.
   */
  public DungeonCanvas(Dungeon midlet) throws Exception {
    super(false);
    myDisplay = Display.getDisplay(midlet);
    myDungeon = midlet;
    // calculate the dimensions
    DISP_WIDTH = getWidth();
    DISP_HEIGHT = getHeight();
    if ((!myDisplay.isColor()) || (myDisplay.numColors() < 256)) {
      throw (new Exception("game requires full-color screen"));
    }
    if ((DISP_WIDTH < 150) || (DISP_HEIGHT < 170)) {
      throw (new Exception("Screen too small"));
    }
    if ((DISP_WIDTH > 250) || (DISP_HEIGHT > 250)) {
      throw (new Exception("Screen too large"));
    }
    // since the time is painted in white on black,
    // it shows up better if the font is bold:
    FONT = Font
        .getFont(Font.FACE_SYSTEM, Font.STYLE_BOLD, Font.SIZE_MEDIUM);
    // calculate the height of the black region that the
    // timer is painted on:
    FONT_HEIGHT = FONT.getHeight();
    TIMER_HEIGHT = FONT_HEIGHT + 8;
    // create the LayerManager (where all of the interesting
    // graphics go!) and give it the dimensions of the
    // region it is supposed to paint:
    if (myManager == null) {
      myManager = new DungeonManager(CORNER_X, CORNER_Y, DISP_WIDTH,
          DISP_HEIGHT - TIMER_HEIGHT, this);
    }
  }

  /**
   * This is called as soon as the application begins.
   */
  void start() {
    myGameOver = false;
    myDisplay.setCurrent(this);
    setNeedsRepaint();
  }

  /**
   * sets all variables back to their initial positions.
   */
  void reset() throws Exception {
    // most of the variables that need to be reset
    // are held by the LayerManager:
    myManager.reset();
    myGameOver = false;
    setNeedsRepaint();
  }

  /**
   * sets all variables back to the positions from a previously saved game.
   */
  void revertToSaved() throws Exception {
    // most of the variables that need to be reset
    // are held by the LayerManager, so we
    // prompt the LayerManager to get the
    // saved data:
    myGameTicks = myManager.revertToSaved();
    myGameOver = false;
    myOldGameTicks = myGameTicks;
    myTimeString = formatTime();
    setNeedsRepaint();
  }

  /**
   * save the current game in progress.
   */
  void saveGame() throws Exception {
    myManager.saveGame(myGameTicks);
  }

  /**
   * clears the key states.
   */
  void flushKeys() {
    getKeyStates();
  }

  /**
   * If the game is hidden by another app (or a menu) ignore it since not much
   * happens in this game when the user is not actively interacting with it.
   * (we could pause the timer, but it's not important enough to bother with
   * when the user is just pulling up a menu for a few seconds)
   */
  protected void hideNotify() {
  }

  /**
   * When it comes back into view, just make sure the manager knows that it
   * needs to repaint.
   */
  protected void showNotify() {
    setNeedsRepaint();
  }

  //-------------------------------------------------------
  //  graphics methods

  /**
   * paint the game graphics on the screen.
   */
  public void paint(Graphics g) {
    // color the bottom segment of the screen black
    g.setColor(BLACK);
    g.fillRect(CORNER_X, CORNER_Y + DISP_HEIGHT - TIMER_HEIGHT, DISP_WIDTH,
        TIMER_HEIGHT);
    // paint the LayerManager (which paints
    // all of the interesting graphics):
    try {
      myManager.paint(g);
    } catch (Exception e) {
      myDungeon.errorMsg(e);
    }
    // draw the time
    g.setColor(WHITE);
    g.setFont(FONT);
    g.drawString("Time: " + formatTime(), DISP_WIDTH / 2, CORNER_Y
        + DISP_HEIGHT - 4, g.BOTTOM | g.HCENTER);
    // write "Dungeon Completed" when the user finishes a board:
    if (myGameOver) {
      myDungeon.setNewCommand();
      // clear the top region:
      g.setColor(WHITE);
      g.fillRect(CORNER_X, CORNER_Y, DISP_WIDTH, FONT_HEIGHT * 2 + 1);
      int goWidth = FONT.stringWidth("Dungeon Completed");
      g.setColor(BLACK);
      g.setFont(FONT);
      g.drawString("Dungeon Completed", (DISP_WIDTH - goWidth) / 2,
          CORNER_Y + FONT_HEIGHT, g.TOP | g.LEFT);
    }
  }

  /**
   * a simple utility to make the number of ticks look like a time...
   */
  public String formatTime() {
    if ((myGameTicks / 16) != myOldGameTicks) {
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
   * update the display.
   */
  void updateScreen() {
    myGameTicks++;
    // paint the display
    try {
      paint(getGraphics());
      flushGraphics(CORNER_X, CORNER_Y, DISP_WIDTH, DISP_HEIGHT);
    } catch (Exception e) {
      myDungeon.errorMsg(e);
    }
  }

  /**
   * Respond to keystrokes.
   */
  public void checkKeys() {
    if (!myGameOver) {
      int vertical = 0;
      int horizontal = 0;
      // determine which moves the user would like to make:
      int keyState = getKeyStates();
      if ((keyState & LEFT_PRESSED) != 0) {
        horizontal = -1;
      }
      if ((keyState & RIGHT_PRESSED) != 0) {
        horizontal = 1;
      }
      if ((keyState & UP_PRESSED) != 0) {
        vertical = -1;
      }
      if ((keyState & DOWN_PRESSED) != 0) {
        // if the user presses the down key,
        // we put down or pick up a key object
        // or pick up the crown:
        myManager.putDownPickUp();
      }
      // tell the manager to move the player
      // accordingly if possible:
      myManager.requestMove(horizontal, vertical);
    }
  }

}
