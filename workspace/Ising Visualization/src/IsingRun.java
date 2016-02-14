import java.awt.*;
import java.applet.*;

/*
<applet code="IsingRun" width=300 height=300>
<param name=xchangeIntegral value="1.0">
<param name=magneticField value="0.0">
<param name=nx value="50">
<param name=ny value="50">
<param name=topology value="5">
</applet>
 */
public class IsingRun extends Applet implements Runnable
{
	private static final long serialVersionUID = 1L;

	Thread t;
	boolean stopFlag;
	
	int nx = 80, ny = 80;
	double J = 0.1;
	double B = 0.0;
	int topology=0;
	IsingClass  ising;// = new IsingClass(nx, ny, J, B, 2);
	
	public void init()
	{
		String temp;
		// Reading value for exchange integral J
		temp = getParameter("xchangeIntegral");
		if (temp==null)
		{
			System.err.println("Warning: Value for J is not set");
			J = 1.0;
		} 
		else
		{
			try
			{
				J = Double.parseDouble(temp);
			}
			catch (NumberFormatException e)
			{
				System.err.println("Warning: Value for J is not valid");
				J = 1.0;
			}
		}
		//
		// Reading value for magnetic field B
		temp = getParameter("magneticField");
		if (temp==null)
		{
			System.err.println("Warning: Value for B is not set");
			B = 0.0;
		} 
		else
		{
			try
			{
				B = Double.parseDouble(temp);
			}
			catch (NumberFormatException e)
			{
				System.err.println("Warning: Value for B is not valid");
				B = 0.0;
			}
		}
		//
		// Reading value for topology parameter
		temp = getParameter("topology");
		if (temp==null)
		{
			System.err.println("Warning: Value for topology is not set");
			topology = 0;
		} 
		else
		{
			try
			{
				topology = Integer.parseInt(temp);
			}
			catch (NumberFormatException e)
			{
				System.err.println("Warning: Value for topology is not valid");
				topology = 0;
			}
		}
		//
		// Reading value for nx
		temp = getParameter("nx");
		if (temp==null)
		{
			System.err.println("Warning: Value for nx is not set");
			nx = 10;
		} 
		else
		{
			try
			{
				nx = Integer.parseInt(temp);
			}
			catch (NumberFormatException e)
			{
				System.err.println("Warning: Value for nx is not valid");
				nx = 0;
			}
		}
		//
		// Reading value for ny
		temp = getParameter("ny");
		if (temp==null)
		{
			System.err.println("Warning: Value for ny is not set");
			ny = 10;
		} 
		else
		{
			try
			{
				ny = Integer.parseInt(temp);
			}
			catch (NumberFormatException e)
			{
				System.err.println("Warning: Value for ny is not valid");
				ny = 0;
			}
		}
		
		ising = new IsingClass(nx, ny, J, B, topology);
		ising.StateGen();
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
		for ( ; ; )
		{
			try
			{
				repaint();
				Thread.sleep(1500);
				ising.MCMS(nx*ny);
				ising.HamiltonianTT();
				System.out.print("M="+ising.magneticMoment);
				System.out.println("\tE="+ising.magneticEnergy);
				if (stopFlag) break;
			}
			catch (InterruptedException exc)
			{
				System.out.println("XXX");
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
		int i,j;
		int width = this.getWidth();
		int height = this.getHeight();
		int hx = width / nx;
		int hy = height / ny;
		for (i=0; i< nx; i++)
			for (j=0; j<ny; j++)
			{
				if (ising.spinMatrix[i*nx+j]<0)
				{
					g.fillRect(i*hx, j*hy, hx, hy);
				}
				else
				{
					g.clearRect(i*hx, j*hy, hx, hy);
				}
			}
		showStatus("Width="+width+" Height="+height +
				" Dimx="+nx+" Dimy="+ny +
				" J="+J+" B="+B +
				" topology="+topology);
	}
}
