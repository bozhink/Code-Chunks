package org.opensourcephysics.sip.ch08.md;

import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.GUIUtils;

/**
 * LJParticlesLoader implements the ObjectLoader interface to load and store data.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0 revised 03/28/05
 */
public class LJParticlesLoader implements XML.ObjectLoader{

   /**
    * Creates a LJParticlesApp object.
    *
    * @param control the xml control
    * @return a new object
     */
   public Object createObject(XMLControl element) {
      return new LJParticlesApp();
   }

   /**
    * Saves data from the LJParticlesApp model into the control.
    *
    * @param element XMLControl
    * @param obj Object
    */
   public void saveObject(XMLControl control, Object obj) {
      LJParticlesApp model = (LJParticlesApp) obj;
      control.setValue("initial_configuration",model.md.initialConfiguration);
      control.setValue("state", model.md.state);
   }

   /**
    * Loads data from the control into the LJParticlesApp model.
    *
    * @param element XMLControl
    * @param obj Object
    * @return Object
    */
   public Object loadObject(XMLControl control, Object obj) {
     // GUI has been loaded with the saved values; now restore the LJ state
     LJParticlesApp model = (LJParticlesApp) obj;
     model.initialize(); // reads values from the GUI into the LJ model
     model.md.initialConfiguration=control.getString("initial_configuration");
     model.md.state=(double[])control.getObject("state");
     int N=(model.md.state.length-1)/4;
     model.md.ax = new double[N];
     model.md.ay = new double[N];
     model.md.computeAcceleration();
     model.md.resetAverages();
     GUIUtils.clearDrawingFrameData(false);  // clears old data from the plot frames
     return obj;
}

}
