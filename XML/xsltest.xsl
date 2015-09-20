<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="document">
    <html>
      <head>
        <title>XSL test</title>
        <link type="text/css" href="xsltest.css" rel="stylesheet" />
      </head>
      <body><table><xsl:apply-templates/></table></body>
    </html>
</xsl:template>

<xsl:template match="title">
    <tr><th><xsl:value-of select="."/></th></tr>
    <tr></tr>
</xsl:template>

<xsl:template match="value">
    <td><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="text">
    <td class="colored"><xsl:value-of select="."/></td>
</xsl:template>


</xsl:stylesheet>