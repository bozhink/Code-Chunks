package diydi.services;

import diydi.db.DB;
import diydi.models.Record;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * Created by bozhin on 4/14/17.
 */
public class InMemoryDataServiceImplementation implements InMemoryDataService {

    private final ConcurrentMap<Integer, Record> cachedData;
    private final DB db;

    public InMemoryDataServiceImplementation(DB db) {
        if (db == null) {
            throw new IllegalArgumentException("db");
        }

        this.db = db;
        this.cachedData = new ConcurrentHashMap<>();
    }

    @Override
    public Record getRecord(int recordID) {
        return this.cachedData.get(recordID);
    }
}
