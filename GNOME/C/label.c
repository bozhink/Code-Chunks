#include <gtk/gtk.h>

static void activate (GtkApplication *app, gpointer user_data) {
    GtkWidget *window;
    GtkWidget *label;
    
    window = gtk_application_window_new (app);
    gtk_window_set_application (GTK_WINDOW (window), GTK_APPLICATION (app));
    gtk_window_set_title (GTK_WINDOW (window), "Welcome to GNOME");
    gtk_window_set_default_size (GTK_WINDOW (window), 200, 100);
    
    /*
     * Create a label and set its alignment. Setting the line wrap to TRUE makes
     * the label break lines if the text exceedes the widget's size. Ehen set to
     * FLASE the text goes cut of by the edge o the widget
     */
    label = gtk_label_new ("Hello GNOME!");
    gtk_label_set_justify (GTK_LABEL (label), GTK_JUSTIFY_CENTER);
    gtk_label_set_line_wrap (GTK_LABEL (label), TRUE);
    
    gtk_container_add (GTK_CONTAINER (window), GTK_WIDGET (label));
    
    gtk_widget_show_all (GTK_WIDGET (window));
}

int main (int argc, char **argv) {
    GtkApplication *app;
    int status;
    
    app = gtk_application_new ("org.gtk.example", G_APPLICATION_FLAGS_NONE);
    g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
    status = g_application_run (G_APPLICATION (app), argc, argv);
    g_object_unref (app);
    
    return status;
}

