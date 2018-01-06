<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"  xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
	<xsl:template match="/">
		<article article-type="research-article" xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
			<xsl:for-each select="document">
				<xsl:for-each select="objects">
					<!--
					FRONT
					-->
					<front>
						<xsl:for-each select="article_metadata">
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
							<article-meta>
								<article-id pub-id-type="doi">10.3897/xxx.000.0000</article-id>
								<article-categories>
									<subj-group>
										<subject><xsl:value-of select="/document/document_info/document_type"/></subject>
									</subj-group>
								</article-categories>
								<title-group>
									<article-title><xsl:copy-of select="title_and_authors/fields/title/value/p/node()"/></article-title>
								</title-group>
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
								<xsl:for-each select="classifications/fields">
									<custom-meta-group>
										<xsl:apply-templates mode="classification" select="taxon_classification"/>
										<xsl:apply-templates mode="classification" select="subject_classification"/>
										<xsl:apply-templates mode="classification" select="chronological_classification"/>
										<xsl:apply-templates mode="classification" select="geographical_classification"/>
									</custom-meta-group>
								</xsl:for-each>
							</article-meta>
						</xsl:for-each>
					</front>
					<!--
					BODY
					-->
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
					<!--
					BACK
					-->
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
				</xsl:for-each>
				<!--
				FLOATS
				-->
				<floats-group>
					<xsl:apply-templates mode="figures" select="/document/figures"/>
					<xsl:apply-templates mode="tables" select="/document/tables"/>
				</floats-group>
			</xsl:for-each>
		</article>
	</xsl:template>
	
	<xsl:template mode="classification" match="*">
		<xsl:if test="node() != ''">
			<custom-meta>
				<meta-name><xsl:value-of select="@field_name"/></meta-name>
				<meta-value>
					<xsl:for-each select="value">
						<xsl:text> "</xsl:text><xsl:value-of select="."/><xsl:text>" </xsl:text>
					</xsl:for-each>
				</meta-value>
			</custom-meta>
		</xsl:if>
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
					<title><xsl:copy-of select="./fields/enter_title_of_this_subsection/value/node()"/></title>
					<xsl:apply-templates mode="p" select="./fields/content/value" />
				</sec>
			</xsl:for-each>
	</xsl:template>
	<xsl:template match="p" mode="p">
		<xsl:copy-of select="."/>
	</xsl:template>
	
	
	<xsl:template mode="systematics" match="*">
		<sec>
			<xsl:attribute name="sec-type">Systematics</xsl:attribute>
			<title>Systematics</title>
			
		</sec>
	</xsl:template>
	
	
	
	
	
	
	
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
	
	<xsl:template mode="reference" match="*">
		<xsl:for-each select="reference">
			<ref>
				<xsl:attribute name="id">B<xsl:number/></xsl:attribute>
				<mixed-citation>
					<xsl:attribute name="xlink:type">simple</xsl:attribute>
					<xsl:apply-templates mode="ref-book-biblio" select="biblio_reference_wrapper/book_biblio_reference"/>
					<xsl:apply-templates mode="ref-book-chapter-biblio" select="biblio_reference_wrapper/book_chapter_biblio_reference"/>
					<xsl:apply-templates mode="ref-conference-paper" select="biblio_reference_wrapper/conference_paper"/>
					<xsl:apply-templates mode="ref-conference-proceedings-biblio" select="biblio_reference_wrapper/conference_proceedings_biblio_reference"/>
					<xsl:apply-templates mode="ref-journal-article-biblio" select="biblio_reference_wrapper/journal_article_biblio_reference"/>
					<xsl:apply-templates mode="ref-software-biblio" select="biblio_reference_wrapper/software_biblio_reference"/>
					<xsl:apply-templates mode="ref-thesis-biblio" select="biblio_reference_wrapper/thesis_biblio_reference"/>
					<xsl:apply-templates mode="ref-website-biblio" select="biblio_reference_wrapper/website_biblio_reference"/>
				</mixed-citation>
			</ref>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="ref-book-biblio" match="*">
		<xsl:apply-templates mode="ref-author-name" select="authors"/>
		<xsl:apply-templates mode="ref-year" select="."/>
		<xsl:apply-templates mode="ref-book-title" select="."/>
		<xsl:apply-templates mode="ref-translated-title" select="."/>
		<xsl:apply-templates mode="ref-edition" select="."/>
		<xsl:apply-templates mode="ref-volume" select="."/>
		<xsl:apply-templates mode="ref-publisher-name" select="."/>
		<xsl:apply-templates mode="ref-publisher-loc" select="."/>
		<xsl:apply-templates mode="ref-number-of-pages" select="."/>
		<xsl:apply-templates mode="ref-lang" select="."/>
		<xsl:apply-templates mode="ref-uri" select="."/>
		<xsl:apply-templates mode="ref-isbn" select="."/>
		<xsl:apply-templates mode="ref-doi" select="."/>
	</xsl:template>
	<xsl:template mode="ref-book-chapter-biblio" match="*">
		<xsl:apply-templates mode="ref-author-name" select="authors_reference"/>
		<xsl:apply-templates mode="ref-year" select="."/>
		<chapter-title><xsl:copy-of select="fields/chapter_title/value/node()"/></chapter-title>
		<xsl:text> In: </xsl:text>
		<xsl:apply-templates mode="ref-editor-name" select="series_editors"/>
		<xsl:apply-templates mode="ref-book-title" select="."/>
		<xsl:apply-templates mode="ref-edition" select="."/>
		<xsl:apply-templates mode="ref-volume" select="."/>
		<xsl:apply-templates mode="ref-publisher-name" select="."/>
		<xsl:apply-templates mode="ref-publisher-loc" select="."/>
		<xsl:apply-templates mode="ref-number-of-pages" select="."/>
		<xsl:apply-templates mode="ref-lang" select="."/>
		<xsl:apply-templates mode="ref-uri" select="."/>
		<xsl:apply-templates mode="ref-isbn" select="."/>
		<xsl:apply-templates mode="ref-doi" select="."/>
	</xsl:template>
	<xsl:template mode="ref-journal-article-biblio" match="*">
		<xsl:apply-templates mode="ref-author-name" select="authors_reference"/>
		<xsl:apply-templates mode="ref-year" select="."/>
		<xsl:apply-templates mode="ref-article-title" select="."/>
		<xsl:if test="fields/journal/value/node()!=''"><source><xsl:copy-of select="fields/journal/value/node()"/></source></xsl:if>
		<xsl:apply-templates mode="ref-volume" select="."/>
		<xsl:if test="fields/issue != ''">
			<xsl:text> (</xsl:text><issue><xsl:value-of select="fields/issue"/></issue><xsl:text>)</xsl:text>
			<xsl:if test="fields/first_page != ''"><xsl:text>:</xsl:text></xsl:if>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="fields/first_page != ''">
			<fpage><xsl:value-of select="fields/first_page"/></fpage>
			<xsl:if test="fields/last_page != '' "><xsl:text>–</xsl:text></xsl:if>
		</xsl:if>
		<xsl:if test="fields/last_page != '' ">
			<lpage><xsl:value-of select="fields/last_page"/></lpage>
		</xsl:if>
		<xsl:apply-templates mode="ref-lang" select="."/>
		<xsl:apply-templates mode="ref-uri" select="."/>
		<xsl:apply-templates mode="ref-doi" select="."/>
	</xsl:template>
	<xsl:template mode="ref-conference-paper" match="*">
		<xsl:apply-templates mode="ref-author-name" select="authors_reference"/>
		<xsl:apply-templates mode="ref-year" select="."/>
		<xsl:apply-templates mode="ref-editor-name" select="series_editors"/>
		<xsl:apply-templates mode="ref-book-title" select="."/>
		<xsl:apply-templates mode="ref-volume" select="."/>
		<xsl:apply-templates mode="ref-conference" select="."/>
		<xsl:apply-templates mode="ref-number-of-pages" select="."/>
		<xsl:apply-templates mode="ref-lang" select="."/>
		<xsl:apply-templates mode="ref-uri" select="."/>
		<xsl:apply-templates mode="ref-isbn" select="."/>
		<xsl:apply-templates mode="ref-doi" select="."/>
	</xsl:template>
	<xsl:template mode="ref-conference-proceedings-biblio" match="*">
		<xsl:apply-templates mode="ref-author-name" select="authors"/>
		<xsl:apply-templates mode="ref-year" select="."/>
		<xsl:apply-templates mode="ref-book-title" select="."/>
		<xsl:apply-templates mode="ref-volume" select="."/>
		<xsl:apply-templates mode="ref-conference" select="."/>
		<xsl:apply-templates mode="ref-number-of-pages" select="."/>
		<xsl:apply-templates mode="ref-lang" select="."/>
		<xsl:apply-templates mode="ref-uri" select="."/>
		<xsl:apply-templates mode="ref-isbn" select="."/>
		<xsl:apply-templates mode="ref-doi" select="."/>
	</xsl:template>
	<xsl:template mode="ref-thesis-biblio" match="*">
		<xsl:apply-templates mode="ref-author-name" select="authors_reference_biblio"/>
		<xsl:apply-templates mode="ref-year" select="."/>
		<xsl:apply-templates mode="ref-book-title" select="."/>
		<xsl:apply-templates mode="ref-translated-title" select="."/>
		<xsl:apply-templates mode="ref-publisher-name" select="."/>
		<xsl:apply-templates mode="ref-publisher-loc" select="."/>
		<xsl:apply-templates mode="ref-number-of-pages" select="."/>
		<xsl:apply-templates mode="ref-lang" select="."/>
		<xsl:apply-templates mode="ref-uri" select="."/>
		<xsl:apply-templates mode="ref-isbn" select="."/>
		<xsl:apply-templates mode="ref-doi" select="."/>
	</xsl:template>
	<xsl:template mode="ref-software-biblio" match="*">
		<xsl:apply-templates mode="ref-author-name" select="authors_reference"/>
		<xsl:apply-templates mode="ref-year" select="."/>
		<xsl:apply-templates mode="ref-title" select="."/>
		<xsl:apply-templates mode="ref-publisher-name" select="."/>
		<xsl:if test="fields/release_date!=''">
			<comment>
				<xsl:text> [released </xsl:text>
				<xsl:value-of select="fields/release_date"/>
				<xsl:text>] </xsl:text>
			</comment>
		</xsl:if>
		<xsl:apply-templates mode="ref-uri" select="."/>
	</xsl:template>
	<xsl:template mode="ref-website-biblio" match="*">
		<xsl:apply-templates mode="ref-title" select="."/>
		<xsl:apply-templates mode="ref-uri" select="."/>
		<xsl:if test="fields/access_date!=''">
			<comment>
				<xsl:text> [accessed </xsl:text>
				<xsl:value-of select="fields/access_date/value"/>
				<xsl:text>] </xsl:text>
			</comment>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-author-name" match="*">
		<person-group person-group-type="author">
			<xsl:for-each select="reference_author">
				<name>
					<xsl:attribute name="name-style">western</xsl:attribute>
					<surname><xsl:value-of select="fields/last_name/value"/></surname>
					<given-names>
						<xsl:value-of select="fields/first_name/value"/>
						<xsl:if test="fields/middle_name/value != '' ">
							<xsl:text> </xsl:text>
							<xsl:value-of select="fields/middle_name" />
						</xsl:if>
					</given-names>
				</name>
			</xsl:for-each>
		</person-group>
	</xsl:template>
	<xsl:template mode="ref-editor-name" match="*">
		<xsl:if test=". != '' ">
			<person-group person-group-type="editor">
				<xsl:for-each select="reference_editor">
					<name>
						<xsl:attribute name="name-style">western</xsl:attribute>
						<surname><xsl:value-of select="fields/last_name/value"/></surname>
						<given-names>
							<xsl:value-of select="fields/first_name/value"/>
							<xsl:if test="fields/middle_name/value != '' ">
								<xsl:text> </xsl:text>
								<xsl:value-of select="fields/middle_name" />
							</xsl:if>
						</given-names>
					</name>
				</xsl:for-each>
			</person-group>
			<xsl:choose>
				<xsl:when test="count(reference_editor) = 1">
					<xsl:text> (</xsl:text><role>Ed.</role><xsl:text>) </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> (</xsl:text><role>Eds</role><xsl:text>) </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-year" match="*">
		<xsl:if test="fields/year_of_publication != '' ">
			<xsl:text> (</xsl:text>
			<year><xsl:value-of select="fields/year_of_publication"/></year>
			<xsl:text>) </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-book-title" match="*">
		<xsl:if test="fields/book_title != '' ">
			<article-title>
				<xsl:copy-of select="fields/book_title/value/node()"/>
			</article-title>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-article-title" match="*">
		<xsl:if test="fields/article_title != '' ">
			<article-title>
				<xsl:copy-of select="fields/article_title/value/node()"/>
			</article-title>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-title" match="*">
		<xsl:if test="fields/title != '' ">
			<article-title>
				<xsl:copy-of select="fields/title/value/node()"/>
			</article-title>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-translated-title" match="*">
		<xsl:if test="fields/translated_title != '' ">
			<xsl:text> [</xsl:text>
			<trans-title><xsl:copy-of select="fields/translated_title/value/node()"/></trans-title>
			<xsl:text>] </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-edition" match="*">
		<xsl:if test="fields/edition != '' ">
			<edition><xsl:value-of select="fields/edition"/></edition>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-volume" match="*">
		<xsl:if test="fields/volume != '' ">
			<volume><xsl:value-of select="fields/volume"/></volume>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-number-of-pages" match="*">
		<xsl:if test="fields/number_of_pages != '' ">
			<lpage><xsl:value-of select="fields/number_of_pages"/></lpage>
			<xsl:text> pp. </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-publisher-name" match="*">
		<xsl:if test="fields/publisher">
			<publisher-name><xsl:copy-of select="fields/publisher/value/node()"/></publisher-name>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-publisher-loc" match="*">
		<xsl:if test="fields/city">
			<publisher-loc><xsl:copy-of select="fields/city/value/node()"/></publisher-loc>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-uri" match="*">
		<xsl:if test="fields/url != '' ">
			<uri><xsl:value-of select="fields/url/value"/></uri>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-isbn" match="*">
		<xsl:if test="fields/isbn != '' ">
			<xsl:text> ISBN: </xsl:text>
			<isbn><xsl:value-of select="fields/isbn/value"/></isbn>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-doi" match="*">
		<xsl:if test="fields/doi != '' ">
			<xsl:text> doi: </xsl:text>
			<ext-link>
				<xsl:attribute name="ext-link-type">uri</xsl:attribute>
				<xsl:attribute name="xlink:href"><xsl:text>http://dx.doi.org/</xsl:text><xsl:value-of select="fields/doi"/></xsl:attribute>
				<xsl:attribute name="xlink:type">simple</xsl:attribute>
				<xsl:value-of select="fields/doi/value"/>
			</ext-link>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ref-conference" match="*">
		<source>
			<xsl:if test="fields/conference_name/value/node() != '' ">
				<xsl:copy-of select="fields/conference_name/value/node()"/>
				<xsl:if test="fields/conference_location/value/node()!=''">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:if>
			<xsl:if test="fields/conference_location/value/node()!=''">
					<xsl:value-of select="fields/conference_location/value"/>
			    <xsl:if test="fields/conference_date!=''">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:if>
			<xsl:if test="fields/conference_date/value/node()!=''">
				<xsl:copy-of select="fields/conference_date/value/node()"/>
			</xsl:if>
		</source>	
	</xsl:template>
	<xsl:template mode="ref-lang" match="*">
		<xsl:if test="fields/publication_language/value!=''">
			<xsl:text> [In </xsl:text>
			<xsl:value-of select="fields/publication_language/value"/>
			<xsl:text>] </xsl:text>
		</xsl:if>
	</xsl:template>
	
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
</xsl:stylesheet>
