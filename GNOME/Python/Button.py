from gi.repository import Gtk
import sys

class MyWindow(Gtk.ApplicationWindow):
    # a window
    def __init__(self, app):
        Gtk.Window.__init__(self, title="GNOME Button", application=app)
        self.set_default_size(250, 50)

        # a button
        button = Gtk.Button()
        # with a label
        button.set_label("Click me")
        # connect the signal "clicked" emitted by the button
        # to the callback function do_clicked
        button.connect("clicked", self.do_clicked)
        # add the button to the window
        self.add(button)

    # callback function connected to the signal "clicked" of the button
    def do_clicked(self, button):
        print "You clicked me!"

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
button = Gtk.Button(label="Click me") could also be used create a button and set the text directly. For a general discussion of this, see here.


set_relief(Gtk.ReliefStyle.NONE) sets to none the relief style of the edges of the Gtk.Button - as opposed to Gtk.ReliefStyle.NORMAL.


If the label of the button is a stock icon, set_use_stock(True) sets the label as the name of the corresponding stock icon.


To set an image (e.g. a stock image) for the button button:
image = Gtk.Image()
image.set_from_stock(Gtk.STOCK_ABOUT, Gtk.IconSize.BUTTON)
button.set_image(image)

You should not set a label for the button after this, otherwise it will show the label and not the image.


If we use set_focus_on_click(False) the button will not grab focus when it is clicked by the mouse. This could be useful in places like toolbars, so that the keyboard focus is not removed from the main area of the application."""
