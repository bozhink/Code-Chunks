<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="book">
    <HTML>
<HEAD>
            <TITLE>Book Info</TITLE>
        <STYLE>
                H1 {font-family: Arial,Univers,sans-serif;
                    font-size: 36pt }
        </STYLE>
    </HEAD>
    <BODY><xsl:apply-templates/></BODY>
    </HTML>
</xsl:template>

<xsl:template match="book_title">
    <H1><xsl:value-of select="."/></H1>
</xsl:template>

<xsl:template match="author">
    <H2><xsl:value-of select="."/></H2>
</xsl:template>

</xsl:stylesheet>