public class Window : Gtk.ApplicationWindow {

    public Window (Application app) {
        Object (application: app, title: "AboutDialog Example");

        var about_action = new SimpleAction ("about", null);
        
        about_action.activate.connect (this.about_cb);
        this.add_action (about_action);
        this.show_all ();
    }
    
    void about_cb (SimpleAction simple, Variant? parameter) {
        string[] authors = {"GNOME Documentation Team", null};
        string[] documenters = {"GNOME Documentation Team", null};
        
        Gtk.show_about_dialog ( this,
            "program-name", ("GtkApplication Example"),
            "copyright", ("Copyright \xc2\xa9 2012 GNOME Documentation Team"),
            "authors", authors,
            "documenters", documenters,
            "website", "http://developer.gnome.org",
            "website-label", ("GNOME Developer Website"),
            null);
    }

}

public class Application : Gtk.Application {
    
    protected override void activate () {
        new Window (this);
    }
    
    protected override void startup () {
        base.startup ();
        var menu = new Menu ();
        menu.append ("About", "win.about");
        menu.append ("Quit", "app.quit");
        this.app_menu = menu;
        
        var quit_action = new SimpleAction ("quit", null);
        this.add_action (quit_action);
    }
    
    public Application () {
        Object (application_id:"org.example.application");
    }
}

int main (string[] args) {
    return new Application ().run (args);
}

