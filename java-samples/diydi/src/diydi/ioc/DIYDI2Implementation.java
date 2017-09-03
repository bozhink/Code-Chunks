package diydi.ioc;

import diydi.db.DB;
import diydi.db.DBImplementation;
import diydi.services.*;
import diydi.settings.Configuration;
import diydi.settings.ConfigurationImplementation;

/**
 * Created by bozhin on 4/14/17.
 */
public class DIYDI2Implementation implements DIYDI2 {

    private static Configuration configuration;
    private static InMemoryDataService inMemoryDataService;
    private DB db;
    private ReportService reportService;
    private AlertService alertService;

    @Override
    public void initSingletons(Object externalArgs) {
        configuration = new ConfigurationImplementation(externalArgs);
        inMemoryDataService = new InMemoryDataServiceImplementation(this.getDB());
    }

    @Override
    public Configuration getConfiguration() {
        return configuration;
    }

    @Override
    public DB getDB() {

        if (this.db == null) {
            this.db = new DBImplementation(this.getConfiguration());
        }

        return this.db;
    }

    @Override
    public ReportService getReportService() {

        if (this.reportService == null) {
            this.reportService = new ReportServiceImplementation(this.getDB());
        }

        return this.reportService;
    }

    @Override
    public InMemoryDataService getInMemoryDataService() {
        return inMemoryDataService;
    }

    @Override
    public AlertService getAlertService() {

        if (this.alertService == null) {
            this.alertService = new AlertServiceImplementation(this.getDB(), this.getInMemoryDataService());
        }

        return this.alertService;
    }

    @Override
    public void close() throws Exception {
        if (this.db != null) {
            try {
                this.db.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
