from gi.repository import Gtk
import sys

class MyWindow(Gtk.ApplicationWindow):
    def __init__(self, app):
        Gtk.Window.__init__(self, title="SpinButton Example", application=app)
        self.set_default_size(210, 70)
        self.set_border_width(5)

        # an adjustment (initial value, min value, max value,
        # step increment - press cursor keys or +/- buttons to see!,
        # page increment - not used here,
        # page size - not used here)
        ad = Gtk.Adjustment(0, 0, 100, 1, 0, 0)

        # a spin button for integers (digits=0)
        self.spin = Gtk.SpinButton(adjustment=ad, climb_rate=1, digits=0)
        # as wide as possible
        self.spin.set_hexpand(True)

        # we connect the signal "value-changed" emitted by the spinbutton with the callback
        # function spin_selected
        self.spin.connect("value-changed", self.spin_selected)

        # a label
        self.label = Gtk.Label()
        self.label.set_text("Choose a number")

        # a grid to attach the widgets
        grid = Gtk.Grid()
        grid.attach(self.spin, 0, 0, 1, 1)
        grid.attach(self.label, 0, 1, 2, 1)

        self.add(grid)

    # callback function: the signal of the spinbutton is used to change the text of the label
    def spin_selected(self, event):
        self.label.set_text("The number you selected is " + str(self.spin.get_value_as_int()) + ".")

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
An example is the "value-changed" signal, emitted when the value of the spinbutton changes.

A Gtk.Adjustment is needed to construct the Gtk.SpinButton. This is the representation of a value with a lower and upper bound, together with step and page increments, and a page size, and it is constructed as Gtk.Adjustment(value, lower, upper, step_increment, page_increment, page_size) where the fields are of type float; step_increment is the increment/decrement that is obtained by using the cursor keys or the buttons of the spinbutton. Note that page_increment and page_size are not used in this case, and they should be set to 0.


If you want the value of the spinbutton to wrap around when they exceed the maximum or the minimum, set set_wrap(True). The "wrapped" signal is emitted when this happens.


set_digits(digits) sets the precision to be displayed by the spinbutton, up to 20 digits.


To get the value of the spinbutton as an integer, use get_value_as_int().
"""
