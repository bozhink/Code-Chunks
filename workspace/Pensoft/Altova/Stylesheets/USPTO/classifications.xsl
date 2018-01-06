<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for &lt;classification-ipc&gt; and &lt;classification-us&gt; and children.</doc:title>
    <doc:filename>classifications.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Common components of &lt;classification-ipc&gt; and &lt;classification-us&gt; stored and called from here. Called by citations.xsl.     
    </doc:description>
</doc:summary>

    
<!--
*****************************************************************
*  John Dunning: 2001-01-29                                     *
*   stylesheet component file for technical-information         *
*   section in patent-application-publication;                  *
*   called by citations.xsl                                     *
*****************************************************************
-->

    <xsl:template match="uspc">
        <xsl:value-of select=".//class" />
        <xsl:text> </xsl:text>
        <xsl:value-of select=".//subclass" />
    </xsl:template>

    <xsl:template name="classifications_ipc">
    <xsl:choose>
        <xsl:when test="name(technical-information)">
                <td class="table_data"><b><xsl:value-of select=".//classification-ipc/classification-ipc-primary/ipc"/></b>
                <xsl:for-each select="descendant::classification-ipc-secondary">;            
                    <xsl:value-of select="."/>                
                </xsl:for-each>
                </td>
                <td class="table_data"><xsl:value-of select=".//classification-ipc/classification-ipc-edition"/></td>
        </xsl:when>
        <xsl:otherwise>
            <b><xsl:value-of select="./classification-ipc-primary/ipc"/></b>
            <xsl:for-each select="descendant::classification-ipc-secondary">;            
                <xsl:value-of select="."/>                
            </xsl:for-each>
            <xsl:text> </xsl:text><xsl:value-of select="./classification-ipc-edition"/>
        </xsl:otherwise>
    </xsl:choose>
    </xsl:template>

    <xsl:template name="classifications_us">
    <xsl:choose>
        <xsl:when test="name(technical-information)">
                <td class="table_data">
                <b><xsl:value-of select=".//classification-us-primary/uspc/class"/>/<xsl:value-of select=".//classification-us-primary/uspc/subclass"/></b>
                <xsl:for-each select="descendant::classification-us-secondary/uspc">;
                    <xsl:call-template name="us_secondary"/>
                </xsl:for-each>
                </td>
                <xsl:for-each select="descendant::classification-us-secondary/uspc-freeform">
                    <xsl:call-template name="uspc_freeform"/>
                </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
                <b><xsl:value-of select=".//classification-us-primary/uspc/class"/>/<xsl:value-of select=".//classification-us-primary/uspc/subclass"/></b>
                <xsl:for-each select=".//classification-us-secondary/uspc">;
                    <xsl:call-template name="us_secondary"/>
                </xsl:for-each>
                <xsl:for-each select=".//classification-us-secondary/uspc-freeform">
                    <xsl:call-template name="uspc_freeform"/>
                </xsl:for-each>
        </xsl:otherwise>
    </xsl:choose>
    </xsl:template>
        
    <xsl:template name="uspc_freeform">
        <tr><td/><td/><td/>
            <td class="table_data"><xsl:value-of select="." /></td>
        </tr>    
    </xsl:template>

    <xsl:template name="us_secondary">
            <xsl:value-of select="class"/>/<xsl:value-of select="subclass"/>                                
    </xsl:template>

</xsl:stylesheet>