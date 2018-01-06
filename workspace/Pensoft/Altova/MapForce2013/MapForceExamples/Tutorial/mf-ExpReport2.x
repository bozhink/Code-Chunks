<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSPY v2004 beta 1 U (http://www.xmlspy.com) by Alex (Altova GmbH) -->
<expense-report currency="Euro" detailed="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="mf-ExpReport.xsd">
	<Person>
		<First>James</First>
		<Last>Johnson</Last>
		<Title>Manager</Title>
		<Phone>456-789-123</Phone>
		<Email>j.john@nanonull.com</Email>
	</Person>
	<expense-item type="Travel" expto="Sales">
		<Date>2004-02-03</Date>
		<Travel Trav-cost="150.44">
			<Destination/>
		</Travel>
		<description/>
	</expense-item>
	<expense-item type="Lodging" expto="Sales">
		<Date>2004-02-02</Date>
		<Lodging Lodge-cost="440">
			<Location/>
		</Lodging>
		<description>Weekend</description>
	</expense-item>
	<expense-item type="Travel" expto="Operations">
		<Date>2004-08-08</Date>
		<Travel Trav-cost="1020">
			<Destination/>
		</Travel>
		<description>Business class</description>
	</expense-item>
	<expense-item type="Travel" expto="Support">
		<Date>2004-03-03</Date>
		<Travel Trav-cost="70">
			<Destination/>
		</Travel>
		<description>Train</description>
	</expense-item>
</expense-report>
