<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for sequence-listings</doc:title>
    <doc:filename>sequence-listing.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
       Component file for Sequence listings.  Template rules are in the form 
       &lt;xsl:template match="seqlst-old | seqlst-new"&gt; 
       wherever there are mappings between the old and new syntax  
       and follow numerical order                                  
    </doc:description>
</doc:summary>


<!--
*****************************************************************
* John Dunning: 2001-02-13:                                     *
*   Component file for Sequence listings                        *
*  Template rules are in the form                               *
*       xsl:template match="seqlst-old | seqlst-new"            *
*   wherever there are mappings between the old and new syntax  *
*   and follow numerical order                                  *
***************************************************************** 
-->


    <xsl:template match="sequence-listing-old-rules | sequence-listing-new-rules">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="s-1 | s100">
        <div>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="s-1-iii | s160">
        <xsl:text>Number of Sequences: </xsl:text>
            <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="s-2 | s210">
        <xsl:text>Sequence ID: </xsl:text>
        <xsl:choose>
            <xsl:when test="self::s-2">
                <xsl:value-of select="@seq-no" />
                <xsl:apply-templates />
            </xsl:when>
            <xsl:when test="self::s210">
                <xsl:value-of select="." />
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="s-2-i-a | s211">
        <br/>
        <xsl:text>Length of Sequence: </xsl:text>
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="s-2-i-b | s212">
        <br/>        
        <xsl:text>Sequence Type: </xsl:text>
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="s-2-i-c">
        <br/>
        <xsl:text>Strandedness: </xsl:text>        
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="s-2-i-d">
        <br/>
        <xsl:text>Topology: </xsl:text>
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="s-2-ii-mt">
        <br/>
        <xsl:text>Molecule Type: </xsl:text>
        <xsl:apply-templates />
    </xsl:template>


    <xsl:template match="s-2-vi-a | s213">
        <br/>
        <xsl:text>Scientific Name: </xsl:text>
        <xsl:value-of select="." />
    </xsl:template>
    
    <xsl:template match="s-2-ix-a | s221">
        <br/>
        <xsl:text>Name/Key: </xsl:text>
            <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="s-2-ix-b | s222">
        <br/>
        <xsl:text>Location: </xsl:text>
            <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="s-2-ix-d | s223">
        <br/>
        <xsl:text>Other Information: </xsl:text>
            <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="s-2-xi | s400">
    <pre style="font-size: 10pt;">
            <xsl:value-of select="." />
    </pre>
    </xsl:template>

</xsl:stylesheet>