<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for paragraph-federal-research-statement</doc:title>
    <doc:filename>para-fed.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
       Template rules for &lt;paragraph-federal-research-statement&gt; and its children.
    </doc:description>
</doc:summary>

<!--
***************************************************************
*  John Dunning: 2001-01-29                                   *
*   Component file for federal-research-statement             *
***************************************************************
-->

    <xsl:template match="federal-research-statement">
        <div style="margin-bottom:  1pc;
                    margin-left:    +10pt;">
               <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="paragraph-federal-research-statement">
        <div class="left_para">
         <table width="100%">
             <tr>
                 <td width="8%" valign="top">
                &#160;
                </td>
                <td width="85%">
                    <div class="para_text">
                        <xsl:apply-templates />
                    </div>
                </td>
                <td width="*"></td>
             </tr>
         </table>
         </div>
    </xsl:template>

    <xsl:template match="number | grant-number | contract-number | us-agency">
        <xsl:text> </xsl:text>
        <xsl:apply-templates />
    </xsl:template>
    
</xsl:stylesheet>