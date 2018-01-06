<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for figures</doc:title>
    <doc:filename>figures.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
      Template rules for embedding TIFFs from &lt;image&gt; and &lt;figure&gt; elements
      into an HTML browser.  Calls script from 'pap.xsl' to create a new document
      with all images contained within a &lt;figure&gt; element and load into a 
      separate window.
    <pre style="font-face:arial; font-size:10pt;">
      Notes: 
      sets width &amp; height of embedded plug-in to width &amp; height         
      attributes of image if present; otherwise sets 800 X 600        
    
      preset to "best" fit; fits entire image to width &amp; height      
                                                                        
      NOTE:  width &amp; height are plug-in, not image!                  

      96 pixels per inch on Windows screens using Small Icons/fonts; 
      72 pixels per inch on Windows screens using Large Icons/fonts; 
      use 84 to allow for header and footer                          
                                                                   
      300 pixels per inch for USPTO scans           
       </pre>               
    </doc:description>
</doc:summary>

<!--
*********************************************************************
* John Dunning: 2001-01-26                                          *
* Component file for image viewing: <image>                         *
*                                                                      *
* sets width & height of embedded plug-in to width & height         *
*   attributes of image if present; otherwise sets 800 X 600        *
*                                                                   *
*    preset to "best" fit; fits entire image to width & height      *
*                                                                   *
*    NOTE:  width & height are plug-in, not image!                  *
*                                                                   *
*    96 pixels per inch on Windows screens using Small Icons/fonts; *
*    72 pixels per inch on Windows screens using Large Icons/fonts; *
*    use 84 to allow for header and footer                          *
*                                                                   *
*    300 pixels per inch for USPTO scans                            *
*********************************************************************
-->

    <xsl:template match="figure[1]">
       <br/>
      [<xsl:value-of select="substring-after(@id,'-')"/>]
       <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="drawing-reference-character">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="figure[1]/image[1]">
        <xsl:choose>
            <xsl:when test="@he"><!-- if it has height and width attributes -->
                <embed toolbar="off" fit="best" align="top" src="{@file}" height="{round(@he)}" width="{round(@wi)}"/>
            </xsl:when>
            <xsl:otherwise><!-- otherwise, preset TIFF viewer size -->
                <embed toolbar="off" fit="best" align="top" width="600" height="800" src="{@file}"/>
            </xsl:otherwise>
        </xsl:choose>
        <div class="break_before" />
    </xsl:template>


	<xsl:template match="image[not(ancestor::figure)]">
       <xsl:choose>
            <xsl:when test="@he"><!-- if it has height and width attributes -->
                <embed toolbar="off" fit="best" align="top" src="{@file}" height="{round(@he)}" width="{round(@wi)}"/>
            </xsl:when>
            <xsl:otherwise><!-- otherwise, preset TIFF viewer size -->
                <embed toolbar="off" fit="best" align="top" width="600" height="800" src="{@file}"/>
            </xsl:otherwise>
        </xsl:choose>
	</xsl:template>


</xsl:stylesheet>