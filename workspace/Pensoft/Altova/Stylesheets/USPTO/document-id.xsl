<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for &lt;document-id&gt;</doc:title>
    <doc:filename>document-id.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Template rules for &lt;document-id&gt; and children.  Returns a whitespace delmited
        string of sub-elements.
    </doc:description>
</doc:summary>
<!--
*****************************************************************
*  John Dunning: 2001-01-29:                                    *
*  Component file for document-id and children                  *
*****************************************************************
-->

    <xsl:template match="document-id">
        <xsl:apply-templates select="country-code"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="doc-number"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="kind-code"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="document-date"/>
        <xsl:text> </xsl:text>
    </xsl:template>

    <xsl:template match="country-code | doc-number | kind-code">
        <xsl:value-of select= "."/>
    </xsl:template>
    
    <xsl:template match="document-date" doc:public="yes" doc:description="uses &lt;xsl:param&gt; elements to present &lt;document-date&gt; in YYYY-MM-DD format">
    		<xsl:param name="document-year" doc:public="yes" doc:description="assigns the year portion of the &lt;document-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
				<xsl:value-of select="substring(.//document-date,1,4)"/>
			</xsl:param>
			<xsl:param name="document-month" doc:public="yes" doc:description="assigns the month portion of the &lt;document-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
				<xsl:value-of select="substring(.//document-date,5,2)"/>
			</xsl:param>
			<xsl:param name="document-day" doc:public="yes" doc:description="assigns the date portion of the &lt;document-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
				<xsl:value-of select="substring(.//document-date,7,2)"/>
			</xsl:param>
			<xsl:value-of select="$document-year" />-<xsl:value-of select="$document-month" />-<xsl:value-of select="$document-day" />
    </xsl:template>

</xsl:stylesheet>