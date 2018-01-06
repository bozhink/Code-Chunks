<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2011 (x64) (http://www.altova.com) by Mr. Nobody (Altova GmbH) -->
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified" attributeFormDefault="unqualified">
	<xs:element name="VaccinationQueryReport">
		<xs:annotation>
			<xs:documentation>Comment describing your root element</xs:documentation>
		</xs:annotation>
		<xs:complexType>
			<xs:sequence>
				<xs:element name="VaccinationQuery">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="WhoSubject">
								<xs:complexType>
									<xs:attribute name="surname" type="xs:string"/>
									<xs:attribute name="givenname" type="xs:string"/>
								</xs:complexType>
							</xs:element>
							<xs:element name="WhatSubject"/>
						</xs:sequence>
						<xs:attribute name="Vaccid" type="xs:string"/>
						<xs:attribute name="QueryUser" type="xs:string"/>
					</xs:complexType>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
</xs:schema>
