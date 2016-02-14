package readFilePack;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

public class ReadFileExample {
	public static void readFile(String fileName){
		try {
			// Exceptions could be thrown below
			FileInputStream fis = new FileInputStream(fileName);
			BufferedReader in = new BufferedReader(
					new InputStreamReader(fis));
			String line = null;
			while ((line = in.readLine()) != null){
				System.out.println(line);
			}
			in.close();
			fis.close();
		} catch (FileNotFoundException e) {
			// Exception handler for FileNotFoundException
			// We just inform the client that there is
			// not such file
			System.err.println("The file \"" + fileName
					+"\" does not exist! Unable to read it.");
		} catch (IOException e) {
			// Exception handler for IOException
			e.printStackTrace();
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		readFile("C:\\eclipse\\eclipse.ini");
	}

}
