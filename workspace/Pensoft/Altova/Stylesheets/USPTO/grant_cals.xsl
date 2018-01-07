<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
*****************************************************************
* John Dunning: 2001-01-26:                                     *
*   Component file for CALS tables                              *
*           transforms CALS tables to HTML tables               *
*****************************************************************
-->

    <xsl:template match="TABLE-US">
        <div style="page-break_before-inside: avoid; "> 
            [<xsl:value-of select="@ID"/>]
            <xsl:apply-templates select=".//TABLE"/>
        </div>
    </xsl:template>

    <xsl:template match="TABLE">
            <span class="table_head">
<!-- *** todo: get proper heading *** -->
                <xsl:value-of select="./HEADING | ./TITLE"/>
            </span>

        <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr><td>
                <xsl:apply-templates select="TGROUP"/>
            </td></tr>
        </table>
    </xsl:template>

    <xsl:template match="TGROUP">
    <!-- *************************************************** -->
    <!--  nesting tables: HTML 4.0, section 11.2.3:          -->
    <!-- "The THEAD, TFOOT, and TBODY sections must contain  -->
    <!--  the same number of columns.                        -->    
    <!-- *************************************************** -->

    <table cellpadding="5" cellspacing="0">
        <xsl:attribute name="rules" >
            <xsl:value-of select="ancestor-or-self::TABLE[1]/@FRAME" />
        </xsl:attribute>
        
        <!-- this will hide the box around a table -->
        <!--xsl:if test="ancestor::table[1]/@frame='none'">
            <xsl:attribute name="border">0</xsl:attribute>
        </xsl:if-->

        <colgroup>
            <xsl:apply-templates select="COLSPEC" />
        </colgroup>
        <thead>
            <xsl:apply-templates select="THEAD"/>
        </thead>
            <xsl:apply-templates select="TBODY" />
    </table>
    </xsl:template>

    <xsl:template match="TBODY">
        <tbody valign="{@VALIGN}">
            <xsl:apply-templates />
        </tbody>
    </xsl:template>
    
    <xsl:template match="THEAD">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="COLSPEC">
            <xsl:for-each select="descendant-or-self::COLSPEC">    
                <col width="{@COLWIDTH}" align="{@ALIGN}"/>
                    <xsl:apply-templates />
            </xsl:for-each>
    </xsl:template>

    <xsl:template match="ROW">
        <tr>
            <xsl:apply-templates select="ENTRY"/>
        </tr>
    </xsl:template>

    <xsl:template match="ENTRY">
    <xsl:param name="rowname" select="@SPANNAME"/>
        <td class="table_data">
            <xsl:if test="@ALIGN">
                <xsl:attribute name="ALIGN">
                    <xsl:value-of select="@ALIGN" />
                </xsl:attribute>
            </xsl:if>
              <xsl:choose>
                <xsl:when test="@SPANNAME">
                    <xsl:attribute name="colspan">
                        <!-- get values from script, below -->
                        <xsl:value-of select="../../../SPANSPEC[@SPANNAME=$rowname]/@NAMEEND"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@NAMEEND">
                    <xsl:attribute name="colspan">
                        <xsl:value-of select="@NAMEEND"/>
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
    
        <xsl:template match="text()">
            <xsl:value-of select="."/>
        </xsl:template>
</xsl:stylesheet>