from gi.repository import Gtk
import sys

class MyWindow(Gtk.ApplicationWindow):
    # constructor for a Gtk.ApplicationWindow
    def __init__(self, app):
        Gtk.Window.__init__(self, title="Welcome to GNOME", application=app)
        self.set_default_size(200, 100)

        # create a label
        label = Gtk.Label()
        # set the text of the label
        #label.set_text("Hello GNOME!")
        
        label.set_markup("Text can be <small>small</small>, <big>big</big>, "
                 "<b>bold</b>, <i>italic</i> and even point to somewhere "
                 "in the <a href=\"http://www.gtk.org\" "
                 "title=\"Click to find out more\">internets</a>.")
        # add the label to the window
        self.add(label)

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
#
# label = Gtk.Label(label="Hello GNOME!") could also be used create a
# label and set the text directly
#
# set_line_wrap(True) breaks lines if the text of the label exceeds the size of the widget
#
# set_justify(Gtk.Justification.LEFT) 
#             Gtk.Justification.RIGHT
#             Gtk.Justification.CENTER
#             Gtk.Justification.FILL
# sets the alignment of the lines in the text of the label relative to each other.
# The method has no effect on a single-line label.
#
# For decorated text we can use set_markup("text"),
# where "text" is a text in the Pango Markup Language.
# An example:
#
# label.set_markup("Text can be <small>small</small>, <big>big</big>, "
#                 "<b>bold</b>, <i>italic</i> and even point to somewhere "
#                 "in the <a href=\"http://www.gtk.org\" "
#                 "title=\"Click to find out more\">internets</a>.")
