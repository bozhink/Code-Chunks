// access general JAVA-COM bridge classes
import java.util.Iterator;

import com.altova.automation.libs.*;

// access XMLSpy Java-COM bridge
import com.altova.automation.MapForce.*;
import com.altova.automation.MapForce.Enums.ENUMProgrammingLanguage;

/**
 * A simple example that starts XMLSpy COM server and performs a few operations on it.
 * Feel free to extend.
 */
public class RunMapForce 
{
	public static void main(String[] args) 
	{
		// an instance of the application.
		Application mapforce = null;

		// instead of COM error handling use Java exception mechanism.
		try 
		{
			// Start MapForce as COM server.
			mapforce = new Application();
			// COM servers start up invisible so we make it visible
			mapforce.setVisible(true);
			
			// The following lines attach to the application events using a default implementation 
			// for the events and override one of its methods.
			// If you want to override all document events it is better to derive your listener class
			// from DocumentEvents and implement all methods of this interface.
			mapforce.addListener(new ApplicationEventsDefaultHandler()
			{
				@Override
				public void onDocumentOpened(Document i_ipDoc) throws AutomationException
				{
					String name = i_ipDoc.getName();
					
					if (name.length() > 0)
						System.out.println("Document " + name + " was opened.");
					else
						System.out.println("A new mapping was created.");
				}
			});

			// Locate samples installed with the product.
			String strExamplesFolder = System.getenv("USERPROFILE") + "\\My Documents\\Altova\\MapForce2013\\MapForceExamples\\";
			// create a new MapForce mapping and generate c++ code
			Document newDoc = mapforce.newMapping();
			ErrorMarkers err1 = newDoc.generateCodeEx(ENUMProgrammingLanguage.eCpp);
			display(err1);
			// open CompletePO.mfd and generate c++ code
			Document doc = mapforce.openDocument(strExamplesFolder + "CompletePO.mfd");
			ErrorMarkers err2 = doc.generateCodeEx(ENUMProgrammingLanguage.eCpp);
			display(err2);
			
			doc.close();
			doc = null;
				
			System.out.println("Watch MapForce!");
		} 
		catch (AutomationException e) 
		{
			// e.printStackTrace();
		}
		finally
		{
			// Make sure that MapForce can shut down properly.
			if (mapforce != null)
				mapforce.dispose();

			// Since the COM server was made visible and still is visible, it will keep running
			// and needs to be closed manually.
			System.out.println("Now close MapForce!");
		}
	}
	
	public static void display(ErrorMarkers err) throws AutomationException
	{
		Iterator<ErrorMarker> itr = err.iterator();
				
		if (err.getCount() == 0)
			 System.out.print("Code generation completed successfully.\n");
		
		while (itr.hasNext())
		{
			String sError = "";
		    Object element = itr.next();
		    if (element instanceof ErrorMarker)
		    	sError = ((ErrorMarker)element).getText();
		    System.out.print("Error text: " + sError + "\n");
		} 
	}
}