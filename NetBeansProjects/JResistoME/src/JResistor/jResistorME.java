/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package JResistor;

import javax.microedition.lcdui.*;
import javax.microedition.midlet.MIDlet;
import resistorcolor.ColorCode;

/**
 * @author bozhin
 */
public class jResistorME extends MIDlet implements CommandListener {
    
    private boolean midletPaused = false;
    
    private int numberOfBands;
    private int maxNumberOfBands = 5;
    private int currentBand = 0;
    private ColorCode [] band = {null, null, null, null, null};
    
    private String color = null;
    private boolean isOK = true;

//<editor-fold defaultstate="collapsed" desc=" Generated Fields ">//GEN-BEGIN:|fields|0|
    private Form form;
    private StringItem stringItem;
    private Form form1;
    private StringItem stringItem1;
    private Command exitCommand;
    private Command okCommand;
    private Command screenCommand;
    private Command screenCommand1;
    private Command screenCommand2;
    private Command screenCommand3;
    private Command screenCommand4;
    private Command screenCommand5;
    private Command screenCommand6;
    private Command screenCommand7;
    private Command screenCommand8;
    private Command screenCommand9;
    private Command screenCommand10;
    private Command screenCommand11;
    private Command screenCommand12;
    private Command screenCommand13;
    private Command cancelCommand;
    private Command screenCommand14;
    private Command okCommand1;
    private Command exitCommand1;
    private Font font;
//</editor-fold>//GEN-END:|fields|0|
    /**
     * The jResistorME constructor.
     */
    public jResistorME() 
    {
        numberOfBands = 5;
        currentBand = 0;
        color = null;
        isOK = true;
    }

//<editor-fold defaultstate="collapsed" desc=" Generated Methods ">//GEN-BEGIN:|methods|0|
//</editor-fold>//GEN-END:|methods|0|
//<editor-fold defaultstate="collapsed" desc=" Generated Method: initialize ">//GEN-BEGIN:|0-initialize|0|0-preInitialize
    /**
     * Initializes the application. It is called only once when the MIDlet is
     * started. The method is called before the
     * <code>startMIDlet</code> method.
     */
    private void initialize() {//GEN-END:|0-initialize|0|0-preInitialize
        // write pre-initialize user code here
//GEN-LINE:|0-initialize|1|0-postInitialize
        // write post-initialize user code here
    }//GEN-BEGIN:|0-initialize|2|
//</editor-fold>//GEN-END:|0-initialize|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Method: startMIDlet ">//GEN-BEGIN:|3-startMIDlet|0|3-preAction
    /**
     * Performs an action assigned to the Mobile Device - MIDlet Started point.
     */
    public void startMIDlet() {//GEN-END:|3-startMIDlet|0|3-preAction
        // write pre-action user code here
        switchDisplayable(null, getForm());//GEN-LINE:|3-startMIDlet|1|3-postAction
        // write post-action user code here
    }//GEN-BEGIN:|3-startMIDlet|2|
//</editor-fold>//GEN-END:|3-startMIDlet|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Method: resumeMIDlet ">//GEN-BEGIN:|4-resumeMIDlet|0|4-preAction
    /**
     * Performs an action assigned to the Mobile Device - MIDlet Resumed point.
     */
    public void resumeMIDlet() {//GEN-END:|4-resumeMIDlet|0|4-preAction
        // write pre-action user code here
//GEN-LINE:|4-resumeMIDlet|1|4-postAction
        // write post-action user code here
    }//GEN-BEGIN:|4-resumeMIDlet|2|
//</editor-fold>//GEN-END:|4-resumeMIDlet|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Method: switchDisplayable ">//GEN-BEGIN:|5-switchDisplayable|0|5-preSwitch
    /**
     * Switches a current displayable in a display. The
     * <code>display</code> instance is taken from
     * <code>getDisplay</code> method. This method is used by all actions in the
     * design for switching displayable.
     *
     * @param alert the Alert which is temporarily set to the display; if
     * <code>null</code>, then
     * <code>nextDisplayable</code> is set immediately
     * @param nextDisplayable the Displayable to be set
     */
    public void switchDisplayable(Alert alert, Displayable nextDisplayable) {//GEN-END:|5-switchDisplayable|0|5-preSwitch
        // write pre-switch user code here
        Display display = getDisplay();//GEN-BEGIN:|5-switchDisplayable|1|5-postSwitch
        if (alert == null) {
            display.setCurrent(nextDisplayable);
        } else {
            display.setCurrent(alert, nextDisplayable);
        }//GEN-END:|5-switchDisplayable|1|5-postSwitch
        // write post-switch user code here
    }//GEN-BEGIN:|5-switchDisplayable|2|
//</editor-fold>//GEN-END:|5-switchDisplayable|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Method: commandAction for Displayables ">//GEN-BEGIN:|7-commandAction|0|7-preCommandAction
    /**
     * Called by a system to indicated that a command has been invoked on a
     * particular displayable.
     *
     * @param command the Command that was invoked
     * @param displayable the Displayable where the command was invoked
     */
    public void commandAction(Command command, Displayable displayable) {//GEN-END:|7-commandAction|0|7-preCommandAction
        // write pre-action user code here
        if (displayable == form) {//GEN-BEGIN:|7-commandAction|1|52-preAction
            if (command == cancelCommand) {//GEN-END:|7-commandAction|1|52-preAction
                CancelCommand();
//GEN-LINE:|7-commandAction|2|52-postAction
                // write post-action user code here
            } else if (command == exitCommand) {//GEN-LINE:|7-commandAction|3|16-preAction
                // write pre-action user code here
                exitMIDlet();//GEN-LINE:|7-commandAction|4|16-postAction
                // write post-action user code here
            } else if (command == okCommand) {//GEN-LINE:|7-commandAction|5|18-preAction
                // write pre-action user code here
                switchDisplayable(null, getForm1());//GEN-LINE:|7-commandAction|6|18-postAction
                stringItem1.setText(EvaluateColorCode());
            } else if (command == screenCommand) {//GEN-LINE:|7-commandAction|7|20-preAction
                // No color
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.NONE;
//GEN-LINE:|7-commandAction|8|20-postAction
                // write post-action user code here
            } else if (command == screenCommand1) {//GEN-LINE:|7-commandAction|9|22-preAction
                // Black color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.BLACK;
//GEN-LINE:|7-commandAction|10|22-postAction
                // write post-action user code here
            } else if (command == screenCommand10) {//GEN-LINE:|7-commandAction|11|40-preAction
                // White color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.WHITE;
//GEN-LINE:|7-commandAction|12|40-postAction
                // write post-action user code here
            } else if (command == screenCommand11) {//GEN-LINE:|7-commandAction|13|42-preAction
                // Gold color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.GOLD;
//GEN-LINE:|7-commandAction|14|42-postAction
                // write post-action user code here
            } else if (command == screenCommand12) {//GEN-LINE:|7-commandAction|15|44-preAction
                // Silver color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.SILVER;
//GEN-LINE:|7-commandAction|16|44-postAction
                // write post-action user code here
            } else if (command == screenCommand2) {//GEN-LINE:|7-commandAction|17|24-preAction
                // Brown color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.BROWN;
//GEN-LINE:|7-commandAction|18|24-postAction
                // write post-action user code here
            } else if (command == screenCommand3) {//GEN-LINE:|7-commandAction|19|26-preAction
                // Red color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.RED;
//GEN-LINE:|7-commandAction|20|26-postAction
                // write post-action user code here
            } else if (command == screenCommand4) {//GEN-LINE:|7-commandAction|21|28-preAction
                // Orange color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.ORANGE;
//GEN-LINE:|7-commandAction|22|28-postAction
                // write post-action user code here
            } else if (command == screenCommand5) {//GEN-LINE:|7-commandAction|23|30-preAction
                // Yellow color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.YELLOW;
//GEN-LINE:|7-commandAction|24|30-postAction
                // write post-action user code here
            } else if (command == screenCommand6) {//GEN-LINE:|7-commandAction|25|32-preAction
                // Green color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.GREEN;
//GEN-LINE:|7-commandAction|26|32-postAction
                // write post-action user code here
            } else if (command == screenCommand7) {//GEN-LINE:|7-commandAction|27|34-preAction
                // Blue color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.BLUE;
//GEN-LINE:|7-commandAction|28|34-postAction
                // write post-action user code here
            } else if (command == screenCommand8) {//GEN-LINE:|7-commandAction|29|36-preAction
                // Violet color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.VIOLET;
//GEN-LINE:|7-commandAction|30|36-postAction
                // write post-action user code here
            } else if (command == screenCommand9) {//GEN-LINE:|7-commandAction|31|38-preAction
                // Grey color selected
                ExecCommand(command);
                if (isOK) band[currentBand-1] = ColorCode.GREY;
//GEN-LINE:|7-commandAction|32|38-postAction
                // write post-action user code here
            }//GEN-BEGIN:|7-commandAction|33|59-preAction
        } else if (displayable == form1) {
            if (command == exitCommand1) {//GEN-END:|7-commandAction|33|59-preAction
                // write pre-action user code here
                exitMIDlet();//GEN-LINE:|7-commandAction|34|59-postAction
                // write post-action user code here
            } else if (command == okCommand1) {//GEN-LINE:|7-commandAction|35|57-preAction
                // write pre-action user code here
                switchDisplayable(null, getForm());//GEN-LINE:|7-commandAction|36|57-postAction
                CancelCommand();
            }//GEN-BEGIN:|7-commandAction|37|7-postCommandAction
        }//GEN-END:|7-commandAction|37|7-postCommandAction
        // write post-action user code here
    }//GEN-BEGIN:|7-commandAction|38|
//</editor-fold>//GEN-END:|7-commandAction|38|


    private void CancelCommand()
    {
        // Clears all content
        stringItem.setLabel("Enter Color Code");
        stringItem.setText("");
        for (int i=0; i<maxNumberOfBands; i++)
            band[i] = null;
        currentBand = 0;
        isOK = true;
    }
    
    private void ExecCommand(Command command)
    {
        currentBand++;
        if (currentBand > maxNumberOfBands)
        {
            stringItem.setLabel("You cant enter at most 5 bands");
            isOK = false;
        }
        else
        {
            stringItem.setLabel("Enter Color Code");
            isOK = true;
        }
        if (isOK)
        {
            color = command.getLabel();
            stringItem.setText(stringItem.getText()+"\n"+color);
        }
    }
    
    private String EvaluateColorCode()
    {
        String code;
        int value;
        switch (currentBand)
        {
            case 0:
                code = "No bands entered";
                break;
            case 1:
                value = band[0].value;
                code = Integer.toString(value)+ColorCode.NONE.tolerance;
                break;
            case 2:
                value = band[0].value*10+band[1].value;
                code = Integer.toString(value)+ColorCode.NONE.tolerance;
                break;
            case 3:
                value = band[0].value*10+band[1].value;
                code = Integer.toString(value) +
                        " e" +
                        Integer.toString(band[2].exponent) +
                        ColorCode.NONE.tolerance;
                break;
            case 4:
                value = band[0].value*10+band[1].value;
                code = Integer.toString(value) +
                        " e" +
                        Integer.toString(band[2].exponent) +
                        band[3].tolerance;
                break;
            default:
                value = band[0].value*100 +
                        band[1].value*10 +
                        band[2].value;
                code = Integer.toString(value) +
                        " e" +
                        Integer.toString(band[3].exponent) +
                        band[4].tolerance;
        }
        return code;
    }
    
//<editor-fold defaultstate="collapsed" desc=" Generated Getter: form ">//GEN-BEGIN:|14-getter|0|14-preInit
    /**
     * Returns an initialized instance of form component.
     *
     * @return the initialized component instance
     */
    public Form getForm() {
        if (form == null) {//GEN-END:|14-getter|0|14-preInit
            // write pre-init user code here
            form = new Form("jResistorME", new Item[]{getStringItem()});//GEN-BEGIN:|14-getter|1|14-postInit
            form.addCommand(getExitCommand());
            form.addCommand(getOkCommand());
            form.addCommand(getScreenCommand());
            form.addCommand(getScreenCommand1());
            form.addCommand(getScreenCommand2());
            form.addCommand(getScreenCommand3());
            form.addCommand(getScreenCommand4());
            form.addCommand(getScreenCommand5());
            form.addCommand(getScreenCommand6());
            form.addCommand(getScreenCommand7());
            form.addCommand(getScreenCommand8());
            form.addCommand(getScreenCommand9());
            form.addCommand(getScreenCommand10());
            form.addCommand(getScreenCommand11());
            form.addCommand(getScreenCommand12());
            form.addCommand(getCancelCommand());
            form.setCommandListener(this);//GEN-END:|14-getter|1|14-postInit
            // write post-init user code here
        }//GEN-BEGIN:|14-getter|2|
        return form;
    }
//</editor-fold>//GEN-END:|14-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: exitCommand ">//GEN-BEGIN:|15-getter|0|15-preInit
    /**
     * Returns an initialized instance of exitCommand component.
     *
     * @return the initialized component instance
     */
    public Command getExitCommand() {
        if (exitCommand == null) {//GEN-END:|15-getter|0|15-preInit
            // write pre-init user code here
            exitCommand = new Command("Exit", Command.EXIT, 0);//GEN-LINE:|15-getter|1|15-postInit
            // write post-init user code here
        }//GEN-BEGIN:|15-getter|2|
        return exitCommand;
    }
//</editor-fold>//GEN-END:|15-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: okCommand ">//GEN-BEGIN:|17-getter|0|17-preInit
    /**
     * Returns an initialized instance of okCommand component.
     *
     * @return the initialized component instance
     */
    public Command getOkCommand() {
        if (okCommand == null) {//GEN-END:|17-getter|0|17-preInit
            // write pre-init user code here
            okCommand = new Command("Ok", Command.OK, 0);//GEN-LINE:|17-getter|1|17-postInit
            // write post-init user code here
        }//GEN-BEGIN:|17-getter|2|
        return okCommand;
    }
//</editor-fold>//GEN-END:|17-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand ">//GEN-BEGIN:|19-getter|0|19-preInit
    /**
     * Returns an initialized instance of screenCommand component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand() {
        if (screenCommand == null) {//GEN-END:|19-getter|0|19-preInit
            // write pre-init user code here
            screenCommand = new Command("NONE", "No color", Command.SCREEN, 0);//GEN-LINE:|19-getter|1|19-postInit
            // write post-init user code here
        }//GEN-BEGIN:|19-getter|2|
        return screenCommand;
    }
//</editor-fold>//GEN-END:|19-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand1 ">//GEN-BEGIN:|21-getter|0|21-preInit
    /**
     * Returns an initialized instance of screenCommand1 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand1() {
        if (screenCommand1 == null) {//GEN-END:|21-getter|0|21-preInit
            // write pre-init user code here
            screenCommand1 = new Command("BLACK", "Black", Command.SCREEN, 0);//GEN-LINE:|21-getter|1|21-postInit
            // write post-init user code here
        }//GEN-BEGIN:|21-getter|2|
        return screenCommand1;
    }
//</editor-fold>//GEN-END:|21-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand2 ">//GEN-BEGIN:|23-getter|0|23-preInit
    /**
     * Returns an initialized instance of screenCommand2 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand2() {
        if (screenCommand2 == null) {//GEN-END:|23-getter|0|23-preInit
            // write pre-init user code here
            screenCommand2 = new Command("BROWN", "Brown", Command.SCREEN, 0);//GEN-LINE:|23-getter|1|23-postInit
            // write post-init user code here
        }//GEN-BEGIN:|23-getter|2|
        return screenCommand2;
    }
//</editor-fold>//GEN-END:|23-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand3 ">//GEN-BEGIN:|25-getter|0|25-preInit
    /**
     * Returns an initialized instance of screenCommand3 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand3() {
        if (screenCommand3 == null) {//GEN-END:|25-getter|0|25-preInit
            // write pre-init user code here
            screenCommand3 = new Command("RED", "Red", Command.SCREEN, 0);//GEN-LINE:|25-getter|1|25-postInit
            // write post-init user code here
        }//GEN-BEGIN:|25-getter|2|
        return screenCommand3;
    }
//</editor-fold>//GEN-END:|25-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand4 ">//GEN-BEGIN:|27-getter|0|27-preInit
    /**
     * Returns an initialized instance of screenCommand4 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand4() {
        if (screenCommand4 == null) {//GEN-END:|27-getter|0|27-preInit
            // write pre-init user code here
            screenCommand4 = new Command("ORANGE", "Orange", Command.SCREEN, 0);//GEN-LINE:|27-getter|1|27-postInit
            // write post-init user code here
        }//GEN-BEGIN:|27-getter|2|
        return screenCommand4;
    }
//</editor-fold>//GEN-END:|27-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand5 ">//GEN-BEGIN:|29-getter|0|29-preInit
    /**
     * Returns an initialized instance of screenCommand5 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand5() {
        if (screenCommand5 == null) {//GEN-END:|29-getter|0|29-preInit
            // write pre-init user code here
            screenCommand5 = new Command("YELLOW", "Yellow", Command.SCREEN, 0);//GEN-LINE:|29-getter|1|29-postInit
            // write post-init user code here
        }//GEN-BEGIN:|29-getter|2|
        return screenCommand5;
    }
//</editor-fold>//GEN-END:|29-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand6 ">//GEN-BEGIN:|31-getter|0|31-preInit
    /**
     * Returns an initialized instance of screenCommand6 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand6() {
        if (screenCommand6 == null) {//GEN-END:|31-getter|0|31-preInit
            // write pre-init user code here
            screenCommand6 = new Command("GREEN", "Green", Command.SCREEN, 0);//GEN-LINE:|31-getter|1|31-postInit
            // write post-init user code here
        }//GEN-BEGIN:|31-getter|2|
        return screenCommand6;
    }
//</editor-fold>//GEN-END:|31-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand7 ">//GEN-BEGIN:|33-getter|0|33-preInit
    /**
     * Returns an initialized instance of screenCommand7 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand7() {
        if (screenCommand7 == null) {//GEN-END:|33-getter|0|33-preInit
            // write pre-init user code here
            screenCommand7 = new Command("BLUE", "Blue", Command.SCREEN, 0);//GEN-LINE:|33-getter|1|33-postInit
            // write post-init user code here
        }//GEN-BEGIN:|33-getter|2|
        return screenCommand7;
    }
//</editor-fold>//GEN-END:|33-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand8 ">//GEN-BEGIN:|35-getter|0|35-preInit
    /**
     * Returns an initialized instance of screenCommand8 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand8() {
        if (screenCommand8 == null) {//GEN-END:|35-getter|0|35-preInit
            // write pre-init user code here
            screenCommand8 = new Command("VIOLET", "Violet", Command.SCREEN, 0);//GEN-LINE:|35-getter|1|35-postInit
            // write post-init user code here
        }//GEN-BEGIN:|35-getter|2|
        return screenCommand8;
    }
//</editor-fold>//GEN-END:|35-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand9 ">//GEN-BEGIN:|37-getter|0|37-preInit
    /**
     * Returns an initialized instance of screenCommand9 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand9() {
        if (screenCommand9 == null) {//GEN-END:|37-getter|0|37-preInit
            // write pre-init user code here
            screenCommand9 = new Command("GREY", "Grey", Command.SCREEN, 0);//GEN-LINE:|37-getter|1|37-postInit
            // write post-init user code here
        }//GEN-BEGIN:|37-getter|2|
        return screenCommand9;
    }
//</editor-fold>//GEN-END:|37-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand10 ">//GEN-BEGIN:|39-getter|0|39-preInit
    /**
     * Returns an initialized instance of screenCommand10 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand10() {
        if (screenCommand10 == null) {//GEN-END:|39-getter|0|39-preInit
            // write pre-init user code here
            screenCommand10 = new Command("WHITE", "White", Command.SCREEN, 0);//GEN-LINE:|39-getter|1|39-postInit
            // write post-init user code here
        }//GEN-BEGIN:|39-getter|2|
        return screenCommand10;
    }
//</editor-fold>//GEN-END:|39-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand11 ">//GEN-BEGIN:|41-getter|0|41-preInit
    /**
     * Returns an initialized instance of screenCommand11 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand11() {
        if (screenCommand11 == null) {//GEN-END:|41-getter|0|41-preInit
            // write pre-init user code here
            screenCommand11 = new Command("GOLD", "Gold", Command.SCREEN, 0);//GEN-LINE:|41-getter|1|41-postInit
            // write post-init user code here
        }//GEN-BEGIN:|41-getter|2|
        return screenCommand11;
    }
//</editor-fold>//GEN-END:|41-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand12 ">//GEN-BEGIN:|43-getter|0|43-preInit
    /**
     * Returns an initialized instance of screenCommand12 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand12() {
        if (screenCommand12 == null) {//GEN-END:|43-getter|0|43-preInit
            // write pre-init user code here
            screenCommand12 = new Command("SILVER", "Silver", Command.SCREEN, 0);//GEN-LINE:|43-getter|1|43-postInit
            // write post-init user code here
        }//GEN-BEGIN:|43-getter|2|
        return screenCommand12;
    }
//</editor-fold>//GEN-END:|43-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand13 ">//GEN-BEGIN:|47-getter|0|47-preInit
    /**
     * Returns an initialized instance of screenCommand13 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand13() {
        if (screenCommand13 == null) {//GEN-END:|47-getter|0|47-preInit
            // write pre-init user code here
            screenCommand13 = new Command("Screen", Command.SCREEN, 0);//GEN-LINE:|47-getter|1|47-postInit
            // write post-init user code here
        }//GEN-BEGIN:|47-getter|2|
        return screenCommand13;
    }
//</editor-fold>//GEN-END:|47-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: stringItem ">//GEN-BEGIN:|49-getter|0|49-preInit
    /**
     * Returns an initialized instance of stringItem component.
     *
     * @return the initialized component instance
     */
    public StringItem getStringItem() {
        if (stringItem == null) {//GEN-END:|49-getter|0|49-preInit
            // write pre-init user code here
            stringItem = new StringItem("Enter Color Code", "", Item.PLAIN);//GEN-LINE:|49-getter|1|49-postInit
            // write post-init user code here
        }//GEN-BEGIN:|49-getter|2|
        return stringItem;
    }
//</editor-fold>//GEN-END:|49-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: font ">//GEN-BEGIN:|50-getter|0|50-preInit
    /**
     * Returns an initialized instance of font component.
     *
     * @return the initialized component instance
     */
    public Font getFont() {
        if (font == null) {//GEN-END:|50-getter|0|50-preInit
            // write pre-init user code here
            font = Font.getDefaultFont();//GEN-LINE:|50-getter|1|50-postInit
            // write post-init user code here
        }//GEN-BEGIN:|50-getter|2|
        return font;
    }
//</editor-fold>//GEN-END:|50-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: cancelCommand ">//GEN-BEGIN:|51-getter|0|51-preInit
    /**
     * Returns an initialized instance of cancelCommand component.
     *
     * @return the initialized component instance
     */
    public Command getCancelCommand() {
        if (cancelCommand == null) {//GEN-END:|51-getter|0|51-preInit
            // write pre-init user code here
            cancelCommand = new Command("Cancel", Command.SCREEN, 0);//GEN-LINE:|51-getter|1|51-postInit
            // write post-init user code here
        }//GEN-BEGIN:|51-getter|2|
        return cancelCommand;
    }
//</editor-fold>//GEN-END:|51-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand14 ">//GEN-BEGIN:|53-getter|0|53-preInit
    /**
     * Returns an initialized instance of screenCommand14 component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand14() {
        if (screenCommand14 == null) {//GEN-END:|53-getter|0|53-preInit
            // write pre-init user code here
            screenCommand14 = new Command("Screen", Command.SCREEN, 0);//GEN-LINE:|53-getter|1|53-postInit
            // write post-init user code here
        }//GEN-BEGIN:|53-getter|2|
        return screenCommand14;
    }
//</editor-fold>//GEN-END:|53-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: form1 ">//GEN-BEGIN:|55-getter|0|55-preInit
    /**
     * Returns an initialized instance of form1 component.
     *
     * @return the initialized component instance
     */
    public Form getForm1() {
        if (form1 == null) {//GEN-END:|55-getter|0|55-preInit
            // write pre-init user code here
            form1 = new Form("Result", new Item[]{getStringItem1()});//GEN-BEGIN:|55-getter|1|55-postInit
            form1.addCommand(getOkCommand1());
            form1.addCommand(getExitCommand1());
            form1.setCommandListener(this);//GEN-END:|55-getter|1|55-postInit
            // write post-init user code here
        }//GEN-BEGIN:|55-getter|2|
        return form1;
    }
//</editor-fold>//GEN-END:|55-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: stringItem1 ">//GEN-BEGIN:|62-getter|0|62-preInit
    /**
     * Returns an initialized instance of stringItem1 component.
     *
     * @return the initialized component instance
     */
    public StringItem getStringItem1() {
        if (stringItem1 == null) {//GEN-END:|62-getter|0|62-preInit
            // write pre-init user code here
            stringItem1 = new StringItem("Resistance is", "");//GEN-LINE:|62-getter|1|62-postInit
            // write post-init user code here
        }//GEN-BEGIN:|62-getter|2|
        return stringItem1;
    }
//</editor-fold>//GEN-END:|62-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: okCommand1 ">//GEN-BEGIN:|56-getter|0|56-preInit
    /**
     * Returns an initialized instance of okCommand1 component.
     *
     * @return the initialized component instance
     */
    public Command getOkCommand1() {
        if (okCommand1 == null) {//GEN-END:|56-getter|0|56-preInit
            // write pre-init user code here
            okCommand1 = new Command("Ok", Command.OK, 0);//GEN-LINE:|56-getter|1|56-postInit
            // write post-init user code here
        }//GEN-BEGIN:|56-getter|2|
        return okCommand1;
    }
//</editor-fold>//GEN-END:|56-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: exitCommand1 ">//GEN-BEGIN:|58-getter|0|58-preInit
    /**
     * Returns an initialized instance of exitCommand1 component.
     *
     * @return the initialized component instance
     */
    public Command getExitCommand1() {
        if (exitCommand1 == null) {//GEN-END:|58-getter|0|58-preInit
            // write pre-init user code here
            exitCommand1 = new Command("Exit", Command.EXIT, 0);//GEN-LINE:|58-getter|1|58-postInit
            // write post-init user code here
        }//GEN-BEGIN:|58-getter|2|
        return exitCommand1;
    }
//</editor-fold>//GEN-END:|58-getter|2|

    /**
     * Returns a display instance.
     *
     * @return the display instance.
     */
    public Display getDisplay() {
        return Display.getDisplay(this);
    }

    /**
     * Exits MIDlet.
     */
    public void exitMIDlet() {
        switchDisplayable(null, null);
        destroyApp(true);
        notifyDestroyed();
    }

    /**
     * Called when MIDlet is started. Checks whether the MIDlet have been
     * already started and initialize/starts or resumes the MIDlet.
     */
    public void startApp() {
        if (midletPaused) {
            resumeMIDlet();
        } else {
            initialize();
            startMIDlet();
        }
        midletPaused = false;
    }

    /**
     * Called when MIDlet is paused.
     */
    public void pauseApp() {
        midletPaused = true;
    }

    /**
     * Called to signal the MIDlet to terminate.
     *
     * @param unconditional if true, then the MIDlet has to be unconditionally
     * terminated and all resources has to be released.
     */
    public void destroyApp(boolean unconditional) {
    }
}
