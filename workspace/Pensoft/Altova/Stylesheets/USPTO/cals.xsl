<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for CALS Tables</doc:title>
    <doc:filename>cals.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Template rules for transforming CALS tables to HTML tables are contained here. 
    </doc:description>
</doc:summary>

<!--
************************************************************
* John Dunning: 2001-01-26:                                *
*  Component file for CALS tables                          *
*    transforms CALS tables to HTML tables                 *
************************************************************
-->

    <xsl:template match="table-cwu">
        <div style="page-break-inside: avoid; "> 
            [<xsl:value-of select="@id"/>]
            <xsl:apply-templates select="table | Table"/>
        </div>
    </xsl:template>

    <xsl:template match="table | Table">
            <span class="table_head">
                <xsl:value-of select="./heading"/>
            </span>

        <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr><td>
                <xsl:apply-templates select="tgroup | TGroup"/>
            </td></tr>
        </table>
    </xsl:template>

    <xsl:template match="tgroup | TGroup" doc:public="yes" doc:description="This template nests tables within each other, since CALS allows multiple &lt;tgroup&gt;s within one &lt;table&gt; and HTML does not; each &lt;tgroup&gt; from the source document becomes a new table.  See
          HTML 4.0, section 11.2.3: &quot;The THEAD, TFOOT, and TBODY sections must contain the same number of columns&quot;.">

    <table cellpadding="0" cellspacing="0">
    
        <xsl:attribute name="rules" >
            <xsl:value-of select="ancestor-or-self::table[1]/@frame | ancestor-or-self::Table[1]/@frame" />
        </xsl:attribute>
        
        <!-- this will hide the box around a table -->
        <!--xsl:if test="ancestor::table[1]/@frame='none'">
            <xsl:attribute name="border">0</xsl:attribute>
        </xsl:if-->

        <colgroup>
            <xsl:apply-templates select="colspec" />
        </colgroup>
        <thead>
            <xsl:apply-templates select="thead"/>
        </thead>
            <xsl:apply-templates select="tbody | TBody" />
    </table>
    </xsl:template>

    <xsl:template match="tbody | TBody">
        <tbody valign="{@valign}">
            <xsl:apply-templates />
        </tbody>
    </xsl:template>
    
    <xsl:template match="thead">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="colspec">
            <xsl:for-each select="descendant-or-self::colspec">    
                <col width="{@colwidth}" align="{@align}"/>
                    <xsl:apply-templates />
            </xsl:for-each>
    </xsl:template>

    <xsl:template match="row | Row">
        <tr>
            <xsl:apply-templates select="entry | Entry"/>
        </tr>
    </xsl:template>

<xsl:template match="entry | Entry" doc:public="yes" doc:description="This template performs an evaluation to test
                                        whether &lt;spanspec&gt; or the &quot;nameend&quot; attribute was used and span table data accordingly">
<xsl:param name="rowname" select="@spanname" doc:public="yes" doc:description="the @spanname of the &lt;entry&gt;; used in evaluation to lookup @nameend of &lt;spanspec&gt;"/>
        <td class="table_data">
            <xsl:if test="@align">
                <xsl:attribute name="align">
                    <xsl:value-of select="@align" />
                </xsl:attribute>
            </xsl:if>
              <xsl:choose>
                <xsl:when test="@spanname">
                    <xsl:attribute name="colspan">
                        <xsl:value-of select="../../../spanspec[@spanname=$rowname]/@nameend"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@nameend">
                    <xsl:attribute name="colspan">
                        <xsl:value-of select="@nameend"/>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
    
        <!-- ***** insert &#160; between <td> and </td> if no content (preserves width) ***** -->
                <xsl:if test="not(child::*)">
                  &#160;
                </xsl:if>
                <xsl:apply-templates />
            </td>
        </xsl:template>
</xsl:stylesheet>