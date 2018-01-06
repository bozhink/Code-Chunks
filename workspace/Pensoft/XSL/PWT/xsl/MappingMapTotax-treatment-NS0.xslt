<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"  xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
	<xsl:import href="front.xslt"/>
	<xsl:import href="body.xslt"/>
	<xsl:import href="back.xslt"/>
	<xsl:import href="floats.xslt"/>
	
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="C:/Users/Bozhin Karaivanov/Documents/TaxPub-master/tax-treatment-NS0.dtd"/>
	
	<xsl:template match="/">
		<article article-type="research-article" xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tp="http://www.plazi.org/taxpub">
			<xsl:for-each select="document">
				<xsl:for-each select="objects">
					<!--FRONT-->
					<xsl:for-each select="article_metadata">
						<xsl:apply-templates mode="front" select="."/>
					</xsl:for-each>
					<!--BODY-->
					<xsl:apply-templates mode="body" select="."/>
					<!--BACK-->
					<xsl:apply-templates mode="back" select="."/>
				</xsl:for-each>
				<!--FLOATS-->
				<xsl:apply-templates mode="floats" select="."/>
			</xsl:for-each>
		</article>
	</xsl:template>
</xsl:stylesheet>
