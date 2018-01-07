<!--  refdisplay.xsl 1.1; 2002 May 8
 | Specific override stylesheet for reference topics (demo)
 |
 | Copyright IBM Corporation, 2002
 | This file is part of the DITA package on IBM's developerWorks site.
 | See license.txt for disclaimers.
 *-->

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="topic2html.xsl"/>

<!-- XHTML output with XML syntax) -->
<xsl:output method="xml"
            encoding="iso-8859-1"
            indent="yes"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
            doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
/>


<xsl:template match="/">
  <xsl:comment>Sample DITA reference to HTML application by IBM Corp., 2002</xsl:comment>
  <xsl:apply-templates/>
</xsl:template>


<!-- elements reference and refbody will fall through to topic processors -->


  <!-- when a specialized rule is imbedded with the topic defaults, there will be
       a priority conflict unless you set the priority of the contained specialied rule
       so that it overrides the topic fallback -->

<xsl:template match="*[contains(@class,' reference/refbody ')]/*[contains(@class,' topic/section ')]" priority="1">
  <xsl:call-template name="sect-heading"><xsl:with-param name="deftitle"></xsl:with-param></xsl:call-template>
  <blockquote>
    <xsl:apply-templates/>
  </blockquote>
</xsl:template>


<xsl:template match="*[contains(@class,' reference/refbody ')]/*[contains(@class,' topic/example ')]" priority="1">
  <xsl:call-template name="sect-heading">
  <xsl:with-param name="deftitle">
      <xsl:call-template name="getString">
        <xsl:with-param name="stringName" select="'Examples'"/>
      </xsl:call-template>
  </xsl:with-param></xsl:call-template>
  <blockquote>
    <xsl:apply-templates/>
  </blockquote>
</xsl:template>


<xsl:template match="*[contains(@class,' reference/refsyn ')]" priority="1">
  <xsl:call-template name="sect-heading"><xsl:with-param name="deftitle">
      <xsl:call-template name="getString">
        <xsl:with-param name="stringName" select="'Syntax'"/>
      </xsl:call-template>
      </xsl:with-param></xsl:call-template>
  <blockquote>
    <xsl:apply-templates/>
  </blockquote>
</xsl:template>


<xsl:template match="*[contains(@class,' reference/properties ')]" priority="3">
  <xsl:call-template name="sect-heading"><xsl:with-param name="deftitle"></xsl:with-param></xsl:call-template>
  <table border="1">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </table>
</xsl:template>


<xsl:template match="*[contains(@class,' reference/property ')]" priority="1">
  <tr>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>


<xsl:template match="*[contains(@class,' reference/proptype ')]" priority="1">
  <td align="left" valign="top">
    <xsl:call-template name="setclass"/>
    <code>
      <xsl:apply-templates/>
    </code>
  </td>
</xsl:template>


<xsl:template match="*[contains(@class,' reference/propvalue ')]" priority="1">
  <td align="left" valign="top">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates/>
  </td>
</xsl:template>


<xsl:template match="*[contains(@class,' reference/propdesc ')]" priority="1">
  <td align="left" valign="top">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates/>
  </td>
</xsl:template>


<!-- parameter lists (specialized DL within a refsect or refbody)  -->
<xsl:template match="*[contains(@class,' reference/parml ')]" priority="1">
  <dl>
    <xsl:apply-templates/>
  </dl>
</xsl:template>


<xsl:template match="*[contains(@class,' reference/plentry ')]" priority="1">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="*[contains(@class,' reference/pt ')]" priority="1">
  <dt>
    <!-- create a potentially linkable target for associative link possibilities -->
    <a name="pl_{.}"><xsl:apply-templates/></a>
  </dt>
</xsl:template>

<xsl:template match="*[contains(@class,' reference/pd ')]" priority="1">
  <dd>
    <xsl:apply-templates/>
  </dd>
</xsl:template>


</xsl:stylesheet>

