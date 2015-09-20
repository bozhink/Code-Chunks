#include <gtk/gtk.h>

static void activate_cb (GObject *switcher, GParamSpec *pspec, gpointer user_data) {
    GtkWindow *window = user_data;
    
    if (gtk_switch_get_active (GTK_SWITCH (switcher)))
        gtk_window_set_title (GTK_WINDOW (window), "Switch Example");
    else
        gtk_window_set_title (GTK_WINDOW (window), "");
}

static void activate (GtkApplication *app, gpointer user_data) {
    GtkWidget *grid;
    GtkWidget *window;
    GtkWidget *label;
    GtkWidget *switcher;
    
    window = gtk_application_window_new (app);
    gtk_window_set_title (GTK_WINDOW (window), "Switch Example");
    gtk_window_set_default_size (GTK_WINDOW (window), 300, 100);
    gtk_container_set_border_width (GTK_CONTAINER (window), 10);
    
    label = gtk_label_new ("Title");
    
    switcher = gtk_switch_new ();
    gtk_switch_set_active (GTK_SWITCH (switcher), TRUE);
    
    grid = gtk_grid_new ();
    gtk_grid_set_column_spacing (GTK_GRID (grid), 10);
    gtk_grid_attach (GTK_GRID (grid), label, 0, 0, 1, 1);
    gtk_grid_attach (GTK_GRID (grid), switcher, 1, 0, 1, 1);
    
    g_signal_connect (GTK_SWITCH (switcher), "notify::active",
        G_CALLBACK (activate_cb), window);
    
    gtk_container_add (GTK_CONTAINER (window), GTK_WIDGET (grid));
    
    gtk_widget_show_all (window);
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

