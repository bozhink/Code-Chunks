package bmime;

import bmi.BMI;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.Form;
import javax.microedition.lcdui.StringItem;
import javax.microedition.lcdui.TextField;
import javax.microedition.midlet.MIDlet;

/**
 * @author Bozhin Karaivanov
 * This program calculates the Body Mass Index and explains you what is
 * your health state. For more information see http://en.wikipedia.org/wiki/Body_mass_index
 */
public class Midlet extends MIDlet implements CommandListener{
    
    private Display display;
    
    private boolean started;
    
    private Command exitCommand;
    private Command cancelCommand;
    private Command okCommand;

    private StringItem bmiLabel;
    
    private TextField massField;
    private TextField heightField;

    public void startApp() {
        if (!started) {
            display = Display.getDisplay(this);
            
            Form form = new Form("BMI calculator");
            exitCommand = new Command("Exit", Command.EXIT, 0);
            cancelCommand = new Command("Cancel", Command.CANCEL, 0);
            okCommand = new Command("OK", Command.OK, 0);
            
            massField = new TextField("Enter mass in kg", null, 7, 5); // 5=Decimal
            heightField = new TextField("Enter height in cm", null, 3, 2); // 2=Numeric
            
            bmiLabel = new StringItem("BMI:", null);
            
            form.addCommand(okCommand);
            form.addCommand(cancelCommand);
            form.addCommand(exitCommand);
            
            form.append(massField);
            form.append(heightField);
            
            form.append(bmiLabel);
            
            form.setCommandListener(this);
            display.setCurrent(form);
            
            started=true;
        }
    }
    
    public void pauseApp() {
    }
    
    public void destroyApp(boolean unconditional) {
    }

    public void commandAction(Command c, Displayable d) {
        if (c == exitCommand) {
            notifyDestroyed();
        } else if (c == okCommand) {
            OKCommand();
        } else if (c == cancelCommand) {
            CancelCommand();
        } else {
            throw new UnsupportedOperationException("Not supported yet.");
        }
    }
    
    private void SetErrorMessage() {
        bmiLabel.setText("Incorrect input values!");
    }
    
    private void OKCommand() {
        String Mass = massField.getString();
        String Height = heightField.getString();
        if (Mass.length()==0 || Height.length()==0) {
            SetErrorMessage();
        } else {
            double mass=Double.parseDouble(Mass);
            int height=Integer.parseInt(Height);
            if (height!=0) {
                BMI bmi = new BMI(mass, height);
                String bbmi = Double.toString(bmi.GetBMI());
                int to=0;
                for (int i=0; i<bbmi.length(); i++) {
                    if (bbmi.charAt(i)=='.') {
                        to=i+3;
                        if (to>bbmi.length()) {
                            to =i;
                        }
                        break;
                    }
                }
                bmiLabel.setText(bbmi.substring(0, to) +"\n"+bmi.ExplainResult());   
            } else {
                SetErrorMessage();
            }
        }
    }
    
    private void CancelCommand() {
        bmiLabel.setText(null);
        heightField.setString(null);
        massField.setString(null);
    }
}
