import java.awt.*;
import java.awt.event.*;
import java.applet.*;

/*
 * <applet code="TrackM" width=300 height=100></applet>
 */

public class TrackM extends Applet
  implements MouseListener, MouseMotionListener
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	int curX=0, curY=0; // current coordinates
	int oldX=0, oldY=0; // old coordinates
	
	boolean draw;
	
	public void init()
	{
		addMouseListener(this);
		addMouseMotionListener(this);
		draw=false;
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
	}
	
	public void paint(Graphics g)
	{
		if (draw)
		{
			g.drawLine(oldX, oldY, curX, curY);
			int x=(curX+oldX)/2;
			int y=(curY+oldY)/2;
			int h=(x+y)/5;
			g.drawOval(x, y, h, h);
			int H = this.getHeight();
			int W = this.getWidth();
			int nx = W / 10;
			int ny = H / 10;
			int i, j;
			for (i=0; i<nx; i++) for (j=0;j<ny; j++)
			{
				x=i*10;
				y=j*10;
				if ((i+j+1)%2 == 1)
				{
					g.fillRect(x, y, 10, 10);
				}
				else
				{
					g.clearRect(x, y, 10, 10);
				}
				
			}
		}
	}
}
