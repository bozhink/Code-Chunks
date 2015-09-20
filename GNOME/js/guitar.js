#!/usr/bin/gjs

var Gtk = imports.gi.Gtk;
var Gst = imports.gi.Gst;

const Mainloop = imports.mainloop;

Gtk.init(null, 0);
Gst.init(null, 0);

var guitarwindow = new Gtk.Window({ type: Gtk.WindowType.TOPLEVEL, border_width: 100});
guitarwindow.title = "Guitar tuner";
guitarwindow.connect ("destroy", function() { Gtk.main_quit() });

var guitarBox = new Gtk.ButtonBox ({ orientation: Gtk.Orientation.VERTICAL, spacing: 10 });

var E = new Gtk.Button({label: "E"});
var A = new Gtk.Button({label: "A"});
var D = new Gtk.Button({label: "D"});
var G = new Gtk.Button({label: "G"});
var B = new Gtk.Button({label: "B"});
var e = new Gtk.Button({label: "e"});

var frequencies = {E:329.63, A:440, D:587.33, G:783.99, B:987.77, e:1318.5};

function playSound(frequency) {
    var pipeline = new Gst.Pipeline({name:"note"});
    var source = new Gst.ElementFactory.make("audiotestsrc", "source");
    var sink = new Gst.ElementFactory.make("autoaudiosink", "output");
    
    source.set_property('freq', frequency);
    pipeline.add(source);
    pipeline.add(sink);
    source.link(sink);
    pipeline.set_state(Gst.State.PLAYING);
    
    Mainloop.timeout_add(500, function(){ pipeline.set_state(Gst.State.PAUSED); return false; });
}

E.connect("clicked", function() { playSound(frequencies.E); });
A.connect("clicked", function() { playSound(frequencies.A); });
D.connect("clicked", function() { playSound(frequencies.D); });
G.connect("clicked", function() { playSound(frequencies.G); });
B.connect("clicked", function() { playSound(frequencies.B); });
e.connect("clicked", function() { playSound(frequencies.e); });

guitarBox.add(E);
guitarBox.add(A);
guitarBox.add(D);
guitarBox.add(G);
guitarBox.add(B);
guitarBox.add(e);

guitarwindow.add(guitarBox);

guitarBox.show_all();
guitarwindow.show();

Gtk.main();

