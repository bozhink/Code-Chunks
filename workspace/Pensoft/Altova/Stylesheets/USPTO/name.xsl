<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for name</doc:title>
    <doc:filename>name.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
          Template rules for &lt;name&gt; and its children.  Returns a 
          whitespace-separated list of child nodes (name-prefix, given-name, etc.).
    </doc:description>
</doc:summary>

<!--
*****************************************************************
*  John Dunning: 2001-01-29:                                    *
*  Component file for name                                      *
*****************************************************************
-->
                
    <xsl:template match="name">
        <xsl:if test=".//name-prefix">
            <xsl:value-of select="name-prefix"/>
            <xsl:text>&#160;</xsl:text>
        </xsl:if>

        <xsl:value-of select="given-name"/>
        <xsl:text>&#160;</xsl:text>
        
        <xsl:if test=".//middle-name">
            <xsl:value-of select="middle-name"/>
            <xsl:text>&#160;</xsl:text>
        </xsl:if>
    
        <xsl:value-of select="family-name"/>
        
        <xsl:if test=".//name-suffix">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="name-suffix"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>