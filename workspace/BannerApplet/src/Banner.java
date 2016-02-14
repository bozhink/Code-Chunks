import java.awt.*;
import java.applet.*;

/*
 * <applet code="Banner" width=300 height=50>
 * </applet>
 */
public class Banner extends Applet implements Runnable
{
	private static final long serialVersionUID = 1L;
	
	String msg = " Java Rules the web ";
	Thread t;
	boolean stopFlag;
	
	public void init()
	{
		t = null;
	}
	
	public void start()
	{
		t = new Thread(this);
		stopFlag = false;
		t.start();
	}
	
	public void run()
	{
		char ch;
		
		for ( ; ; )
		{
			try
			{
				repaint();
				Thread.sleep(250);
				ch = msg.charAt(0);
				msg = msg.substring(1, msg.length());
				msg += ch;
				if (stopFlag) break;
			}
			catch (InterruptedException exc)
			{
				//
			}
		}
	}
	
	public void stop()
	{
		stopFlag = true;
		t = null;
	}
	
	public void paint(Graphics g)
	{
		g.drawString(msg, 50, 30);
	}
}