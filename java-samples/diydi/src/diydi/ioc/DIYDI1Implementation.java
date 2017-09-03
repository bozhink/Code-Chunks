package diydi.ioc;

import diydi.db.DB;
import diydi.db.DBImplementation;
import diydi.services.ReportService;
import diydi.services.ReportServiceImplementation;
import diydi.settings.Configuration;

/**
 * Created by bozhin on 4/14/17.
 */
public class DIYDI1Implementation implements DIYDI1 {

    private static DIYDI1 instance = new DIYDI1Implementation();

    public DIYDI1 getInstance() {
        return instance;
    }

    @Override
    public DB getDB() {
        return new DBImplementation(new Configuration() {
            @Override
            public String getConnectionString() {
                return "my-connection-string";
            }
        });
    }

    @Override
    public ReportService getReportService() {
        return new ReportServiceImplementation(this.getDB());
    }
}
