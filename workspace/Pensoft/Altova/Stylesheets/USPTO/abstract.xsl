<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
       <doc:title>Component stylesheet for &lt;abstract-of-disclosure&gt; and &lt;subdoc-abstract&gt;</doc:title>
       <doc:filename>abstract.xsl</doc:filename>
       <doc:version>1.0</doc:version>
       <doc:doctype>numerous</doc:doctype>
       <doc:doctype-date>N/A</doc:doctype-date>
       <doc:dateCreated>2001-01-26</doc:dateCreated>
       <doc:lastModified>2001-02-16</doc:lastModified>
       <doc:description>
        Template rules for formatting the &lt;abstract-of-disclosure&gt; and &lt;subdoc-abstract&gt; are contained here.  
        This includes specialized rules for specification document instances, which force the abstract heading and paragraph to 
        print first, and to display and print first in patent-application-publication document instances.  Also writes a heading of
        &quot;Abstract&quot; if none is present.
      </doc:description>
</doc:summary>

<!--
************************************************************
*  John Dunning: 2001-01-29                                *
*  Component file for abstract-of-disclosure               *
************************************************************
-->

    <xsl:template match="abstract-of-disclosure | subdoc-abstract" doc:public="yes" doc:description="In specification, inserts the title-of-invention above the abstract.  If there is no heading above the abstract, a heading of &quot;Abstract&quot; is inserted.">
        <div class="break_before_after">
            <xsl:if test="//specification">
                <xsl:apply-templates mode="abstract_title" select="//title-of-invention" />
            </xsl:if>
            <xsl:choose>
                <xsl:when test="not(heading)">
                    <table width="90%" border="0">
                    <tr><td width="9%" class="table_data">(57)</td>
                        <td><h3>Abstract</h3></td>
                    </tr>
                    </table>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates mode="abstract_heading" select="./heading" />
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates mode="abstract_para" select="./paragraph" />
        </div>
        <xsl:apply-templates mode="drawing-section" select="//subdoc-drawings"/>
    </xsl:template>
    
    <xsl:template mode="abstract_title" match="title-of-invention" doc:public="yes" doc:description="modal template for printing title-of-invention before the abstract paragraph">
          <h1 align="CENTER" class="title">
            <xsl:apply-templates mode="abstract_heading" />
        </h1>
    </xsl:template>
    
    <xsl:template mode="abstract_heading" match="heading">
        <h3 align="center">
            <xsl:apply-templates mode="abstract_para" />
        </h3>
    </xsl:template>
    
    <xsl:template mode="abstract_para" match="paragraph">
          <div class="left_para">
            <table border="0" width="100%">
                <tr>
                    <td width="8%" valign="top">
                        <div class="para_text"></div>
                    </td>
                    <td width="85%">
                        <div class="para_text">
                               <xsl:if test="//patent-application-publication">
                                <!-- [<xsl:value-of select="@id"/>] -->
                            </xsl:if>
                            &#160;&#160;&#160;                
                            <xsl:apply-templates />
                        </div>
                    </td>
                    <td/>
                    </tr>
                </table>
        </div>
    </xsl:template>

    <xsl:template mode="drawing-section" match="*" doc:public="yes" doc:description="Used by patent-application-publication to print &lt;image&gt;s after the abstract and before the rest of the document.">
        <xsl:apply-templates mode="linker" select="//subdoc-drawings"/>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template mode="linker" match="//subdoc-drawings" doc:public="yes" doc:description="creates a hyperlink anchor at the subdoc-drawings section.">
        <a name="{@id}"/>
    </xsl:template>

</xsl:stylesheet>