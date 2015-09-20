using Gtk;

public class SyncSample : Window {
    
    private SpinButton spinBox;
    private Scale slider;
    
    public SyncSample () {
        this.title = "Enter your age";
        this.window_position = WindowPosition.CENTER;
        this.destroy.connect (Gtk.main_quit);
        set_default_size(300,20);
        
        spinBox = new SpinButton.with_range(0,130,1);
        slider = new Scale.with_range(Orientation.HORIZONTAL, 0, 130, 1);
        spinBox.adjustment.value_changed.connect (() => {
            slider.adjustment.value = spinBox.adjustment.value;
        });
        slider.adjustment.value_changed.connect (() => {
            spinBox.adjustment.value = slider.adjustment.value;
        });
        spinBox.adjustment.value = 35;
        
        var hbox = new Box (Orientation.HORIZONTAL, 5);
        hbox.homogeneous = true;
        hbox.add(spinBox);
        hbox.add(slider);
        add(hbox);
    }
    
    public static int main (string[] args) {
        Gtk.init(ref args);
        
        var window = new SyncSample();
        window.show_all();
        
        Gtk.main();
        return 0;
    }
}    
