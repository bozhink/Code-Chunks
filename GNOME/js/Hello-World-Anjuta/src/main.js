#!/usr/bin/gjs

const GLib = imports.gi.GLib;
const Lang = imports.lang;
const Gtk = imports.gi.Gtk;

const Application = new Lang.Class({
	Name: 'Application',

	_init: function() {
		this.application = new Gtk.Application();

		this.application.connect('activate', Lang.bind(this, this._onActivate));
		this.application.connect('startup', Lang.bind(this, this._onStartup));
	},

	_buildUI: function() {
		this._window = new Gtk.ApplicationWindow({ application: this.application,
			title: "Hello World!"});
		this._window.set_default_size(200,200);
		this.label = new Gtk.Label({ label: "Hello, World!" });
		this._window.add(this.label);
	},

	_onActivate: function() {
		this._window.show_all();
	},

	_onStartup: function() {
		this._buildUI();
	}
});

let app = new Application();
app.application.run(ARGV);

print("Hello World!");
