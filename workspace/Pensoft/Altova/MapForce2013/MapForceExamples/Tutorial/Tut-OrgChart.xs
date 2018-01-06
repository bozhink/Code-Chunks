<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2005 rel. 3 U (http://www.altova.com) by Mr. Nobody (Altova GmbH) -->
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified" attributeFormDefault="unqualified">
	<xs:notation name="MF-Tutorial-Orgchart" public="http://www.xmlspy.com/schemas/Altova/orgchart"/>
	<xs:complexType name="DivisionType">
		<xs:sequence>
			<xs:element ref="Name"/>
			<xs:element ref="Person" maxOccurs="unbounded"/>
		</xs:sequence>
	</xs:complexType>
	<xs:element name="OrgChart">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="CompanyLogo">
					<xs:complexType>
						<xs:attribute name="href" type="xs:anyURI"/>
					</xs:complexType>
				</xs:element>
				<xs:element ref="Name"/>
				<xs:element name="Office" type="OfficeType" maxOccurs="unbounded"/>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
	<xs:element name="Person">
		<xs:complexType>
			<xs:complexContent>
				<xs:extension base="PersonType"/>
			</xs:complexContent>
		</xs:complexType>
	</xs:element>
	<xs:complexType name="PersonType">
		<xs:annotation>
			<xs:documentation>A person working for the company</xs:documentation>
		</xs:annotation>
		<xs:sequence>
			<xs:element name="First">
				<xs:annotation>
					<xs:documentation>Christian name</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:simpleContent>
						<xs:extension base="xs:string"/>
					</xs:simpleContent>
				</xs:complexType>
			</xs:element>
			<xs:element name="Last" type="xs:string">
				<xs:annotation>
					<xs:documentation>Surname </xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="Title" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Academic title</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="PhoneExt" type="xs:int">
				<xs:annotation>
					<xs:documentation>Phone extension</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element ref="EMail"/>
		</xs:sequence>
	</xs:complexType>
	<xs:simpleType name="emailType">
		<xs:restriction base="xs:string">
			<xs:pattern value="[\p{L}_-]+(\.[\p{L}_-]+)*@[\p{L}_]+(\.[\p{L}_]+)+"/>
		</xs:restriction>
	</xs:simpleType>
	<xs:element name="Department" type="DivisionType"/>
	<xs:element name="Name" type="xs:string"/>
	<xs:complexType name="OfficeType">
		<xs:sequence>
			<xs:element ref="Name"/>
			<xs:element ref="Desc"/>
			<xs:element name="Location" type="xs:string"/>
			<xs:element name="Phone" type="xs:string"/>
			<xs:element name="Fax" type="xs:string"/>
			<xs:element ref="EMail"/>
			<xs:element ref="Department" maxOccurs="unbounded"/>
		</xs:sequence>
	</xs:complexType>
	<xs:element name="EMail" type="emailType"/>
	<xs:element name="Desc">
		<xs:complexType>
			<xs:sequence>
				<xs:element ref="para" maxOccurs="unbounded"/>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
	<xs:element name="bold" type="TextType"/>
	<xs:element name="italic" type="TextType"/>
	<xs:complexType name="TextType" mixed="true">
		<xs:choice minOccurs="0" maxOccurs="unbounded">
			<xs:element name="bold" type="xs:string"/>
			<xs:element name="italic" type="xs:string"/>
		</xs:choice>
	</xs:complexType>
	<xs:element name="para" type="TextType"/>
</xs:schema>
