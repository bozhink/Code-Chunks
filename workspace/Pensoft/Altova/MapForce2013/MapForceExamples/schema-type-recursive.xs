<?xml version="1.0" encoding="utf-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:complexType name="recursiveType">
    <xs:sequence>
      <xs:element name="type" type="recursiveType" minOccurs="0" maxOccurs="unbounded"/>        
    </xs:sequence>
    <xs:attribute name="name" type="xs:token"/>
  </xs:complexType>
  <xs:element name="type" type="recursiveType"/>
</xs:schema>
