import gtk.MainWindow;
import gtk.Label;
import gtk.Main;

void main(string[] args)
{
    Main.init(args);
    MainWindow win = new MainWindow("Hello world!");
    win.setDefaultSize(250,150);
    win.add(new Label("Hello World!"));
    win.showAll();
    
    Main.run();
}