<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for complex work units</doc:title>
    <doc:filename>cwu.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Template rules for complex work units (&lt;chemistry-cwu&gt;, &lt;math-cwu&gt;, &lt;sequence-cwu&gt;).  Sets to block-style and calls
        required template (figures.xsl, sequence-listing.xsl).
    </doc:description>
</doc:summary>

<!--
*****************************************************************
*  John Dunning: 2001-01-29                                     *
*    Component file for complex work units                      *
*    uses figures.xsl, sequence-listing.xsl                     *
*****************************************************************
-->

    <xsl:template match="chemistry-cwu | math-cwu | sequence-cwu">
       <span class="break_avoid">
            <xsl:apply-templates />
        </span>
    </xsl:template>

</xsl:stylesheet>