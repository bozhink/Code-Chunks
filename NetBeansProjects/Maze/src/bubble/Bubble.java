package bubble;

import javax.microedition.lcdui.*;
import javax.microedition.midlet.*;

public class Bubble  extends MIDlet implements CommandListener
{
    Command exit = new Command("Exit", Command.EXIT, 0);
    Command ok = new Command("OK", Command.OK, 0);
    
    private BubbleCanvas bub = new BubbleCanvas();
    
    public void startApp() 
    {
        bub.start();
        bub.addCommand(exit);
        bub.addCommand(ok);
        bub.setCommandListener(this);
        Display.getDisplay(this).setCurrent(bub);
    }
    
    public void commandAction (Command c, Displayable s) {
            if (s == bub) {
                if (c == exit) {
                    bub.stop();
                    notifyDestroyed();
                }
            }
        }
    
    public void pauseApp() {}
    
    public void destroyApp(boolean unconditional) {}
    
//    /*
//     * Commander class
//     */
//    class Commander implements CommandListener 
//    {
//        public Commander () {   }
//        
//        public void commandAction (Command c, Displayable s) {
//            if (s == bub) {
//                if (c == exit) {
//                    bub.stop();
//                    notifyDestroyed();
//                }
//            }
//        }
//    }
}

