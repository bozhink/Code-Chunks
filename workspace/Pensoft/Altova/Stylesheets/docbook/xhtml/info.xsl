<?xml version="1.0" encoding="ASCII"?>
<!--This file was created automatically by html2xhtml-->
<!--from the HTML stylesheets.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">

<!-- ********************************************************************
     $Id: info.xsl,v 1.1.2.4 2008-02-06 14:55:16 has Exp $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://docbook.sf.net/release/xsl/current/ for
     copyright and other information.

     ******************************************************************** -->

<!-- These templates define the "default behavior" for info
     elements.  Even if you don't process the *info wrappers,
     some of these elements are needed because the elements are
     processed from named templates that are called with modes.
     Since modes aren't sticky, these rules apply. 
     (TODO: clarify this comment) -->

<!-- ==================================================================== -->
<!-- called from named templates in a given mode -->

<xsl:template match="corpauthor">
  <span>
    <xsl:apply-templates select="." mode="class.attribute"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="jobtitle">
  <span>
    <xsl:apply-templates select="." mode="class.attribute"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<!-- ==================================================================== -->

</xsl:stylesheet>
