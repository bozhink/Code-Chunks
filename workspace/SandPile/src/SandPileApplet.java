import java.applet.Applet;
import java.awt.Graphics;
import jsandpilemodel.SandPile;

/*
<applet code="SimpleApplet" width=300 height=50 />
*/
public class SandPileApplet extends Applet implements Runnable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	String msg = " Sand pile model ";
	Thread t;
	boolean stopFlag;
	
	SandPile sandPile;
	
	public void init ()
	{
		t = null;
		sandPile = new SandPile(50, 50);
	}
	
	public void start ()
	{
		t = new Thread(this);
		stopFlag = false;
		t.start();
	}
	
	public void run ()
	{
		char ch;
		for ( ; ; )
		{
			try
			{
				repaint();
				Thread.sleep(2500);
				ch = msg.charAt(0);
				msg = msg.substring(1, msg.length());
				msg += ch;
				sandPile.Step();
				if (stopFlag)
				{
					break;
				}
			}
			catch (InterruptedException exc)
			{
				// nothing to do
			}
		}
	}
	
	public void stop()
	{
		stopFlag = true;
		t = null;
		sandPile = null;
	}

	public void paint(Graphics g)
	{
		
		int width = this.getWidth();
		int height = this.getHeight();
		int nx = sandPile.GetWidth();
		int ny = sandPile.GetHeight();
		int hx = width / nx;
		int hy = height / ny;
		for (int i=0; i<nx; i++)
		{
			for (int j=0; j<ny; j++)
			{
				if (sandPile.GetElement(j,i) < 1)
				{
					g.fillRect(i*hx,j*hy,hx,hy);
				}
				else
				{
					g.clearRect(i*hx,j*hy,hx,hy);
				}
			}
		}
	}
}
