<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for &lt;appendix-data&gt;</doc:title>
    <doc:filename>appendix.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Template rules for formatting the &lt;appendix-data&gt; and &lt;object-reference&gt; children are contained here.  
    </doc:description>
</doc:summary>

<!--
**********************************************************
*  John Dunning: 2001-01-29                              *
*   Component file for appendix-data                     *
**********************************************************
-->

    <xsl:template match="appendix-data">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="object-reference">
        <div class="left_para">
        <table border="0" width="90%">
            <tr>
                <td width="8%" valign="top">&#160; </td>
                <td width="85%">
                    <span class="para_text">
                        <xsl:apply-templates />
                    </span>
                </td>
                <td width="*"></td>
            </tr>
        </table>
        </div>
    </xsl:template>
    
    <xsl:template match="object-id | object-contents | object-description">
            <xsl:text> </xsl:text>
            <xsl:apply-templates />
    </xsl:template>

</xsl:stylesheet>