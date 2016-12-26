package gameactions;

/*--------------------------------------------------
* GameActions.java
*
* Canvas for processing game actions
*
* Example from the book:     Core J2ME Technology
* Copyright John W. Muchow   http://www.CoreJ2ME.com
* You may use/modify for any non-commercial purpose
*-------------------------------------------------*/  
import javax.microedition.lcdui.*;
import javax.microedition.midlet.*;

public class GameActions extends MIDlet
{
  private Display  display;       // The display
  private GameActionCanvas canvas;   // Canvas 
 
  public GameActions()
  {
    display = Display.getDisplay(this);
    canvas  = new GameActionCanvas(this);
  }
 
  protected void startApp()
  {
    display.setCurrent( canvas );
  }
 
  protected void pauseApp()
  { }

  protected void destroyApp( boolean unconditional )
  { }
 
  public void exitMIDlet()
  {
    destroyApp(true);
    notifyDestroyed();
  }
}

/*--------------------------------------------------
* GameActionCanvas.java
*
* Game action event handling
*-------------------------------------------------*/
class GameActionCanvas extends Canvas implements CommandListener
{
  private Command cmExit;          // Exit midlet
  private String keyText = null;    // Key code text
  private GameActions midlet;

  /*--------------------------------------------------
  * Constructor
  *-------------------------------------------------*/
  public GameActionCanvas(GameActions midlet)
  {
    this.midlet = midlet;
    
    // Create exit command & listen for events
    cmExit = new Command("Exit", Command.EXIT, 1);
    addCommand(cmExit);
    setCommandListener(this);
  } 

  /*--------------------------------------------------
  * Paint the text representing the key code 
  *-------------------------------------------------*/
  protected void paint(Graphics g)
  {
    // Clear the background (to white)
    g.setColor(255, 255, 255);
    g.fillRect(0, 0, getWidth(), getHeight());
    
    // Set color and draw text
    if (keyText != null)
    {
      // Draw with black pen
      g.setColor(0, 0, 0);
      // Center the text
      g.drawString(keyText, getWidth()/2, getHeight()/2, Graphics.TOP | Graphics.HCENTER);
    }
  }

  /*--------------------------------------------------
  * Command event handling
  *-------------------------------------------------*/  
  public void commandAction(Command c, Displayable d)
  {
    if (c == cmExit)
      midlet.exitMIDlet();
  }

  /*--------------------------------------------------
  * Game action event handling
  * A game action will be converted into a key code 
  * and handed off to this method
  *-------------------------------------------------*/  
  protected void keyPressed(int keyCode)
  {
    switch (getGameAction(keyCode))
    {
      // Place logic of each action inside the case
      case FIRE:
      case UP: 
      case DOWN:
      case LEFT:
      case RIGHT:
      case GAME_A:
      case GAME_B:
      case GAME_C:
      case GAME_D:
      default:
        // Print the text of the game action
        keyText = getKeyName(keyCode);
    }        
    repaint();
  }
}
