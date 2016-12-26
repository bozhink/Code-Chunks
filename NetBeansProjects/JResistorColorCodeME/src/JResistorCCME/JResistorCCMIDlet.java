/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package JResistorCCME;

import javax.microedition.lcdui.*;
import javax.microedition.midlet.MIDlet;
import org.netbeans.microedition.lcdui.SplashScreen;
import resistorcolor.ColorCode;

/**
 * @author Owner
 */
public class JResistorCCMIDlet extends MIDlet implements CommandListener {
    
    private boolean midletPaused = false;
    
    private ColorCode [] band = new ColorCode[5];
    
    private int numberOfBands=5;
    
    private int currentBand=0;
//<editor-fold defaultstate="collapsed" desc=" Generated Fields ">//GEN-BEGIN:|fields|0|
    private Command exitCommand;
    private Command okCommand;
    private Command exitCommand1;
    private Command okCommand1;
    private Command screenCommand;
    private Command okCommand2;
    private Command exitCommand2;
    private Command okCommand3;
    private Command exitCommand3;
    private Command okCommand4;
    private Form form;
    private StringItem stringItem;
    private ChoiceGroup choiceGroup;
    private SplashScreen splashScreen;
    private Form form1;
    private StringItem stringItem3;
    private StringItem stringItem2;
    private StringItem stringItem5;
    private StringItem stringItem4;
    private StringItem stringItem1;
    private StringItem stringItem6;
    private Form form2;
    private TextField textField;
    private Form form3;
    private ChoiceGroup choiceGroup1;
//</editor-fold>//GEN-END:|fields|0|

    /**
     * The JResistorCCMIDlet constructor.
     */
    public JResistorCCMIDlet() {
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
        switchDisplayable(null, getSplashScreen());//GEN-LINE:|3-startMIDlet|1|3-postAction
        // write post-action user code here
    }//GEN-BEGIN:|3-startMIDlet|2|
//</editor-fold>//GEN-END:|3-startMIDlet|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Method: resumeMIDlet ">//GEN-BEGIN:|4-resumeMIDlet|0|4-preAction
    /**
     * Performs an action assigned to the Mobile Device - MIDlet Resumed point.
     */
    public void resumeMIDlet() {//GEN-END:|4-resumeMIDlet|0|4-preAction
        // write pre-action user code here
        switchDisplayable(null, getForm());//GEN-LINE:|4-resumeMIDlet|1|4-postAction
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
        if (displayable == form) {//GEN-BEGIN:|7-commandAction|1|19-preAction
            if (command == exitCommand) {//GEN-END:|7-commandAction|1|19-preAction
                // write pre-action user code here
                exitMIDlet();//GEN-LINE:|7-commandAction|2|19-postAction
                // write post-action user code here
            } else if (command == okCommand) {//GEN-LINE:|7-commandAction|3|30-preAction
                numberOfBands = GetNumberOfBands();
                switchDisplayable(null, getForm1());//GEN-LINE:|7-commandAction|4|30-postAction
                currentBand = 0;
                band[0]=null;
                band[1]=null;
                band[2]=null;
                band[3]=null;
                band[4]=null;
                switch (numberOfBands)
                {
                    case 3:
                        stringItem1.setText("");
                        stringItem2.setText("");
                        stringItem3.setText("");
                        stringItem4.setText("----");
                        stringItem5.setText("----");
                        break;
                    case 4:
                        stringItem1.setText("");
                        stringItem2.setText("");
                        stringItem3.setText("");
                        stringItem4.setText("");
                        stringItem5.setText("----");
                        break;
                    default:
                        stringItem1.setText("");
                        stringItem2.setText("");
                        stringItem3.setText("");
                        stringItem4.setText("");
                        stringItem5.setText("");
                }
            }//GEN-BEGIN:|7-commandAction|5|40-preAction
        } else if (displayable == form1) {
            if (command == exitCommand1) {//GEN-END:|7-commandAction|5|40-preAction
                // write pre-action user code here
                switchDisplayable(null, getForm());//GEN-LINE:|7-commandAction|6|40-postAction
                // write post-action user code here
            } else if (command == okCommand1) {//GEN-LINE:|7-commandAction|7|42-preAction
                // Calculates the resistance
                //
                // First check if all bands are initialized
                if (!IfBandsAreInitialized())
                {
                    stringItem6.setText("Set All band first");
                    stringItem6.setLabel("WARNING");
                }
                else
                {// Then shows the next form
                    stringItem6.setText("Choose next color");
                    stringItem6.setLabel("Messages");
                    switchDisplayable(null, getForm2());//GEN-LINE:|7-commandAction|8|42-postAction
                // and then prints the result
                    textField.setString(CalculateColorCode());
                }
            } else if (command == screenCommand) {//GEN-LINE:|7-commandAction|9|45-preAction
                if (currentBand<numberOfBands)
                {
                    switchDisplayable(null, getForm3());//GEN-LINE:|7-commandAction|10|45-postAction
                }
            }//GEN-BEGIN:|7-commandAction|11|49-preAction
        } else if (displayable == form2) {
            if (command == exitCommand2) {//GEN-END:|7-commandAction|11|49-preAction
                // write pre-action user code here
                switchDisplayable(null, getForm());//GEN-LINE:|7-commandAction|12|49-postAction
                // write post-action user code here
            } else if (command == okCommand2) {//GEN-LINE:|7-commandAction|13|52-preAction
                // write pre-action user code here
                switchDisplayable(null, getForm());//GEN-LINE:|7-commandAction|14|52-postAction
                // write post-action user code here
            }//GEN-BEGIN:|7-commandAction|15|57-preAction
        } else if (displayable == form3) {
            if (command == exitCommand3) {//GEN-END:|7-commandAction|15|57-preAction
                // write pre-action user code here
                switchDisplayable(null, getForm());//GEN-LINE:|7-commandAction|16|57-postAction
                // write post-action user code here
            } else if (command == okCommand3) {//GEN-LINE:|7-commandAction|17|59-preAction
                band[currentBand] = GetColor();
                SetColor();
                currentBand++;
                switchDisplayable(null, getForm1());//GEN-LINE:|7-commandAction|18|59-postAction
                // write post-action user code here
            }//GEN-BEGIN:|7-commandAction|19|24-preAction
        } else if (displayable == splashScreen) {
            if (command == SplashScreen.DISMISS_COMMAND) {//GEN-END:|7-commandAction|19|24-preAction
                // write pre-action user code here
                switchDisplayable(null, getForm());//GEN-LINE:|7-commandAction|20|24-postAction
                // write post-action user code here
            }//GEN-BEGIN:|7-commandAction|21|7-postCommandAction
        }//GEN-END:|7-commandAction|21|7-postCommandAction
        // write post-action user code here
    }//GEN-BEGIN:|7-commandAction|22|24-postAction
//</editor-fold>//GEN-END:|7-commandAction|22|24-postAction


    private boolean IfBandsAreInitialized()
    {
        switch (numberOfBands)
        {
            case 3:
                if (band[0]==null ||
                    band[1]==null ||
                    band[2]==null)
                    return false;
                else 
                    return true;
            case 4:
                if (band[0]==null ||
                    band[1]==null ||
                    band[2]==null ||
                    band[3]==null)
                    return false;
                else 
                    return true;
            default:
                if (band[0]==null ||
                    band[1]==null ||
                    band[2]==null ||
                    band[3]==null ||
                    band[4]==null)
                    return false;
                else 
                    return true;
        }
    }
    
    private int GetNumberOfBands()
    {
        if (choiceGroup.isSelected(0))
            return 3;
        else if(choiceGroup.isSelected(1))
            return 4;
        else
            return 5;
    }
    
    private void SetColor()
    {
        switch (currentBand)
        {
            case 0 : 
                stringItem1.setText(band[currentBand].name);
                break;
            case 1 : 
                stringItem2.setText(band[currentBand].name);
                break;
            case 2 : 
                stringItem3.setText(band[currentBand].name);
                break;
            case 3 : 
                stringItem4.setText(band[currentBand].name);
                break;
            default : 
                stringItem5.setText(band[currentBand].name);
                break;
        }
        
    }
    
    private ColorCode GetColor()
    {
        if (choiceGroup1.isSelected(0))
        {
            return ColorCode.BLACK;
        }
        else if (choiceGroup1.isSelected(1))
        {
            return ColorCode.BROWN;
        }
        else if (choiceGroup1.isSelected(2))
        {
            return ColorCode.RED;
        }
        else if (choiceGroup1.isSelected(3))
        {
            return ColorCode.ORANGE;
        }
        else if (choiceGroup1.isSelected(4))
        {
            return ColorCode.YELLOW;
        }
        else if (choiceGroup1.isSelected(5))
        {
            return ColorCode.GREEN;
        }
        else if (choiceGroup1.isSelected(6))
        {
            return ColorCode.BLUE;
        }
        else if (choiceGroup1.isSelected(7))
        {
            return ColorCode.VIOLET;
        }
        else if (choiceGroup1.isSelected(8))
        {
            return ColorCode.GREY;
        }
        else if (choiceGroup1.isSelected(9))
        {
            return ColorCode.WHITE;
        }
        else if (choiceGroup1.isSelected(10))
        {
            return ColorCode.GOLD;
        }
        else if (choiceGroup1.isSelected(11))
        {
            return ColorCode.SILVER;
        }
        else{
            return ColorCode.NONE;
        }
    }
    
    private String CalculateColorCode()
    {
        String code=null;
        int value;
        switch(numberOfBands)
        {
            case 3:
                value = (band[0].value*10+band[1].value);
                code = Integer.toString(value) +
                        " e" +
                        Integer.toString(band[2].value) +
                        ColorCode.NONE.tolerance;
                break;
            case 4:
                value = (band[0].value*10+band[1].value);
                code = Integer.toString(value) +
                        " e" +
                        Integer.toString(band[2].value) +
                        band[3].tolerance;
                break;
            default:
                value = (band[0].value*100+band[1].value*10+band[2].value);
                code = Integer.toString(value) +
                        " e" +
                        Integer.toString(band[3].value) +
                        band[4].tolerance;
        }
        return code;
    }

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: exitCommand ">//GEN-BEGIN:|18-getter|0|18-preInit
    /**
     * Returns an initialized instance of exitCommand component.
     *
     * @return the initialized component instance
     */
    public Command getExitCommand() {
        if (exitCommand == null) {//GEN-END:|18-getter|0|18-preInit
            // write pre-init user code here
            exitCommand = new Command("Exit", Command.EXIT, 0);//GEN-LINE:|18-getter|1|18-postInit
            // write post-init user code here
        }//GEN-BEGIN:|18-getter|2|
        return exitCommand;
    }
//</editor-fold>//GEN-END:|18-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: form ">//GEN-BEGIN:|14-getter|0|14-preInit
    /**
     * Returns an initialized instance of form component.
     *
     * @return the initialized component instance
     */
    public Form getForm() {
        if (form == null) {//GEN-END:|14-getter|0|14-preInit
            // write pre-init user code here
            form = new Form("Resistor Color code", new Item[]{getStringItem(), getChoiceGroup()});//GEN-BEGIN:|14-getter|1|14-postInit
            form.addCommand(getExitCommand());
            form.addCommand(getOkCommand());
            form.setCommandListener(this);//GEN-END:|14-getter|1|14-postInit
            // write post-init user code here
        }//GEN-BEGIN:|14-getter|2|
        return form;
    }
//</editor-fold>//GEN-END:|14-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: stringItem ">//GEN-BEGIN:|16-getter|0|16-preInit
    /**
     * Returns an initialized instance of stringItem component.
     *
     * @return the initialized component instance
     */
    public StringItem getStringItem() {
        if (stringItem == null) {//GEN-END:|16-getter|0|16-preInit
            // write pre-init user code here
            stringItem = new StringItem("Number of Bands", "Choose the number of bands");//GEN-LINE:|16-getter|1|16-postInit
            // write post-init user code here
        }//GEN-BEGIN:|16-getter|2|
        return stringItem;
    }
//</editor-fold>//GEN-END:|16-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: splashScreen ">//GEN-BEGIN:|22-getter|0|22-preInit
    /**
     * Returns an initialized instance of splashScreen component.
     *
     * @return the initialized component instance
     */
    public SplashScreen getSplashScreen() {
        if (splashScreen == null) {//GEN-END:|22-getter|0|22-preInit
            // write pre-init user code here
            splashScreen = new SplashScreen(getDisplay());//GEN-BEGIN:|22-getter|1|22-postInit
            splashScreen.setTitle("JResistorCCME");
            splashScreen.setCommandListener(this);
            splashScreen.setFullScreenMode(true);
            splashScreen.setText("JResistorColorCodeME");//GEN-END:|22-getter|1|22-postInit
            // write post-init user code here
        }//GEN-BEGIN:|22-getter|2|
        return splashScreen;
    }
//</editor-fold>//GEN-END:|22-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: okCommand ">//GEN-BEGIN:|29-getter|0|29-preInit
    /**
     * Returns an initialized instance of okCommand component.
     *
     * @return the initialized component instance
     */
    public Command getOkCommand() {
        if (okCommand == null) {//GEN-END:|29-getter|0|29-preInit
            // write pre-init user code here
            okCommand = new Command("Ok", Command.OK, 0);//GEN-LINE:|29-getter|1|29-postInit
            // write post-init user code here
        }//GEN-BEGIN:|29-getter|2|
        return okCommand;
    }
//</editor-fold>//GEN-END:|29-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: choiceGroup ">//GEN-BEGIN:|33-getter|0|33-preInit
    /**
     * Returns an initialized instance of choiceGroup component.
     *
     * @return the initialized component instance
     */
    public ChoiceGroup getChoiceGroup() {
        if (choiceGroup == null) {//GEN-END:|33-getter|0|33-preInit
            // write pre-init user code here
            choiceGroup = new ChoiceGroup("choiceGroup", Choice.EXCLUSIVE);//GEN-BEGIN:|33-getter|1|33-postInit
            choiceGroup.append("3 bands", null);
            choiceGroup.append("4 bands", null);
            choiceGroup.append("5 bands", null);
            choiceGroup.setSelectedFlags(new boolean[]{true, false, false});//GEN-END:|33-getter|1|33-postInit
            // write post-init user code here
        }//GEN-BEGIN:|33-getter|2|
        return choiceGroup;
    }
//</editor-fold>//GEN-END:|33-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: exitCommand1 ">//GEN-BEGIN:|39-getter|0|39-preInit
    /**
     * Returns an initialized instance of exitCommand1 component.
     *
     * @return the initialized component instance
     */
    public Command getExitCommand1() {
        if (exitCommand1 == null) {//GEN-END:|39-getter|0|39-preInit
            // write pre-init user code here
            exitCommand1 = new Command("Exit", Command.EXIT, 0);//GEN-LINE:|39-getter|1|39-postInit
            // write post-init user code here
        }//GEN-BEGIN:|39-getter|2|
        return exitCommand1;
    }
//</editor-fold>//GEN-END:|39-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: okCommand1 ">//GEN-BEGIN:|41-getter|0|41-preInit
    /**
     * Returns an initialized instance of okCommand1 component.
     *
     * @return the initialized component instance
     */
    public Command getOkCommand1() {
        if (okCommand1 == null) {//GEN-END:|41-getter|0|41-preInit
            // write pre-init user code here
            okCommand1 = new Command("Ok", Command.OK, 0);//GEN-LINE:|41-getter|1|41-postInit
            // write post-init user code here
        }//GEN-BEGIN:|41-getter|2|
        return okCommand1;
    }
//</editor-fold>//GEN-END:|41-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: screenCommand ">//GEN-BEGIN:|44-getter|0|44-preInit
    /**
     * Returns an initialized instance of screenCommand component.
     *
     * @return the initialized component instance
     */
    public Command getScreenCommand() {
        if (screenCommand == null) {//GEN-END:|44-getter|0|44-preInit
            // write pre-init user code here
            screenCommand = new Command("Choose color", Command.SCREEN, 0);//GEN-LINE:|44-getter|1|44-postInit
            // write post-init user code here
        }//GEN-BEGIN:|44-getter|2|
        return screenCommand;
    }
//</editor-fold>//GEN-END:|44-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: exitCommand2 ">//GEN-BEGIN:|48-getter|0|48-preInit
    /**
     * Returns an initialized instance of exitCommand2 component.
     *
     * @return the initialized component instance
     */
    public Command getExitCommand2() {
        if (exitCommand2 == null) {//GEN-END:|48-getter|0|48-preInit
            // write pre-init user code here
            exitCommand2 = new Command("Exit", Command.EXIT, 0);//GEN-LINE:|48-getter|1|48-postInit
            // write post-init user code here
        }//GEN-BEGIN:|48-getter|2|
        return exitCommand2;
    }
//</editor-fold>//GEN-END:|48-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: okCommand2 ">//GEN-BEGIN:|51-getter|0|51-preInit
    /**
     * Returns an initialized instance of okCommand2 component.
     *
     * @return the initialized component instance
     */
    public Command getOkCommand2() {
        if (okCommand2 == null) {//GEN-END:|51-getter|0|51-preInit
            // write pre-init user code here
            okCommand2 = new Command("Ok", Command.OK, 0);//GEN-LINE:|51-getter|1|51-postInit
            // write post-init user code here
        }//GEN-BEGIN:|51-getter|2|
        return okCommand2;
    }
//</editor-fold>//GEN-END:|51-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: exitCommand3 ">//GEN-BEGIN:|56-getter|0|56-preInit
    /**
     * Returns an initialized instance of exitCommand3 component.
     *
     * @return the initialized component instance
     */
    public Command getExitCommand3() {
        if (exitCommand3 == null) {//GEN-END:|56-getter|0|56-preInit
            // write pre-init user code here
            exitCommand3 = new Command("Exit", Command.EXIT, 0);//GEN-LINE:|56-getter|1|56-postInit
            // write post-init user code here
        }//GEN-BEGIN:|56-getter|2|
        return exitCommand3;
    }
//</editor-fold>//GEN-END:|56-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: okCommand3 ">//GEN-BEGIN:|58-getter|0|58-preInit
    /**
     * Returns an initialized instance of okCommand3 component.
     *
     * @return the initialized component instance
     */
    public Command getOkCommand3() {
        if (okCommand3 == null) {//GEN-END:|58-getter|0|58-preInit
            // write pre-init user code here
            okCommand3 = new Command("Ok", Command.OK, 0);//GEN-LINE:|58-getter|1|58-postInit
            // write post-init user code here
        }//GEN-BEGIN:|58-getter|2|
        return okCommand3;
    }
//</editor-fold>//GEN-END:|58-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: form1 ">//GEN-BEGIN:|37-getter|0|37-preInit
    /**
     * Returns an initialized instance of form1 component.
     *
     * @return the initialized component instance
     */
    public Form getForm1() {
        if (form1 == null) {//GEN-END:|37-getter|0|37-preInit
            // write pre-init user code here
            form1 = new Form("JResisitorCCME", new Item[]{getStringItem6(), getStringItem1(), getStringItem2(), getStringItem3(), getStringItem4(), getStringItem5()});//GEN-BEGIN:|37-getter|1|37-postInit
            form1.addCommand(getExitCommand1());
            form1.addCommand(getOkCommand1());
            form1.addCommand(getScreenCommand());
            form1.setCommandListener(this);//GEN-END:|37-getter|1|37-postInit
            // write post-init user code here
        }//GEN-BEGIN:|37-getter|2|
        return form1;
    }
//</editor-fold>//GEN-END:|37-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: form2 ">//GEN-BEGIN:|46-getter|0|46-preInit
    /**
     * Returns an initialized instance of form2 component.
     *
     * @return the initialized component instance
     */
    public Form getForm2() {
        if (form2 == null) {//GEN-END:|46-getter|0|46-preInit
            // write pre-init user code here
            form2 = new Form("Result", new Item[]{getTextField()});//GEN-BEGIN:|46-getter|1|46-postInit
            form2.addCommand(getExitCommand2());
            form2.addCommand(getOkCommand2());
            form2.setCommandListener(this);//GEN-END:|46-getter|1|46-postInit
            // write post-init user code here
        }//GEN-BEGIN:|46-getter|2|
        return form2;
    }
//</editor-fold>//GEN-END:|46-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: textField ">//GEN-BEGIN:|65-getter|0|65-preInit
    /**
     * Returns an initialized instance of textField component.
     *
     * @return the initialized component instance
     */
    public TextField getTextField() {
        if (textField == null) {//GEN-END:|65-getter|0|65-preInit
            // write pre-init user code here
            textField = new TextField("Resistance is", null, 40, TextField.ANY);//GEN-LINE:|65-getter|1|65-postInit
            // write post-init user code here
        }//GEN-BEGIN:|65-getter|2|
        return textField;
    }
//</editor-fold>//GEN-END:|65-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: form3 ">//GEN-BEGIN:|54-getter|0|54-preInit
    /**
     * Returns an initialized instance of form3 component.
     *
     * @return the initialized component instance
     */
    public Form getForm3() {
        if (form3 == null) {//GEN-END:|54-getter|0|54-preInit
            // write pre-init user code here
            form3 = new Form("ChooseColor", new Item[]{getChoiceGroup1()});//GEN-BEGIN:|54-getter|1|54-postInit
            form3.addCommand(getExitCommand3());
            form3.addCommand(getOkCommand3());
            form3.setCommandListener(this);//GEN-END:|54-getter|1|54-postInit
            // write post-init user code here
        }//GEN-BEGIN:|54-getter|2|
        return form3;
    }
//</editor-fold>//GEN-END:|54-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: choiceGroup1 ">//GEN-BEGIN:|67-getter|0|67-preInit
    /**
     * Returns an initialized instance of choiceGroup1 component.
     *
     * @return the initialized component instance
     */
    public ChoiceGroup getChoiceGroup1() {
        if (choiceGroup1 == null) {//GEN-END:|67-getter|0|67-preInit
            // write pre-init user code here
            choiceGroup1 = new ChoiceGroup("ChooseColor", Choice.EXCLUSIVE);//GEN-BEGIN:|67-getter|1|67-postInit
            choiceGroup1.append("Black", null);
            choiceGroup1.append("Brown", null);
            choiceGroup1.append("Red", null);
            choiceGroup1.append("Orange", null);
            choiceGroup1.append("Yellow", null);
            choiceGroup1.append("Green", null);
            choiceGroup1.append("Blue", null);
            choiceGroup1.append("Violet", null);
            choiceGroup1.append("Grey", null);
            choiceGroup1.append("White", null);
            choiceGroup1.append("Gold", null);
            choiceGroup1.append("Silver", null);
            choiceGroup1.setSelectedFlags(new boolean[]{true, false, false, false, false, false, false, false, false, false, false, false});//GEN-END:|67-getter|1|67-postInit
            // write post-init user code here
        }//GEN-BEGIN:|67-getter|2|
        return choiceGroup1;
    }
//</editor-fold>//GEN-END:|67-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: stringItem1 ">//GEN-BEGIN:|83-getter|0|83-preInit
    /**
     * Returns an initialized instance of stringItem1 component.
     *
     * @return the initialized component instance
     */
    public StringItem getStringItem1() {
        if (stringItem1 == null) {//GEN-END:|83-getter|0|83-preInit
            // write pre-init user code here
            stringItem1 = new StringItem("B1", "", Item.PLAIN);//GEN-LINE:|83-getter|1|83-postInit
            // write post-init user code here
        }//GEN-BEGIN:|83-getter|2|
        return stringItem1;
    }
//</editor-fold>//GEN-END:|83-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: stringItem2 ">//GEN-BEGIN:|84-getter|0|84-preInit
    /**
     * Returns an initialized instance of stringItem2 component.
     *
     * @return the initialized component instance
     */
    public StringItem getStringItem2() {
        if (stringItem2 == null) {//GEN-END:|84-getter|0|84-preInit
            // write pre-init user code here
            stringItem2 = new StringItem("B2", "");//GEN-LINE:|84-getter|1|84-postInit
            // write post-init user code here
        }//GEN-BEGIN:|84-getter|2|
        return stringItem2;
    }
//</editor-fold>//GEN-END:|84-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: stringItem3 ">//GEN-BEGIN:|85-getter|0|85-preInit
    /**
     * Returns an initialized instance of stringItem3 component.
     *
     * @return the initialized component instance
     */
    public StringItem getStringItem3() {
        if (stringItem3 == null) {//GEN-END:|85-getter|0|85-preInit
            // write pre-init user code here
            stringItem3 = new StringItem("B3", "");//GEN-LINE:|85-getter|1|85-postInit
            // write post-init user code here
        }//GEN-BEGIN:|85-getter|2|
        return stringItem3;
    }
//</editor-fold>//GEN-END:|85-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: stringItem4 ">//GEN-BEGIN:|86-getter|0|86-preInit
    /**
     * Returns an initialized instance of stringItem4 component.
     *
     * @return the initialized component instance
     */
    public StringItem getStringItem4() {
        if (stringItem4 == null) {//GEN-END:|86-getter|0|86-preInit
            // write pre-init user code here
            stringItem4 = new StringItem("B4", "");//GEN-LINE:|86-getter|1|86-postInit
            // write post-init user code here
        }//GEN-BEGIN:|86-getter|2|
        return stringItem4;
    }
//</editor-fold>//GEN-END:|86-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: stringItem5 ">//GEN-BEGIN:|87-getter|0|87-preInit
    /**
     * Returns an initialized instance of stringItem5 component.
     *
     * @return the initialized component instance
     */
    public StringItem getStringItem5() {
        if (stringItem5 == null) {//GEN-END:|87-getter|0|87-preInit
            // write pre-init user code here
            stringItem5 = new StringItem("B5", "");//GEN-LINE:|87-getter|1|87-postInit
            // write post-init user code here
        }//GEN-BEGIN:|87-getter|2|
        return stringItem5;
    }
//</editor-fold>//GEN-END:|87-getter|2|



//<editor-fold defaultstate="collapsed" desc=" Generated Getter: okCommand4 ">//GEN-BEGIN:|89-getter|0|89-preInit
    /**
     * Returns an initialized instance of okCommand4 component.
     *
     * @return the initialized component instance
     */
    public Command getOkCommand4() {
        if (okCommand4 == null) {//GEN-END:|89-getter|0|89-preInit
            // write pre-init user code here
            okCommand4 = new Command("Ok", Command.OK, 0);//GEN-LINE:|89-getter|1|89-postInit
            // write post-init user code here
        }//GEN-BEGIN:|89-getter|2|
        return okCommand4;
    }
//</editor-fold>//GEN-END:|89-getter|2|

//<editor-fold defaultstate="collapsed" desc=" Generated Getter: stringItem6 ">//GEN-BEGIN:|92-getter|0|92-preInit
    /**
     * Returns an initialized instance of stringItem6 component.
     *
     * @return the initialized component instance
     */
    public StringItem getStringItem6() {
        if (stringItem6 == null) {//GEN-END:|92-getter|0|92-preInit
            // write pre-init user code here
            stringItem6 = new StringItem("Messages", "Choose next color");//GEN-LINE:|92-getter|1|92-postInit
            // write post-init user code here
        }//GEN-BEGIN:|92-getter|2|
        return stringItem6;
    }
//</editor-fold>//GEN-END:|92-getter|2|

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
