import java.awt.Color;
import java.awt.Graphics;
import java.applet.Applet;
import cellularautomata.*;

/*
<applet code="CellularAutamataApplet" width=600 height=600>
</applet>
*/

public class CellularAutamataApplet extends Applet implements Runnable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Thread myThread;
	boolean isStopped;
	
	
	private int ny = 91, nx = (ny-1)/2;
	private int rule = 90;
	private CellularAutomata cell = new CellularAutomata(nx, ny, rule);
	private int peaks[] = {ny/3,(ny-1)/2+1, 2*ny/3};
	
	
	public void init () {
		myThread = null;
	}
	
	public void start () {
		myThread = new Thread(this);
		isStopped = false;
		myThread.start();
	}
	
	@SuppressWarnings("deprecation")
	public void stop () {
		isStopped = true;
		myThread.stop();
	}
	
	public void destroy () {
		
	}
	
	public void paint (Graphics g) {
		cell.SetPeaks(peaks);
		cell.Calculate();
		int width = this.getWidth();
		int height = this.getHeight();
		int w = height / cell.ny;
		int h = width / cell.nx / 2;
		for (int i=0; i<cell.nx; i++) {
			for (int j=0; j<cell.ny; j++) {
				if (cell.matrix[i][j]==0) {
					g.setColor(Color.white);
				} else {
					g.setColor(Color.black);
				}
				g.fillRect(j*w, i*h, w, h);
			}
		}
		g.setColor(Color.red);
		g.drawString(cell.codeName, 5, 20);
	}

	@Override
	public void run() {
		int j1=0, J1;
		int j2=cell.ny-1, J2;
		for ( ; ; ) {
			J1 = (cell.ny+j1++) % cell.ny;
			J2 = Math.abs((cell.ny+j2--)) % cell.ny;
			peaks[0] = J1;
			peaks[2] = J2;
			try {
				repaint ();
				Thread.sleep(500);
				if (isStopped) {
					break;
				}
			} catch (InterruptedException e) {
				//............................
			}
		}
	}
}
