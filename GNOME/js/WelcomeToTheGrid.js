#!/usr/bin/gjs

const Gtk = imports.gi.Gtk;
const Lang = imports.lang;

const WelcomeToTheGrid = new Lang.Class ({
    Name: 'Welcome to the Grid',
    
    _init: function () {
        this.application = new Gtk.Application ();
        this.application.connect ('activate', Lang.bind (this, this._onActivate));
        this.application.connect ('startup', Lang.bind (this, this._onStartup));
    },
    
    _onActivate: function () {
        this._window.present ();
    },
    
    _onStartup: function () {
        this._buildUI ();
    },
    
    
    _buildUI: function () {
        this._window = new Gtk.ApplicationWindow ({
            application: this.application,
            window_position: Gtk.WindowPosition.CENTER,
            border_width: 10,
            title: "Welcome to the Grid"
        });
        
        this._grid = new Gtk.Grid ({
            column_homogeneous: true,
            column_spacing: 20,
            row_spacing: 20
        });
        
        this._image = new Gtk.Image ({
            file: "gnome-image.png"
        });
        
        this._icon = new Gtk.Image ({
            stock: 'gtk-about'
        });
        
        this._label = new Gtk.Label ({
            label: "Welcome to GNOME, too!",
            margin_top: 20
        });
        
        this._labelTwo = new Gtk.Label ({
            label: "The cake is a pie."
        });
        
        this._button = new Gtk.Button ({
            label: "Welcome to GNOME, too!"
        });
        
        this._grid.attach (this._image, 0, 0, 2, 1);
        this._grid.attach (this._icon,  0, 1, 1, 1);
        this._grid.attach (this._label, 1, 1, 1, 1);

        //this._grid.attach (this._label, 0, 1, 1, 1);
        //this._grid.attach (this._labelTwo, 1, 1, 1, 1);
        
        //this._grid.attach (this._button, 1, 1, 1, 1);
        
        this._window.add (this._grid);
        this._window.show_all ();
    }
});

let app = new WelcomeToTheGrid ();
app.application.run (ARGV);
