<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for &lt;address&gt;</doc:title>
    <doc:filename>address.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Common components of &lt;address&gt; stored and called from here.    
    </doc:description>
</doc:summary>

<!--
**********************************************************
*  John Dunning: 2001-01-29                              *
*   Component file for address block                     *
**********************************************************
-->

    <xsl:template match="address" doc:public="yes" doc:description="Creates a table to format child elements of address.">
        <table width="60%" border="0">
            <tr>
                <xsl:if test="./military-address">
                    <td class="table_data"><xsl:value-of select="."/></td>
                </xsl:if>
                <td class="table_data"><xsl:value-of select="./address-1"/></td>
            </tr>
            <tr>
                <td class="table_data"><xsl:value-of select="./address-2"/></td>
            </tr>
            <tr>
                <td class="table_data"><xsl:value-of select="./city" />,
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="./state" /> 
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="./postalcode" />,
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="./country/country-code"/>
                </td>
            </tr>

            <xsl:for-each select="./email" >
            <tr>
                <td class="table_data"><xsl:value-of select="." /></td>
            </tr>
            </xsl:for-each>
        
            <xsl:for-each select="./telephone" >
                <tr>
                    <td class="table_data">  <xsl:value-of select="." /></td>
                </tr>
            </xsl:for-each>
    
            <xsl:for-each select="./fax">
                <tr>
                    <td class="table_data"><xsl:value-of select="."/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>