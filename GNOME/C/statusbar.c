#include <gtk/gtk.h>

static void push_item (GtkWidget *widget, gpointer data) {
    GtkWidget *status_bar = data;
    guint context_id = gtk_statusbar_get_context_id (
        GTK_STATUSBAR (status_bar), "Statusbar example");
    static int count = 1;
    char hold_output[20];
    
    g_snprintf (hold_output, 20, "Item %d", count++);
    gtk_statusbar_push (GTK_STATUSBAR (status_bar), context_id, hold_output);
}

static void pop_item (GtkWidget *widget, gpointer data) {
    GtkWidget *status_bar = data;
    guint context_id = gtk_statusbar_get_context_id (
        GTK_STATUSBAR (status_bar), "Statusbar example");
    gtk_statusbar_pop (GTK_STATUSBAR (status_bar), context_id);
}

static void activate (GtkApplication *app, gpointer user_data) {
    GtkWidget *grid;
    GtkWidget *window;
    GtkWidget *status_bar;
    GtkWidget *pop_button;
    GtkWidget *push_button;
    
    window = gtk_application_window_new (app);
    gtk_window_set_default_size (GTK_WINDOW (window), 220, 100);
    gtk_window_set_title (GTK_WINDOW (window), "Statusbar Example");
    gtk_container_set_border_width (GTK_CONTAINER (window), 10);
    
    status_bar = gtk_statusbar_new ();
    
    push_button = gtk_button_new_with_label ("push item");
    pop_button = gtk_button_new_with_label ("pop last item");
    
    grid = gtk_grid_new ();
    gtk_grid_attach (GTK_GRID (grid), push_button, 0, 1, 1, 1);
    gtk_grid_attach (GTK_GRID (grid), pop_button, 0, 2, 1, 1);
    gtk_grid_attach (GTK_GRID (grid), status_bar, 0, 3, 1, 1);
    
    g_signal_connect (GTK_BUTTON (push_button), "clicked",
        G_CALLBACK (push_item), status_bar);
    g_signal_connect (GTK_BUTTON (pop_button), "clicked",
        G_CALLBACK (pop_item), status_bar);
    
    gtk_container_add (GTK_CONTAINER (window), grid);
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

