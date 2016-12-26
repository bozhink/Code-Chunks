package bmi;

/**
 *
 * @author Bozhin Karaivanov
 * This program calculates the Body Mass Index and explains you what is
 * your health state. For more information see http://en.wikipedia.org/wiki/Body_mass_index
 */
public class BMI {
    
    private String[] status = {
        "Very severely underweight",
        "Severely underweight",
        "Underweight",
        "Normal (healthy weight)",
        "Overweight",
        "Obese Class I (Moderately obese)",
        "Obese Class II (Severely obese)",
        "Obese Class III (Very severely obese)"
    };
    private double mass; // Mass in kg
    private int height;  // height in cm
    private double bmi;  // BMI in kg/m^2
    
    public BMI() {
        mass=0.0;
        height=0;
        bmi=0.0;
    }
    
    public BMI(double mass, int height) {
        this.mass = mass;
        this.height = height;
        Calculate();
    }
    
    public void Calculate() {
        bmi=10000.0*mass/(height*height);
    }
    
    public void Calculate(double mass, int height) {
        this.mass=mass;
        this.height = height;
        Calculate();
    }
    
    public double GetBMI() {
        return bmi;
    }
    
    public double GetBMI(double mass, int height) {
        Calculate(mass, height);
        return bmi;
    }
    
    public String ExplainResult() {
        if (bmi<15.0) {
            return status[0];
        } else if (bmi<16.0) {
            return status[1];
        } else if (bmi<18.5) {
            return status[2];
        } else if (bmi<25.0) {
            return status[3];
        } else if (bmi<30.0) {
            return status[4];
        } else if (bmi<35.0) {
            return status[5];
        } else if (bmi<40) {
            return status[6];
        } else {
            return status[7];
        }
    }
    
    public String ExplainResult(double mass, int height) {
        this.mass = mass;
        this.height = height;
        Calculate();
        return ExplainResult();
    }
}
