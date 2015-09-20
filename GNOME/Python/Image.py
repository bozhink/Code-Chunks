from gi.repository import Gtk
import sys

class MyWindow(Gtk.ApplicationWindow):
    # create a window
    def __init__(self, app):
        Gtk.Window.__init__(self, title="Welcome to GNOME", application=app)
        self.set_default_size(300, 300)

        # create an image
        image = Gtk.Image()
        # set the content of the image as the file filename.png
        image.set_from_file("~/.face.png")
        # add the image to the window
        self.add(image)

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

# To set a stock icon as image, you can use set_from_stock(stock_id, size)
# where stock_id is a stock icon such as Gtk.STOCK_ABOUT 
# and size is a stock icon size to be chosen from Gtk.IconSize.INVALID,
# Gtk.IconSize.MENU, Gtk.IconSize.SMALL_TOOLBAR, Gtk.IconSize.LARGE_TOOLBAR,
# Gtk.IconSize.BUTTON, Gtk.IconSize.DND, Gtk.IconSize.DIALOG.
#
# You can also use set_from_icon_name(icon_name, size),
# where icon_name is a stock icon name such as "gtk-about" and size is as above.
#
# To load an image over a network use set_from_pixbuf(pixbuf), where pixbuf is a GdkPixbuf.
#
# from gi.repository import Gtk
# from gi.repository import GdkPixbuf
# import sys
#
# class MyWindow(Gtk.ApplicationWindow):
#     # create a window
#     def __init__(self, app):
#         Gtk.Window.__init__(self, title="Welcome to GNOME", application=app)
#         self.set_default_size(300, 300)
#
#         # create a pixbuf from file filename="gnome-image.png", with width=32
#         # and height=64 amd boolean preserve_aspect_ratio=False.
#         pixbuf = GdkPixbuf.Pixbuf.new_from_file_at_scale("gnome-image.png", 64, 128, False)
#
#         # create an image
#         image = Gtk.Image()
#         # set the content of the image as the pixbuf
#         image.set_from_pixbuf(pixbuf)
#         # add the image to the window
#         self.add(image)
#
#
# If preserve_aspect_ratio=True we can use new_from_file_at_size(filename, width, height).
# If width or height is -1, it is not constrained.
#
# For loading from an input stream, see new_from_stream()
# and new_from_stream_at_scale() in the documentation
