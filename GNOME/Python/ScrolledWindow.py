from gi.repository import Gtk
import sys

class MyWindow(Gtk.ApplicationWindow):
    def __init__(self, app):
        Gtk.Window.__init__(self, title="ScrolledWindow Example", application=app)
        self.set_default_size(200, 200)

        # the scrolledwindow
        scrolled_window = Gtk.ScrolledWindow()
        scrolled_window.set_border_width(10)
        # there is always the scrollbar (otherwise: AUTOMATIC - only if needed - or NEVER)
        scrolled_window.set_policy(Gtk.PolicyType.ALWAYS, Gtk.PolicyType.ALWAYS)

        # an image - slightly larger than the window...
        image = Gtk.Image()
        image.set_from_file("gnome-image.png")

        # add the image to the scrolledwindow
        scrolled_window.add_with_viewport(image)

        # add the scrolledwindow to the window
        self.add(scrolled_window)

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
set_policy(hscrollbar_policy, vscrollbar_policy) where each of the arguments is one of Gtk.Policy.AUTOMATIC, Gtk.Policy.ALWAYS, Gtk.Policy.NEVER regulates whether the horizontal and vertical scrollbars should appear: with AUTOMATIC they appear only if needed, ALWAYS and NEVER are self-explanatory.


add_with_viewport(widget) is used to add the Gtk.Widget widget without native scrolling capabilities inside the window.


set_placement(window_placement) sets the placement of the contents with respect to the scrollbars for the scrolled window. The options for the argument are Gtk.CornerType.TOP_LEFT (default: the scrollbars are on the bottom and on the right of the window), Gtk.CornerType.TOP_RIGHT, Gtk.CornerType.BOTTOM_LEFT, Gtk.CornerType.BOTTOM_RIGHT.


set_hadjustment(adjustment) and set_vadjustment(adjustment) set the Gtk.Adjustment adjustment. This is the representation of a value with a lower and upper bound, together with step and page increments, and a page size, and it is constructed as Gtk.Adjustment(value, lower, upper, step_increment, page_increment, page_size) where the fields are of type float. (Note that step_increment is not used in this case, it can be set to 0.)
"""
