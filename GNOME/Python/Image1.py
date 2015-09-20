from gi.repository import Gtk
import sys

# a class to create a window
class MyWindow(Gtk.ApplicationWindow):
    def __init__(self, app):
        Gtk.Window.__init__(self, title="Welcome to GNOME", application=app)
        self.set_default_size(300, 300)

# a class to create an image
class MyImage(Gtk.Image):
    def __init__(self):
        Gtk.Image.__init__(self)
        self.set_from_file("gnome-image.png")

class MyApplication(Gtk.Application):
    def __init__(self):
        Gtk.Application.__init__(self)

    def do_activate(self):
        # create an instance of MyWindow
        win = MyWindow(self)
        # create an instance of MyImage and add it to the window
        win.add(MyImage())
        # show the window and everything on it
        win.show_all()


app = MyApplication()
exit_status = app.run(sys.argv)
sys.exit(exit_status)

