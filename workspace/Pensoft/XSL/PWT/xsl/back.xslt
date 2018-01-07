<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"  xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
	<xsl:import href="ref.xslt"  />
	<xsl:import href="supplement.xslt"/>
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
	<xsl:template mode="back" match="*">
		<back>
			<ack>
				<title>Acknowledgements</title>
				<xsl:apply-templates mode="p" select="acknowledgements/value" />
			</ack>
			<xsl:for-each select="author_contributions">
				<xsl:apply-templates mode="section" select="." >
					<xsl:with-param name="title"><xsl:value-of select="fields/author_contributions/@field_name"/></xsl:with-param>
				</xsl:apply-templates>
			</xsl:for-each>
			<ref-list>
				<xsl:apply-templates mode="reference" select="references" />
			</ref-list>
			<xsl:for-each select="/document/objects/supplementary_files">
				<xsl:apply-templates mode="supplement" select="."/>
			</xsl:for-each>
		</back>
	</xsl:template>
</xsl:stylesheet>