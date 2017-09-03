package diydi.services;

import diydi.db.DB;
import diydi.models.Record;

import java.util.List;

/**
 * Created by bozhin on 4/14/17.
 */
public class ReportServiceImplementation implements ReportService {

    private final DB db;

    public ReportServiceImplementation(DB db) {
        if (db == null) {
            throw new IllegalArgumentException("db");
        }

        this.db = db;
    }

    @Override
    public void generateReport(String fileName, String filterText) {
        List<Record> records = this.db.fetchRecords(filterText);
    }
}
