<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"  xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
	<xsl:template mode="section" match="*">
			<xsl:param name="title" />
				<sec>
					<xsl:attribute name="sec-type"><xsl:value-of select="$title" /></xsl:attribute>
					<title><xsl:value-of select="$title" /></title>
					<xsl:apply-templates mode="p" select="./fields/*/value" />
					<xsl:apply-templates mode="subsection" select="." />
				</sec>
	</xsl:template>
	<xsl:template mode="subsection" match="*">
			<xsl:for-each select="subsection">
				<sec>
					<xsl:attribute name="sec-type"><xsl:value-of select="./fields/enter_title_of_this_subsection"/></xsl:attribute>
					<title><xsl:copy-of select="./fields/enter_title_of_this_subsection/value/node()"/></title>
					<xsl:apply-templates mode="p" select="./fields/content/value" />
				</sec>
			</xsl:for-each>
	</xsl:template>
	<xsl:template match="p" mode="p">
		<xsl:copy-of select="."/>
	</xsl:template>
</xsl:stylesheet>
