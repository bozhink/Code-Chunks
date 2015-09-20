from gi.repository import Gtk
import sys

# a class to define a window
class MyWindow(Gtk.ApplicationWindow):
    def __init__(self, app):
        Gtk.Window.__init__(self, title="Welcome to GNOME", application=app)
        self.set_default_size(200, 100)

# a class to define a label
class MyLabel(Gtk.Label):
    def __init__(self):
        Gtk.Label.__init__(self)
        self.set_text("Hello GNOME!")

class MyApplication(Gtk.Application):
    def __init__(self):
        Gtk.Application.__init__(self)

    def do_activate(self):
        # create an instance of MyWindow
        win = MyWindow(self)
        # create an instance of MyLabel
        label = MyLabel()
        # and add it to the window
        win.add(label)
        # show the window and everything on it
        win.show_all()

app = MyApplication()
exit_status = app.run(sys.argv)
sys.exit(exit_status)
