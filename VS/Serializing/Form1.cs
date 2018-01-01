using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Globalization;

using System.Xml.Serialization;         //XmlArray, XmlArrayItem

namespace Serializing
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnSerialize_Click(object sender, EventArgs e)
        {
            TheRequest clsRequest = new TheRequest();

            //BaseRequest Data..
            clsRequest.BaseSoftware.Version = "5.0";
            clsRequest.BaseSoftware.Checksum = "0123456789ABCDEF0123456789ABCDEF";
            clsRequest.BaseOtherInfo.FirstName = "John";
            clsRequest.BaseOtherInfo.LastName = "Smith";

            //Transaction Info
            //*
            clsRequest.FirstNode = new subFirstNode();
            clsRequest.FirstNode.Type = FirstNodeType.Other;
            clsRequest.FirstNode.TicketNumber = 123456789012345678;
            clsRequest.FirstNode.ID = 1;
            /**/

            //Terminal Data
            clsRequest.SecondNode.TestOne = 300;
            clsRequest.SecondNode.TestTwo = 500;
            clsRequest.SecondNode.TestThree = 700;
            clsRequest.SecondNode.TestFour = 1100;

            //generates a subnode then repeats a node within it
            subArrayExampleNodes arr = new subArrayExampleNodes();
            arr.ID = 1;
            arr.FieldOne = "john";
            arr.FieldTwo = 40;
            clsRequest.ArrayNode.Add(arr);

            arr = new subArrayExampleNodes();
            arr.ID = 2;
            arr.FieldOne = "doe";
            arr.FieldTwo = 45;
            clsRequest.ArrayNode.Add(arr);

            arr = new subArrayExampleNodes();
            arr.ID = 3;
            arr.FieldOne = "smith";
            arr.FieldTwo = 50;
            clsRequest.ArrayNode.Add(arr);

            //repeates same node more than once, without a subnode
            subSameElement same = new subSameElement();
            same.FieldOne = "Bob";
            same.FieldTwo = 22;
            clsRequest.ThirdRepeatedNode.Add(same);

            same = new subSameElement();
            same.FieldOne = "Todd";
            same.FieldTwo = 25;
            clsRequest.ThirdRepeatedNode.Add(same);

            //convert object to XML
            clsRequest.RawXML = CCommon.SerializeObject(clsRequest, typeof(TheRequest));
            //write to text
            this.textBox1.Text = clsRequest.RawXML;
        }

        private void btnDeserialize_Click(object sender, EventArgs e)
        {
            TheRequest clsResult = new TheRequest();

            if (String.IsNullOrEmpty(this.textBox1.Text))
                btnSerialize_Click(sender, e);

            //convert XML to SOAP Object
            clsResult = (TheRequest)CCommon.DeserializeXML(this.textBox1.Text.ToString(), typeof(TheRequest));

            if(clsResult!=null)
                MessageBox.Show("View debug to see rest of object properties.");
            else
                MessageBox.Show("Not a valid XML format.");
        }
    }
}
