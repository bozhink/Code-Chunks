<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"  xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
	<!--
		FIGURES
	-->
	<xsl:template mode="figures" match="*">
		<xsl:for-each select="figure">
			<fig>
				<xsl:variable name="fignum"><xsl:number/></xsl:variable>
				<xsl:attribute name="id"><xsl:text>F</xsl:text><xsl:value-of select="$fignum"/></xsl:attribute>
				<xsl:attribute name="position">float</xsl:attribute>
				<xsl:attribute name="orientation">portrait</xsl:attribute>
				<label>Figure <xsl:value-of select="$fignum"/>.</label>
				<xsl:copy-of select="caption"/>
				<graphic>
					<xsl:attribute name="xlink:href"><xsl:value-of select="url"/></xsl:attribute>
					<xsl:attribute name="position">float</xsl:attribute>
					<xsl:attribute name="orientation">portrait</xsl:attribute>
					<xsl:attribute name="xlink:type">simple</xsl:attribute>
				</graphic>
			</fig>
		</xsl:for-each>
	</xsl:template>
	<!--
		TABLES
	-->
	<xsl:template mode="tables" match="*">
		<xsl:for-each select="table">
			<table-wrap>
				<xsl:variable name="tabnum"><xsl:number/></xsl:variable>
				<xsl:attribute name="id"><xsl:text>T</xsl:text><xsl:value-of select="$tabnum"/></xsl:attribute>
				<xsl:attribute name="position">float</xsl:attribute>
				<xsl:attribute name="orientation">portrait</xsl:attribute>
				<label>Table <xsl:value-of select="$tabnum"/>.</label>
				<caption><xsl:copy-of select="title/node()"/></caption>
				<table>
					<xsl:for-each select="description/table">
						<xsl:for-each select="thead">
							<thead>
								<xsl:for-each select="tr">
								<tr>
									<xsl:for-each select="th">
										<th>
											<xsl:attribute name="rowspan">1</xsl:attribute>
											<xsl:attribute name="colspan">1</xsl:attribute>
											<xsl:copy-of select="node()"/>
										</th>
									</xsl:for-each>
								</tr>
								</xsl:for-each>
							</thead>
						</xsl:for-each>
						<xsl:for-each select="tbody">
							<tbody>
								<xsl:for-each select="tr">
								<tr>
									<xsl:for-each select="td">
										<td>
											<xsl:attribute name="rowspan">1</xsl:attribute>
											<xsl:attribute name="colspan">1</xsl:attribute>
											<xsl:copy-of select="node()"/>
										</td>
									</xsl:for-each>
								</tr>
								</xsl:for-each>
							</tbody>
						</xsl:for-each>
					</xsl:for-each>
				</table>
			</table-wrap>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
