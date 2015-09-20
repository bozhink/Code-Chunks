#include <gtk/gtk.h>

static void button_toggled_cb (GtkWidget *button, gpointer user_data) {
    char *b_state;
    const char *button_label;
    
    if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (button)))
        b_state = "on";
    else {
        b_state = "off";
        g_print ("\n");
    }
    
    button_label = gtk_button_get_label (GTK_BUTTON (button));
    
    g_print ("%s was turned %s\n", button_label, b_state);
}

static void activate (GtkApplication *app, gpointer user_data) {
    GtkWidget *window, *grid;
    GtkWidget *button1, *button2, *button3;
    
    window = gtk_application_window_new (app);
    gtk_window_set_title (GTK_WINDOW (window), "RadioButton Example");
    gtk_window_set_default_size (GTK_WINDOW (window), 250, 100);
    gtk_container_set_border_width (GTK_CONTAINER (window), 20);
    
    button1 = gtk_radio_button_new_with_label (NULL, "Button 1");
    /* Create a second radion button, and add it to the same gropu as Button 1*/
    button2 = gtk_radio_button_new_with_label_from_widget (
        GTK_RADIO_BUTTON (button1), "Button 2");
    button3 = gtk_radio_button_new_with_label_from_widget (
        GTK_RADIO_BUTTON (button1), "Button 3");
    
    grid = gtk_grid_new ();
    gtk_grid_attach (GTK_GRID (grid), button1, 0, 0, 1, 1);
    gtk_grid_attach (GTK_GRID (grid), button2, 0, 1, 1, 1);
    gtk_grid_attach (GTK_GRID (grid), button3, 0, 2, 1, 1);
    
    g_signal_connect (GTK_TOGGLE_BUTTON (button1), "toggled",
        G_CALLBACK (button_toggled_cb), window);
    g_signal_connect (GTK_TOGGLE_BUTTON (button2), "toggled",
        G_CALLBACK (button_toggled_cb), window);
    g_signal_connect (GTK_TOGGLE_BUTTON (button3), "toggled",
        G_CALLBACK (button_toggled_cb), window);
    
    gtk_container_add (GTK_CONTAINER (window), GTK_WIDGET (grid));
    
    gtk_widget_show_all (window);
}

int main (int argc, char**argv) {
    GtkApplication *app;
    int status;
    app = gtk_application_new ("org.gtk.exmple", G_APPLICATION_FLAGS_NONE);
    g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
    status = g_application_run (G_APPLICATION (app), argc, argv);
    g_object_unref (app);
    return status;
}


