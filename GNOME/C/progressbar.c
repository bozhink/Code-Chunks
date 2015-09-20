#include <gtk/gtk.h>

static gboolean fill (gpointer user_data) {
    GtkWidget *progress_bar = user_data;
    gdouble fraction;

    fraction = gtk_progress_bar_get_fraction (GTK_PROGRESS_BAR (progress_bar));
    fraction += 0.1;
    
    gtk_progress_bar_set_fraction (GTK_PROGRESS_BAR (progress_bar), fraction);
    
    if (fraction < 1.0) return TRUE;
    return FALSE;
}

static void activate (GtkApplication *app, gpointer user_app) {
    GtkWidget *window;
    GtkWidget *progress_bar;
    gdouble fraction = 0.0;
    
    window = gtk_application_window_new (app);
    gtk_window_set_title (GTK_WINDOW (window), "ProgressBar Example");
    gtk_window_set_default_size (GTK_WINDOW (window), 220, 20);
    
    progress_bar = gtk_progress_bar_new ();
    gtk_container_add (GTK_CONTAINER (window), progress_bar);

    gtk_progress_bar_set_fraction (GTK_PROGRESS_BAR (progress_bar), fraction);
    g_timeout_add (500, fill, GTK_PROGRESS_BAR (progress_bar));

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


