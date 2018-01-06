<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for party</doc:title>
    <doc:filename>party.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Template rules for &lt;party&gt; and its children.  Calls templates name.xsl and address.xsl.
    </doc:description>
</doc:summary>

<!--
**************************************************************
*  John Dunning: 2001-01-29:                                 *
*  Component file for party                                  *
**************************************************************
-->
    <xsl:template match="party">
    <div>
        <xsl:apply-templates select="name"/>
    </div>
        <xsl:value-of select=".//organization-name"/>
        <xsl:apply-templates select="address"/>
    </xsl:template>

    <xsl:template match="citizenship">
        <xsl:text> </xsl:text>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="organization-name">
        <div>
            <xsl:apply-templates />
        </div>
    </xsl:template>


</xsl:stylesheet>