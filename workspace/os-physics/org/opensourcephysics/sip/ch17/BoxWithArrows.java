package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.display3d.simple3d.*;


/**
 * BoxWithArrows creates a 3D visualization that can be transformed as a group.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class BoxWithArrows extends Group {
  Element body = new ElementBox();
  Element xaxisBody = new ElementArrow();
  Element yaxisBody = new ElementArrow();
  Element zaxisBody = new ElementArrow();

  public BoxWithArrows () {
    xaxisBody.getStyle().setFillColor(java.awt.Color.RED);
    xaxisBody.getStyle().setResolution(new Resolution(10));
    yaxisBody.getStyle().setFillColor(java.awt.Color.GREEN);
    yaxisBody.getStyle().setResolution(new Resolution(10));
    zaxisBody.getStyle().setFillColor(java.awt.Color.BLUE);
    zaxisBody.getStyle().setResolution(new Resolution(10));
    xaxisBody.setSizeXYZ(5, 0, 0);
    yaxisBody.setSizeXYZ(0, 5, 0);
    zaxisBody.setSizeXYZ(0, 0, 5);
    body.getStyle().setFillColor(new java.awt.Color(0, 0, 255, 64));            // transparent blue
    body.getStyle().setLineColor(java.awt.Color.BLUE);
    body.setSizeXYZ(1.0, 2.0, 4.0);
    addElement(body);           // adds the body to the group
    addElement(xaxisBody);      // adds the arrow to the group
    addElement(yaxisBody);      // adds the arrow to the group
    addElement(zaxisBody);      // adds the arrow to the group
  }
}



