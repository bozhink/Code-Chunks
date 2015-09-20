from gi.repository import Gtk
import sys

class MyWindow(Gtk.ApplicationWindow):
    def __init__(self, app):
        Gtk.Window.__init__(self, title="TextView Example", application=app)
        self.set_default_size(300, 450)

        # a scrollbar for the child widget (that is going to be the textview)
        scrolled_window = Gtk.ScrolledWindow()
        scrolled_window.set_border_width(5)
        # we scroll only if needed
        scrolled_window.set_policy(Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC)

        # a text buffer (stores text)
        buffer1 = Gtk.TextBuffer()

        # a textview (displays the buffer)
        textview = Gtk.TextView(buffer=buffer1)
        # wrap the text, if needed, breaking lines in between words
        textview.set_wrap_mode(Gtk.WrapMode.WORD)

        # textview is scrolled
        scrolled_window.add(textview)

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
A Gtk.TextView displays the text stored in a Gtk.TextBuffer. However, most text manipulation 
is accomplished with iterators, represented by a Gtk.TextIter - a position between two
characters in the text buffer. Iterators are not valid indefinitely; whenever the buffer is
modified in a way that affects the contents of the buffer, all outstanding iterators become
invalid. Because of this, iterators can’t be used to preserve positions across buffer
modifications.
To 
preserve
a
position,
we
use
a
Gtk.TextMark,
that can be set visible with
visible(True). A text buffer contains two built-in marks; an "insert" mark (the position of
the cursor) and the "selection_bound" mark.

Methods for a TextView widget:

The TextView widget is by default editable. If you prefer otherwise, use set_editable(False).
If the buffer has no editable text, it might be a good idea to use
set_cursor_visible(False) as well.

The justification of the text is set with set_justification(Gtk.Justification.JUSTIFICATION)
where JUSTIFICATION is one of LEFT, RIGHT, CENTER, FILL.

The line wrapping of the text is set with set_wrap_mode(Gtk.WrapMode.WRAP) where WRAP is one
of NONE (the text area is made wider), CHAR (break lines anywhere the cursor can appear), WORD
(break lines between words), WORD_CHAR (break lines between words, but if that is not enough
between characters).

Methods for a TextBuffer widget:

get_insert() returns the Gtk.TextMark that represents the cursor, that is the insertion point.

get_selection_bound() returns the Gtk.TextMark that represents the selection bound.

set_text("some text", length) where length is a positive integer or -1, sets the content of the buffer as the first length characters of the "some text" text. If length is omitted or -1, the text is inserted completely. The content of the buffer, if there is any, is destroyed.

insert(iter, "some text", length) where iter is a text iterator and length is a positive integer or -1, inserts in the buffer at iter the first length characters of the "some text" text. If length is omitted or -1, the text is inserted completely.

insert_at_cursor("some text", length) does the same as insert(iter, "some text", length), with the current cursor taken as iter.

create_mark("mark_name", iter, left_gravity) where iter is a Gtk.TextIter and left_gravity is a boolean, creates a Gtk.TextMark at the position of iter. If "mark_name" is None, the mark is anonymous; otherwise, the mark can be retrieved by name using get_mark(). If a mark has left gravity, and text is inserted at the mark’s current location, the mark will be moved to the left of the newly-inserted text. If left_gravity is omitted, it defaults to False.

To specify that some text in the buffer should have specific formatting, you must define a tag to hold that formatting information, and then apply that tag to the region of text using create_tag("tag name", property) and apply_tag(tag, start_iter, end_iter) as in, for instance:
tag = textbuffer.create_tag("orange_bg", background="orange")
textbuffer.apply_tag(tag, start_iter, end_iter)

The following are some of the common styles applied to text:

Background colour ("background" property)

Foreground colour ("foreground" property)

Underline ("underline" property)

Bold ("weight" property)

Italics ("style" property)

Strikethrough ("strikethrough" property)

Justification ("justification" property)

Size ("size" and "size-points" properties)

Text wrapping ("wrap-mode" property)
You can also delete particular tags later using remove_tag() or delete all tags in a given region by calling remove_all_tags().

Methods for a TextIter widget

forward_search(needle, flags, limit) searches forward for needle. The search will not continue past the Gtk.TextIter limit. The flags can be set to one of the following, or any combination of it by concatenating them with the bitwise-OR operator |: 0 (the match must be exact); Gtk.TextSearchFlags.VISIBLE_ONLY (the match may have invisible text interspersed in needle); Gtk.TextSearchFlags.TEXT_ONLY (the match may have pixbufs or child widgets mixed inside the matched range); Gtk.TextSearchFlags.CASE_INSENSITIVE (the text will be matched regardless of what case it is in). The method returns a tuple containing a Gtk.TextIter pointing to the start and to the first character after the match; if no match is found, None is returned.


backward_search(needle, flags, limit) does the same as forward_search(), but moving backwards.
"""
