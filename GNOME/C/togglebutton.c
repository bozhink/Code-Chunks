#include <gtk/gtk.h>

static void button_toggled_cb (GtkWidget *button, gpointer user_data) {
    GtkWidget *spinner = user_data;
    
    if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (button)))
        gtk_spinner_start (GTK_SPINNER (spinner));
    else
        gtk_spinner_stop (GTK_SPINNER (spinner));
}

static void activate (GtkApplication *app, gpointer user_data) {
    GtkWidget *window;
    GtkWidget *button;
    GtkWidget *grid;
    GtkWidget *spinner;
    
    window = gtk_application_window_new (app);
    gtk_window_set_title (GTK_WINDOW (window), "ToggleButton Example");
    gtk_window_set_default_size (GTK_WINDOW (window), 300, 300);
    gtk_container_set_border_width (GTK_CONTAINER (window), 30);
    
    button = gtk_toggle_button_new_with_label ("Start/Stop");
    
    spinner = gtk_spinner_new ();
    gtk_widget_set_hexpand (spinner, TRUE);
    gtk_widget_set_vexpand (spinner, TRUE);
    
    grid = gtk_grid_new ();
    gtk_grid_set_row_homogeneous (GTK_GRID (grid), FALSE);
    gtk_grid_set_row_spacing (GTK_GRID (grid), 15);
    gtk_grid_attach (GTK_GRID (grid), spinner, 0, 0, 1, 1);
    gtk_grid_attach (GTK_GRID (grid), button, 0, 1, 1, 1);
    
    gtk_container_add (GTK_CONTAINER (window), grid);
    
    g_signal_connect (GTK_TOGGLE_BUTTON (button), "toggled",
        G_CALLBACK (button_toggled_cb), spinner);
    
    gtk_widget_show_all (window);
}

int main (int argc, char**argv) {
    void *app;
    //GtkApplication *app;
    int status;
    
    app = gtk_application_new ("org.gtk.example", G_APPLICATION_FLAGS_NONE);
    g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
    status = g_application_run (G_APPLICATION (app), argc, argv);
    g_object_unref (app);
    
    return status;
}

