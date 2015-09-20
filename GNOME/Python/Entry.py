from gi.repository import Gtk
import sys

class MyWindow(Gtk.ApplicationWindow):
    def __init__(self, app):
        Gtk.Window.__init__(self, title="What is your name?", application=app)
        self.set_default_size(300, 100)
        self.set_border_width(10)

        # a single line entry
        name_box = Gtk.Entry()
        # emits a signal when the Enter key is pressed, connected to the
        # callback function cb_activate
        name_box.connect("activate", self.cb_activate)

        # add the Gtk.Entry to the window
        self.add(name_box)

    # the content of the entry is used to write in the terminal
    def cb_activate(self, entry):
        # retrieve the content of the widget
		name = entry.get_text()
		# print it in a nice form in the terminal
		print "Hello " + name + "!"

class MyApplication(Gtk.Application):
    def __init__(self):
        Gtk.Application.__init__(self)

    def do_activate(self):
        win = MyWindow(self)
        win.show_all()

    def do_startup(self):
        Gtk.Application.do_startup(self)

app = MyApplication()
exit_status = app.run(sys.argv)
sys.exit(exit_status)
"""
Some of the signals that a Gtk.Entry widget can emit are: "activate" (emitted when the user activates the Entry key); "backspace" (emitted when the user activates the Backspace or Shift-Backspace keys); "copy-clipboard" (Ctrl-c and Ctrl-Insert); "paste-clipboard" (Ctrl-v and Shift-Insert); "delete-from-cursor" (Delete, for deleting a character; Ctrl-Delete, for deleting a word); "icon-press" (emitted when the user clicks an activable icon); "icon-release" (emitted on the button release from a mouse click over an activable icon); "insert-at-cursor" (emitted when the user initiates the insertion of a fixed string at the cursor); "move-cursor" (emitted when the user initiates a cursor movement); "populate-popup" (emitted before showing the context menu of the entry; it can be used to add items to it).


get_buffer() and set_buffer(buffer), where buffer is a Gtk.EntryBuffer object, can be used to get and set the buffer for the entry.


get_text() and set_text("some text") can be used to get and set the content for the entry.


get_text_length() is self-explanatory.


get_text_area() gets the area where the entry's text is drawn.


If we set set_visibility(False) the characters in the entry are displayed as the invisible char. This is the best available in the current font, but it can be changed with set_invisible_char(ch), where ch is a Unicode charcater. The latter method is reversed by unset_invisbile_char().


set_max_length(int), where int is an integer, truncates every entry longer than int to have the desired maximum length.


By default, if you press the Entry key the Gtk.Entry emits the signal "activate". If you would like to activate the default widget for the window (set using set_default(widget) on the window), then use set_activates_default(True).


To set a frame around the entry: set_has_frame(True).


set_placeholder_text("some text") sets the text to be displayed in the entry when it is empty and unfocused.


set_overwrite_mode(True) and set_overwrite_mode(False) are self-explanatory.


If we have set_editable(False) the user cannot edit the text in the widget.


set_completion(completion), where completion is a Gtk.EntryCompletion, sets completion - or disables it if completion is None.


An Entry widget can display progress or activity information behind the text. We use set_progress_fraction(fraction), where fraction is a float between 0.0 and 1.0 inclusive, to fill in the given fraction of the bar. We use set_progress_pulse_step() to set the fraction of total entry width to move the progress bouncing block for each call to progress_pulse(). The latter method indicates that some progress is made, and causes the progress indicator of the entry to enter "activity mode", where a block bounces back and forth. Each call to progress_pulse() causes the block to move by a little bit (the amount of movement per pulse is determined, as said before, by set_progress_pulse_step()).


An Entry widget can also show icons. These icons can be activatable by clicking, can be set up as drag source and can have tooltips. To add an icon, use set_icon_from_stock(icon_position, stock_id), or one of set_icon_from_pixbuf(icon_position, pixbuf), set_icon_from_icon_name(icon_position, icon_name), where icon_position is one of Gtk.EntryIconPosition.PRIMARY (to set the icon at the beginning of the entry) Gtk.EntryIconPosition.SECONDARY (to set the icon at the end of the entry). To set a tooltip on an icon, use set_icon_tooltip_text("tooltip text") or set_icon_tooltip_markup("tooltip text in Pango markup language").
"""
