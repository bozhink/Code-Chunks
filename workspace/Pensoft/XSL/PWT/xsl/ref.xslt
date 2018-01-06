<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"  xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
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
</xsl:stylesheet>
