<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"  xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
	<xsl:template mode="supplement" match="*">
		<app-group>
			<title><xsl:value-of select="@display_name"/></title>
			<xsl:for-each select="supplementary_file">
				<app>
					<title><xsl:value-of select="fields/title"/></title>
					<supplementary-material>
						<xsl:attribute name="id"><xsl:text>S</xsl:text><xsl:number/></xsl:attribute>
						<xsl:attribute name="xlink:title">local_file</xsl:attribute>
						<xsl:attribute name="xlink:type">simple</xsl:attribute>
						<xsl:attribute name="position">float</xsl:attribute>
						<xsl:attribute name="xlink:href"><xsl:value-of select="fields/file/value"/></xsl:attribute>
						<xsl:attribute name="mimetype">xls</xsl:attribute>
						<caption><p><xsl:copy-of select="fields/brief_description/value/p[1]/node()"/></p></caption>
						<p><bold><xsl:value-of select="fields/authors/@field_name"/><xsl:text>: </xsl:text></bold><xsl:value-of select="fields/authors/value"/></p>
						<p><bold><xsl:text>Data type: </xsl:text></bold><xsl:value-of select="fields/type/value"/></p>
						<p><bold>Description:</bold></p>
						<xsl:copy-of select="fields/brief_description/value/node()"/>
						<p><bold><xsl:text>File name: </xsl:text></bold><xsl:value-of select="fields/file/value"/></p>
					</supplementary-material>
				</app>
			</xsl:for-each>
		</app-group>	
	</xsl:template>
</xsl:stylesheet>
