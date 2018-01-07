<xsl:stylesheet version="1.0" exclude-result-prefixes="msxsl local doc" extension-element-prefixes="msxsl local" xmlns:doc="urn:schemas-uspto-gov:document" xmlns:local="#local-functions" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!-- *** these are imported for documentation purposes only! *** -->
<!-- *** see 'xsl:include' elements at the bottom of this file *** -->
<xsl:import href="pap_noscript.xsl"/>
<xsl:import href="figures_detail.xsl"/>
<xsl:import href="figures_noscript.xsl"/>
                



<xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>

<xsl:preserve-space elements="*"/>

<xsl:template match="*">
    <xsl:apply-templates/> 
</xsl:template>

<xsl:template match="/">
    <html>
        <head>
            <xsl:call-template name="css_styles"/>
	<script language="JScript"><xsl:comment>
	function loadNewDoc(node){
	try {
		var myloc, myNewLoc, myPI, stylePI, newStylePI, r, re, styleNode;

		var mydoc = new ActiveXObject("Msxml2.DOMDocument");
		var myNewDoc = new ActiveXObject("Msxml2.DOMDocument");
			myNewDoc.loadXML("&lt;figure&gt;&lt;/figure&gt;");
			root = myNewDoc.documentElement; // &lt;figure/&gt;
			myloc = new String(window.location);
			myNewLoc = myloc.substr(8); 

		var myImages = document.XMLDocument.getElementsByTagName("figure/image");
			for (var i=0;i&lt;myImages.length;i++){
				myNewDoc.documentElement.appendChild(myImages(i));
		}

		for (var i=0;i&lt;document.XMLDocument.documentElement.parentNode.childNodes.length;i++){
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
			for (var i=0;i&lt;(s.length);i++) { 
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


	</xsl:comment>
	</script>
    </head>
        
        <body>
        <basefont face="Arial Unicode MS, Lucida Sans Unicode, Times New Roman " size="2">
        <div style="margin-left: +35pt;">
            <xsl:apply-templates select=".//subdoc-bibliographic-information | .//subdoc-abstract | .//subdoc-description | .//sequence-cwu | .//subdoc-claims"/>
        </div>
        </basefont>
        </body>
    </html>
</xsl:template>

    <!-- *** top-level block (document head) *** -->

    <xsl:template match="subdoc-bibliographic-information">
		<xsl:param name="subdoc-year">
			<xsl:value-of select="substring(.//document-date,1,4)"/>
		</xsl:param>
		<xsl:param name="subdoc-month">
			<xsl:value-of select="substring(.//document-date,5,2)"/>
		</xsl:param>
		<xsl:param name="subdoc-day">
			<xsl:value-of select="substring(.//document-date,7,2)"/>
		</xsl:param>

		<xsl:param name="filing-year">
			<xsl:value-of select="substring(.//filing-date,1,4)"/>
		</xsl:param>
		<xsl:param name="filing-month">
			<xsl:value-of select="substring(.//filing-date,5,2)"/>
		</xsl:param>
		<xsl:param name="filing-day">
			<xsl:value-of select="substring(.//filing-date,7,2)"/>
		</xsl:param>
		 
 
 	<table width="90%" border="0">
                <tr>
                <!-- ***** barcode info ***** -->
                <td class="bar" align="right">*<xsl:value-of select=".//doc-number"/><xsl:value-of select=".//kind-code"/>*</td>        
                </tr>
        </table>
        <xsl:variable name="doc_len" select="string-length(.//document-id/doc-number)"/>
		<xsl:variable name="pubno_1" select="substring(.//document-id/doc-number,1,4)"/>            
		<xsl:variable name="pubno_2" select="substring(.//document-id/doc-number,3,$doc_len)"/>            

        <table width="90%" border="0">
            <tr>
                <td class="headinfo_large" width="43%">
                    <b>Patent Application Publication</b>   <font size="-1" weight="normal">(12)</font>
                </td>
                <td class="table_data" width="27%">
                    (10)     <b>Publication Number: </b>
                </td>
                <td class="table_data" width="30%" align="right">
                    <b>US <xsl:value-of select="$pubno_1"/>-<xsl:value-of select="$pubno_2"/>
                    <xsl:text> </xsl:text>
                        <xsl:value-of select=".//kind-code"/>
                    </b>                
                </td>
            </tr>
            <tr>
                <td class="headinfo_reg">
                    <b><xsl:value-of select=".//first-named-inventor//family-name"/></b>
                </td>
                <td class="table_data">(43)     <b>Publication Date:</b> </td>
                <td class="headinfo_reg" align="right"><xsl:value-of select="$subdoc-year"/>-<xsl:value-of select="$subdoc-month"/>-<xsl:value-of select="$subdoc-day"/></td>
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
                  <xsl:value-of select=".//first-named-inventor/residence//city"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select=".//first-named-inventor/residence//state"/>
                    <xsl:text> </xsl:text>
                    (<xsl:value-of select=".//first-named-inventor/residence//country-code"/>)
                    </td>
            </tr>
            <tr><td/>
            
            <td class="table_data" colspan="2"><xsl:apply-templates select="correspondence-address"/></td></tr>
            <tr>
                <xsl:variable name="appno_1" select="substring(.//application-number/doc-number,1,2)"/>            
                <xsl:variable name="appno_2" select="substring(.//application-number/doc-number,3,8)"/>            
                <td class="table_data">(21)</td>
                <td class="table_data">Appl. No.: </td>
                <td class="table_data"><b><xsl:value-of select="$appno_1"/>/<xsl:value-of select="format-number($appno_2,'###,###')"/></b></td>
            </tr>
            <tr><td class="table_data">(22)</td>
                <td class="table_data">Filed: </td>
                <td class="table_data"><b><xsl:value-of select="$filing-year"/>-<xsl:value-of select="$filing-month"/>-<xsl:value-of select="$filing-day"/></b></td>
            </tr>
            
            <table width="50%" border="0">
                <xsl:if test="//foreign-priority-data">
                    <xsl:call-template name="foreign_data"/>    
                </xsl:if>
            </table>
                <xsl:call-template name="tech_info"/>
            <tr><td> </td></tr>
            <tr><td> </td></tr>
            <xsl:apply-templates select="appendix-data"/>
        </table>
    </xsl:template>
    
    
<xsl:template match="subdoc-description">
    <div class="smalltitle">
        <xsl:value-of select="//title-of-invention"/>
    </div>
        <xsl:apply-templates/>
</xsl:template>

<xsl:template match="copyright-statement">
        <div style="margin-bottom:  1pc;                     margin-left:    +10pt;">
               <xsl:apply-templates/>
        </div>
</xsl:template>

<xsl:template match="cross-reference-to-related-applications">
        <div style="margin-bottom:  1pc;                     margin-left:    +10pt;">
               <xsl:apply-templates/>
        </div>
</xsl:template>

    <xsl:template match="cross-reference">
      <b>
       	<xsl:choose>
           	<xsl:when test="@target='DRAWINGS'">
                <a href="javascript:loadNewDoc(this);">
                   <xsl:apply-templates/>
                </a>
             </xsl:when>
             <xsl:otherwise>
				<a href="#{@target}">
                   <xsl:apply-templates/>
                </a>
             </xsl:otherwise>
       </xsl:choose>
      </b>
    </xsl:template>



    <xsl:template name="foreign_data">
		<xsl:param name="foreign-year">
			<xsl:value-of select="substring(foreign-priority-data/filing-date,1,4)"/>
		</xsl:param>
		<xsl:param name="foreign-month">
			<xsl:value-of select="substring(foreign-priority-data/filing-date,5,2)"/>
		</xsl:param>
		<xsl:param name="foreign-day">
			<xsl:value-of select="substring(foreign-priority-data/filing-date,7,2)"/>
		</xsl:param>
    
        <tr>
            <td class="table_data" width="9%">(30)</td>
            <td class="table_data" colspan="3" align="center"><b>Foreign Application Priority Data</b></td>
        </tr>
        <tr><td/>
            <td class="table_data"><!--xsl:value-of select="foreign-priority-data/filing-date"/-->
            <xsl:value-of select="$foreign-year"/>-<xsl:value-of select="$foreign-month"/>-<xsl:value-of select="$foreign-day"/></td>
            <td class="table_data"><xsl:value-of select="foreign-priority-data/country-code"/></td>
            <td class="table_data" align="right"><xsl:value-of select=".//priority-application-number/doc-number"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template name="tech_info">
    <table width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="9%"/>
            <td class="table_data" colspan="4" align="center"><b>Publication Classification</b></td>
        </tr>
        <tr><td class="table_data">(51)</td>
            <td class="table_data" width="15%"><b>Int. Cl.: </b></td>
            <td/>
                <xsl:call-template name="classifications_ipc"/>
        </tr>
        <tr><td class="table_data">(52)</td>
            <td class="table_data"><b>U.S. Cl.:</b></td>
            <td/>
                <xsl:call-template name="classifications_us"/>
        </tr>
    </table>
    </xsl:template>

    <!-- hide MathML components -->
    <xsl:template match="//math/*"/>
    
     <xsl:template match="representative-figure">
         Representative Figure: <xsl:value-of select="."/>
     </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>

<!-- include component stylesheets, overriding subsequent declarations -->

<xsl:template match="abstract-of-disclosure | subdoc-abstract" doc:public="yes" doc:description="In specification, inserts the title-of-invention above the abstract.  If there is no heading above the abstract, a heading of &quot;Abstract&quot; is inserted.">
        <div class="break_before_after">
            <xsl:if test="//specification">
                <xsl:apply-templates mode="abstract_title" select="//title-of-invention"/>
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
                    <xsl:apply-templates mode="abstract_heading" select="./heading"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates mode="abstract_para" select="./paragraph"/>
        </div>
        <xsl:apply-templates mode="drawing-section" select="//subdoc-drawings"/>
    </xsl:template><xsl:template mode="abstract_title" match="title-of-invention" doc:public="yes" doc:description="modal template for printing title-of-invention before the abstract paragraph">
          <h1 align="CENTER" class="title">
            <xsl:apply-templates mode="abstract_heading"/>
        </h1>
    </xsl:template><xsl:template mode="abstract_heading" match="heading">
        <h3 align="center">
            <xsl:apply-templates mode="abstract_para"/>
        </h3>
    </xsl:template><xsl:template mode="abstract_para" match="paragraph">
          <div class="left_para">
            <table border="0" width="100%">
                <tr>
                    <td width="8%" valign="top">
                        <div class="para_text"/>
                    </td>
                    <td width="85%">
                        <div class="para_text">
                               <xsl:if test="//patent-application-publication">
                                <!-- [<xsl:value-of select="@id"/>] -->
                            </xsl:if>
                                               
                            <xsl:apply-templates/>
                        </div>
                    </td>
                    <td/>
                    </tr>
                </table>
        </div>
    </xsl:template><xsl:template mode="drawing-section" match="*" doc:public="yes" doc:description="Used by patent-application-publication to print &lt;image>s after the abstract and before the rest of the document.">
        <xsl:apply-templates mode="linker" select="//subdoc-drawings"/>
        <xsl:apply-templates/>
    </xsl:template><xsl:template mode="linker" match="//subdoc-drawings" doc:public="yes" doc:description="creates a hyperlink anchor at the subdoc-drawings section.">
        <a name="{@id}"/>
    </xsl:template>
<xsl:template match="address" doc:public="yes" doc:description="Creates a table to format child elements of address.">
        <table width="60%" border="0">
            <tr>
                <xsl:if test="./military-address">
                    <td class="table_data"><xsl:value-of select="."/></td>
                </xsl:if>
                <td class="table_data"><xsl:value-of select="./address-1"/></td>
            </tr>
            <tr>
                <td class="table_data"><xsl:value-of select="./address-2"/></td>
            </tr>
            <tr>
                <td class="table_data"><xsl:value-of select="./city"/>,
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="./state"/> 
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="./postalcode"/>,
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="./country/country-code"/>
                </td>
            </tr>

            <xsl:for-each select="./email">
            <tr>
                <td class="table_data"><xsl:value-of select="."/></td>
            </tr>
            </xsl:for-each>
        
            <xsl:for-each select="./telephone">
                <tr>
                    <td class="table_data">  <xsl:value-of select="."/></td>
                </tr>
            </xsl:for-each>
    
            <xsl:for-each select="./fax">
                <tr>
                    <td class="table_data"><xsl:value-of select="."/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
<xsl:template match="appendix-data">
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="object-reference">
        <div class="left_para">
        <table border="0" width="90%">
            <tr>
                <td width="8%" valign="top">  </td>
                <td width="85%">
                    <span class="para_text">
                        <xsl:apply-templates/>
                    </span>
                </td>
                <td width="*"/>
            </tr>
        </table>
        </div>
    </xsl:template><xsl:template match="object-id | object-contents | object-description">
            <xsl:text> </xsl:text>
            <xsl:apply-templates/>
    </xsl:template>
<xsl:template match="biological-deposit">
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="deposit-term | depository | deposit-accession-number | deposit-description">
        <xsl:text> </xsl:text>
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="deposit-date">
		<xsl:param name="deposit-year" doc:public="yes" doc:description="assigns the year portion of the &lt;deposit-date> element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(deposit-date,1,4)"/>
		</xsl:param>
		<xsl:param name="deposit-month" doc:public="yes" doc:description="assigns the month portion of the &lt;deposit-date> element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(deposit-date,5,2)"/>
		</xsl:param>
		<xsl:param name="deposit-day" doc:public="yes" doc:description="assigns the date portion of the &lt;deposit-date> element to a parameter to allow YYYY-MM-DD date formatting.">
			<xsl:value-of select="substring(deposit-date,7,2)"/>
		</xsl:param>
		<xsl:value-of select="$deposit-year"/>-<xsl:value-of select="$deposit-month"/>-<xsl:value-of select="$deposit-day"/>
    </xsl:template>
<xsl:template match="table-cwu">
        <div style="page-break-inside: avoid; "> 
            [<xsl:value-of select="@id"/>]
            <xsl:apply-templates select="table | Table"/>
        </div>
    </xsl:template><xsl:template match="table | Table">
            <span class="table_head">
                <xsl:value-of select="./heading"/>
            </span>

        <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr><td>
                <xsl:apply-templates select="tgroup | TGroup"/>
            </td></tr>
        </table>
    </xsl:template><xsl:template match="tgroup | TGroup" doc:public="yes" doc:description="This template nests tables within each other, since CALS allows multiple &lt;tgroup>s within one &lt;table> and HTML does not; each &lt;tgroup> from the source document becomes a new table.  See           HTML 4.0, section 11.2.3: &quot;The THEAD, TFOOT, and TBODY sections must contain the same number of columns&quot;.">

    <table cellpadding="0" cellspacing="0">
    
        <xsl:attribute name="rules">
            <xsl:value-of select="ancestor-or-self::table[1]/@frame | ancestor-or-self::Table[1]/@frame"/>
        </xsl:attribute>
        
        <!-- this will hide the box around a table -->
        <!--xsl:if test="ancestor::table[1]/@frame='none'">
            <xsl:attribute name="border">0</xsl:attribute>
        </xsl:if-->

        <colgroup>
            <xsl:apply-templates select="colspec"/>
        </colgroup>
        <thead>
            <xsl:apply-templates select="thead"/>
        </thead>
            <xsl:apply-templates select="tbody | TBody"/>
    </table>
    </xsl:template><xsl:template match="tbody | TBody">
        <tbody valign="{@valign}">
            <xsl:apply-templates/>
        </tbody>
    </xsl:template><xsl:template match="thead">
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="colspec">
            <xsl:for-each select="descendant-or-self::colspec">    
                <col width="{@colwidth}" align="{@align}"/>
                    <xsl:apply-templates/>
            </xsl:for-each>
    </xsl:template><xsl:template match="row | Row">
        <tr>
            <xsl:apply-templates select="entry | Entry"/>
        </tr>
    </xsl:template><xsl:template match="entry | Entry" doc:public="yes" doc:description="This template performs an evaluation to test                                         whether &lt;spanspec> or the &quot;nameend&quot; attribute was used and span table data accordingly">
<xsl:param name="rowname" select="@spanname" doc:public="yes" doc:description="the @spanname of the &lt;entry>; used in evaluation to lookup @nameend of &lt;spanspec>"/>
        <td class="table_data">
            <xsl:if test="@align">
                <xsl:attribute name="align">
                    <xsl:value-of select="@align"/>
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
                   
                </xsl:if>
                <xsl:apply-templates/>
            </td>
        </xsl:template>
<xsl:template match="citation">
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="cited-patent-literature">
        <div>
        <xsl:text> </xsl:text>
            <xsl:apply-templates/>
        </div>
    </xsl:template><xsl:template match="cited-non-patent-literature | classification-ipc-edition | ipc | uspc-freeform">
        <xsl:choose>
            <xsl:when test="//specification">
                <b>    <xsl:apply-templates/>    </b>
            </xsl:when>
            <xsl:when test="//patent-application-publication">
                <xsl:apply-templates/>
            </xsl:when>
        </xsl:choose>
    </xsl:template><xsl:template match="relevant-section">
        <b> <xsl:apply-templates/>    </b>
    </xsl:template>
<xsl:template match="claims">
        <div class="break_before">
            <xsl:apply-templates/>
        </div>
    </xsl:template><xsl:template match="claim" doc:public="yes" doc:description="specification shows @number; pap shows @id.">
        <div class="left_para">
            <table border="0" width="100%">
            <tr>
                <td width="8%" valign="top">
                <a name="{@id}"/>
                <xsl:choose>
                    <xsl:when test="//specification"><!-- if its the spec -->
                        <div class="text">
                            [c<xsl:value-of select="@number"/>]
                        </div>
                        <td width="70%" valign="top" class="text">
                            <xsl:apply-templates/>
                        </td>
                    </xsl:when>
                    <xsl:when test="//patent-application-publication">
                        <td width="12%" valign="top" align="right" class="para_text" colspan="1">
                            [<xsl:value-of select="substring-after(@id,'CLM-')"/>]
                        </td>
                        <td width="70%" valign="top" class="para_text">
                            <xsl:apply-templates/>
                        </td>
                    </xsl:when>
                </xsl:choose>
                </td>
                <td width="*"/>
                </tr>
                </table>
         </div>
     </xsl:template><xsl:template match="claim/claim-text[1]">
		<span style="claim_text">
			<xsl:apply-templates/>
		</span>
	</xsl:template><xsl:template match="claim-text[not(ancestor::dependent-claim-reference)]">
        <div class="claim_text">
            <xsl:apply-templates/>
        </div>
    </xsl:template><xsl:template match="dependent-claim-reference">
            <b><a href="#{@depends_on}"><xsl:apply-templates/></a></b>
    </xsl:template><xsl:template match="markush-group">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template><xsl:template match="markush-item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
<xsl:template match="uspc">
        <xsl:value-of select=".//class"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select=".//subclass"/>
    </xsl:template><xsl:template name="classifications_ipc">
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
    </xsl:template><xsl:template name="classifications_us">
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
    </xsl:template><xsl:template name="uspc_freeform">
        <tr><td/><td/><td/>
            <td class="table_data"><xsl:value-of select="."/></td>
        </tr>    
    </xsl:template><xsl:template name="us_secondary">
            <xsl:value-of select="class"/>/<xsl:value-of select="subclass"/>                                
    </xsl:template>
<xsl:template match="bold">
        <b> <xsl:apply-templates/> </b>
    </xsl:template><xsl:template match="email">
        <span class="mono"> <xsl:apply-templates/> </span>
    </xsl:template><xsl:template match="emphasis | italic">
        <i> <xsl:apply-templates/> </i>
    </xsl:template><xsl:template match="footnote">
        <font size="-2"><xsl:apply-templates/></font>
    </xsl:template><xsl:template match="heading">
        <h3><xsl:apply-templates/></h3>
    </xsl:template><xsl:template match="highlight| in-line-formula | literal">
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="list-item">
        <div class="list_item">
            <xsl:apply-templates/>        
        </div>    
     </xsl:template><xsl:template match="paragraph">
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
		                    [<xsl:value-of select="substring-after(@id,'P-')"/>]    
		                                       
		                 </xsl:if>
	                    <xsl:apply-templates/>
	                </td>
	             </xsl:when>
	             <xsl:otherwise>
	                <td width="85%" class="para_text">
	                    [<xsl:value-of select="@id"/>]    
	                                       
	                    <xsl:apply-templates/>
	                </td>
	             </xsl:otherwise>
				</xsl:choose>
                <td width="*"/>
            </tr>
        </table>
        </div>
     </xsl:template><xsl:template match="program-listing">
        <div style="margin-bottom:  1pc;                     font-size: 10pt;">
             <pre>
                 <xsl:apply-templates/>
             </pre>
        </div>
    </xsl:template><xsl:template match="section">
        <div style="margin-bottom:  1pc;                     margin-left:    +10pt;">
               <xsl:apply-templates/>
        </div>
    </xsl:template><xsl:template match="smallcaps">
        <span style="font-variant: small-caps;">
            <xsl:apply-templates/>
        </span>
    </xsl:template><xsl:template match="subscript">
        <span style="vertical-align: sub;">
            <xsl:apply-templates/>
        </span>
    </xsl:template><xsl:template match="superscript">
        <span style="vertical-align: super;">
            <xsl:apply-templates/>
        </span>
    </xsl:template><xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template><xsl:template match="title-of-invention">
        <h1 class="title">
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
<xsl:template match="correspondence-address" doc:public="yes" doc:description="inserts different boilerplate text according to doctype.">
    <br/>
        <xsl:choose>
            <xsl:when test="//bibd.transmittal">
                <b>Correspondence Address (Publish):</b>
            </xsl:when>        
            <xsl:when test="//patent-application-publication">
                <b>Correspondence Name and Address:</b>
                <br/>
                <xsl:apply-templates/>
            </xsl:when>
        </xsl:choose>
</xsl:template><xsl:template match="name-1 | name-2">
        <xsl:apply-templates/>
</xsl:template>
<xsl:template name="css_styles" doc:description="Inserts a &lt;style> element containing a list of CSS styles used by USPTO stylesheets into the &lt;head> section of the resulting HTML document.">
<style type="text/css">
            a     {text-decoration: none;color:blue;}
            
            a:visited {color: blue; }
            
            
            .bar {font-family: Code 39;
                  font-size: 16pt;}

            .break_avoid {page-break-inside: avoid;}
            
            .break_before {page-break-before: always;}
            
            .break_before_after {page-break-before: always;
                                 page-break-after: always;}

            .claim_text {margin-left: +30pt;
                         font-size: 10pt;
                             line-height: 200%;}

            .grant_claim_text {margin-left: +60pt;
                                   line-height: 200%;}

            .head {    font-size: 12pt;
                    font-weight: bold;
                      margin-top: 2em;
                      margin-bottom: 2em;}
                      
            heading {margin-top: 3px;
                     margin-bottom: 3px;
                     text-transform: uppercase;}
                     

             h3         {margin-top: 3px;
                     margin-bottom: 3px;
                     font-weight: normal;
                     text-align: center;
                     text-transform: uppercase;}

                     
                      
            .headinfo_large {font-size: 12pt;}
                             
            .headinfo_reg   {font-size: 10pt;
                             font-weight: bold;}


            .left_para {margin-top: 8px;
                        margin-bottom: 8px;
                        margin-left: -30pt;}
                        
                        
            .list_item {list-style-type: none;
                         display: list-item;
                         margin-left: +30pt;
                           line-height: 200%;}
                           
            .mono       {line-height: 200%;
                        font-family: monospace;}

            paragraph {font-size: 10pt;
                       line-height: 200%;}
            
            .para_text {line-height: 200%;
                        font-size: 10pt;
                        margin-top: 8px;
                        margin-bottom: 8px;}

            .smallcaps     {text-transform: uppercase;
                         font-size: 9pt; }            
            
            .smalltitle {display: block;
                    text-align: center;
                    text-transform: uppercase;
                    font-size:16pt;
                    font-weight:bold;
                    margin-top:3mm;
                    margin-bottom: 3mm;}

            .table_head {font-size: 12pt;
                         font-weight: bold; 
                         margin-top: 2em; 
                         margin-bottom: 2em;}

            .table_data {font-size: 10pt;
                       vertical-align: top;}

            .text  {line-height: 200%;
                    font-size: 10pt;}
                    
            .title {display: block;
                    text-align: center;
                    font-size:26pt;
                    font-family:serif;
                    font-weight:bold;
                    margin-top:3mm;
                    margin-bottom: 3mm;}

</style>
</xsl:template>
<xsl:template match="chemistry-cwu | math-cwu | sequence-cwu">
       <span class="break_avoid">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
<xsl:template match="document-id">
        <xsl:apply-templates select="country-code"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="doc-number"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="kind-code"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="document-date"/>
        <xsl:text> </xsl:text>
    </xsl:template><xsl:template match="country-code | doc-number | kind-code">
        <xsl:value-of select="."/>
    </xsl:template><xsl:template match="document-date" doc:public="yes" doc:description="uses &lt;xsl:param> elements to present &lt;document-date> in YYYY-MM-DD format">
    		<xsl:param name="document-year" doc:public="yes" doc:description="assigns the year portion of the &lt;document-date> element to a parameter to allow YYYY-MM-DD date formatting.">
				<xsl:value-of select="substring(.//document-date,1,4)"/>
			</xsl:param>
			<xsl:param name="document-month" doc:public="yes" doc:description="assigns the month portion of the &lt;document-date> element to a parameter to allow YYYY-MM-DD date formatting.">
				<xsl:value-of select="substring(.//document-date,5,2)"/>
			</xsl:param>
			<xsl:param name="document-day" doc:public="yes" doc:description="assigns the date portion of the &lt;document-date> element to a parameter to allow YYYY-MM-DD date formatting.">
				<xsl:value-of select="substring(.//document-date,7,2)"/>
			</xsl:param>
			<xsl:value-of select="$document-year"/>-<xsl:value-of select="$document-month"/>-<xsl:value-of select="$document-day"/>
    </xsl:template>
<xsl:template match="figure[1]">
       <br/>
      [<xsl:value-of select="substring-after(@id,'-')"/>]
       <xsl:apply-templates/>
    </xsl:template><xsl:template match="drawing-reference-character">
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="figure[1]/image[1]">
        <xsl:choose>
            <xsl:when test="@he"><!-- if it has height and width attributes -->
                <embed toolbar="off" fit="best" align="top" src="{@file}" height="{round(@he)}" width="{round(@wi)}"/>
            </xsl:when>
            <xsl:otherwise><!-- otherwise, preset TIFF viewer size -->
                <embed toolbar="off" fit="best" align="top" width="600" height="800" src="{@file}"/>
            </xsl:otherwise>
        </xsl:choose>
        <div class="break_before"/>
    </xsl:template><xsl:template match="image[not(ancestor::figure)]">
       <xsl:choose>
            <xsl:when test="@he"><!-- if it has height and width attributes -->
                <embed toolbar="off" fit="best" align="top" src="{@file}" height="{round(@he)}" width="{round(@wi)}"/>
            </xsl:when>
            <xsl:otherwise><!-- otherwise, preset TIFF viewer size -->
                <embed toolbar="off" fit="best" align="top" width="600" height="800" src="{@file}"/>
            </xsl:otherwise>
        </xsl:choose>
	</xsl:template>
<xsl:template match="inventor-block | inventors">
    <br/>
    <table width="80%" border="0">
    <xsl:choose>
        <xsl:when test="count(.//inventor) > 1">
            <th align="left" class="table_data">INVENTORS: </th>
        </xsl:when>
        <xsl:otherwise>
            <th align="left" class="table_data">INVENTOR: </th>
        </xsl:otherwise>
    </xsl:choose>
    <tr/>

    <xsl:if test="first-named-inventor/authority-applicant">
        <tr><td class="table_data">Authority Applicant:</td>
            <td class="table_data">
                <xsl:value-of select="first-named-inventor/authority-applicant"/>
            </td>
        </tr>
    </xsl:if>
    
    <xsl:for-each select="inventor">
        <xsl:if test="authority-applicant">
            <tr><td class="table_data">Authority Applicant:</td>
                <td class="table_data">
                    <xsl:value-of select="authority-applicant"/>
                </td>
            </tr>
        </xsl:if>
        <tr><td> </td></tr>
        <tr><td/></tr>
        <tr><td/></tr>
        <tr><td/></tr>
    </xsl:for-each>
        <tr/>
        <xsl:if test="authority-applicant">
            <tr>
                <td/>
                <td class="table_data">
                    <xsl:value-of select="authority-applicant"/>
                </td>
            </tr>
        </xsl:if>
    <tr/>
    <tr/>
    </table>
</xsl:template>
<xsl:template match="name">
        <xsl:if test=".//name-prefix">
            <xsl:value-of select="name-prefix"/>
            <xsl:text> </xsl:text>
        </xsl:if>

        <xsl:value-of select="given-name"/>
        <xsl:text> </xsl:text>
        
        <xsl:if test=".//middle-name">
            <xsl:value-of select="middle-name"/>
            <xsl:text> </xsl:text>
        </xsl:if>
    
        <xsl:value-of select="family-name"/>
        
        <xsl:if test=".//name-suffix">
            <xsl:text> </xsl:text>
            <xsl:value-of select="name-suffix"/>
        </xsl:if>
    </xsl:template>
<xsl:template match="federal-research-statement">
        <div style="margin-bottom:  1pc;                     margin-left:    +10pt;">
               <xsl:apply-templates/>
        </div>
    </xsl:template><xsl:template match="paragraph-federal-research-statement">
        <div class="left_para">
         <table width="100%">
             <tr>
                 <td width="8%" valign="top">
                 
                </td>
                <td width="85%">
                    <div class="para_text">
                        <xsl:apply-templates/>
                    </div>
                </td>
                <td width="*"/>
             </tr>
         </table>
         </div>
    </xsl:template><xsl:template match="number | grant-number | contract-number | us-agency">
        <xsl:text> </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
<xsl:template match="party">
    <div>
        <xsl:apply-templates select="name"/>
    </div>
        <xsl:value-of select=".//organization-name"/>
        <xsl:apply-templates select="address"/>
    </xsl:template><xsl:template match="citizenship">
        <xsl:text> </xsl:text>
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="organization-name">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
<xsl:template match="residence">
    <table width="60%" border="0">
        <xsl:apply-templates/>
    </table>
</xsl:template><xsl:template match="residence-us | residence-non-us">
    <xsl:apply-templates/>
</xsl:template><xsl:template match="residence//city">
    <tr><td class="table_data">Residence City:</td>
        <td class="table_data">
            <xsl:apply-templates/>
        </td>
    </tr>
</xsl:template><xsl:template match="residence//state">
    <tr><td class="table_data">Residence State:</td>
        <td class="table_data">
            <xsl:apply-templates/>
        </td>
    </tr>
</xsl:template><xsl:template match="residence//country-code">
    <tr><td class="table_data">Residence Country:</td>
        <td class="table_data">
            <xsl:value-of select="."/>
        </td>
    </tr>
</xsl:template><xsl:template match="residence//military-service">
    <tr><td class="table_data">Military Service:</td>
        <td class="table_data">
            <xsl:apply-templates/>
        </td>
    </tr>
</xsl:template><xsl:template match="residence//citizenship">
    <tr><td class="table_data">Citizenship:</td>
        <td class="table_data">
            <xsl:apply-templates/>
        </td>
    </tr>
</xsl:template>
<xsl:template match="sequence-listing-old-rules | sequence-listing-new-rules">
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="*">
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="s-1 | s100">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template><xsl:template match="s-1-iii | s160">
        <xsl:text>Number of Sequences: </xsl:text>
            <xsl:value-of select="."/>
    </xsl:template><xsl:template match="s-2 | s210">
        <xsl:text>Sequence ID: </xsl:text>
        <xsl:choose>
            <xsl:when test="self::s-2">
                <xsl:value-of select="@seq-no"/>
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="self::s210">
                <xsl:value-of select="."/>
            </xsl:when>
        </xsl:choose>
    </xsl:template><xsl:template match="s-2-i-a | s211">
        <br/>
        <xsl:text>Length of Sequence: </xsl:text>
        <xsl:value-of select="."/>
    </xsl:template><xsl:template match="s-2-i-b | s212">
        <br/>        
        <xsl:text>Sequence Type: </xsl:text>
        <xsl:value-of select="."/>
    </xsl:template><xsl:template match="s-2-i-c">
        <br/>
        <xsl:text>Strandedness: </xsl:text>        
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="s-2-i-d">
        <br/>
        <xsl:text>Topology: </xsl:text>
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="s-2-ii-mt">
        <br/>
        <xsl:text>Molecule Type: </xsl:text>
        <xsl:apply-templates/>
    </xsl:template><xsl:template match="s-2-vi-a | s213">
        <br/>
        <xsl:text>Scientific Name: </xsl:text>
        <xsl:value-of select="."/>
    </xsl:template><xsl:template match="s-2-ix-a | s221">
        <br/>
        <xsl:text>Name/Key: </xsl:text>
            <xsl:apply-templates/>
    </xsl:template><xsl:template match="s-2-ix-b | s222">
        <br/>
        <xsl:text>Location: </xsl:text>
            <xsl:apply-templates/>
    </xsl:template><xsl:template match="s-2-ix-d | s223">
        <br/>
        <xsl:text>Other Information: </xsl:text>
            <xsl:apply-templates/>
    </xsl:template><xsl:template match="s-2-xi | s400">
    <pre style="font-size: 10pt;">
            <xsl:value-of select="."/>
    </pre>
    </xsl:template>


</xsl:stylesheet>