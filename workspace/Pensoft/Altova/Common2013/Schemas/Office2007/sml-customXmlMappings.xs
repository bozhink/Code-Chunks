﻿<?xml version="1.0" encoding="utf-8"?>
<xsd:schema targetNamespace="http://schemas.openxmlformats.org/spreadsheetml/2006/main" elementFormDefault="qualified" xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <xsd:element name="MapInfo" type="CT_MapInfo">
    <xsd:annotation>
      <xsd:documentation>XML Mapping</xsd:documentation>
    </xsd:annotation>
  </xsd:element>
  <xsd:complexType name="CT_MapInfo">
    <xsd:sequence>
      <xsd:element name="Schema" type="CT_Schema" minOccurs="1" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>XML Schema</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="Map" type="CT_Map" minOccurs="1" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>XML Mapping Properties</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="SelectionNamespaces" type="xsd:string" use="required">
      <xsd:annotation>
        <xsd:documentation>Prefix Mappings for XPath Expressions</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
  </xsd:complexType>
  <xsd:complexType name="CT_Schema">
    <xsd:sequence>
      <xsd:any></xsd:any>
    </xsd:sequence>
    <xsd:attribute name="ID" type="xsd:string" use="required">
      <xsd:annotation>
        <xsd:documentation>Schema ID</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="SchemaRef" type="xsd:string" use="optional">
      <xsd:annotation>
        <xsd:documentation>Schema Reference</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="Namespace" type="xsd:string" use="optional">
      <xsd:annotation>
        <xsd:documentation>Schema Root Namespace</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
  </xsd:complexType>
  <xsd:complexType name="CT_Map">
    <xsd:sequence>
      <xsd:element name="DataBinding" type="CT_DataBinding" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>XML Mapping</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="ID" type="xsd:unsignedInt" use="required">
      <xsd:annotation>
        <xsd:documentation>XML Mapping ID</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="Name" type="xsd:string" use="required">
      <xsd:annotation>
        <xsd:documentation>XML Mapping Name</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="RootElement" type="xsd:string" use="required">
      <xsd:annotation>
        <xsd:documentation>Root Element Name</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="SchemaID" type="xsd:string" use="required">
      <xsd:annotation>
        <xsd:documentation>Schema Name</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="ShowImportExportValidationErrors" type="xsd:boolean" use="required">
      <xsd:annotation>
        <xsd:documentation>Show Validation Errors</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="AutoFit" type="xsd:boolean" use="required">
      <xsd:annotation>
        <xsd:documentation>AutoFit Table on Refresh</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="Append" type="xsd:boolean" use="required">
      <xsd:annotation>
        <xsd:documentation>Append Data to Table</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="PreserveSortAFLayout" type="xsd:boolean" use="required">
      <xsd:annotation>
        <xsd:documentation>Preserve AutoFilter State</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="PreserveFormat" type="xsd:boolean" use="required">
      <xsd:annotation>
        <xsd:documentation>Preserve Cell Formatting</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
  </xsd:complexType>
  <xsd:complexType name="CT_DataBinding">
    <xsd:sequence>
      <xsd:any></xsd:any>
    </xsd:sequence>
    <xsd:attribute name="DataBindingName" type="xsd:string" use="optional">
      <xsd:annotation>
        <xsd:documentation>Unique Identifer</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="FileBinding" type="xsd:boolean" use="optional">
      <xsd:annotation>
        <xsd:documentation>Binding to External File</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="ConnectionID" type="xsd:unsignedInt" use="optional">
      <xsd:annotation>
        <xsd:documentation>Reference to Connection ID</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="FileBindingName" type="xsd:string" use="optional">
      <xsd:annotation>
        <xsd:documentation>File Binding Name</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
    <xsd:attribute name="DataBindingLoadMode" type="xsd:unsignedInt" use="required">
      <xsd:annotation>
        <xsd:documentation>XML Data Loading Behavior</xsd:documentation>
      </xsd:annotation>
    </xsd:attribute>
  </xsd:complexType>
</xsd:schema>