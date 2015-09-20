from gi.repository import Gtk
import sys

class MyWindow(Gtk.ApplicationWindow):
    def __init__(self, app):
        Gtk.Window.__init__(self, title="Grid Example", application=app)

        # three labels
        label_top_left = Gtk.Label(label="This is Top Left")
        label_top_right = Gtk.Label(label="This is Top Right")
        label_bottom = Gtk.Label(label="This is Bottom")

        # a grid
        grid = Gtk.Grid()

        # some space between the columns of the grid
        grid.set_column_spacing(20)

        # in the grid:
        # attach the first label in the top left corner
        grid.attach(label_top_left, 0, 0, 1, 1)
        # attach the second label
        grid.attach(label_top_right, 1, 0, 1, 1)
        # attach the third label below the first label
        grid.attach_next_to(label_bottom, label_top_left, Gtk.PositionType.BOTTOM, 2, 1)

        # add the grid to the window
        self.add(grid)

class MyApplication(Gtk.Application):
    def __init__(self):
        Gtk.Application.__init__(self)

    def do_activate(self):
        win = MyWindow(self)
        win.show_all()

app = MyApplication()
exit_status = app.run(sys.argv)
sys.exit(exit_status)

"""To attach a widget child in position left, top in a slot of given width, height use attach(child, top, left, width, height). If a widget sibling is already in place, we can also use attach_next_to(child, sibling, side, width, height), where side is one of Gtk.PositionType.LEFT, Gtk.PositionType.RIGHT, Gtk.PositionType.TOP, Gtk.PositionType.BOTTOM.


insert_row(position) and insert_column(position) do exactly what they say; children which are attached at or below this position are moved one row down, and children which span across this position are grown to span the new row. insert_next_to(sibling, side) inserts a row or column at the specified position. The new row or column is placed next to sibling, on the side determined by side; if side is Gtk.PositionType.TOP or Gtk.PositionType.BOTTOM, a row is inserted, if side is Gtk.PositionType.LEFT of Gtk.PositionType.RIGHT, a column is inserted.


set_row_homogeneous(True) and set_column_homogeneous(True) ensure that (respectively) every row or every column has the same width or height.


set_row_spacing(spacing) and set_column_spacing(spacing) force a spacing between (respectively) rows or columns. The value of spacing can be between 0, which is the default value, and 32767"""
