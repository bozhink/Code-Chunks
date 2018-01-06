<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="*">
		<xsl:for-each select=".">
		<xsl:call-template name="Total">
			<xsl:with-param name="string" select="."/>
		</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	
	
	<xsl:template name="Total">
	<xsl:param name="string"/>
		<xsl:value-of select="sum($string/Product/Price)"/>
	</xsl:template>
</xsl:stylesheet>