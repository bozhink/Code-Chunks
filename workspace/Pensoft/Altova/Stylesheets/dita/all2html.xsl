<?xml version="1.0" encoding="UTF-8" ?>
<!--  all2html.xsl 1.00; 2002 May 7
 | Composite DITA topics to HTML
 |
 | Copyright IBM Corporation, 2002
 | This file is part of the DITA package on IBM's developerWorks site.
 | See license.txt for disclaimers.
 *-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- stylesheet imports -->

<xsl:import href="topic2html.xsl"/>
<xsl:include href="taskdisplay.xsl"/>
<xsl:include href="refdisplay.xsl"/>


<!-- XHTML output with XML syntax -->
<xsl:output method="xml"
            encoding="iso-8859-1"
            indent="no"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
            doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
/>


<xsl:template match="/" priority="3">
  <xsl:comment>Composite DITA to XHTML application by IBM Corp., 2001, 2002</xsl:comment>
  <xsl:message>DITA File = <xsl:value-of select="$FILENAME"/>, DocID = <xsl:value-of select="generate-id(/)"/></xsl:message>
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>
