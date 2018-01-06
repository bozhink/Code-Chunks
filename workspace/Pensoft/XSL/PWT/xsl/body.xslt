<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"  xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
	<xsl:import href="keys.xslt"/>
	<xsl:import href="section.xslt" />
	<xsl:import href="systematics.xslt"/>
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
	<xsl:template mode="body" match="*">
		<body>
			<!--Introduction-->
			<xsl:for-each select="introduction">
				<xsl:apply-templates mode="section" select="." >
					<xsl:with-param name="title">Introduction</xsl:with-param>
				</xsl:apply-templates>
			</xsl:for-each>
			<!--Materials and methods-->
			<xsl:for-each select="material_and_methods">
				<xsl:apply-templates mode="section" select="." >
					<xsl:with-param name="title">Materials and methods</xsl:with-param>
				</xsl:apply-templates>
			</xsl:for-each>
			<!--Data resources-->
			<xsl:for-each select="data_resources">
				<xsl:apply-templates mode="section" select="." >
					<xsl:with-param name="title">Data resources</xsl:with-param>
				</xsl:apply-templates>
			</xsl:for-each>
			<!--Systematics-->
			<xsl:for-each select="systematics">
				<xsl:apply-templates mode="systematics" select="."/>
			</xsl:for-each>
			<!--Identification keys-->
			<xsl:for-each select="identification_keys">
				<xsl:apply-templates mode="keys" select="." />
			</xsl:for-each>
			<!--Results-->
			<xsl:for-each select="results">
				<xsl:apply-templates mode="section" select="." >
					<xsl:with-param name="title">Results</xsl:with-param>
				</xsl:apply-templates>
			</xsl:for-each>
			<!--Discussion-->
			<xsl:for-each select="discussion">
				<xsl:apply-templates mode="section" select="." >
					<xsl:with-param name="title">Discusion</xsl:with-param>
				</xsl:apply-templates>
			</xsl:for-each>
		</body>
	</xsl:template>
</xsl:stylesheet>