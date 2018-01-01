using System;                           //Default
using System.Collections.Generic;       //List
using System.Xml.Serialization;         //XmlArray, XmlArrayItem
using System.Diagnostics;               //DebuggerStepThroughAttribute

//[Serializable]
[XmlRoot("BaseRequest", IsNullable = false)]
public class BaseRequest
{
    [XmlIgnore()]           //Can be used in object, but will not show up or be expected in the XML
    public String RawXML;

    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public subBaseSoftware BaseSoftware;

    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public subBaseOtherInfo BaseOtherInfo;

    public BaseRequest()
    {
        BaseSoftware = new subBaseSoftware();
        BaseOtherInfo = new subBaseOtherInfo();
    }
}

public class subBaseSoftware
{
    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public String Version;

    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public String Checksum;

    public subBaseSoftware()
    {
        //init vars
        Version = "";
        Checksum = "";
    }
}

public class subBaseOtherInfo
{
    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public String FirstName;

    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public String LastName;

    public subBaseOtherInfo()
    {
        //init vars
        LastName = "";
    }
}