#!/usr/bin/gjs

const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;
const Gtk = imports.gi.Gtk;
const Lang = imports.lang;

const GridExample = new Lang.Class ({
    Name: 'Grid Example',
    
    _init: function () {
        this.application = new Gtk.Application ({
            application_id: 'org.example.jsgrid',
            flags: Gio.ApplicationFlags.FLAGS_NONE
        });
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
            title: "Grid Example"
        });
        
        this.Grid = new Gtk.Grid ();
        
        this.progressBar = new Gtk.ProgressBar ();
        this.Button = new Gtk.Button ({ label: "Button" });
        this.Button.connect ("clicked", Lang.bind (this, this._clickHandler));
        
        this._window.add (this.Grid);
        this.Grid.attach (this.Button, 1, 1, 1, 1);
        this.Grid.attach_next_to (this.progressBar,
            this.Button, Gtk.PositionType.BOTTOM, 1, 1);
        this._window.show_all();
    },
    
    _clickHandler: function () {
        this.progressBar.pulse ();
    }
});

let app = new GridExample ();
app.application.run (ARGV);
