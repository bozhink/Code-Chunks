package diydi.ioc;

import diydi.db.DB;
import diydi.services.AlertService;
import diydi.services.InMemoryDataService;
import diydi.services.ReportService;
import diydi.settings.Configuration;

/**
 * Created by bozhin on 4/14/17.
 */
public interface DIYDI2 extends AutoCloseable {

    void initSingletons(Object externalArgs);

    Configuration getConfiguration();

    DB getDB();

    ReportService getReportService();

    InMemoryDataService getInMemoryDataService();

    AlertService getAlertService();
}
