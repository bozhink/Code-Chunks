/**
 * 
 */
package diydi.db;

import java.util.List;

import diydi.models.Record;

/**
 * @author bozhin
 *
 */
public interface DB extends AutoCloseable {
	public List<Record> fetchRecords(String parameter);
}
