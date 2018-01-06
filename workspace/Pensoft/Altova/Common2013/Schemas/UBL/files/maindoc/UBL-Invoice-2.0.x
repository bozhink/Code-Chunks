<?xml version="1.0" encoding="UTF-8"?>
<!--
  Document Type:     Invoice
  Generated On:      Tue Oct 03 2:26:38 P3 2006

-->
<!-- ===== xsd:schema Element With Namespaces Declarations ===== -->
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    targetNamespace="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
    xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
    xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
    xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
    xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
    xmlns:ccts="urn:un:unece:uncefact:documentation:2"
    xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
    xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
    elementFormDefault="qualified"
    attributeFormDefault="unqualified"
    version="2.0">
<!-- ===== Imports ===== -->
  <xsd:import namespace="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" schemaLocation="../common/UBL-CommonAggregateComponents-2.0.xsd"/>
  <xsd:import namespace="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" schemaLocation="../common/UBL-CommonBasicComponents-2.0.xsd"/>
  <xsd:import namespace="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" schemaLocation="../common/UnqualifiedDataTypeSchemaModule-2.0.xsd"/>
  <xsd:import namespace="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" schemaLocation="../common/UBL-CommonExtensionComponents-2.0.xsd"/>
  <xsd:import namespace="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" schemaLocation="../common/UBL-QualifiedDatatypes-2.0.xsd"/>
<!-- ===== Root Element ===== -->
  <xsd:element name="Invoice" type="InvoiceType">
    <xsd:annotation>
      <xsd:documentation>This element MUST be conveyed as the root element in any instance document based on this Schema expression</xsd:documentation>
    </xsd:annotation>
  </xsd:element>
  <xsd:complexType name="InvoiceType">
    <xsd:annotation>
      <xsd:documentation>
        <ccts:Component>
          <ccts:ComponentType>ABIE</ccts:ComponentType>
          <ccts:DictionaryEntryName>Invoice. Details</ccts:DictionaryEntryName>
          <ccts:Definition>The document used to request payment.</ccts:Definition>
          <ccts:ObjectClass>Invoice</ccts:ObjectClass>
        </ccts:Component>
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element ref="ext:UBLExtensions" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>A container for all extensions present in the document.</xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:UBLVersionID" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. UBL Version Identifier. Identifier</ccts:DictionaryEntryName>
              <ccts:Definition>The earliest version of the UBL 2 schema for this document type that defines all of the elements that might be encountered in the current instance.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>UBL Version Identifier</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Identifier</ccts:RepresentationTerm>
              <ccts:DataType>Identifier. Type</ccts:DataType>
              <ccts:Examples>2.0.5</ccts:Examples>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:CustomizationID" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Customization Identifier. Identifier</ccts:DictionaryEntryName>
              <ccts:Definition>Identifies a user-defined customization of UBL for a specific use.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Customization Identifier</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Identifier</ccts:RepresentationTerm>
              <ccts:DataType>Identifier. Type</ccts:DataType>
              <ccts:Examples>NES</ccts:Examples>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:ProfileID" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Profile Identifier. Identifier</ccts:DictionaryEntryName>
              <ccts:Definition>Identifies a user-defined profile of the customization of UBL being used.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Profile Identifier</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Identifier</ccts:RepresentationTerm>
              <ccts:DataType>Identifier. Type</ccts:DataType>
              <ccts:Examples>BasicProcurementProcess</ccts:Examples>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:ID" minOccurs="1" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Identifier</ccts:DictionaryEntryName>
              <ccts:Definition>An identifier for the Invoice assigned by the Creditor.</ccts:Definition>
              <ccts:Cardinality>1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Identifier</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Identifier</ccts:RepresentationTerm>
              <ccts:DataType>Identifier. Type</ccts:DataType>
              <ccts:AlternativeBusinessTerms>Invoice Number</ccts:AlternativeBusinessTerms>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:CopyIndicator" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Copy_ Indicator. Indicator</ccts:DictionaryEntryName>
              <ccts:Definition>Indicates whether a document is a copy (true) or not (false).</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Copy</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Indicator</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Indicator</ccts:RepresentationTerm>
              <ccts:DataType>Indicator. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:UUID" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. UUID. Identifier</ccts:DictionaryEntryName>
              <ccts:Definition>A universally unique identifier for an instance of this ABIE.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>UUID</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Identifier</ccts:RepresentationTerm>
              <ccts:DataType>Identifier. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:IssueDate" minOccurs="1" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Issue Date. Date</ccts:DictionaryEntryName>
              <ccts:Definition>The date assigned by the Creditor on which the Invoice was issued.</ccts:Definition>
              <ccts:Cardinality>1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Issue Date</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Date</ccts:RepresentationTerm>
              <ccts:DataType>Date. Type</ccts:DataType>
              <ccts:AlternativeBusinessTerms>Invoice Date</ccts:AlternativeBusinessTerms>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:IssueTime" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Issue Time. Time</ccts:DictionaryEntryName>
              <ccts:Definition>The time assigned by the Creditor at which the Invoice was issued.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Issue Time</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Time</ccts:RepresentationTerm>
              <ccts:DataType>Time. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:InvoiceTypeCode" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Invoice Type Code. Code</ccts:DictionaryEntryName>
              <ccts:Definition>Code specifying the type of the Invoice.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Invoice Type Code</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Code</ccts:RepresentationTerm>
              <ccts:DataType>Code. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:Note" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Note. Text</ccts:DictionaryEntryName>
              <ccts:Definition>Free-form text applying to the Invoice. This element may contain notes or any other similar information that is not contained explicitly in another structure.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Note</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Text</ccts:RepresentationTerm>
              <ccts:DataType>Text. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:TaxPointDate" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Tax Point Date. Date</ccts:DictionaryEntryName>
              <ccts:Definition>The date of the Invoice, used to indicate the point at which tax becomes applicable.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Tax Point Date</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Date</ccts:RepresentationTerm>
              <ccts:DataType>Date. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:DocumentCurrencyCode" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Document_ Currency Code. Code</ccts:DictionaryEntryName>
              <ccts:Definition>The currency in which the Document is presented. This may be the same currency as the pricing or as the tax.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Document</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Currency Code</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Code</ccts:RepresentationTerm>
              <ccts:DataType>Currency_ Code. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:TaxCurrencyCode" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Tax_ Currency Code. Code</ccts:DictionaryEntryName>
              <ccts:Definition>The currency used for tax amounts in the Invoice.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Tax</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Currency Code</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Code</ccts:RepresentationTerm>
              <ccts:DataType>Currency_ Code. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:PricingCurrencyCode" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Pricing_ Currency Code. Code</ccts:DictionaryEntryName>
              <ccts:Definition>The currency used for prices in the Invoice.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Pricing</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Currency Code</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Code</ccts:RepresentationTerm>
              <ccts:DataType>Currency_ Code. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:PaymentCurrencyCode" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Payment_ Currency Code. Code</ccts:DictionaryEntryName>
              <ccts:Definition>The currency used for payment in the Invoice.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Payment</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Currency Code</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Code</ccts:RepresentationTerm>
              <ccts:DataType>Currency_ Code. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:PaymentAlternativeCurrencyCode" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Payment Alternative_ Currency Code. Code</ccts:DictionaryEntryName>
              <ccts:Definition>The alternative currency used for payment in the Invoice.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Payment Alternative</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Currency Code</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Code</ccts:RepresentationTerm>
              <ccts:DataType>Currency_ Code. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:AccountingCostCode" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Accounting Cost Code. Code</ccts:DictionaryEntryName>
              <ccts:Definition>The Buyer's accounting code applied to the Invoice as a whole.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Accounting Cost Code</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Code</ccts:RepresentationTerm>
              <ccts:DataType>Code. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:AccountingCost" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Accounting Cost. Text</ccts:DictionaryEntryName>
              <ccts:Definition>The Buyer's accounting code applied to the Invoice as a whole, expressed as text.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Accounting Cost</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Text</ccts:RepresentationTerm>
              <ccts:DataType>Text. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cbc:LineCountNumeric" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>BBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Line Count. Numeric</ccts:DictionaryEntryName>
              <ccts:Definition>The number of lines in the document.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Line Count</ccts:PropertyTerm>
              <ccts:RepresentationTerm>Numeric</ccts:RepresentationTerm>
              <ccts:DataType>Numeric. Type</ccts:DataType>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:InvoicePeriod" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Invoice_ Period. Period</ccts:DictionaryEntryName>
              <ccts:Definition>An association to period(s) to which the Invoice applies.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Invoice</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Period</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Period</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:OrderReference" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Order Reference</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Order Reference.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Order Reference</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Order Reference</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:BillingReference" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Billing Reference</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Billing Reference.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Billing Reference</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Billing Reference</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:DespatchDocumentReference" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Despatch_ Document Reference. Document Reference</ccts:DictionaryEntryName>
              <ccts:Definition>An associative reference to Despatch Advice.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Despatch</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Document Reference</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Document Reference</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:ReceiptDocumentReference" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Receipt_ Document Reference. Document Reference</ccts:DictionaryEntryName>
              <ccts:Definition>An associative reference to Receipt Advice.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Receipt</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Document Reference</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Document Reference</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:OriginatorDocumentReference" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Originator_ Document Reference. Document Reference</ccts:DictionaryEntryName>
              <ccts:Definition>An associative reference to Originator Document.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Originator</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Document Reference</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Document Reference</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:ContractDocumentReference" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Contract_ Document Reference. Document Reference</ccts:DictionaryEntryName>
              <ccts:Definition>An associative reference to Contract.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Contract</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Document Reference</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Document Reference</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:AdditionalDocumentReference" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Additional_ Document Reference. Document Reference</ccts:DictionaryEntryName>
              <ccts:Definition>An associative reference to Additional Document.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Additional</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Document Reference</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Document Reference</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:Signature" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Signature</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Signature.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Signature</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Signature</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:AccountingSupplierParty" minOccurs="1" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Accounting_ Supplier Party. Supplier Party</ccts:DictionaryEntryName>
              <ccts:Definition>An association to the Accounting Supplier Party.</ccts:Definition>
              <ccts:Cardinality>1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Accounting</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Supplier Party</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Supplier Party</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:AccountingCustomerParty" minOccurs="1" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Accounting_ Customer Party. Customer Party</ccts:DictionaryEntryName>
              <ccts:Definition>An association to the Accounting Customer Party.</ccts:Definition>
              <ccts:Cardinality>1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Accounting</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Customer Party</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Customer Party</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:PayeeParty" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Payee_ Party. Party</ccts:DictionaryEntryName>
              <ccts:Definition>An association to the Payee.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Payee</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Party</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Party</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:BuyerCustomerParty" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Buyer_ Customer Party. Customer Party</ccts:DictionaryEntryName>
              <ccts:Definition>An association to the Buyer.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Buyer</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Customer Party</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Customer Party</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:SellerSupplierParty" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Seller_ Supplier Party. Supplier Party</ccts:DictionaryEntryName>
              <ccts:Definition>An association to the Seller.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Seller</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Supplier Party</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Supplier Party</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:TaxRepresentativeParty" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Tax Representative_ Party. Party</ccts:DictionaryEntryName>
              <ccts:Definition>An association to the Tax Representative.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Tax Representative</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Party</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Party</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:Delivery" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Delivery</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Delivery.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Delivery</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Delivery</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:DeliveryTerms" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Delivery Terms</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Delivery Terms.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Delivery Terms</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Delivery Terms</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:PaymentMeans" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Payment Means</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Payment Means.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Payment Means</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Payment Means</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:PaymentTerms" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Payment Terms</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Payment Terms.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Payment Terms</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Payment Terms</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:PrepaidPayment" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Prepaid_ Payment. Payment</ccts:DictionaryEntryName>
              <ccts:Definition>An association to prepaid payment(s).</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Prepaid</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Payment</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Payment</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:AllowanceCharge" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Allowance Charge</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Allowances and Charges that apply to the Invoice as a whole.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Allowance Charge</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Allowance Charge</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:TaxExchangeRate" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Tax_ Exchange Rate. Exchange Rate</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Exchange Rate between the Document Currency and the Tax Currency.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Tax</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Exchange Rate</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Exchange Rate</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:PricingExchangeRate" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Pricing_ Exchange Rate. Exchange Rate</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Exchange Rate between the Document Currency and the Pricing Currency.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Pricing</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Exchange Rate</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Exchange Rate</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:PaymentExchangeRate" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Payment_ Exchange Rate. Exchange Rate</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Exchange Rate between the Document Currency and the Payment Currency.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Payment</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Exchange Rate</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Exchange Rate</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:PaymentAlternativeExchangeRate" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Payment Alternative_ Exchange Rate. Exchange Rate</ccts:DictionaryEntryName>
              <ccts:Definition>An association to Exchange Rate between the Document Currency and the Payment Alternative Currency.</ccts:Definition>
              <ccts:Cardinality>0..1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Payment Alternative</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Exchange Rate</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Exchange Rate</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:TaxTotal" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Tax Total</ccts:DictionaryEntryName>
              <ccts:Definition>An association to tax total for specific tax types/rates.</ccts:Definition>
              <ccts:Cardinality>0..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Tax Total</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Tax Total</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:LegalMonetaryTotal" minOccurs="1" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Legal_ Monetary Total. Monetary Total</ccts:DictionaryEntryName>
              <ccts:Definition>An association to the total amount payable on the Invoice, including Allowances, Charges, and Taxes.</ccts:Definition>
              <ccts:Cardinality>1</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTermQualifier>Legal</ccts:PropertyTermQualifier>
              <ccts:PropertyTerm>Monetary Total</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Monetary Total</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element ref="cac:InvoiceLine" minOccurs="1" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            <ccts:Component>
              <ccts:ComponentType>ASBIE</ccts:ComponentType>
              <ccts:DictionaryEntryName>Invoice. Invoice Line</ccts:DictionaryEntryName>
              <ccts:Definition>An association to one or more Invoice Lines.</ccts:Definition>
              <ccts:Cardinality>1..n</ccts:Cardinality>
              <ccts:ObjectClass>Invoice</ccts:ObjectClass>
              <ccts:PropertyTerm>Invoice Line</ccts:PropertyTerm>
              <ccts:AssociatedObjectClass>Invoice Line</ccts:AssociatedObjectClass>
            </ccts:Component>
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
  </xsd:complexType>
<!-- ===== Element Declarations ===== -->
<!-- ===== Type Definitions ===== -->
<!-- ===== Basic Business Information Entity Type Definitions ===== -->
</xsd:schema>
<!-- ===== Copyright Notice ===== -->
<!--
  OASIS takes no position regarding the validity or scope of any 
  intellectual property or other rights that might be claimed to pertain 
  to the implementation or use of the technology described in this 
  document or the extent to which any license under such rights 
  might or might not be available; neither does it represent that it has 
  made any effort to identify any such rights. Information on OASIS's 
  procedures with respect to rights in OASIS specifications can be 
  found at the OASIS website. Copies of claims of rights made 
  available for publication and any assurances of licenses to be made 
  available, or the result of an attempt made to obtain a general 
  license or permission for the use of such proprietary rights by 
  implementors or users of this specification, can be obtained from 
  the OASIS Executive Director.

  OASIS invites any interested party to bring to its attention any 
  copyrights, patents or patent applications, or other proprietary 
  rights which may cover technology that may be required to 
  implement this specification. Please address the information to the 
  OASIS Executive Director.
  
  Copyright (C) OASIS Open 2001-2006. All Rights Reserved.

  This document and translations of it may be copied and furnished to 
  others, and derivative works that comment on or otherwise explain 
  it or assist in its implementation may be prepared, copied, 
  published and distributed, in whole or in part, without restriction of 
  any kind, provided that the above copyright notice and this 
  paragraph are included on all such copies and derivative works. 
  However, this document itself may not be modified in any way, 
  such as by removing the copyright notice or references to OASIS, 
  except as needed for the purpose of developing OASIS 
  specifications, in which case the procedures for copyrights defined 
  in the OASIS Intellectual Property Rights document must be 
  followed, or as required to translate it into languages other than 
  English. 

  The limited permissions granted above are perpetual and will not be 
  revoked by OASIS or its successors or assigns. 

  This document and the information contained herein is provided on 
  an "AS IS" basis and OASIS DISCLAIMS ALL WARRANTIES, 
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY 
  WARRANTY THAT THE USE OF THE INFORMATION HEREIN 
  WILL NOT INFRINGE ANY RIGHTS OR ANY IMPLIED 
  WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A 
  PARTICULAR PURPOSE.
-->