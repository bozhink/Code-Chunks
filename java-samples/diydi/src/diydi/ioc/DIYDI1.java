package diydi.ioc;

import diydi.db.DB;
import diydi.services.ReportService;

/**
 * Created by bozhin on 4/14/17.
 */
public interface DIYDI1 {

    DB getDB() throws Exception;

    ReportService getReportService() throws Exception;

}
