public class MyWindow : Gtk.ApplicationWindow {
	internal MyWindow (MyApplication app) {
		Object (application: app, title: "MenuBar Example");
		this.set_default_size (200, 200);
	}
}

class MyApplication : Gtk.Application {
	protected override void activate () {
		new MyWindow(this).show();
	}

	protected override void startup () {
		base.startup ();

		var builder = new Gtk.Builder ();
		try {
			builder.add_from_file ("menubar.ui");
		} catch (Error e) {
			error ("Unable to load file: %s", e.message);
		}
		this.menubar = builder.get_object ("menubar") as MenuModel;
	}
}

public int main (string[] args) {
	return new MyApplication().run(args);
}
