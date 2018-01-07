<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for inventor-block and inventors</doc:title>
    <doc:filename>inventor-block.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Template rules for &lt;inventor-block&gt; and &lt;inventors&gt;.
    </doc:description>
</doc:summary>


<!--
*****************************************************************
*  John Dunning: 2001-01-29:                                    *
*  Component file for inventors/inventor block                  *
*****************************************************************
-->

<xsl:template match="inventor-block | inventors">
    <br/>
    <table width="80%" border="0">
    <xsl:choose>
        <xsl:when test="count(.//inventor) &gt; 1">
            <th align="left" class="table_data">INVENTORS: </th>
        </xsl:when>
        <xsl:otherwise>
            <th align="left" class="table_data">INVENTOR: </th>
        </xsl:otherwise>
    </xsl:choose>
    <tr/>

    <xsl:if test="first-named-inventor/authority-applicant">
        <tr><td class="table_data">Authority Applicant:</td>
            <td class="table_data">
                <xsl:value-of select="first-named-inventor/authority-applicant" />
            </td>
        </tr>
    </xsl:if>
    
    <xsl:for-each select="inventor">
        <xsl:if test="authority-applicant">
            <tr><td class="table_data">Authority Applicant:</td>
                <td class="table_data">
                    <xsl:value-of select="authority-applicant" />
                </td>
            </tr>
        </xsl:if>
        <tr><td>&#160;</td></tr>
        <tr><td/></tr>
        <tr><td/></tr>
        <tr><td/></tr>
    </xsl:for-each>
        <tr/>
        <xsl:if test="authority-applicant">
            <tr>
                <td/>
                <td class="table_data">
                    <xsl:value-of select="authority-applicant" />
                </td>
            </tr>
        </xsl:if>
    <tr/>
    <tr/>
    </table>
</xsl:template>
</xsl:stylesheet>