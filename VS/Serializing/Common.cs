using System;                       //Exception
using System.Text;                  //StringBuilder
using System.Xml;                   //XmlDocument, XmlNodeList, XmlElement, XmlNode
using System.Xml.Serialization;     //XmlArray, XmlArrayItem, XmlSerializerNamespaces
using System.IO;                    //Directory, File, StringWriter
using System.Windows.Forms;         //MessageBox

class CCommon
{
    static public String SerializeObject(object oRequest, Type tRequest)
    /****************************
    **	SerializeObject() function - Method used to convert SOAP Objects into XML
    **	Parms: 
    **	    oRequest            - Soap Object
    **      tRequest            - Soap Object type
    **	Return:
    **		String
    ****************************/
    {
        StringBuilder sb = new StringBuilder();

        //remove namespace
        XmlSerializerNamespaces xmlns = new XmlSerializerNamespaces();
        StringWriter myStream = null;
        try
        {
            xmlns.Add("gwl", "http://www.chizl.com/schemas/v1.1.1/");
            //eo remove namespace

            myStream = new StringWriter(sb);
            XmlSerializer xmlSerial = new XmlSerializer(tRequest);
            xmlSerial.Serialize(myStream, oRequest, xmlns);

        }
        catch (Exception ex)
        {
            String strMsg = String.Format("Failed to Serialize Object to XML: {0}", ex.Message);
            MessageBox.Show(strMsg);

            if (myStream != null)
                myStream.Close();
        }

        return sb.ToString();
    }

    static public object DeserializeXML(String strXML, Type tRequest)
    /****************************
    **	DeserializeXML() function - Method used to convert XML into SOAP Objects
    **	Parms: 
    **	    strXML            - XML Data
    **      tRequest            - Soap Object type
    **	Return:
    **		Object
    ****************************/
    {
        StringReader myStream = null;
        object oRetVal = null;

        try
        {
            // To read the file, create a FileStream.
            myStream = new StringReader(strXML);
            // Call the Deserialize method and cast to the object type.
            XmlSerializer mySerializer = new XmlSerializer(tRequest);
            oRetVal = mySerializer.Deserialize(myStream);
        }
        catch (Exception ex)
        {
            String strMsg = String.Format("Failed to Deserialize XML data: {0}", ex.Message);
            MessageBox.Show(strMsg);
        }

        if (myStream != null)
            myStream.Close();

        return oRetVal;
    }
}
