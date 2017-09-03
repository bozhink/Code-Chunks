package diydi.db;

import diydi.models.Record;

import java.util.List;

/**
 * Created by bozhin on 4/14/17.
 */
public interface DB extends AutoCloseable {
    List<Record> fetchRecords(String filterText);
}
