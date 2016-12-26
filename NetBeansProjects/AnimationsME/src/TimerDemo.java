/* License
 * 
 * Copyright 1994-2004 Sun Microsystems, Inc. All Rights Reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *  
 *  * Redistribution of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 * 
 *  * Redistribution in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 * 
 * Neither the name of Sun Microsystems, Inc. or the names of contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 *  
 * This software is provided "AS IS," without a warranty of any kind. ALL
 * EXPRESS OR IMPLIED CONDITIONS, REPRESENTATIONS AND WARRANTIES, INCLUDING
 * ANY IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
 * OR NON-INFRINGEMENT, ARE HEREBY EXCLUDED. SUN MICROSYSTEMS, INC. ("SUN")
 * AND ITS LICENSORS SHALL NOT BE LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE
 * AS A RESULT OF USING, MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS
 * DERIVATIVES. IN NO EVENT WILL SUN OR ITS LICENSORS BE LIABLE FOR ANY LOST
 * REVENUE, PROFIT OR DATA, OR FOR DIRECT, INDIRECT, SPECIAL, CONSEQUENTIAL,
 * INCIDENTAL OR PUNITIVE DAMAGES, HOWEVER CAUSED AND REGARDLESS OF THE THEORY
 * OF LIABILITY, ARISING OUT OF THE USE OF OR INABILITY TO USE THIS SOFTWARE,
 * EVEN IF SUN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
 *  
 * You acknowledge that this software is not designed, licensed or intended
 * for use in the design, construction, operation or maintenance of any
 * nuclear facility. 
 */

import java.util.*;
import javax.microedition.lcdui.*;
import javax.microedition.midlet.*;

public class TimerDemo extends MIDlet {

  Display    display;
  StarField  field = new StarField();
  FieldMover mover = new FieldMover();
  Timer      timer = new Timer();

  public TimerDemo() {
    display = Display.getDisplay( this );
  }

  protected void destroyApp( boolean unconditional ) { }

  protected void startApp() {
    display.setCurrent( field );
    timer.schedule( mover, 100, 100 );
  }

  protected void pauseApp() { }

  public void exit(){
    timer.cancel(); // stop scrolling
    destroyApp( true );
    notifyDestroyed();
  }

class FieldMover extends TimerTask {
  public void run(){
    field.scroll();
  }
}

class StarField extends Canvas {
  int        height;
  int        width;
  int[]      stars;
  Random     generator = new Random();
  boolean    painting = false;

  public StarField(){
    height      = getHeight();
    width       = getWidth();
    stars       = new int[ height ];

    for( int i = 0; i < height; ++i ){
      stars[i] = -1;
    }
  }

  public void scroll() {
    if( painting ) return;

    for( int i = height-1; i > 0; --i ){
      stars[i] = stars[i-1];
    }

    stars[0] = ( generator.nextInt() % ( 3 * width ) ) / 2;
    if( stars[0] >= width ){
      stars[0] = -1;
    }

    repaint();
  }

  protected void paint( Graphics g ){
    painting = true;

    g.setColor( 0, 0, 0 );
    g.fillRect( 0, 0, width, height );

    g.setColor( 255, 255, 255 );

    for( int y = 0; y < height; ++y ){
      int x = stars[y];
      if( x == -1 ) continue;

      g.drawLine( x, y, x, y );
    }

    painting = false;
  }

  protected void keyPressed( int keyCode ){
    exit();
  }
}
}
