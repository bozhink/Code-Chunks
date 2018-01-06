<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for &lt;biological-deposit&gt;</doc:title>
    <doc:filename>biological-deposit.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Template rules for formatting &lt;biological-deposit&gt; and children are contained here.  
    </doc:description>
</doc:summary>

<!--
*************************************************************
*  John Dunning: 2001-01-29                                 *
*   Component file for biological-deposit                   *
*************************************************************
-->

    <xsl:template match="biological-deposit">
        <xsl:apply-templates />
    </xsl:template>
    
    
    <xsl:template match="deposit-term | depository | deposit-accession-number | deposit-description">
        <xsl:text> </xsl:text>
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="deposit-date">
		<xsl:param name="deposit-year" doc:public="yes" doc:description="assigns the year portion of the &lt;deposit-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(deposit-date,1,4)"/>
		</xsl:param>
		<xsl:param name="deposit-month" doc:public="yes" doc:description="assigns the month portion of the &lt;deposit-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(deposit-date,5,2)"/>
		</xsl:param>
		<xsl:param name="deposit-day" doc:public="yes" doc:description="assigns the date portion of the &lt;deposit-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(deposit-date,7,2)"/>
		</xsl:param>
		<xsl:value-of select="$deposit-year" />-<xsl:value-of select="$deposit-month" />-<xsl:value-of select="$deposit-day" />
    </xsl:template>
    
</xsl:stylesheet>