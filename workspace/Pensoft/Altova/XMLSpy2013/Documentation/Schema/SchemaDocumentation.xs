<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2013 (x64) (http://www.altova.com) by Mr. Nobody (Altova GmbH) -->
<xs:schema xmlns="http://www.altova.com/documentation" xmlns:xs="http://www.w3.org/2001/XMLSchema" targetNamespace="http://www.altova.com/documentation" elementFormDefault="qualified" attributeFormDefault="unqualified">
	<xs:include schemaLocation="../Documentation.xsd"/>
	<xs:element name="SchemaDocumentation">
		<xs:annotation>
			<xs:documentation>Root element of the Schema documentation</xs:documentation>
		</xs:annotation>
		<xs:complexType>
			<xs:sequence maxOccurs="1">
				<xs:element ref="Document"/>
				<xs:element name="DocumentationSettings">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="Includes">
								<xs:complexType>
									<xs:attribute name="index" type="xs:boolean" use="required"/>
									<xs:attribute name="globalAttributes" type="xs:boolean" use="required"/>
									<xs:attribute name="globalElements" type="xs:boolean" use="required"/>
									<xs:attribute name="localAttributes" type="xs:boolean" use="required"/>
									<xs:attribute name="localElements" type="xs:boolean" use="required"/>
									<xs:attribute name="notations" type="xs:boolean" use="required"/>
									<xs:attribute name="simpleTypes" type="xs:boolean" use="required"/>
									<xs:attribute name="complexTypes" type="xs:boolean" use="required"/>
									<xs:attribute name="groups" type="xs:boolean" use="required"/>
									<xs:attribute name="attributeGroups" type="xs:boolean" use="required"/>
									<xs:attribute name="redefines" type="xs:boolean" use="required"/>
									<xs:attribute name="referencedSchemas" type="xs:boolean" use="required"/>
								</xs:complexType>
							</xs:element>
							<xs:element name="Details">
								<xs:complexType>
									<xs:attribute name="diagram" type="xs:boolean" use="required"/>
									<xs:attribute name="namespace" type="xs:boolean" use="required"/>
									<xs:attribute name="type" type="xs:boolean" use="required"/>
									<xs:attribute name="substitutionGroup" type="xs:boolean" use="required"/>
									<xs:attribute name="children" type="xs:boolean" use="required"/>
									<xs:attribute name="usedBy" type="xs:boolean" use="required"/>
									<xs:attribute name="properties" type="xs:boolean" use="required"/>
									<xs:attribute name="singleFacets" type="xs:boolean" use="required"/>
									<xs:attribute name="patterns" type="xs:boolean" use="required"/>
									<xs:attribute name="enumerations" type="xs:boolean" use="required"/>
									<xs:attribute name="attributes" type="xs:boolean" use="required"/>
									<xs:attribute name="identityConstraints" type="xs:boolean" use="required"/>
									<xs:attribute name="annotations" type="xs:boolean" use="required"/>
									<xs:attribute name="sourceCode" type="xs:boolean" use="required"/>
								</xs:complexType>
							</xs:element>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
				<xs:sequence minOccurs="0" maxOccurs="unbounded">
					<xs:element ref="SchemaDocument"/>
				</xs:sequence>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
	<xs:element name="SchemaDocument">
		<xs:complexType>
			<xs:choice minOccurs="0" maxOccurs="unbounded">
				<xs:element ref="Attribute"/>
				<xs:element ref="Element"/>
				<xs:element ref="ComplexType"/>
				<xs:element ref="SimpleType"/>
				<xs:element ref="Group"/>
				<xs:element ref="AttributeGroup"/>
				<xs:element ref="Notation"/>
			</xs:choice>
			<xs:attribute name="schemaLocation" type="xs:anyURI"/>
			<xs:attribute name="href" type="xs:anyURI" use="optional"/>
			<xs:attribute name="attributeFormDefault" type="xs:string" use="required"/>
			<xs:attribute name="elementFormDefault" type="xs:string" use="required"/>
			<xs:attribute name="blockDefault" type="xs:string"/>
			<xs:attribute name="finalDefault" type="xs:string"/>
			<xs:attribute name="targetNamespace" type="xs:string"/>
			<xs:attribute name="newFile" type="xs:anyURI" use="optional"/>
		</xs:complexType>
	</xs:element>
	<xs:complexType name="TSchemaItem" mixed="true">
		<xs:annotation>
			<xs:documentation>Contains common attributes for Schema documentation items</xs:documentation>
		</xs:annotation>
		<xs:complexContent>
			<xs:extension base="TNamedItem">
				<xs:attribute name="ref" type="xs:string"/>
				<xs:attribute name="redefinition" type="xs:boolean" use="optional"/>
				<xs:attribute name="newFile" type="xs:anyURI" use="optional"/>
				<xs:attribute name="wsdlType" type="xs:boolean" use="optional" default="false"/>
			</xs:extension>
		</xs:complexContent>
	</xs:complexType>
	<xs:element name="Attribute">
		<xs:annotation>
			<xs:documentation>Contains documentation for xs:attribute</xs:documentation>
		</xs:annotation>
		<xs:complexType mixed="true">
			<xs:complexContent>
				<xs:extension base="TSchemaItem">
					<xs:sequence>
						<xs:element ref="Namespace" minOccurs="0"/>
						<xs:element ref="Type" minOccurs="0"/>
						<xs:element ref="Properties" minOccurs="0"/>
						<xs:element ref="UsedBy" minOccurs="0"/>
						<xs:element ref="Facets" minOccurs="0"/>
						<xs:element ref="Annotations" minOccurs="0"/>
						<xs:element ref="Source" minOccurs="0"/>
					</xs:sequence>
				</xs:extension>
			</xs:complexContent>
		</xs:complexType>
	</xs:element>
	<xs:element name="Element">
		<xs:annotation>
			<xs:documentation>Contains documentation for xs:element</xs:documentation>
		</xs:annotation>
		<xs:complexType mixed="true">
			<xs:complexContent>
				<xs:extension base="TSchemaItem">
					<xs:sequence>
						<xs:element ref="Diagram" minOccurs="0"/>
						<xs:element ref="Namespace" minOccurs="0"/>
						<xs:element ref="Type" minOccurs="0"/>
						<xs:element name="SubstitutionGroups" minOccurs="0">
							<xs:annotation>
								<xs:documentation>Substitution groups of this element</xs:documentation>
							</xs:annotation>
							<xs:complexType>
								<xs:sequence>
									<xs:element name="SubstitutionGroup" type="TText" minOccurs="0" maxOccurs="unbounded">
										<xs:annotation>
											<xs:documentation>Substitution group of element</xs:documentation>
										</xs:annotation>
									</xs:element>
								</xs:sequence>
							</xs:complexType>
						</xs:element>
						<xs:element ref="Properties" minOccurs="0"/>
						<xs:element ref="Children" minOccurs="0"/>
						<xs:element ref="UsedBy" minOccurs="0"/>
						<xs:element ref="Facets" minOccurs="0"/>
						<xs:element ref="LocalAttributes" minOccurs="0"/>
						<xs:element name="IdentityConstraints" minOccurs="0">
							<xs:complexType>
								<xs:sequence>
									<xs:element name="Constraint" minOccurs="0" maxOccurs="unbounded">
										<xs:complexType>
											<xs:sequence>
												<xs:element name="Field" type="TText" minOccurs="0" maxOccurs="unbounded"/>
												<xs:element ref="Annotations" minOccurs="0"/>
											</xs:sequence>
											<xs:attribute name="kind" type="xs:string" use="required"/>
											<xs:attribute name="name" type="xs:string" use="required"/>
											<xs:attribute name="refer" type="xs:string" use="required"/>
											<xs:attribute name="refer_ref" type="xs:string"/>
											<xs:attribute name="selector" type="xs:string" use="required"/>
										</xs:complexType>
									</xs:element>
								</xs:sequence>
							</xs:complexType>
						</xs:element>
						<xs:element ref="Annotations" minOccurs="0"/>
						<xs:element ref="Source" minOccurs="0"/>
						<xs:choice minOccurs="0" maxOccurs="unbounded">
							<xs:element ref="Attribute"/>
							<xs:element ref="Element"/>
						</xs:choice>
					</xs:sequence>
				</xs:extension>
			</xs:complexContent>
		</xs:complexType>
	</xs:element>
	<xs:element name="ComplexType">
		<xs:annotation>
			<xs:documentation>Contains documentation for xs:complexType</xs:documentation>
		</xs:annotation>
		<xs:complexType mixed="true">
			<xs:complexContent>
				<xs:extension base="TSchemaItem">
					<xs:sequence>
						<xs:element ref="Diagram" minOccurs="0"/>
						<xs:element ref="Namespace" minOccurs="0"/>
						<xs:element ref="Type" minOccurs="0"/>
						<xs:element ref="Properties" minOccurs="0"/>
						<xs:element ref="Children" minOccurs="0"/>
						<xs:element ref="UsedBy" minOccurs="0"/>
						<xs:element ref="Facets" minOccurs="0"/>
						<xs:element ref="LocalAttributes" minOccurs="0"/>
						<xs:element ref="Annotations" minOccurs="0"/>
						<xs:element ref="Source" minOccurs="0"/>
						<xs:choice minOccurs="0" maxOccurs="unbounded">
							<xs:element ref="Attribute"/>
							<xs:element ref="Element"/>
						</xs:choice>
					</xs:sequence>
				</xs:extension>
			</xs:complexContent>
		</xs:complexType>
	</xs:element>
	<xs:element name="SimpleType">
		<xs:annotation>
			<xs:documentation>Contains documentation for xs:simpleType</xs:documentation>
		</xs:annotation>
		<xs:complexType mixed="true">
			<xs:complexContent>
				<xs:extension base="TSchemaItem">
					<xs:sequence>
						<xs:element ref="Namespace" minOccurs="0"/>
						<xs:element ref="Type" minOccurs="0"/>
						<xs:element ref="Properties" minOccurs="0"/>
						<xs:element ref="UsedBy" minOccurs="0"/>
						<xs:element ref="Facets" minOccurs="0"/>
						<xs:element ref="Annotations" minOccurs="0"/>
						<xs:element ref="Source" minOccurs="0"/>
					</xs:sequence>
				</xs:extension>
			</xs:complexContent>
		</xs:complexType>
	</xs:element>
	<xs:element name="Group">
		<xs:annotation>
			<xs:documentation>Contains documentation for xs:group</xs:documentation>
		</xs:annotation>
		<xs:complexType mixed="true">
			<xs:complexContent>
				<xs:extension base="TSchemaItem">
					<xs:sequence>
						<xs:element ref="Diagram" minOccurs="0"/>
						<xs:element ref="Namespace" minOccurs="0"/>
						<xs:element ref="Properties" minOccurs="0"/>
						<xs:element ref="Children" minOccurs="0"/>
						<xs:element ref="UsedBy" minOccurs="0"/>
						<xs:element ref="Annotations" minOccurs="0"/>
						<xs:element ref="Source" minOccurs="0"/>
						<xs:element ref="Element" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:extension>
			</xs:complexContent>
		</xs:complexType>
	</xs:element>
	<xs:element name="AttributeGroup">
		<xs:annotation>
			<xs:documentation>Contains documentation for xs:attributeGroup</xs:documentation>
		</xs:annotation>
		<xs:complexType mixed="true">
			<xs:complexContent>
				<xs:extension base="TSchemaItem">
					<xs:sequence>
						<xs:element ref="Namespace" minOccurs="0"/>
						<xs:element ref="UsedBy" minOccurs="0"/>
						<xs:element ref="LocalAttributes" minOccurs="0"/>
						<xs:element ref="Annotations" minOccurs="0"/>
						<xs:element ref="Source" minOccurs="0"/>
						<xs:element ref="Attribute" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:extension>
			</xs:complexContent>
		</xs:complexType>
	</xs:element>
	<xs:element name="Notation">
		<xs:annotation>
			<xs:documentation>Contains documentation for xs:notation</xs:documentation>
		</xs:annotation>
		<xs:complexType mixed="true">
			<xs:complexContent>
				<xs:extension base="TSchemaItem">
					<xs:sequence>
						<xs:element ref="Namespace" minOccurs="0"/>
						<xs:element ref="Properties" minOccurs="0"/>
						<xs:element ref="UsedBy" minOccurs="0"/>
						<xs:element ref="Annotations" minOccurs="0"/>
						<xs:element ref="Source" minOccurs="0"/>
					</xs:sequence>
				</xs:extension>
			</xs:complexContent>
		</xs:complexType>
	</xs:element>
	<xs:element name="Namespace" type="TText">
		<xs:annotation>
			<xs:documentation>Namespace of type or element</xs:documentation>
		</xs:annotation>
	</xs:element>
	<xs:element name="Type">
		<xs:annotation>
			<xs:documentation>Type of element or type (and its derivation type)</xs:documentation>
		</xs:annotation>
		<xs:complexType>
			<xs:choice minOccurs="0">
				<xs:element ref="Union"/>
				<xs:element ref="List"/>
				<xs:element ref="Restriction"/>
				<xs:element name="Extension">
					<xs:complexType>
						<xs:sequence>
							<xs:element ref="Reference"/>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
				<xs:element ref="Reference"/>
			</xs:choice>
		</xs:complexType>
	</xs:element>
	<xs:element name="Properties">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="Property" type="TNamedText" minOccurs="0" maxOccurs="unbounded">
					<xs:annotation>
						<xs:documentation>Property of type or element (eg: base, content)</xs:documentation>
					</xs:annotation>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
	<xs:element name="Children">
		<xs:annotation>
			<xs:documentation>The direct children of this type or element</xs:documentation>
		</xs:annotation>
		<xs:complexType>
			<xs:sequence>
				<xs:element name="Child" type="TText" minOccurs="0" maxOccurs="unbounded">
					<xs:annotation>
						<xs:documentation>Child element of type or element</xs:documentation>
					</xs:annotation>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
	<xs:element name="UsedBy">
		<xs:annotation>
			<xs:documentation>List of all referencing elements</xs:documentation>
		</xs:annotation>
		<xs:complexType>
			<xs:sequence>
				<xs:element name="By" minOccurs="0" maxOccurs="unbounded">
					<xs:annotation>
						<xs:documentation>Where this type or element is used (in type or element)</xs:documentation>
					</xs:annotation>
					<xs:complexType>
						<xs:complexContent>
							<xs:extension base="TText">
								<xs:attribute name="type" type="xs:string" use="required"/>
							</xs:extension>
						</xs:complexContent>
					</xs:complexType>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
	<xs:element name="LocalAttributes">
		<xs:annotation>
			<xs:documentation>All localy defined attributes in this type or element</xs:documentation>
		</xs:annotation>
		<xs:complexType>
			<xs:sequence>
				<xs:element name="LocalAttribute" minOccurs="0" maxOccurs="unbounded">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="Type" type="TText" minOccurs="0"/>
							<xs:element ref="Annotations" minOccurs="0"/>
						</xs:sequence>
						<xs:attribute name="ref" type="xs:string"/>
						<xs:attribute name="name" type="xs:string" use="required"/>
						<xs:attribute name="use" type="xs:string"/>
						<xs:attribute name="default" type="xs:string"/>
						<xs:attribute name="fixed" type="xs:string"/>
						<xs:attribute name="type" type="xs:string"/>
					</xs:complexType>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
	<xs:element name="Facets">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="Facet" minOccurs="0" maxOccurs="unbounded">
					<xs:annotation>
						<xs:documentation>Simple type facet</xs:documentation>
					</xs:annotation>
					<xs:complexType>
						<xs:sequence>
							<xs:element ref="Annotations" minOccurs="0"/>
						</xs:sequence>
						<xs:attribute name="kind" type="xs:string" use="required"/>
						<xs:attribute name="value" type="xs:string" use="required"/>
						<xs:attribute name="ref" type="xs:string"/>
					</xs:complexType>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
	<xs:element name="Annotations">
		<xs:annotation>
			<xs:documentation>List of all documentation and appInfo</xs:documentation>
		</xs:annotation>
		<xs:complexType>
			<xs:sequence>
				<xs:element name="Annotation" type="TNamedText" minOccurs="0" maxOccurs="unbounded">
					<xs:annotation>
						<xs:documentation>Annotation of type or element</xs:documentation>
					</xs:annotation>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
	<xs:complexType name="TDerivedWith">
		<xs:choice minOccurs="0" maxOccurs="unbounded">
			<xs:element ref="Union"/>
			<xs:element ref="Restriction"/>
			<xs:element ref="List"/>
			<xs:element ref="Reference"/>
		</xs:choice>
	</xs:complexType>
	<xs:element name="Union" type="TDerivedWith"/>
	<xs:element name="Restriction" type="TDerivedWith"/>
	<xs:element name="List" type="TDerivedWith"/>
	<xs:element name="Reference" type="TText"/>
</xs:schema>
