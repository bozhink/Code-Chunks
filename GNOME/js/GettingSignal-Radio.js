#!/usr/bin/gjs

const Gtk = imports.gi.Gtk;
const Lang = imports.lang;

var cookies = 0;

const GettingTheSignal = new Lang.Class ({
    Name: 'Getting the Signal',
    
    _init: function() {
        this.application = new Gtk.Application();
        this.application.connect('activate',
            Lang.bind(this, this._onActivate));
        this.application.connect('startup',
            Lang.bind(this, this._onStartup));
    },
    
    _onActivate: function() {
        this._window.present();
    },
    
    _onStartup: function() {
        this._buildUI();
    },
    
    _buildUI: function() {
        this._window = new Gtk.ApplicationWindow({
            application: this.application,
            window_position: Gtk.WindowPosition.CENTER,
            default_height: 200,
            default_width: 400,
            border_width: 20,
            title: "Choose the one that says 'cookie'!"
        });
        this._cookieButton = new Gtk.RadioButton({label: "Cookie"});
        this._notCookieOne = new Gtk.RadioButton({
            label: "Not cookie",
            group: this._cookieButton});
        this._notCookieTwo = new Gtk.RadioButton({
            label: "Not cookie",
            group: this._cookieButton });
        
        this._radioGrid = new Gtk.Grid();
        this._radioGrid.attach(this._notCookieOne, 0, 0, 1, 1);
        this._radioGrid.attach(this._cookieButton, 0, 1, 1, 1);
        this._radioGrid.attach(this._notCookieTwo, 0, 2, 1, 1);
        
        this._notCookieOne.set_active(true);
        
        this._cookieButton = new Gtk.Button ({
            label: "Got a cookie"});
        
        this._cookieButton.connect ('clicked',
            Lang.bind(this, this._getACookie));
        
        this._cookieLabel = new Gtk.Label({
            label: "Number of cookies: " + cookies });
        
        this._grid = new Gtk.Grid ({
            halign: Gtk.Align.CENTER,
            valign: Gtk.Align.CENTER,
            row_spacing: 20 });
        
        this._grid.attach(this._radioGrid, 0, 0, 1, 1);
        this._grid.attach(this._cookieButton, 0, 1, 1, 1);
        this._grid.attach(this._cookieLabel, 0, 2, 1, 1);
        
        this._window.add (this._grid);
        
        this._window.show_all();
    },
    
    _getACookie: function() {
        if (this._cookieButton) {
            cookies++;
            this._cookieLabel.set_label (
                "Number of cookies: " + cookies);
        }
    }
});

let app = new GettingTheSignal ();
app.application.run(ARGV);
