package diydi.db;

import diydi.models.Record;
import diydi.settings.Configuration;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by bozhin on 4/14/17.
 */
public class DBImplementation implements DB {

    private final String connectionString;

    public DBImplementation(Configuration configuration) {
        if (configuration == null) {
            throw new IllegalArgumentException("configuration");
        }

        this.connectionString = configuration.getConnectionString();
    }


    @Override
    public List<Record> fetchRecords(String filterText) {
        return new ArrayList<>();
    }

    @Override
    public void close() throws Exception {

    }
}
