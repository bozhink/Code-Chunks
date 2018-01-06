<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for common elements </doc:title>
    <doc:filename>common.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
        Template rules for formatting elements common to many USPTO doctypes.
    </doc:description>
</doc:summary>

<!--
*****************************************************************
*  John Dunning: 2001-01-29:                                    *
*  Component file for elements that are commonly                *
*   used across to several doctypes                             *
*****************************************************************
-->

    <xsl:template match="bold">
        <b> <xsl:apply-templates /> </b>
    </xsl:template>
    
    <xsl:template match="email">
        <span class="mono"> <xsl:apply-templates /> </span>
    </xsl:template>

    <xsl:template match="emphasis | italic">
        <i> <xsl:apply-templates /> </i>
    </xsl:template>

    
    <xsl:template match="footnote">
        <font size = "-2"><xsl:apply-templates /></font>
    </xsl:template>

    <xsl:template match="heading">
        <h3><xsl:apply-templates /></h3>
    </xsl:template>

    <xsl:template match="highlight| in-line-formula | literal">
        <xsl:apply-templates />
    </xsl:template>

     <xsl:template match="list-item">
        <div class="list_item">
            <xsl:apply-templates />        
        </div>    
     </xsl:template>

    <xsl:template match="paragraph">
        <div class="left_para">
        <table border="0" width="100%">
            <tr>
                <td width="8%" valign="top" class="para_text">
                    <xsl:text> </xsl:text>
                </td>
            <xsl:choose>
				<xsl:when test="//patent-application-publication">	
	                <td width="85%" class="para_text">
	                	<xsl:if test="@id">
		                    [<xsl:value-of select="substring-after(@id,'P-')" />]    
		                    &#160;&#160;&#160;                
		                 </xsl:if>
	                    <xsl:apply-templates />
	                </td>
	             </xsl:when>
	             <xsl:otherwise>
	                <td width="85%" class="para_text">
	                    [<xsl:value-of select="@id" />]    
	                    &#160;&#160;&#160;                
	                    <xsl:apply-templates />
	                </td>
	             </xsl:otherwise>
				</xsl:choose>
                <td width="*"></td>
            </tr>
        </table>
        </div>
     </xsl:template>

    <xsl:template match="program-listing">
        <div style ="margin-bottom:  1pc;
                    font-size: 10pt;">
             <pre>
                 <xsl:apply-templates />
             </pre>
        </div>
    </xsl:template>

    <xsl:template match="section">
        <div style="margin-bottom:  1pc;
                    margin-left:    +10pt;">
               <xsl:apply-templates />
        </div>
    </xsl:template>


    <xsl:template match="smallcaps">
        <span style="font-variant: small-caps;">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <xsl:template match="subscript">
        <span style="vertical-align: sub;">
            <xsl:apply-templates  />
        </span>
    </xsl:template>

    <xsl:template match="superscript">
        <span style="vertical-align: super;">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="title-of-invention">
        <h1 class="title">
            <xsl:apply-templates />
        </h1>
    </xsl:template>

</xsl:stylesheet>