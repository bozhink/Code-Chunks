#!/usr/bin/gjs

const Gtk = imports.gi.Gtk;
const Lang = imports.lang;

var cookies = 0;

const GettingTheSignal = new Lang.Class({
    Name: "Getting the Signal",
    
    _init: function () {
        this.application = new Gtk.Application ();
        this.application.connect ('activate',
            Lang.bind (this, this._onActivate));
        this.application.connect ('startup',
            Lang.bind (this, this._onStartup));
    },
    
    _onActivate: function () {
        this._window.present ();
    },
    
    _onStartup: function () {
        this._buildUI ();
    },
    
    _buildUI: function() {
        this._window = new Gtk.ApplicationWindow ({
            application: this.application,
            window_position: Gtk.WindowPosition.CENTER,
            default_height: 200,
            default_width: 400,
            title: "Click the button to get a cookie!"
        });
        this._cookieLabel = new Gtk.Label ({
            label: "Number of cookies: " + cookies
        });
        this._cookieButton = new Gtk.Button ({
            label: "Get a cookie"
        });
        this._cookieButton.connect ('clicked',
            Lang.bind (this, this._getACookie));
        this._cookieSwitch = new Gtk.Switch ();
        this._switchLabel = new Gtk.Label ({
            label: "Cookie dispenser" });
        this._switchGrid = new Gtk.Grid ({
            halign: Gtk.Align.CENTER,
            valign: Gtk.Align.CENTER });
        this._switchGrid.attach (this._switchLabel, 0, 0, 1, 1);
        this._switchGrid.attach (this._cookieSwitch, 1, 0, 1, 1);
        
        this._grid = new Gtk.Grid ({
            halign: Gtk.Align.CENTER,
            valign: Gtk.Align.CENTER,
            row_spacing: 20 });
        this._grid.attach (this._cookieButton, 0, 0, 1, 1);
        this._grid.attach (this._switchGrid, 0, 1, 1, 1);
        this._grid.attach (this._cookieLabel, 0, 2, 1, 1);
        
        this._window.add (this._grid);
        
        this._window.show_all ();
    },
    
    _getACookie: function () {
        if (this._cookieSwitch.get_active ()) {
            cookies++;
            this._cookieLabel.set_label ("Number of cookies: " + cookies);
        }
    }
});

let app = new GettingTheSignal ();
app.application.run (ARGV);
