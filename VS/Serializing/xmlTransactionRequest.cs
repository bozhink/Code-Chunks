using System;                           //Default
using System.Collections.Generic;       //List
using System.Xml.Serialization;         //XmlArray, XmlArrayItem
using System.Diagnostics;               //DebuggerStepThroughAttribute

public enum FirstNodeType
{
    Unknown = 0,
    Other = 1,
};

//[Serializable]
[XmlRoot("TheRequest", IsNullable = false, Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
public class TheRequest : BaseRequest   //inherit BaseRequest
{
    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public subFirstNode FirstNode;

    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public subSecondNode SecondNode;

    //array of nodes in a root node
    [XmlArray("ArrayExampleNodes")]
    [XmlArrayItem("ArrayNode")]
    public List<subArrayExampleNodes> ArrayNode;

    //array of nodes without a root node
    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public List<subSameElement> ThirdRepeatedNode;

    public TheRequest()
    {
        //init vars

        //I've commented "FirstNode" out, to show in the form code, I can init 
        //it there or leave it NULL.  If I leave it NULL, it will not show up 
        //in the XML at all.  All depends on how you want your XML to show no data 
        //exists.  Missing completely or tag with no data in it.  I like all my tags
        //there, with no data, so I do a new on all sub classes and clear strings so
        //they are not null.

        //FirstNode = new subFirstNode();       
        SecondNode = new subSecondNode();
        ThirdRepeatedNode = new List<subSameElement>();
        ArrayNode = new List<subArrayExampleNodes>();
    }
}

public class subSameElement
{
    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public String FieldOne;

    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public Int64 FieldTwo;
}

public class subFirstNode
{
    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public FirstNodeType Type;

    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public Int64 TicketNumber;

    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public Int64 ID;

    public subFirstNode()
    {
        //init vars
        Type = FirstNodeType.Unknown;
    }
}

public class subSecondNode
{
    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public Int64 TestOne;

    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public Int64 TestTwo;

    [XmlElement(Namespace = "http://www.chizl.com/schemas/v1.1.1/")]
    public Int64 TestThree;

    [XmlElement(Namespace="http://www.chizl.com/schemas/v1.1.1/")]
    public Int64 TestFour;

    public subSecondNode()
    {
        //init vars
    }
}

public class subArrayExampleNodes
{
    //C#     - Form = System.Xml.Schema.XmlSchemaForm.Qualified - Allows the Namespace prefix to show up 
    //                                                            in your XML for the set attribute.
    //VB.NET - Form:=Xml.Schema.XmlSchemaForm.Qualified
    [XmlAttribute(Namespace = "http://www.chizl.com/schemas/v1.1.1/", Form = System.Xml.Schema.XmlSchemaForm.Qualified)]
    public Int64 ID;

    [XmlAttribute(Namespace = "http://www.chizl.com/schemas/v1.1.1/", Form = System.Xml.Schema.XmlSchemaForm.Qualified)]
    public String FieldOne;

    [XmlAttribute(Namespace = "http://www.chizl.com/schemas/v1.1.1/", Form = System.Xml.Schema.XmlSchemaForm.Qualified)]
    public Int64 FieldTwo;
}