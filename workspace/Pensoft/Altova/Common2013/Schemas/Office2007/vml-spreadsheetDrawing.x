﻿<?xml version="1.0" encoding="utf-8"?>
<xsd:schema targetNamespace="urn:schemas-microsoft-com:office:excel" xmlns="urn:schemas-microsoft-com:office:excel" xmlns:xsd="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified" attributeFormDefault="unqualified">
  <xsd:element name="ClientData" type="CT_ClientData">
    <xsd:annotation>
      <xsd:documentation>Attached Object Data</xsd:documentation>
    </xsd:annotation>
  </xsd:element>
  <xsd:complexType name="CT_ClientData">
    <xsd:choice minOccurs="0" maxOccurs="unbounded">
      <xsd:element name="MoveWithCells" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Move with Cells</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="SizeWithCells" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Resize with Cells</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Anchor" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Anchor</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Locked" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Lock Toggle</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="DefaultSize" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Default Size Toggle</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="PrintObject" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Print Toggle</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Disabled" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Macro Disable Toggle</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="AutoFill" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>AutoFill</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="AutoLine" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>AutoLine</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="AutoPict" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Automatically Size</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="FmlaMacro" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Reference to Custom Function</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="TextHAlign" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Horizontal Text Alignment</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="TextVAlign" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Vertical Text Alignment</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="LockText" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Text Lock</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="JustLastX" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Far East Alignment Toggle</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="SecretEdit" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Password Edit</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Default" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Default Button</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Help" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Help Button</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Cancel" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Cancel Button</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Dismiss" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Dismiss Button</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Accel" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Primary Keyboard Accelerator</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Accel2" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Secondary Keyboard Accelerator</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Row" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Comment Row Target</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Column" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Comment Column Target</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Visible" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Comment Visibility Toggle</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="RowHidden" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Comment's Row is Hidden</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="ColHidden" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Comment's Column is Hidden</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="VTEdit" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Validation Type</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="MultiLine" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Multi-line</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="VScroll" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Vertical Scroll</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="ValidIds" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Valid ID</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="FmlaRange" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>List Items Source Range</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="WidthMin" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Minimum Width</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Sel" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Selected Entry</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="NoThreeD2" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Disable 3D</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="SelType" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Selection Type</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="MultiSel" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Multiple Selections</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="LCT" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Callback Type</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="ListItem" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Non-linked List Item</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="DropStyle" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Dropdown Style</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Colored" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Dropdown Color Toggle</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="DropLines" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Dropdown Maximum Lines</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Checked" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Checked</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="FmlaLink" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Linked Formula</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="FmlaPict" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Camera Source Range</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="NoThreeD" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Disable 3D</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="FirstButton" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>First Radio Button</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="FmlaGroup" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Linked Formula - Group Box</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Val" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Scroll bar position</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Min" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Scroll Bar Minimum</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Max" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Scroll Bar Maximum</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Inc" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Scroll Bar Increment</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Page" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Scroll Bar Page Increment</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Horiz" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Scroll Bar Orientation</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Dx" type="xsd:integer">
        <xsd:annotation>
          <xsd:documentation>Scroll Bar Width</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="MapOCX" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>ActiveX Control</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="CF" type="ST_CF">
        <xsd:annotation>
          <xsd:documentation>Clipboard Format</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Camera" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Camera Tool</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="RecalcAlways" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Recalculation Toggle</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="AutoScale" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Font AutoScale</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="DDE" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>Dynamic Data Exchange</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="UIObj" type="ST_TrueFalseBlank">
        <xsd:annotation>
          <xsd:documentation>UI Object Toggle</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="ScriptText" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>HTML Script Text</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="ScriptExtended" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>HTML Script Attributes</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="ScriptLanguage" type="xsd:nonNegativeInteger">
        <xsd:annotation>
          <xsd:documentation>HTML Script Language</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="ScriptLocation" type="xsd:nonNegativeInteger">
        <xsd:annotation>
          <xsd:documentation>HTML Script Location</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="FmlaTxbx" type="xsd:string">
        <xsd:annotation>
          <xsd:documentation>Text Formula</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:choice>
    <xsd:attribute name="ObjectType" type="ST_ObjectType" use="required">
      <xsd:annotation>
        <xsd:documentation>Object type</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
  </xsd:complexType>
  <xsd:simpleType name="ST_CF">
    <xsd:annotation>
      <xsd:documentation>Clipboard Format Type</xsd:documentation>
    </xsd:annotation>
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="PictOld">
        <xsd:annotation>
          <xsd:documentation>WMF</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Pict">
        <xsd:annotation>
          <xsd:documentation>EMF</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Bitmap">
        <xsd:annotation>
          <xsd:documentation>Bitmap</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="PictPrint">
        <xsd:annotation>
          <xsd:documentation>Printer Picture</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="PictScreen">
        <xsd:annotation>
          <xsd:documentation>Screen Picture EMF</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="ST_ObjectType">
    <xsd:annotation>
      <xsd:documentation>Object Type</xsd:documentation>
    </xsd:annotation>
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="Button">
        <xsd:annotation>
          <xsd:documentation>Pushbutton</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Checkbox">
        <xsd:annotation>
          <xsd:documentation>Checkbox</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Dialog">
        <xsd:annotation>
          <xsd:documentation>Dialog</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Drop">
        <xsd:annotation>
          <xsd:documentation>Dropdown Box</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Edit">
        <xsd:annotation>
          <xsd:documentation>Editable Text Field</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="GBox">
        <xsd:annotation>
          <xsd:documentation>Group Box</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Label">
        <xsd:annotation>
          <xsd:documentation>Label</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="LineA">
        <xsd:annotation>
          <xsd:documentation>Auditing Line</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="List">
        <xsd:annotation>
          <xsd:documentation>List Box</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Movie">
        <xsd:annotation>
          <xsd:documentation>Movie</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Note">
        <xsd:annotation>
          <xsd:documentation>Comment</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Pict">
        <xsd:annotation>
          <xsd:documentation>Image</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Radio">
        <xsd:annotation>
          <xsd:documentation>Radio Button</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="RectA">
        <xsd:annotation>
          <xsd:documentation>Auditing Rectangle</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Scroll">
        <xsd:annotation>
          <xsd:documentation>Scroll Bar</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Spin">
        <xsd:annotation>
          <xsd:documentation>Spin Button</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Shape">
        <xsd:annotation>
          <xsd:documentation>Plain Shape</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Group">
        <xsd:annotation>
          <xsd:documentation>Group</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="Rect">
        <xsd:annotation>
          <xsd:documentation>Plain Rectangle</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="ST_TrueFalseBlank">
    <xsd:annotation>
      <xsd:documentation>Boolean Value with Blank State</xsd:documentation>
    </xsd:annotation>
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="True">
        <xsd:annotation>
          <xsd:documentation>Logical True</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="t">
        <xsd:annotation>
          <xsd:documentation>Logical True</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="False">
        <xsd:annotation>
          <xsd:documentation>Logical False</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="f">
        <xsd:annotation>
          <xsd:documentation>Logical False</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
      <xsd:enumeration value="">
        <xsd:annotation>
          <xsd:documentation>Blank - Default Value</xsd:documentation>
        </xsd:annotation>
      </xsd:enumeration>
    </xsd:restriction>
  </xsd:simpleType>
</xsd:schema>