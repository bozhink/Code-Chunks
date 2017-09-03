package diydi.services;

import diydi.db.DB;
import diydi.models.Customer;
import diydi.models.Record;

/**
 * Created by bozhin on 4/14/17.
 */
public class AlertServiceImplementation implements AlertService {

    private final DB db;
    private final InMemoryDataService inMemoryDataService;

    public AlertServiceImplementation(DB db, InMemoryDataService inMemoryDataService) {
        if (db == null) {
            throw new IllegalArgumentException("db");
        }

        if (inMemoryDataService == null) {
            throw new IllegalArgumentException("inMemoryDataService");
        }

        this.db = db;
        this.inMemoryDataService = inMemoryDataService;
    }

    @Override
    public void sendAlert(int customerID, int recordID) {
        Record record = this.inMemoryDataService.getRecord(recordID);
        Customer customer = this.getCustomer(customerID);
        this.sendAlert(customer, record);
    }

    private Customer getCustomer(int customerID) {
        return null;
    }

    private  void sendAlert(Customer customer, Record record) {

    }
}
