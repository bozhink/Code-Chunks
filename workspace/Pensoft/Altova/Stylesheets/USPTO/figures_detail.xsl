<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for showing figures in new window</doc:title>
    <doc:filename>figures_detail.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
		Formats the separate document showing all figures that results
		from clicking a cross-reference to a figure  (@target='DRAWINGS')
		<br/>
		This file is not called by any other; a processing instruction with
		a reference to this file is written to the new document that results 
		from the script contained in 'pap.xsl' and 'grant.xsl'.
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
*                                                                   *
*  culled from "figures.xsl" in                                     *
*   order to open "FIGURES" section in a new window when a          *
*   cross-reference to a figure is clicked                          *
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

    <xsl:template match="figures | FIGURES">
    <html>
    <head></head>
    <body>
       <br/>
	       <xsl:apply-templates />
	</body>
	</html>
    </xsl:template>

	<xsl:template match="figure | FIGURE">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="EMI[1]" doc:public="yes" doc:description="surpresses the first image [D0000]from the resulting new document in GRANT."/>
    
    <xsl:template match="image | EMI">
    	<xsl:if test="//image">
	    [<xsl:value-of select="substring-after(@id,'EMI-')"/>]
        <xsl:choose>
            <xsl:when test="@he"><!-- if it has height and width attributes -->
                <embed toolbar="off" fit="best" align="top" src="{@file}" height="{round(@he)}" width="{round(@wi)}"/>
            </xsl:when>
            <xsl:otherwise><!-- otherwise, preset TIFF viewer size -->
                <embed toolbar="off" fit="best" align="top" width="600" height="800" src="{@file}"/>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:if>
        <xsl:if test="//EMI">
	        [<xsl:value-of select="substring-after(@ID,'EMI-')"/>]
            <embed toolbar="off" fit="best" align="top" width="600" height="800" src="{@FILE}"/>
        </xsl:if>
        <div class="break_before" />
    </xsl:template>
</xsl:stylesheet>