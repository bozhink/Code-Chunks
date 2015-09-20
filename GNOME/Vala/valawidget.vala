// valac --pkg gtk+-3.0 valawidget.vala
/*
 * Nick Glynn 2011
 * Johan Dahlin 2008
 *
 * A quite simple Gtk.Widget subclass which demonstrates how to subclass
 * and do realizing, sizing and drawing. Originally based on widget.py in PyGTK
 * and ported to GTK+ 3
 */

using Gtk;
using Cairo;
 
public class ValaWidget : Widget {

    private static const string TEXT = "Hello World!";
    private static const int BORDER_WIDTH = 10;
    private Pango.Layout layout;

    construct {
        this.layout = create_pango_layout (TEXT);
        set_has_window (false);
    }
     
    public override bool draw (Cairo.Context cr) {
        int width = get_allocated_width ();
        int height = get_allocated_height ();

        cr.set_source_rgba (0.5, 0.5, 0.5, 1);
        cr.rectangle (BORDER_WIDTH, BORDER_WIDTH,
                      width - 2 * BORDER_WIDTH,
                      height - 2 * BORDER_WIDTH);
        cr.set_line_width (5.0);
        cr.set_line_join (LineJoin.ROUND);
        cr.stroke ();

        // And draw the text in the middle of the allocated space
        int fontw, fonth;
        this.layout.get_pixel_size (out fontw, out fonth);
        cr.move_to ((width - fontw) / 2,
                    (height - fonth) / 2);
        Pango.cairo_update_layout (cr, this.layout);
        Pango.cairo_show_layout (cr, this.layout);
        return true;
    }
    
    /*
     * This method gets called by Gtk+ when the actual size is known
     * and the widget is told how much space could actually be allocated.
     * It is called every time the widget size changes, for example when the
     * user resizes the window.
     */
    public override void size_allocate (Allocation allocation) {
        // The base method will save the allocation and move/resize the
        // widget's GDK window if the widget is already realized.
        base.size_allocate (allocation);

        // Move/resize other realized windows if necessary
    }
}

int main (string[] args) {
    Gtk.init (ref args);

    var win = new Window ();
    win.set_size_request (200,200);
    win.border_width = 5;
    win.title = "Widget test";
    win.destroy.connect (Gtk.main_quit);

    var frame = new Frame ("Example Vala Widget");
    win.add (frame);

    var widget = new ValaWidget ();
    frame.add (widget);

    win.show_all ();
    Gtk.main ();

    return 0;
}
