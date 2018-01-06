<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2011 (http://www.altova.com) by Alex Pilz (Altova GmbH) -->
<!-- edited with XMLSPY v2004 beta 1 U (http://www.xmlspy.com) by Alex (Altova GmbH) -->
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified" attributeFormDefault="unqualified">
	<xs:element name="expense-report">
		<xs:annotation>
			<xs:documentation>expense-report is the root element.</xs:documentation>
		</xs:annotation>
		<xs:complexType>
			<xs:sequence>
				<xs:element name="Person">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="First">
								<xs:simpleType>
									<xs:restriction base="xs:string">
										<xs:minLength value="1"/>
									</xs:restriction>
								</xs:simpleType>
							</xs:element>
							<xs:element name="Last">
								<xs:simpleType>
									<xs:restriction base="xs:string">
										<xs:minLength value="1"/>
									</xs:restriction>
								</xs:simpleType>
							</xs:element>
							<xs:element name="Title" type="xs:string"/>
							<xs:element name="Phone">
								<xs:simpleType>
									<xs:restriction base="xs:string">
										<xs:pattern value="[0-9 \-]*"/>
									</xs:restriction>
								</xs:simpleType>
							</xs:element>
							<xs:element name="Email" type="emailType"/>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
				<xs:element ref="expense-item" maxOccurs="unbounded"/>
			</xs:sequence>
			<xs:attribute name="detailed" type="xs:string" use="required"/>
			<xs:attribute name="currency" use="required">
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:enumeration value="USD"/>
						<xs:enumeration value="Euro"/>
						<xs:enumeration value="JPY"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
		</xs:complexType>
	</xs:element>
	<xs:complexType name="TextType" mixed="true">
		<xs:choice minOccurs="0" maxOccurs="unbounded">
			<xs:element ref="strong"/>
			<xs:element ref="italic"/>
		</xs:choice>
	</xs:complexType>
	<xs:element name="description" type="TextType"/>
	<xs:element name="Travel">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="Destination" type="xs:string"/>
				<xs:element name="Mileage" type="xs:decimal" minOccurs="0"/>
			</xs:sequence>
			<xs:attribute name="means">
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:enumeration value="Taxi"/>
						<xs:enumeration value="CharterAir"/>
						<xs:enumeration value="Airline"/>
						<xs:enumeration value="Limo"/>
						<xs:enumeration value="CharterSea"/>
						<xs:enumeration value="Rail"/>
						<xs:enumeration value="CharterLand"/>
						<xs:enumeration value="Bus"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
			<xs:attribute name="Trav-cost" type="xs:decimal"/>
		</xs:complexType>
	</xs:element>
	<xs:element name="Meal">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="Name" type="xs:string" minOccurs="0"/>
				<xs:element ref="Location"/>
			</xs:sequence>
			<xs:attribute name="mealtype">
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:enumeration value="dinner"/>
						<xs:enumeration value="breakfast"/>
						<xs:enumeration value="lunch"/>
						<xs:enumeration value="other"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
		</xs:complexType>
	</xs:element>
	<xs:element name="Parking">
		<xs:complexType>
			<xs:sequence>
				<xs:element ref="Location"/>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
	<xs:element name="Date" type="xs:date"/>
	<xs:simpleType name="emailType">
		<xs:restriction base="xs:string">
			<xs:pattern value="[\p{L}_-]+(\.[\p{L}_-]+)*@[\p{L}_]+(\.[\p{L}_]+)+"/>
		</xs:restriction>
	</xs:simpleType>
	<xs:element name="expense-item">
		<xs:complexType>
			<xs:sequence>
				<xs:element ref="Date"/>
				<xs:choice minOccurs="0" maxOccurs="unbounded">
					<xs:element ref="Meal"/>
					<xs:element name="Lodging">
						<xs:complexType>
							<xs:sequence>
								<xs:element name="Name" type="xs:string" minOccurs="0"/>
								<xs:element ref="Location"/>
							</xs:sequence>
							<xs:attribute name="Lodge-cost" type="xs:decimal"/>
						</xs:complexType>
					</xs:element>
					<xs:element ref="Travel"/>
					<xs:element ref="Parking"/>
					<xs:element name="Entertainment">
						<xs:complexType>
							<xs:sequence>
								<xs:element name="Client-name" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
							</xs:sequence>
						</xs:complexType>
					</xs:element>
					<xs:element name="Misc">
						<xs:complexType>
							<xs:attribute name="misctype">
								<xs:simpleType>
									<xs:restriction base="xs:string">
										<xs:enumeration value="TeamBuilding"/>
										<xs:enumeration value="Tips"/>
										<xs:enumeration value="Fines"/>
										<xs:enumeration value="Rental"/>
										<xs:enumeration value="EverythingElse"/>
										<xs:enumeration value="Tolls"/>
										<xs:enumeration value="Telephone"/>
									</xs:restriction>
								</xs:simpleType>
							</xs:attribute>
						</xs:complexType>
					</xs:element>
				</xs:choice>
				<xs:element ref="description" minOccurs="0"/>
			</xs:sequence>
			<xs:attribute name="type" use="required">
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:enumeration value="Meal"/>
						<xs:enumeration value="Lodging"/>
						<xs:enumeration value="Travel"/>
						<xs:enumeration value="Parking"/>
						<xs:enumeration value="Entertainment"/>
						<xs:enumeration value="Misc"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
			<xs:attribute name="expto" use="required">
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:enumeration value="Development"/>
						<xs:enumeration value="Marketing"/>
						<xs:enumeration value="Accounting"/>
						<xs:enumeration value="Sales"/>
						<xs:enumeration value="Operations"/>
						<xs:enumeration value="Support"/>
						<xs:enumeration value="IT"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
		</xs:complexType>
	</xs:element>
	<xs:element name="Location" type="xs:string"/>
	<xs:element name="strong" type="TextType"/>
	<xs:element name="italic" type="TextType"/>
</xs:schema>
