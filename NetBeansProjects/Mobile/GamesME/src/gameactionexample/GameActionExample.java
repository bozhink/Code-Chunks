package gameactionexample;

/*
J2ME: The Complete Reference

James Keogh

Publisher: McGraw-Hill

ISBN 0072227109

*/
//jad file (please verify the jar size)
/*
MIDlet-Name: GameActionExample
MIDlet-Version: 1.0
MIDlet-Vendor: MyCompany
MIDlet-Jar-URL: GameActionExample.jar
MIDlet-1: GameActionExample, , GameActionExample
MicroEdition-Configuration: CLDC-1.0
MicroEdition-Profile: MIDP-1.0
MIDlet-JAR-SIZE: 100

*/
import javax.microedition.lcdui.*;
import javax.microedition.midlet.*;


public class GameActionExample extends MIDlet
{
  private Display  display;       
  private MyCanvas canvas;   
  public GameActionExample()
  {
    display = Display.getDisplay(this);
    canvas  = new MyCanvas (this);
  }
  protected void startApp()
  {
    display.setCurrent(canvas);
  }
  protected void pauseApp()
  { 
  }
  protected void destroyApp( boolean unconditional )
  { 
  }
  public void exitMIDlet()
  {
    destroyApp(true);
    notifyDestroyed();
  }
}
class MyCanvas extends Canvas implements CommandListener
{
  private Command exit;          
  private String message;
  private GameActionExample gameActionExample;
  private int x, y;
  public MyCanvas (GameActionExample gameActionExample)
  {
    x = 5;
    y = 5;
    message = "Use Game Keys";    
    this.gameActionExample = gameActionExample;
    exit = new Command("Exit", Command.EXIT, 1);
    addCommand(exit);
    setCommandListener(this);
  } 
  protected void paint(Graphics graphics)
  {
    graphics.setColor(255,255,255);
    graphics.fillRect(0, 0, getWidth(), getHeight());
    graphics.setColor(255, 0, 0);
    graphics.drawString(message, x, y, Graphics.TOP | Graphics.LEFT);
  }
  public void commandAction(Command command, Displayable displayable)
  {
    if (command == exit)
    {
      gameActionExample.exitMIDlet();
     }
  }
  protected void keyPressed(int key)
  {
    switch ( getGameAction(key) ){
     case Canvas.UP:
       message = "up";
       y--;
       break;
     case Canvas.DOWN:
       message = "down";
       y++;
       break;
     case Canvas.LEFT:
       message = "left";
       x--;
       break;
     case Canvas.RIGHT:
       message = "right";
       x++;
       break;
     case Canvas.FIRE:
       message = "FIRE";
       break;
    }
    repaint();
  }
}
