package sweep;

import javax.microedition.lcdui.*;
import javax.microedition.midlet.*;

public class Sweep  extends MIDlet {

  public void startApp() {
    final SweepCanvas sweeper = new SweepCanvas();
    sweeper.start();
    
    sweeper.addCommand(new Command("Exit", Command.EXIT, 0));
    sweeper.setCommandListener(new CommandListener() {
      public void commandAction(Command c, Displayable s) {
        sweeper.stop();
        notifyDestroyed();
      }
    });
    
    Display.getDisplay(this).setCurrent(sweeper);
  }
  
  public void pauseApp() {}

  public void destroyApp(boolean unconditional) {}
}
class SweepCanvas extends Canvas implements Runnable {
  private boolean mTrucking;
  private int mTheta;
  private int mBorder;
  private int mDelay;
  
  public SweepCanvas() {
    mTheta = 0;
    mBorder = 10;
    mDelay = 50;
  }
  
  public void start() {
    mTrucking = true;
    Thread t = new Thread(this);
    t.start();
  }
  
  public void stop() {
    mTrucking = false;
  }
    
  public void paint(Graphics g) {
    int width = getWidth();
    int height = getHeight();
    
    // Clear the Canvas.
    g.setGrayScale(255);
    g.fillRect(0, 0, width - 1, height - 1);
    
    int x = mBorder;
    int y = mBorder;
    int w = width - mBorder * 2;
    int h = height - mBorder * 2;
    for (int i = 0; i < 8; i++) {
      g.setGrayScale((8 - i) * 32 - 16);
      g.fillArc(x, y, w, h, mTheta + i * 10, 10);
      g.fillArc(x, y, w, h, (mTheta + 180) % 360 + i * 10, 10);
    }
  }
  
  public void run() {
    while (mTrucking) {
      mTheta = (mTheta + 1) % 360;
      repaint();
      try { Thread.sleep(mDelay); }
      catch (InterruptedException ie) {}
    }
  }
}

