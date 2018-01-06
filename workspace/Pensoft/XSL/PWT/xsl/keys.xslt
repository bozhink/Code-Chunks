<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"  xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
		<xsl:template mode="keys" match="*">
		<sec>
			<xsl:attribute name="sec-type">Identification Keys</xsl:attribute>
			<title>Identification Keys</title>
			<xsl:apply-templates mode="key" select="." />
		</sec>
	</xsl:template>

	<xsl:template mode="key" match="*">
			<xsl:for-each select="identification_key">
				<sec>
					<xsl:attribute name="sec-type"><xsl:value-of select="./fields/title/value"/></xsl:attribute>
					<title><xsl:copy-of select="./fields/title/value/p/node()"/></title>
					<table-wrap content-type="key" position="anchor" orientation="portrait">
						<table>
							<tbody>
							<xsl:for-each select="key_couplet">
								<tr>
									<td>
										<xsl:attribute name="rowspan">1</xsl:attribute>
										<xsl:attribute name="colspan">1</xsl:attribute>
										<xsl:number/>
									</td>
									<td>
										<xsl:attribute name="rowspan">1</xsl:attribute>
										<xsl:attribute name="colspan">1</xsl:attribute>
										<xsl:copy-of select="./fields/thesis/value/p/node()" />
									</td>
									<td>
										<xsl:attribute name="rowspan">1</xsl:attribute>
										<xsl:attribute name="colspan">1</xsl:attribute>
										<xsl:if test="./fields/thesis_taxon_name/value/p != '' ">
											<xsl:copy-of select="./fields/thesis_taxon_name/value/p/node()" />
											<xsl:if test="./fields/thesis_next_couplet/value != '' ">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="./fields/thesis_next_couplet/value != '' ">
											<xsl:copy-of select="./fields/thesis_next_couplet/value/node()" />
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:attribute name="rowspan">1</xsl:attribute>
										<xsl:attribute name="colspan">1</xsl:attribute>
										<xsl:text>–</xsl:text>
									</td>
									<td>
										<xsl:attribute name="rowspan">1</xsl:attribute>
										<xsl:attribute name="colspan">1</xsl:attribute>
										<xsl:copy-of select="./fields/antithesis/value/p/node()" />
									</td>
									<td>
										<xsl:attribute name="rowspan">1</xsl:attribute>
										<xsl:attribute name="colspan">1</xsl:attribute>
										<xsl:if test="./fields/antithesis_taxon_name/value/p != '' ">
											<xsl:copy-of select="./fields/antithesis_taxon_name/value/p/node()" />
											<xsl:if test="./fields/antithesis_next_couplet/value != '' ">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="./fields/antithesis_next_couplet/value != '' ">
											<xsl:copy-of select="./fields/antithesis_next_couplet/value/node()" />
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
							</tbody>
						</table>
					</table-wrap>
				</sec>
			</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
