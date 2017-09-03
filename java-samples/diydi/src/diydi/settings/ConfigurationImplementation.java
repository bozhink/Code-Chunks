package diydi.settings;

/**
 * Created by bozhin on 4/14/17.
 */
public class ConfigurationImplementation implements Configuration {

    private String connectionString = "";

    public ConfigurationImplementation(Object externalArgs) {

    }

    @Override
    public String getConnectionString() {
        return this.connectionString;
    }
}
