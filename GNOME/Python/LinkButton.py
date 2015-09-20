from gi.repository import Gtk
import sys

class MyWindow(Gtk.ApplicationWindow):
    # a window
    def __init__(self, app):
        Gtk.Window.__init__(self, title="GNOME LinkButton", application=app)
        self.set_default_size(250, 50)

        # a linkbutton pointing to the given URI
        button = Gtk.LinkButton(uri="http://live.gnome.org")
        # with given text
        button.set_label("Link to GNOME live!")

        # add the button to the window
        self.add(button)

class MyApplication(Gtk.Application):
    def __init__(self):
        Gtk.Application.__init__(self)

    def do_activate(self):
        win = MyWindow(self)
        win.show_all()

    def do_startup (self):
        Gtk.Application.do_startup (self)

app = MyApplication()
exit_status = app.run(sys.argv)
sys.exit(exit_status)

"""
get_visited() returns the 'visited' state (True or False) of the URI where the LinkButton points. The button becomes visited when it is clicked.


set_visited(True) sets the 'visited' state of the URI where the LinkButton points as True (analogously for False).


Each time the button is clicked, the signal "activate-link" is emitted. For an explanation of signals and callback functions
"""
