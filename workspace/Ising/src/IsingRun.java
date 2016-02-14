import java.awt.*;
import java.awt.event.*;
import java.applet.*;

/*
 * <applet code="TrackM" width=300 height=100></applet>
 */

public class IsingRun extends Applet
    implements MouseListener, MouseMotionListener
{
	/*
	public static void main(String[] args) 
	{
		IsingClass ising = new IsingClass(300, 300, 1.0, 0.0);
		System.out.println("dimX="+ising.Dimx() + "\tdimY="+ising.Dimx());
		System.out.println(ising.spinMatrix.length);
		//
		System.out.print(ising.spinMatrix[10]);
		for (int i=0; i<10; i++)
		{
			ising.StateGen();
			System.out.print("\t"+ising.spinMatrix[10]);
		}
		System.out.println();
		ising.MCMS(100);
		
	}
	*/
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	int curX=0, curY=0; // current coordinates
	int oldX=0, oldY=0; // old coordinates
	
	boolean draw;
	
	IsingClass ising = new IsingClass(30, 30, 0.5, 0.0);
	
	public void init()
	{
		addMouseListener(this);
		addMouseMotionListener(this);
		draw=false;
		
		ising.StateGen();
	}
	
	// Next methods are not used, but they must be implemented
	// because they are defined in MouseListener
	
	public void mouseEntered(MouseEvent me){}
	
	public void mouseExited(MouseEvent me){}
	
	public void mouseClicked(MouseEvent me){}
	
	public void mousePressed(MouseEvent me)
	{
		oldX = me.getX();
		oldY = me.getY();
		draw = true;
	}
	
	public void mouseReleased(MouseEvent me)
	{
		draw = false;
	}
	
	public void mouseDragged(MouseEvent me)
	{
		curX = me.getX();
		curY = me.getY();
		repaint();
	}
	
	public void mouseMoved(MouseEvent me)
	{
		showStatus("Moving mouse at "+me.getX()+", "+me.getY());
		repaint();
	}
	
	/*
	public void run()
	{
		while (1==1)
		{
			try
			{
				repaint();
				Thread.sleep(2);
			}
			catch (InterruptedException exc) 
			{
				System.out.println("Somenting went wrong...");
			}
		}
	}
	*/
	
	public void paint(Graphics g)
	{
		if (draw)
		{
			g.drawLine(oldX, oldY, curX, curY);
		}
		int nx=30, ny=30, h=8;
		int i,j;
		ising.MCMS(10);
		for (i=0; i< nx; i++)
			for (j=0; j<ny; j++)
			{
				if (ising.spinMatrix[i*nx+j]<0)
				{
					g.fillRect(i*h, j*h, h, h);
				}
				else
				{
					g.clearRect(i*h, j*h, h, h);
				}
			}
	}

}

