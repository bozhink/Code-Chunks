<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for &lt;claims&gt;</doc:title>
    <doc:filename>claims.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
      Template rules for formatting &lt;claims&gt; and its children.
    </doc:description>
</doc:summary>

<!-- 
************************************************************
* John Dunning: 2001-01-26:                                *
*   Component file for claims                              *
************************************************************
-->

    <xsl:template match="claims">
        <div class="break_before">
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <xsl:template match="claim" doc:public="yes" doc:description="specification shows @number; pap shows @id.">
        <div class="left_para">
            <table border="0" width="100%">
            <tr>
                <td width="8%" valign="top">
                <a name="{@id}"/>
                <xsl:choose>
                    <xsl:when test="//specification"><!-- if its the spec -->
                        <div class="text">
                            [c<xsl:value-of select="@number"/>]
                        </div>
                        <td width="70%" valign="top" class="text">
                            <xsl:apply-templates />
                        </td>
                    </xsl:when>
                    <xsl:when test="//patent-application-publication">
                        <td width="12%" valign="top" align="right" class="para_text" colspan="1">
                            [<xsl:value-of select="substring-after(@id,'CLM-')"/>]
                        </td>
                        <td width="70%" valign="top" class="para_text">
                            <xsl:apply-templates />
                        </td>
                    </xsl:when>
                </xsl:choose>
                </td>
                <td width="*"></td>
                </tr>
                </table>
         </div>
     </xsl:template>

	<xsl:template match="claim/claim-text[1]">
		<span style="claim_text">
			<xsl:apply-templates />
		</span>
	</xsl:template>

    <xsl:template match="claim-text[not(ancestor::dependent-claim-reference)]">
        <div class="claim_text">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="dependent-claim-reference">
            <b><a href="#{@depends_on}"><xsl:apply-templates /></a></b>
    </xsl:template>

    <xsl:template match="markush-group">
        <ul>
            <xsl:apply-templates />
        </ul>
    </xsl:template>
    
    <xsl:template match="markush-item">
        <li>
            <xsl:apply-templates />
        </li>
    </xsl:template>

</xsl:stylesheet>