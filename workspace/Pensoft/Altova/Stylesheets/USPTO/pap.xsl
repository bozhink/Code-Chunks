<?xml-stylesheet href="stripDocumentation.xsl" type="text/xsl"?>
<xsl:stylesheet version="1.0" 
                exclude-result-prefixes="msxsl local doc" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:local="#local-functions" 
                extension-element-prefixes="msxsl local">


<!-- *** these are imported for documentation purposes only! *** -->
<!-- *** see 'xsl:include' elements at the bottom of this file *** -->
<xsl:import href="pap_noscript.xsl"/>
<xsl:import href="figures_detail.xsl"/>
<xsl:import href="figures_noscript.xsl"/>
                
<doc:summary doc:public="yes" >
    <doc:title>Patent Application Publication Stylesheet</doc:title>
    <doc:filename>pap.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>PAP v1.5</doc:doctype>
    <doc:doctype-date>2001-01-31</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-21</doc:lastModified>
    <doc:description>This is the "driver" file for an XSL transformation;        
       all patent-application-publication specific template rules  
       are in this file; component files are "included" below      
    </doc:description>
</doc:summary>


<xsl:output method="html" indent="yes" omit-xml-declaration="yes" />

<xsl:preserve-space elements="*"/>

<xsl:template match="*">
    <xsl:apply-templates /> 
</xsl:template>

<xsl:template match="/" doc:public="yes" doc:description="The root element of the document instance; creates an HTML document context">
    <html>
        <head>
            <xsl:call-template name="css_styles"/>
	<script language="JScript"><xsl:comment><![CDATA[
	function loadNewDoc(node){
	try {
		var myloc, myNewLoc, myPI, stylePI, newStylePI, r, re, styleNode;

		var mydoc = new ActiveXObject("Msxml2.DOMDocument");
		var myNewDoc = new ActiveXObject("Msxml2.DOMDocument");
			myNewDoc.loadXML("<figure></figure>");
			root = myNewDoc.documentElement; // <figure/>
			myloc = new String(window.location);
			myNewLoc = myloc.substr(8); 

		var myImages = document.XMLDocument.getElementsByTagName("figure/image");
			for (var i=0;i<myImages.length;i++){
				myNewDoc.documentElement.appendChild(myImages(i));
		}

		for (var i=0;i<document.XMLDocument.documentElement.parentNode.childNodes.length;i++){
			if (document.XMLDocument.documentElement.parentNode.childNodes(i).nodeName == "xml-stylesheet") {
				stylePI = document.XMLDocument.documentElement.parentNode.childNodes(i).text;

				// test whether pap.xsl or pap_full.xsl is used;
				if (stylePI.indexOf("full") == -1)
					re = /pap/g;
					else
					re = /pap_full/g;
				r = stylePI.replace(re,"figures_detail");
				newStylePI = myNewDoc.createProcessingInstruction("xml-stylesheet",r);
				}
			}
			styleNode = myNewDoc.insertBefore(newStylePI,root);

		// save new file to same directory		
		
			var fileName = "";
			var href= myNewLoc;
			var s = href.split("/");
			for (var i=0;i<(s.length);i++) { 
			fileName=s[i]; 
			}
			var locLen = myNewLoc.length;
			var fileLen = fileName.length;
			var path = myNewLoc.substr(0,(locLen-fileLen));
			
		// now write to a file that can be opened in new browser
		var fso = new ActiveXObject("Scripting.FileSystemObject");
		var a = fso.CreateTextFile(path + "images.xml", true);
		a.Write(myNewDoc.xml);
		a.Close();
			
		var newWin = window.open(path + "images.xml");
	
	}
	
	catch(e) {
		window.alert ("An error has occurred.  Please use the stylesheet 'pap_noscript.xsl'");	
	}
}	


	]]></xsl:comment>
	</script>
    </head>
        
        <body>
        <basefont face="Arial Unicode MS, Lucida Sans Unicode, Times New Roman "
                    size="2">
        <div style="margin-left: +35pt;">
            <xsl:apply-templates select=".//subdoc-bibliographic-information | .//subdoc-abstract | .//subdoc-description | .//sequence-cwu | .//subdoc-claims"/>
        </div>
        </basefont>
        </body>
    </html>
</xsl:template>

    <!-- *** top-level block (document head) *** -->

    <xsl:template match="subdoc-bibliographic-information" doc:public="yes" doc:description="Template rules specific to formatting objects contained in &lt;subdoc-bibliographic-information&gt;. 
                                                          This includes the barcode and the following elements and their children: document-id, publication-filing-type, domestic-filing-data, foreign-priority-data, technical-information, continuity-data, prior-publication, inventors, assignee, correspondence-address, international-conventions, and appendix-data">
		<xsl:param name="subdoc-year" doc:public="yes" doc:description="assigns the year portion of the &lt;document-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(.//document-date,1,4)"/>
		</xsl:param>
		<xsl:param name="subdoc-month" doc:public="yes" doc:description="assigns the month portion of the &lt;document-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(.//document-date,5,2)"/>
		</xsl:param>
		<xsl:param name="subdoc-day" doc:public="yes" doc:description="assigns the date portion of the &lt;document-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(.//document-date,7,2)"/>
		</xsl:param>

		<xsl:param name="filing-year" doc:public="yes" doc:description="assigns the year portion of the &lt;filing-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(.//filing-date,1,4)"/>
		</xsl:param>
		<xsl:param name="filing-month" doc:public="yes" doc:description="assigns the month portion of the &lt;filing-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(.//filing-date,5,2)"/>
		</xsl:param>
		<xsl:param name="filing-day" doc:public="yes" doc:description="assigns the date portion of the &lt;filing-date&gt; element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(.//filing-date,7,2)"/>
		</xsl:param>
		 
 
 	<table width="90%" border="0">
                <tr>
                <!-- ***** barcode info ***** -->
                <td class="bar" align="right">*<xsl:value-of select=".//doc-number"/><xsl:value-of select=".//kind-code" />*</td>        
                </tr>
        </table>
        <xsl:variable name="doc_len" select="string-length(.//document-id/doc-number)" doc:public="yes" doc:description="gets the length of the doc-number for use in formatting doc-number"/>
		<xsl:variable name="pubno_1" select="substring(.//document-id/doc-number,1,4)" doc:public="yes" doc:description="used to format the first part of the publication number (e.g. &quot;20001-&quot;"/>            
		<xsl:variable name="pubno_2" select="substring(.//document-id/doc-number,3,$doc_len)" doc:public="yes" doc:description="used to format the remaining part of the publication number"/>            

        <table width="90%" border="0">
            <tr>
                <td class="headinfo_large" width="43%">
                    <b>Patent Application Publication</b> &#160;&#160;<font size="-1" weight="normal">(12)</font>
                </td>
                <td class="table_data" width="27%">
                    (10) &#160;&#160;&#160;&#160;<b>Publication Number: </b>
                </td>
                <td class="table_data" width="30%" align="right">
                    <b>US <xsl:value-of select="$pubno_1"/>-<xsl:value-of select="$pubno_2" />
                    <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select=".//kind-code" />
                    </b>                
                </td>
            </tr>
            <tr>
                <td class="headinfo_reg">
                    <b><xsl:value-of select=".//first-named-inventor//family-name"/></b>
                </td>
                <td class="table_data">(43)&#160;&#160;&#160;&#160; <b>Publication Date:</b> </td>
                <td class="headinfo_reg" align="right"><xsl:value-of select="$subdoc-year" />-<xsl:value-of select="$subdoc-month" />-<xsl:value-of select="$subdoc-day" /></td>
            </tr>
        </table>
        <hr width="100%"/>
        <!-- end doc header -->
        
        <!-- bibliographic info -->
        <table width="90%" border="0">
        <tr><td width="10%"/><td width="15%"/><td width="*"/></tr>
            <tr><td class="table_data">(54)</td>
                <td colspan="2" style="text-transform: uppercase"><b><xsl:value-of select="//title-of-invention"/></b></td>
                <td/>
            </tr>
            <tr><td class="table_data">(76)</td>
                <td class="table_data">
                    INVENTOR: 
                </td>
                <td class="table_data">
                 <b><xsl:apply-templates select=".//first-named-inventor/name"/>,</b> 
                 &#160;<xsl:value-of select=".//first-named-inventor/residence//city"/>
                    <xsl:text>&#160;</xsl:text>
                    <xsl:value-of select=".//first-named-inventor/residence//state"/>
                    <xsl:text>&#160;</xsl:text>
                    (<xsl:value-of select=".//first-named-inventor/residence//country-code"/>)
                    </td>
            </tr>
            <tr><td/>			            
            <td class="table_data" colspan="2"><xsl:apply-templates select="correspondence-address" /></td></tr>
            <tr>
                <xsl:variable name="appno_1" select="substring(.//application-number/doc-number,1,2)" doc:public="yes" doc:description="used to format the first part of the application number (e.g. &quot;09/&quot;"/>            
                <xsl:variable name="appno_2" select="substring(.//application-number/doc-number,3,8)" doc:public="yes" doc:description="used to format the remaining part of the application number"/>            
                <td class="table_data">(21)</td>
                <td class="table_data">Appl. No.: </td>
                <td class="table_data"><b><xsl:value-of select="$appno_1"/>/<xsl:value-of select="format-number($appno_2,'###,###')" /></b></td>
            </tr>
            <tr><td class="table_data">(22)</td>
                <td class="table_data">Filed: </td>
                <td class="table_data"><b><xsl:value-of select="$filing-year" />-<xsl:value-of select="$filing-month" />-<xsl:value-of select="$filing-day" /></b></td>
            </tr>
            
            <table width="50%" border="0">
                <xsl:if test="//foreign-priority-data">
                    <xsl:call-template name="foreign_data"/>    
                </xsl:if>
            </table>
                <xsl:call-template name="tech_info"/>
            <tr><td>&#160;</td></tr>
            <tr><td>&#160;</td></tr>
            <xsl:apply-templates select="appendix-data"/>
        </table>
    </xsl:template>
    
    
<xsl:template match="subdoc-description" doc:public="no" doc:description="Template rules specific to &lt;subdoc-description&gt;; uses generic &lt;xsl:apply-templates /&gt; to call included template rules.">
    <div class="smalltitle">
        <xsl:value-of select="//title-of-invention" />
    </div>
        <xsl:apply-templates />
</xsl:template>

<xsl:template match="copyright-statement">
        <div style="margin-bottom:  1pc;
                    margin-left:    +10pt;">
               <xsl:apply-templates />
        </div>
</xsl:template>

<xsl:template match="cross-reference-to-related-applications">
        <div style="margin-bottom:  1pc;
                    margin-left:    +10pt;">
               <xsl:apply-templates />
        </div>
</xsl:template>

    <xsl:template match="cross-reference">
      <b>
       	<xsl:choose>
           	<xsl:when test="@target='DRAWINGS'">
                <a href="javascript:loadNewDoc(this);">
                   <xsl:apply-templates />
                </a>
             </xsl:when>
             <xsl:otherwise>
				<a href="#{@target}">
                   <xsl:apply-templates />
                </a>
             </xsl:otherwise>
       </xsl:choose>
      </b>
    </xsl:template>



    <xsl:template name="foreign_data" doc:description="Template rules for &lt;foreign-priority-data&gt; and children">
		<xsl:param name="foreign-year" doc:public="yes" doc:description="assigns the year portion of the foreign-priority-data/filing-date to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(foreign-priority-data/filing-date,1,4)"/>
		</xsl:param>
		<xsl:param name="foreign-month" doc:public="yes" doc:description="assigns the month portion of the foreign-priority-data/filing-date to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(foreign-priority-data/filing-date,5,2)"/>
		</xsl:param>
		<xsl:param name="foreign-day" doc:public="yes" doc:description="assigns the date portion of the foreign-priority-data/filing-date to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(foreign-priority-data/filing-date,7,2)"/>
		</xsl:param>
    
        <tr>
            <td class="table_data" width="9%">(30)</td>
            <td class="table_data" colspan="3" align="center"><b>Foreign Application Priority Data</b></td>
        </tr>
        <tr><td/>
            <td class="table_data"><!--xsl:value-of select="foreign-priority-data/filing-date"/-->
            <xsl:value-of select="$foreign-year" />-<xsl:value-of select="$foreign-month" />-<xsl:value-of select="$foreign-day" /></td>
            <td class="table_data"><xsl:value-of select="foreign-priority-data/country-code"/></td>
            <td class="table_data" align="right"><xsl:value-of select=".//priority-application-number/doc-number"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template name="tech_info" doc:description="Template rules for Publication Classifications (US/International) and children.">
    <table width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="9%"/>
            <td class="table_data" colspan="4" align="center"><b>Publication Classification</b></td>
        </tr>
        <tr><td class="table_data">(51)</td>
            <td class="table_data" width="15%"><b>Int. Cl.: </b></td>
            <td/>
                <xsl:call-template name="classifications_ipc" />
        </tr>
        <tr><td class="table_data">(52)</td>
            <td class="table_data"><b>U.S. Cl.:</b></td>
            <td/>
                <xsl:call-template name="classifications_us" />
        </tr>
    </table>
    </xsl:template>

    <!-- hide MathML components -->
    <xsl:template match="//math/*" doc:public="yes" doc:description="Hides MathML components, as an &lt;image&gt; will be supplied" />
    
     <xsl:template match="representative-figure">
         Representative Figure: <xsl:value-of select="." />
     </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="." />
    </xsl:template>

<!-- include component stylesheets, overriding subsequent declarations -->

<xsl:include href="abstract.xsl"/>
<xsl:include href="address.xsl"/>
<xsl:include href="appendix.xsl"/>
<xsl:include href="biological-deposit.xsl"/>
<xsl:include href="cals.xsl"/>
<xsl:include href="citation.xsl"/>
<xsl:include href="claims.xsl"/>
<xsl:include href="classifications.xsl"/>
<xsl:include href="common.xsl"/>
<xsl:include href="correspondence-address.xsl"/>
<xsl:include href="css-styles.xsl"/>
<xsl:include href="cwu.xsl"/>
<xsl:include href="document-id.xsl"/>
<xsl:include href="figures.xsl"/>
<xsl:include href="inventor-block.xsl"/>
<xsl:include href="name.xsl"/>
<xsl:include href="para-fed.xsl"/>
<xsl:include href="party.xsl"/>
<xsl:include href="residence.xsl"/>
<xsl:include href="sequence-listing.xsl"/>


</xsl:stylesheet>