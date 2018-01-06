<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for &lt;correspondence-address&gt;</doc:title>
    <doc:filename>correspondence-address.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Template rules for &lt;correspondence-address&gt;  Implicitly calls address.xsl.
    </doc:description>
</doc:summary>
<!--
*****************************************************************
*  John Dunning: 2001-01-29:                                    *
*  component file for correspondence-address;                   *
*   uses name.xsl, address.xsl                                  *
*****************************************************************
-->

<xsl:template match="correspondence-address" doc:public="yes" doc:description="inserts different boilerplate text according to doctype.">
    <br/>
        <xsl:choose>
            <xsl:when test="//bibd.transmittal">
                <b>Correspondence Address (Publish):</b>
            </xsl:when>        
            <xsl:when test="//patent-application-publication">
                <b>Correspondence Name and Address:</b>
                <br/>
                <xsl:apply-templates />
            </xsl:when>
        </xsl:choose>
</xsl:template>

<xsl:template match="name-1 | name-2">
        <xsl:apply-templates />
</xsl:template>

</xsl:stylesheet>