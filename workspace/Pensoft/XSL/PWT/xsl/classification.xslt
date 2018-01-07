<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"  xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
	<xsl:template mode="classification" match="*">
		<xsl:if test="node() != ''">
			<subj-group>
				<xsl:attribute name="subj-group-type"><xsl:value-of select="@field_name"/></xsl:attribute>
				<xsl:for-each select="value">
					<subject><xsl:value-of select="."/></subject>
				</xsl:for-each>
			</subj-group>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
