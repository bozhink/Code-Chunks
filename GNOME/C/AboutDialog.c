#include <gtk/gtk.h>

static void
on_close (GtkDialog *dialog, gint response_id, gpointer user_data) {
    /* This will cause the dialog to be destroyed */
    gtk_widget_destroy (GTK_WIDGET (dialog));
}

static void
about_cb (GSimpleAction *simple, GVariant *parameter, gpointer user_data) {
    GtkWidget *about_dialog;
    
    about_dialog = gtk_about_dialog_new ();
    
    const gchar *authors[] = {"GNOME Documentation Team", NULL};
    const gchar *documenters[] = {"GNOME Documentation Team", NULL};
    
    gtk_about_dialog_set_program_name (GTK_ABOUT_DIALOG (about_dialog),
        "AboutDialog Example");
    gtk_about_dialog_set_copyright (GTK_ABOUT_DIALOG (about_dialog),
        "Copyright \xc2\xa9 2012 GNOME Documentation Team");
    gtk_about_dialog_set_authors (GTK_ABOUT_DIALOG (about_dialog),
        authors);
    gtk_about_dialog_set_documenters (GTK_ABOUT_DIALOG (about_dialog),
        documenters);
    gtk_about_dialog_set_website_label (GTK_ABOUT_DIALOG (about_dialog),
        "GNOME Developer Website");
    gtk_about_dialog_set_website (GTK_ABOUT_DIALOG (about_dialog),
        "http://developer.gnome.org");
    
    gtk_window_set_title (GTK_WINDOW (about_dialog), "");
    
    g_signal_connect (GTK_DIALOG (about_dialog), "response",
        G_CALLBACK (on_close), NULL);
    
    gtk_widget_show (about_dialog);
}

static void
activate (GtkApplication *app, gpointer user_data) {
    GtkWidget *window;
    
    GSimpleAction *about_action;
    
    window = gtk_application_window_new (app);
    gtk_window_set_title (GTK_WINDOW (window),
        "AboutDialog Example");
    gtk_window_set_default_size (GTK_WINDOW (window), 200, 200);
    
    about_action = g_simple_action_new ("about", NULL);
    
    g_signal_connect (about_action, "activate",
        G_CALLBACK (about_cb), GTK_WINDOW (window));
    
    g_action_map_add_action (G_ACTION_MAP (window),
        G_ACTION (about_action));
    
    gtk_widget_show_all (window);
}

static void
quit_cb (GSimpleAction *simple, GVariant *parameter, gpointer user_data) {
    GApplication *application = user_data;
    g_application_quit (application);
}

static void
startup (GApplication *app, gpointer user_data) {
    GMenu *menu;
    GSimpleAction *quit_action;
    menu = g_menu_new ();
    g_menu_append (menu, "About", "win.about");
    g_menu_append (menu, "Quit", "app.quit");
    quit_action = g_simple_action_new ("quit", NULL);
    gtk_application_set_app_menu (GTK_APPLICATION (app),
        G_MENU_MODEL (menu));
    g_signal_connect (quit_action, "activate",
        G_CALLBACK (quit_cb), app);
    g_action_map_add_action (G_ACTION_MAP (app),
        G_ACTION (quit_action));
}

int main (int argc, char**argv) {
    GtkApplication*app;
    int status;
    
    app = gtk_application_new ("org.gtk.example", G_APPLICATION_FLAGS_NONE);
    g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
    g_signal_connect (app, "startup", G_CALLBACK (startup), NULL);
    status = g_application_run (G_APPLICATION (app), argc, argv);
    g_object_unref (app);
    return status;
}



