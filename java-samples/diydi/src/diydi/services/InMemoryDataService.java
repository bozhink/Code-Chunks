package diydi.services;

import diydi.models.Record;

/**
 * Created by bozhin on 4/14/17.
 */
public interface InMemoryDataService {
    Record getRecord(int recordID);
}
