/**
 * 
 */
package diydi.db;

import java.util.ArrayList;
import java.util.List;

import diydi.models.Record;

/**
 * @author bozhin
 *
 */
public class DBImpl implements DB {
	
	private final String connectionString;
	
	public DBImpl(String connectionString) {
		this.connectionString = connectionString;
	}

	@Override
	public void close() throws Exception {
		
	}

	@Override
	public List<Record> fetchRecords(String parameter) {
		// TODO Auto-generated method stub
		return new ArrayList<>();
	}

}
