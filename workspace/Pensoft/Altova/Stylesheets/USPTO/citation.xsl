<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for &lt;citation&gt;</doc:title>
    <doc:filename>citation.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Template rules for formatting &lt;citation&gt; and its children
    </doc:description>
</doc:summary>
                
<!--
************************************************************
* John Dunning: 2001-01-26:                                *
*  Component file for citations                            *
************************************************************
-->

    <xsl:template match="citation">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="cited-patent-literature">
        <div>
        <xsl:text> </xsl:text>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="cited-non-patent-literature | classification-ipc-edition | ipc | uspc-freeform">
        <xsl:choose>
            <xsl:when test="//specification">
                <b>    <xsl:apply-templates />    </b>
            </xsl:when>
            <xsl:when test="//patent-application-publication">
                <xsl:apply-templates />
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="relevant-section">
        <b> <xsl:apply-templates />    </b>
    </xsl:template>

</xsl:stylesheet>