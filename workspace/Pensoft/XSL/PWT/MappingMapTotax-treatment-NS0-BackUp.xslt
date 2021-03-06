<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2013r2

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
	<xsl:template match="/">
		<article xmlns:tp="http://www.plazi.org/taxpub" xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:for-each select="document">
				<xsl:variable name="var1_resultof_first" select="objects"/>
				<xsl:variable name="var2_displayname" select="$var1_resultof_first/material_and_methods/@display_name"/>
				<xsl:variable name="var3_displayname" select="$var1_resultof_first/introduction/@display_name"/>
				<xsl:variable name="var4_displayname">
					<xsl:if test="$var1_resultof_first/material_and_methods/@display_name">
						<xsl:value-of select="'1'"/>
					</xsl:if>
				</xsl:variable>
				<xsl:variable name="var5_resultof_exists" select="boolean(string($var4_displayname))"/>
				<xsl:variable name="var6_displayname">
					<xsl:if test="$var1_resultof_first/introduction/@display_name">
						<xsl:value-of select="'1'"/>
					</xsl:if>
				</xsl:variable>
				<xsl:variable name="var7_resultof_exists" select="boolean(string($var6_displayname))"/>
				<xsl:variable name="var8_resultof_first" select="$var1_resultof_first/article_metadata/abstract_and_keywords/fields"/>
				<xsl:variable name="var9_resultof_first" select="$var8_resultof_first/keywords"/>
				<xsl:variable name="var10_fieldname" select="$var9_resultof_first/@field_name"/>
				<xsl:variable name="var11_id" select="$var9_resultof_first/@id"/>
				<xsl:variable name="var12_fieldname" select="$var8_resultof_first/abstract/@field_name"/>
				<front>
					<article-meta>
						<contrib-group>
							<xsl:for-each select="$var1_resultof_first/article_metadata/title_and_authors/author">
								<xsl:variable name="var13_resultof_first" select="fields"/>
								<xsl:variable name="var14_resultof_cast" select="string($var13_resultof_first/e-mail/value)"/>
								<contrib>
									<name>
										<surname>
											<xsl:value-of select="string($var13_resultof_first/last_name/value)"/>
										</surname>
										<given-names>
											<xsl:value-of select="string($var13_resultof_first/first_name/value)"/>
										</given-names>
										<prefix>
											<xsl:value-of select="string($var13_resultof_first/salutation/value)"/>
										</prefix>
									</name>
									<address>
										<email>
											<xsl:value-of select="$var14_resultof_cast"/>
										</email>
									</address>
									<aff>
										<addr-line>
											<xsl:for-each select="address">
												<xsl:variable name="var15_resultof_cast" select="string(fields/country/value)"/>
												<country>
													<xsl:value-of select="$var15_resultof_cast"/>
												</country>
											</xsl:for-each>
											<xsl:for-each select="address">
												<xsl:variable name="var16_resultof_cast" select="string(fields/affiliation/value)"/>
												<institution>
													<xsl:value-of select="$var16_resultof_cast"/>
												</institution>
											</xsl:for-each>
										</addr-line>
										<xsl:for-each select="address">
											<xsl:variable name="var17_resultof_cast" select="string(fields/country/value)"/>
											<country>
												<xsl:value-of select="$var17_resultof_cast"/>
											</country>
										</xsl:for-each>
										<xsl:for-each select="address">
											<xsl:variable name="var18_resultof_cast" select="string(fields/affiliation/value)"/>
											<institution>
												<xsl:value-of select="$var18_resultof_cast"/>
											</institution>
										</xsl:for-each>
										<email>
											<xsl:value-of select="$var14_resultof_cast"/>
										</email>
									</aff>
								</contrib>
							</xsl:for-each>
						</contrib-group>
						<xsl:variable name="var19_fieldname">
							<xsl:if test="$var8_resultof_first/abstract/@field_name">
								<xsl:value-of select="'1'"/>
							</xsl:if>
						</xsl:variable>
						<abstract>
							<xsl:if test="string(boolean(string($var19_fieldname))) != 'false'">
								<label>
									<xsl:value-of select="string($var12_fieldname)"/>
								</label>
							</xsl:if>
						</abstract>
						<kwd-group>
							<xsl:variable name="var20_id">
								<xsl:if test="$var9_resultof_first/@id">
									<xsl:value-of select="'1'"/>
								</xsl:if>
							</xsl:variable>
							<xsl:if test="string(boolean(string($var20_id))) != 'false'">
								<xsl:attribute name="id">
									<xsl:value-of select="string(number(string($var11_id)))"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:variable name="var21_fieldname">
								<xsl:if test="$var9_resultof_first/@field_name">
									<xsl:value-of select="'1'"/>
								</xsl:if>
							</xsl:variable>
							<xsl:if test="string(boolean(string($var21_fieldname))) != 'false'">
								<label>
									<xsl:value-of select="string($var10_fieldname)"/>
								</label>
							</xsl:if>
						</kwd-group>
					</article-meta>
				</front>
				<body>
					<!--<sec>
						<xsl:if test="string((string((string($var7_resultof_exists) != 'false')) != 'false')) != 'false'">
							<xsl:attribute name="sec-type">
								<xsl:value-of select="string($var3_displayname)"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="string((string((string($var7_resultof_exists) != 'false')) != 'false')) != 'false'">
							<title>
								<xsl:value-of select="string($var3_displayname)"/>
							</title>
						</xsl:if>
					</sec>-->
					<xsl:apply-templates mode="section" select="$var1_resultof_first/introduction" >
						<xsl:with-param name="title">Introduction</xsl:with-param>
					</xsl:apply-templates>
					<!--<sec sec-type="Introduction">
						<title>Introduction</title>
						<xsl:apply-templates mode="p" select="$var1_resultof_first/introduction/fields/introduction/value" />
						
					</sec>-->
					<!--<sec>
						<xsl:apply-templates mode="p" select="$var1_resultof_first/material_and_methods/fields/materials/value" />
						<xsl:if test="string((string((string($var5_resultof_exists) != 'false')) != 'false')) != 'false'">
							<xsl:attribute name="sec-type">
								<xsl:value-of select="string($var2_displayname)"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="string((string((string($var5_resultof_exists) != 'false')) != 'false')) != 'false'">
							<title>
								<xsl:value-of select="string($var2_displayname)"/>
							</title>
						</xsl:if>
					</sec>
-->				</body>
			</xsl:for-each>
		</article>
	</xsl:template>

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
					<title><xsl:copy-of select="./fields/enter_title_of_this_subsection/value"/></title>
					<xsl:apply-templates mode="p" select="./fields/*/value" />
				</sec>
			</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="p" mode="p"><p><xsl:copy-of select="."/></p></xsl:template>
</xsl:stylesheet>
