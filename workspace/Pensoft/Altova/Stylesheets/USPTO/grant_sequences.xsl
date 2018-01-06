<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
*****************************************************************
* John Dunning: 2001-02-13:                                     *
*   Component file for Sequence listings                        *
*   displays sequence-cwus for Grant Redbook                    *
*  Template rules are in the form                               *
*       xsl:template match="SEQLST-OLD | SEQLST-NEW"            *
*   wherever there are mappings between the old and new syntax  *
*   and follow numerical order                                  *
***************************************************************** 
-->

    <xsl:template match="SEQLST-US">
        <div style="page-break_before-inside: avoid; "> 
            [<xsl:value-of select="@ID"/>]
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <xsl:template match="SEQLST-OLD | SEQLST-NEW">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="S-1 | S100">
        <div>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="S-1-III | S160">
        <xsl:text>Number of Sequences: </xsl:text>
            <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="S-2 | S210">
        <xsl:text>Sequence ID: </xsl:text>
        <xsl:choose>
            <xsl:when test="self::S-2">
                <xsl:value-of select="@SEQ-NO" />
                <xsl:apply-templates />
            </xsl:when>
            <xsl:when test="self::S210">
                <xsl:value-of select="." />
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="S-2-I-A | S211">
        <br/>
        <xsl:text>Length of Sequence: </xsl:text>
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="S-2-I-B | S212">
        <br/>        
        <xsl:text>Sequence Type: </xsl:text>
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="S-2-I-C">
        <br/>
        <xsl:text>Strandedness: </xsl:text>        
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="S-2-I-D">
        <br/>
        <xsl:text>Topology: </xsl:text>
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="S-2-II-MT">
        <br/>
        <xsl:text>Molecule Type: </xsl:text>
        <xsl:apply-templates />
    </xsl:template>


    <xsl:template match="S-2-VI-A | S213">
        <br/>
        <xsl:text>Scientific Name: </xsl:text>
        <xsl:value-of select="." />
    </xsl:template>
    
    <xsl:template match="S-2-IX-A | S221">
        <br/>
        <xsl:text>Name/Key: </xsl:text>
            <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="S-2-IX-B | S222">
        <br/>
        <xsl:text>Location: </xsl:text>
            <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="S-2-IX-D | S223">
        <br/>
        <xsl:text>Other Information: </xsl:text>
            <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="S-2-XI | S400">
    <pre style="font-size: 10pt;">
            <xsl:value-of select="." />
    </pre>
    </xsl:template>

</xsl:stylesheet>