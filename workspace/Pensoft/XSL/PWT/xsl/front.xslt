<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"  xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
	<xsl:import href="classification.xslt"/>
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
	<xsl:template mode="front" match="*">
		<front>
			<xsl:apply-templates mode="journal-meta" select="/"/>
			<article-meta>
				<article-id pub-id-type="doi">10.3897/xxx.000.0000</article-id>
				<article-categories>
					<xsl:for-each select="classifications/fields">
							<xsl:apply-templates mode="classification" select="taxon_classification"/>
							<xsl:apply-templates mode="classification" select="subject_classification"/>
							<xsl:apply-templates mode="classification" select="chronological_classification"/>
							<xsl:apply-templates mode="classification" select="geographical_classification"/>
					</xsl:for-each>
				</article-categories>
				<title-group>
					<article-title><xsl:copy-of select="title_and_authors/fields/title/value/p/node()"/></article-title>
				</title-group>
				
				<xsl:apply-templates mode="front-authors" select="."/>
				<xsl:apply-templates mode="front-editors" select="."/>
				
				<!--<aff id="A1">
					<label>1</label>
				</aff>
				<aff id="A2">
					<label>2</label>
				</aff>-->
				<author-notes>
					<fn>
						<xsl:attribute name="fn-type">corresp</xsl:attribute>
						<p>
							<xsl:text>Corresponding author: </xsl:text>
							<xsl:for-each select="title_and_authors/author">
								<xsl:choose>
									<xsl:when test="fields/corresponding_author='Mark as Corresponding author'">
										<xsl:apply-templates mode="getname" select="fields"/>
										<xsl:text> (</xsl:text>
										<email xlink:type="simple"><xsl:value-of select="fields/e-mail"/></email>
										<xsl:text>)</xsl:text>
										<xsl:text>, </xsl:text>
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
						</p>
					</fn>
					<fn>
						<xsl:attribute name="fn-type">edited-by</xsl:attribute>
						<p>Academic editor: </p>
					</fn>
				</author-notes>
				<pub-date pub-type="collection">
					<year>2013</year>
				</pub-date>
				<pub-date pub-type="epub">
					<day>1</day>
					<month>1</month>
					<year>2013</year>
				</pub-date>
				<issue>1000</issue>
				<fpage>1</fpage>
				<lpage>20</lpage>
				<history>
					<date date-type="received">
						<day>1</day>
						<month>1</month>
						<year>2013</year>
					</date>
					<date date-type="accepted">
						<day>1</day>
						<month>1</month>
						<year>2013</year>
					</date>
				</history>
				<permissions>
					<copyright-statement>
						<xsl:for-each select="title_and_authors/author">
							<xsl:apply-templates mode="getname" select="fields"/>
							<xsl:text>, </xsl:text>
						</xsl:for-each>
					</copyright-statement>
					<license license-type="creative-commons-attribution" xlink:href="http://creativecommons.org/licenses/by/3.0" xlink:type="simple">
						<license-p>This is an open access article distributed under the terms of the Creative Commons Attribution License 3.0 (CC-BY), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.</license-p>
					</license>
				</permissions>
				<self-uri content-type="lsid" xlink:type="simple">urn:lsid:zoobank.org:pub:</self-uri>
				<xsl:for-each select="abstract_and_keywords/fields">
					<abstract>
						<label>Abstract</label>
						<xsl:apply-templates mode="p" select="abstract"/>
					</abstract>
					<kwd-group>
						<label>Keywords</label>
						<kwd><xsl:copy-of select="keywords/value/p/node()"/></kwd>
					</kwd-group>
				</xsl:for-each>
				<xsl:for-each select="funding_agencies/fields">
					<funding-group>
						<xsl:for-each select="supporting_agencies">
							<funding-statement><xsl:value-of select="value"/></funding-statement>
						</xsl:for-each>
					</funding-group>
				</xsl:for-each>
			</article-meta>
		</front>
	</xsl:template>
	
	<xsl:template mode="getname" match="*">
		<xsl:value-of select="first_name"/>
		<xsl:if test="middle_name/value!=''">
			<xsl:text> </xsl:text>
			<xsl:value-of select="middle_name/value"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:value-of select="last_name"/>
	</xsl:template>
	<xsl:template mode="corresp" match="*">
		<xsl:for-each select="/document/objects/article_metadata/title_and_authors/author">
			<xsl:choose>
				<xsl:when test="fields/corresponding_author='Mark as Corresponding author'">
					<xsl:apply-templates mode="getname" select="fields"/>
					<xsl:text> (</xsl:text>
					<email xlink:type="simple"><xsl:value-of select="fields/e-mail"/></email>
					<xsl:text>)</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>		
	</xsl:template>
	
	
	<xsl:template mode="journal-meta" match="*">
		<journal-meta>
			<journal-id journal-id-type="publisher-id"><xsl:value-of select="/document/document_info/journal_name"/></journal-id>
			<journal-title-group>
				<journal-title xml:lang="en"><xsl:value-of select="/document/document_info/journal_name"/></journal-title>
				<abbrev-journal-title xml:lang="en"><xsl:value-of select="/document/document_info/journal_name"/></abbrev-journal-title>
			</journal-title-group>
			<issn pub-type="ppub">0000-0000</issn>
			<issn pub-type="epub">0000-0000</issn>
			<publisher>
				<publisher-name>Pensoft Publishers</publisher-name>
			</publisher>
		</journal-meta>
	</xsl:template>
	
	<xsl:template mode="front-authors" match="*">
		<contrib-group>
			<xsl:attribute name="content-type">authors</xsl:attribute>
			<xsl:for-each select="title_and_authors/author">
				<contrib>
					<xsl:attribute name="contrib-type">author</xsl:attribute>
					<xsl:attribute name="corresp">
						<xsl:choose>
							<xsl:when test="fields/corresponding_author='Mark as Corresponding author'">yes</xsl:when>
							<xsl:otherwise>no</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<name>
						<xsl:attribute name="name-style">western</xsl:attribute>
						<surname>
							<xsl:value-of select="fields/last_name/value"/>
						</surname>
						<given-names>
							<xsl:value-of select="fields/first_name/value"/>
							<xsl:if test="fields/middle_name!=''">
								<xsl:text> </xsl:text>
								<xsl:value-of select="fields/middle_name/value"/>
							</xsl:if>
						</given-names>
						<xsl:if test="fields/salutation!=''">
							<prefix>
								<xsl:value-of select="fields/salutation/value"/>
							</prefix>
						</xsl:if>
					</name>
					<xsl:for-each select="fields/e-mail">
						<email>
							<xsl:attribute name="xlink:type">simple</xsl:attribute>
							<xsl:value-of select="value"/>
						</email>
					</xsl:for-each>
					<xsl:for-each select="fields/rights">
						<author-comment>
							<title><xsl:value-of select="@field_name"/></title>
							<p><xsl:value-of select="value"/></p>
						</author-comment>
					</xsl:for-each>
					<xsl:for-each select="address">
						<aff>
							<addr-line>
								<institution>
									<xsl:value-of select="fields/affiliation/value"/>
								</institution>
								<xsl:text>, </xsl:text>
								<xsl:value-of select="fields/city/value"/>
								<xsl:text>, </xsl:text>
								<country>
									<xsl:value-of select="fields/country/value"/>
								</country>
							</addr-line>
							<country>
								<xsl:value-of select="fields/country/value"/>
							</country>
							<institution>
								<xsl:value-of select="fields/affiliation/value"/>
							</institution>
						</aff>
					</xsl:for-each>
				</contrib>
			</xsl:for-each>
		</contrib-group>
	</xsl:template>
	
	<xsl:template mode="front-editors" match="*">
		<contrib-group>
			<xsl:attribute name="content-type">editors</xsl:attribute>
			<xsl:for-each select="contributors/contributor">
				<contrib>
					<xsl:attribute name="contrib-type">editor</xsl:attribute>
					<name>
						<xsl:attribute name="name-style">western</xsl:attribute>
						<surname>
							<xsl:value-of select="fields/last_name/value"/>
						</surname>
						<given-names>
							<xsl:value-of select="fields/first_name/value"/>
							<xsl:if test="fields/middle_name!=''">
								<xsl:text> </xsl:text>
								<xsl:value-of select="fields/middle_name/value"/>
							</xsl:if>
						</given-names>
						<xsl:if test="fields/salutation!=''">
							<prefix>
								<xsl:value-of select="fields/salutation/value"/>
							</prefix>
						</xsl:if>
					</name>
					<xsl:for-each select="fields/e-mail">
						<email>
							<xsl:attribute name="xlink:type">simple</xsl:attribute>
							<xsl:value-of select="value"/>
						</email>
					</xsl:for-each>
					<xsl:for-each select="fields/role">
						<role><xsl:value-of select="value"/></role>
					</xsl:for-each>
					<xsl:for-each select="fields/rights">
						<author-comment>
							<title><xsl:value-of select="@field_name"/></title>
							<p><xsl:value-of select="value"/></p>
						</author-comment>
					</xsl:for-each>
					<xsl:for-each select="address">
						<aff>
							<addr-line>
								<institution>
									<xsl:value-of select="fields/affiliation/value"/>
								</institution>
								<xsl:text>, </xsl:text>
								<xsl:value-of select="fields/city/value"/>
								<xsl:text>, </xsl:text>
								<country>
									<xsl:value-of select="fields/country/value"/>
								</country>
							</addr-line>
							<country>
								<xsl:value-of select="fields/country/value"/>
							</country>
							<institution>
								<xsl:value-of select="fields/affiliation/value"/>
							</institution>
						</aff>
					</xsl:for-each>
				</contrib>
			</xsl:for-each>
		</contrib-group>
	</xsl:template>
</xsl:stylesheet>
