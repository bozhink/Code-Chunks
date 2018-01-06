<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSPY v2004 beta 1 U (http://www.xmlspy.com) by Alex (Altova GmbH) -->
<expense-report currency="USD" detailed="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="mf-ExpReport.xsd">
	<Person>
		<First>Fred</First>
		<Last>Landis</Last>
		<Title>Project Manager</Title>
		<Phone>123-456-78</Phone>
		<Email>f.landis@nanonull.com</Email>
	</Person>
	<expense-item type="Travel" expto="Development">
		<Date>2003-01-02</Date>
		<Travel Trav-cost="337.88">
			<Destination/>
		</Travel>
		<description>Biz jet</description>
	</expense-item>
	<expense-item type="Lodging" expto="Sales">
		<Date>2003-01-01</Date>
		<Lodging Lodge-cost="121.2">
			<Location/>
		</Lodging>
		<description>Motel mania</description>
	</expense-item>
	<expense-item type="Travel" expto="Accounting">
		<Date>2003-07-07</Date>
		<Travel Trav-cost="1014.22">
			<Destination/>
		</Travel>
		<description>Ambassador class</description>
	</expense-item>
	<expense-item type="Travel" expto="Marketing">
		<Date>2003-02-02</Date>
		<Travel Trav-cost="2000">
			<Destination/>
		</Travel>
		<description>Hong Kong</description>
	</expense-item>
	<expense-item type="Meal" expto="Sales">
		<Date>2003-03-03</Date>
		<description>For Free</description>
	</expense-item>
</expense-report>
