<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for residence</doc:title>
    <doc:filename>residence.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Template rules for &lt;residence&gt; and its children.
    </doc:description>
</doc:summary>


<!--
*****************************************************************
*  John Dunning: 2001-01-29:                                    *
*  Component file for residence                                 *
*****************************************************************
-->
                
<xsl:template match="residence">
    <table width="60%" border="0">
        <xsl:apply-templates />
    </table>
</xsl:template>

<xsl:template match="residence-us | residence-non-us">
    <xsl:apply-templates />
</xsl:template>

<xsl:template match="residence//city">
    <tr><td class="table_data">Residence City:</td>
        <td class="table_data">
            <xsl:apply-templates />
        </td>
    </tr>
</xsl:template>

<xsl:template match="residence//state">
    <tr><td class="table_data">Residence State:</td>
        <td class="table_data">
            <xsl:apply-templates />
        </td>
    </tr>
</xsl:template>

<xsl:template match="residence//country-code">
    <tr><td class="table_data">Residence Country:</td>
        <td class="table_data">
            <xsl:value-of select="."/>
        </td>
    </tr>
</xsl:template>

<xsl:template match="residence//military-service">
    <tr><td class="table_data">Military Service:</td>
        <td class="table_data">
            <xsl:apply-templates />
        </td>
    </tr>
</xsl:template>

<xsl:template match="residence//citizenship">
    <tr><td class="table_data">Citizenship:</td>
        <td class="table_data">
            <xsl:apply-templates />
        </td>
    </tr>
</xsl:template>

</xsl:stylesheet>