<?xml version="1.0" encoding="UTF-8"?>
<!-- Role schema for net label -->
<xsd:schema targetNamespace="http://www.xbrl.org/2009/role/net" attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:net="http://www.xbrl.org/2009/role/net" xmlns:link="http://www.xbrl.org/2003/linkbase" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xbrli="http://www.xbrl.org/2003/instance">
  <xsd:annotation>
    <xsd:appinfo>
      <link:roleType roleURI="http://www.xbrl.org/2009/role/netLabel" id="netLabel">
        <link:definition>Net label</link:definition>
        <link:usedOn>link:label</link:usedOn>
      </link:roleType> 
    </xsd:appinfo>
  </xsd:annotation>
  <xsd:import namespace="http://www.xbrl.org/2003/linkbase" schemaLocation="http://www.xbrl.org/2003/xbrl-linkbase-2003-12-31.xsd"/>
</xsd:schema>