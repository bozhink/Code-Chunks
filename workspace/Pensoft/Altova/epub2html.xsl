<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:cnt="urn:oasis:names:tc:opendocument:xmlns:container" xmlns:opf="http://www.idpf.org/2007/opf" xmlns:ncx="http://www.daisy.org/z3986/2005/ncx/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:altovaext="http://www.altova.com/xslt-extensions">
	<xsl:param name="destination-uri" select="altovaext:get-temp-folder()"/>

	<xsl:output method="xhtml" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

	<xsl:variable name="epub-uri" select="document-uri(.)"/>
	<xsl:variable name="container-uri" select="altovaext:expand-epub-uri( 'META-INF/container.xml' )"/>
	<xsl:variable name="opf-uri" select="altovaext:expand-epub-uri( document( $container-uri )/cnt:container/cnt:rootfiles/cnt:rootfile/@full-path )"/>
	<xsl:variable name="opf-dir" select="concat( string-join( remove( tokenize( $opf-uri, '/' ), count( tokenize( $opf-uri, '/' ) ) ), '/' ), '/' )"/>
	<xsl:variable name="opf" select="document( $opf-uri )"/>
	<xsl:variable name="ncx-uri" select="altovaext:expand-uri( $opf-dir, $opf/opf:package/opf:manifest/opf:item[ @id='ncx' ]/@href )"/>
	<xsl:variable name="ncx" select="document( $ncx-uri )"/>

	<!-- Expands given path with the enclosing epub document location. -->
	<xsl:function name="altovaext:expand-epub-uri">
		<xsl:param name="relative-uri"/>
		<xsl:value-of select="concat( $epub-uri, '|zip\', $relative-uri )"/>
	</xsl:function>

	<xsl:function name="altovaext:expand-uri">
		<xsl:param name="root-uri"/>
		<xsl:param name="relative-uri"/>
		<xsl:value-of select="concat( $root-uri, $relative-uri )"/>
	</xsl:function>

	<!-- Extract each content item to a temporary location -->
	<xsl:template match="opf:item">
		<xsl:result-document href="{altovaext:expand-uri( $destination-uri, @href )}" method="text" encoding="base64tobinary">
			<xsl:value-of select="unparsed-text( altovaext:expand-uri( $opf-dir, @href ), 'binarytobase64' )"/>
		</xsl:result-document>
	</xsl:template>

	<!-- Output the metadata information like title and author -->
	<xsl:template match="opf:metadata">
		<div class="Title"><xsl:value-of select="dc:title"/></div>
		<div class="Author"><xsl:value-of select="dc:creator"/></div>
		<br/>
		<br/>
	</xsl:template>

	<!-- Output the table of contents of the complete epub -->
	<xsl:template match="ncx:navPoint">
		<xsl:param name="class" select="'navPoint'"/>
		<li>
			<a target="content" class="{$class}">
				<xsl:attribute name="href" select="altovaext:expand-uri( $destination-uri, ncx:content/@src )"/>
				<xsl:value-of select="ncx:navLabel/ncx:text/text()"/>
			</a>
			<!-- Also output any 'sub' navigation points recursively -->
			<xsl:if test="ncx:navPoint">
				<ul>
					<xsl:apply-templates select="ncx:navPoint">
						<xsl:with-param name="class" select="'navPointSub'"/>
						<xsl:sort select="@playOrder" data-type="number"/>
					</xsl:apply-templates>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>

	<!-- Generates TOC document for a given epub. -->
	<xsl:template name="toc">
		<xsl:result-document href="{altovaext:expand-uri( $destination-uri, 'altova_toc.html' )}">
			<html>
				<head>
					<style type="text/css"> .navPoint { font-family: Arial; font-size: 10pt; font-weight: bold; }</style>
					<style type="text/css"> .navPointSub { font-family: Arial; font-size: 8pt; }</style>
					<style type="text/css"> .Title { font-family: Arial; font-size: 16pt; font-weight: bold; color: black; text-align: center; margin-top: 20px; }</style>
					<style type="text/css"> .Author { font-family: Arial; font-size: 12pt; font-weight: bold; color: black; text-align: center; font-style: italic; }</style>
					<title/>
				</head>
				<body>
					<xsl:apply-templates select="$opf/opf:package/opf:metadata"/>
					<ul>
						<xsl:apply-templates select="$ncx/ncx:ncx/ncx:navMap/ncx:navPoint">
							<xsl:sort select="@playOrder" data-type="number"/>
						</xsl:apply-templates>
					</ul>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>

	<!-- Generates a HTML preview document for a given epub. -->
	<xsl:template match="/">

		<!-- extract all epub content to temporary location -->
		<xsl:apply-templates select="$opf/opf:package/opf:manifest/opf:item"/>

		<!-- create the toc html which is displayed in the left frame -->
		<xsl:call-template name="toc"/>

		<html>
			<frameset cols="25%, 75%">
				<frame src="altova_toc.html" name="toc"/>
				<frame src="{$ncx/ncx:ncx/ncx:navMap//ncx:navPoint[@playOrder = 1]/ncx:content/@src}" name="content"/>
			</frameset>
		</html>
	</xsl:template>
</xsl:stylesheet>
