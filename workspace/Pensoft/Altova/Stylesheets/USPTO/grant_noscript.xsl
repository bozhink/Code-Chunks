<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
*********************************************************************
*  John Dunning: 2001-01-26                                         *
*  DTD: ST32-us-grant-024-xml.dtdV1.4 2001-01-31                    *
*        XSL transformation for ST32 Grant DTD                      *
*                                                                   *
*  This stylesheet follows the basic structure of the DTD           *
*  and is arranged in the following manner:                         *
*       + SDOBI                                                     *
*       + SDOAB                                                     *
*       + SDODE                                                     *
*       + SDOCL                                                     *
*       + SDODR                                                     *
*       + Commonly used elements (listed alphabetically)            *
*********************************************************************
-->

<xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>

<xsl:preserve-space elements="*"/>

<xsl:variable name="doc_kind" select="//B130"/>

<!-- ***** establish context of HTML document ***** -->
<xsl:template match="/">
    <html>
        <head>
            <xsl:call-template name="css_styles"/>
        </head>
        <body>
        <basefont face="Arial Unicode MS, Lucida Sans Unicode, Times New Roman "
                    size="2">
        <div style="margin-left: +35pt;">
            <xsl:apply-templates select=".//SDOBI | .//SDOAB | .//SDODE | .//SDOCL | .//SDODR |.//SDOCR"/>
        </div>
        </basefont>
        </body>
    </html>
</xsl:template>

<!-- ********************************************************** -->
<!--     SUBDOC BIBLIOGRAPHIC INFORMATION                        -->
<!-- ********************************************************** -->

<xsl:param name="cont"/>
    <xsl:template match="SDOBI">
    		<xsl:param name="B140-year">
				<xsl:value-of select="substring(.//B140/DATE/PDAT,1,4)"/>
			</xsl:param>
			<xsl:param name="B140-month">
				<xsl:value-of select="substring(.//B140/DATE/PDAT,5,2)"/>
			</xsl:param>
			<xsl:param name="B140-day">
				<xsl:value-of select="substring(.//B140/DATE/PDAT,7,2)"/>
			</xsl:param>

    		<xsl:param name="B220-year">
				<xsl:value-of select="substring(.//B220/DATE/PDAT,1,4)"/>
			</xsl:param>
			<xsl:param name="B220-month">
				<xsl:value-of select="substring(.//B220/DATE/PDAT,5,2)"/>
			</xsl:param>
			<xsl:param name="B220-day">
				<xsl:value-of select="substring(.//B220/DATE/PDAT,7,2)"/>
			</xsl:param>

        <table width="90%" border="0">
            <tr>
                <!-- ***** Patent number (for barcode) ***** -->
                <td class="bar" align="right">*<xsl:value-of select=".//B190/PDAT" /><xsl:value-of select=".//B110/DNUM/PDAT"/><xsl:value-of select=".//B130/PDAT" />*</td>        
            </tr>
        </table>
        <table width="90%" border="0">
        <colgroup>
            <col width="40%"/>    <!-- (12) United States [Plant, Design] Patent -->
            <col width="5%" />    <!-- spaceholder -->
            <col width="5%"/>     <!-- (10), (45) -->
            <col width="15%"/>    <!-- Patent No.:, Date of Patent (labels) -->            
            <col width="30%"/>    <!-- Patent No.:, Date of Patent (data) -->
        </colgroup>

            <tr>
                <td class="headinfo_large" colspan="1">
            <!-- ***** test for document kind, add boilerplate ***** -->
            <xsl:choose>
                <xsl:when test="substring($doc_kind ,1,1)='A'">
                    <font size="-1" weight="normal">(12)</font>&#160;&#160;<b>United States Utility Patent</b>                 
                </xsl:when>
                <xsl:when test="substring($doc_kind ,1,1)='B'">
                    <font size="-1" weight="normal">(12)</font>&#160;&#160;<b>United States Patent</b>                 
                </xsl:when>
                <xsl:when test="substring($doc_kind ,1,1)='E'">
                    <font size="-1" weight="normal">(12)</font>&#160;&#160;<b>United States Reissue Patent</b>                 
                </xsl:when>
                <xsl:when test="substring($doc_kind,1,1)='S'">
                    <font size="-1" weight="normal">(12)</font>&#160;&#160;<b>United States Design Patent</b>                 
                </xsl:when>
                <xsl:when test="substring($doc_kind,1,1)='P'">
                    <font size="-1" weight="normal">(12)</font>&#160;&#160;<b>United States Plant Patent</b>                 
                </xsl:when>
                <xsl:otherwise>
                    <font size="-1" weight="normal">(12)</font>&#160;&#160;<b>United States Patent</b>                 
                </xsl:otherwise>
            </xsl:choose>
                </td>
                <td/>
                <td class="table_data" align="right">(10)</td>
                <td class="table_data" align="right">
                    <b>Patent No: </b>
                </td>
                <td class="headinfo_large" align="right">
            <!-- ***** same info that's in the barcode at top ***** -->
                <!-- country -->
                    <b><xsl:value-of select=".//B190/PDAT" /></b>
                    <xsl:text> </xsl:text>
                <!-- Patent number -->
                <xsl:choose>
                <!-- **** can not format the number of Plant patents, as they start with 'PP' **** -->
                	<xsl:when test="substring($doc_kind,1,1)='P'">
	                    <b><xsl:value-of select="substring(.//B110/DNUM/PDAT,1,2)" /><xsl:value-of select="format-number(substring-after(.//B110/DNUM/PDAT,'PP'),'###,###')" /></b>
                    </xsl:when>
                <!-- **** can not format the number of Design patents, as they start with 'D' **** -->
                	<xsl:when test="substring($doc_kind,1,1)='S'">
	                    <b><xsl:value-of select="substring(.//B110/DNUM/PDAT,1,1)" /><xsl:value-of select="format-number(substring-after(.//B110/DNUM/PDAT,'D'),'###,###')" /></b>
                    </xsl:when>
                    <xsl:otherwise>
	                    <b><xsl:value-of select="format-number(.//B110/DNUM/PDAT,'##,###,###')"/></b>                
                    </xsl:otherwise>
                </xsl:choose>
                    <xsl:text> </xsl:text>
                <!-- kind code -->
                    <b><xsl:value-of select=".//B130/PDAT" /></b>
                </td>
            </tr>
            <tr>
                <td class="headinfo_reg">
            <!-- ***** First-named inventor's family name ***** -->
                    &#160;&#160;&#160;&#160;&#160;&#160;
                    <b><xsl:value-of select=".//B721/PARTY-US//SNM"/>
                    <!-- ***** add "et al. " if more than one inventor ***** -->
                    <xsl:if test="count(//B721) &gt;1"> et al.</xsl:if>                    
                    </b>
                </td>
                <td/>
                <td class="table_data" align="right">(45)</td>
                <td class="table_data" align="right"><b>Date of Patent:</b> </td>
            <!-- date of patent -->
                <td class="headinfo_reg" align="right">
                	<xsl:value-of select="$B140-year" />-<xsl:value-of select="$B140-month" />-<xsl:value-of select="$B140-day" />
                </td>
            </tr>
        </table>
        <hr width="100%"/>
    <!-- ***** end page header ***** -->
        
        <!-- ***** bibliographic info ***** -->
        <table width="90%" border="0">
        <tr><td width="10%"/><td width="15%"/><td width="*"/></tr>
            <tr><td class="table_data">(54)</td>
            <!-- ***** title of invention ***** -->
                <td colspan="2" style="text-transform: uppercase">
                    <b><xsl:value-of select="//B540/*"/></b></td>
                <td/>
            </tr>
            <xsl:choose>
            <!-- ***** test number of INVENTORs ***** -->
                <xsl:when test="count(//B721) &gt; 1 ">
                    <tr><td class="table_data">(76)</td>
                    <td class="table_data">
                        Inventors: 
                    </td>
                    <td class="table_data">
                        <b>
                            <xsl:apply-templates select=".//B721[1]/PARTY-US/NAM"/>,                
                        </b>
                            <xsl:apply-templates select=".//B721[1]/PARTY-US/ADR"/>
                         
                    <xsl:for-each select=".//B721[1]/following-sibling::B721">;
                         <b><xsl:apply-templates select=".//NAM"/></b>
                         <xsl:apply-templates select=".//ADR"/>
                    </xsl:for-each>
                    </td>
                    </tr>
                </xsl:when>
                <xsl:otherwise>
                    <tr><td class="table_data">(76)</td>
                    <td class="table_data">
                        Inventor: 
                    </td>
                    <td class="table_data">
                         <b><xsl:apply-templates select=".//B721/PARTY-US/NAM"/>, </b>
                            <xsl:apply-templates select=".//B721/PARTY-US/ADR"/>
                    </td>
                    </tr>
                </xsl:otherwise>
            </xsl:choose>

            <!-- ***** test number of ASSIGNEEs ***** -->
            <xsl:choose>
                <xsl:when test="count(//B731) &gt; 1 ">
                    <tr><td class="table_data">(76)</td>
                    <td class="table_data">
                        Assignees: 
                    </td>
                    <td class="table_data">
                        <b>
                            <xsl:apply-templates select=".//B731[1]/PARTY-US/NAM"/>,                
                        </b>
                            <xsl:apply-templates select=".//B731[1]/PARTY-US/ADR"/>
                         
                    <xsl:for-each select=".//B731[1]/following-sibling::B731">;
                         <b><xsl:apply-templates select=".//NAM"/></b>
                         <xsl:apply-templates select=".//ADR"/>
                    </xsl:for-each>
                    </td>
                    </tr>
                </xsl:when>
                <xsl:when test="count(//B731)='1'">
                    <tr><td class="table_data">(73)</td>
                    <td class="table_data">
                        Assignee: 
                    </td>
                    <td class="table_data">
                         <b><xsl:apply-templates select=".//B731/PARTY-US/NAM"/>,</b>
                            <xsl:apply-templates select=".//B731/PARTY-US/ADR"/>
                    </td>
                    </tr>
                </xsl:when>
            </xsl:choose>
        <!-- ***** test for Term of Grant ***** -->
            <xsl:if test="//B474">
                <tr><td class="table_data">(**)</td>
                    <td class="table_data">Term:</td>
                    <td class="table_data">
                        <b><xsl:value-of select=".//B474" /></b>
                    </td>
                </tr>
            </xsl:if>
        <!-- Todo: test for B474US; handle appropriately -->    
			<xsl:variable name="B-210-1" select="substring(.//B210/DNUM/PDAT,1,2)"/>            
			<xsl:variable name="B-210-2" select="substring(.//B210/DNUM/PDAT,3,8)"/>            

            <tr><td class="table_data">(21)</td>
                <td class="table_data">Appl. No.: </td>
        <!-- ***** application number ***** -->
                <td class="table_data"><b><!--xsl:value-of select=".//B210"/-->
                	<xsl:value-of select="$B-210-1"/>/<xsl:value-of select="format-number($B-210-2,'###,###')" />
                </b></td>
            </tr>
            <tr><td class="table_data">(22)</td>
                <td class="table_data">Filed: </td>
        <!-- ***** application-filing-date ***** -->
                <td class="table_data"><b><xsl:value-of select="$B220-year"/>-<xsl:value-of select="$B220-month"/>-<xsl:value-of select="$B220-day"/></b></td>
            </tr>
			
			<xsl:if test=".//B861">

			<xsl:variable name="B861-year" select="substring(.//B861/DOC/DATE/PDAT,1,4)" />
			<xsl:variable name="B861-month" select="substring(.//B861/DOC/DATE/PDAT,5,2)" />
			<xsl:variable name="B861-date" select="substring(.//B861/DOC/DATE/PDAT,7,2)" />

            <tr><td class="table_data">(22)</td>
            	<td class="table_data">PCT Filed:</td>
            	<td class="table_data"><b><xsl:value-of select="$B861-year"/>-<xsl:value-of select="$B861-month" />-<xsl:value-of select="$B861-date" /></b></td>
			</tr>

            <tr><td class="table_data">(86)</td>
                <td class="table_data">PCT No.: </td>
	        <!-- ***** application number ***** -->
                <td class="table_data"><b><xsl:value-of select=".//B861/DOC/DNUM/PDAT"/></b></td>
            </tr>
			</xsl:if>
			
			<xsl:if test=".//B863">
				<xsl:variable name="B863-year" select="substring(.//B863/DATE/PDAT,1,4)" />
				<xsl:variable name="B863-month" select="substring(.//B863/DATE/PDAT,5,2)" />
				<xsl:variable name="B863-date" select="substring(.//B863/DATE/PDAT,7,2)" />

            <tr><td class="table_data"></td>
                <td class="table_data">&#167; 371 Date:</td>
	        <!-- ***** application number ***** -->
                <td class="table_data"><b><xsl:value-of select="$B863-year"/>-<xsl:value-of select="$B863-month" />-<xsl:value-of select="$B863-date" /></b></td>
            </tr>
			</xsl:if>
			
			<xsl:if test=".//B864">
				<xsl:variable name="B864-year" select="substring(.//B864/DATE/PDAT,1,4)" />
				<xsl:variable name="B864-month" select="substring(.//B864/DATE/PDAT,5,2)" />
				<xsl:variable name="B864-date" select="substring(.//B864/DATE/PDAT,7,2)" />
			
            <tr><td class="table_data"></td>
                <td class="table_data">&#167; 102(e) Date: </td>
		        <!-- ***** application number ***** -->
                <td class="table_data"><b><xsl:value-of select="$B864-year"/>-<xsl:value-of select="$B864-month" />-<xsl:value-of select="$B864-date" /></b></td>
            </tr>
			</xsl:if>
		
			<xsl:if test=".//B871">
				<xsl:variable name="B871-year" select="substring(.//B871/DOC/DATE/PDAT,1,4)" />
				<xsl:variable name="B871-month" select="substring(.//B871/DOC/DATE/PDAT,5,2)" />
				<xsl:variable name="B871-date" select="substring(.//B871/DOC/DATE/PDAT,7,2)" />
			
			<tr><td class="table_data">(87)</td>
				<td class="table_data">PCT Pub. No.:</td>
				<td class="table_data"><b><xsl:value-of select=".//B871/DOC/DNUM/PDAT" /></b></td>
			</tr>
			
			<tr><td/>
				<td class="table_data">PCT Pub. Date:</td>
				<td class="table_data"><b><xsl:value-of select="$B871-year"/>-<xsl:value-of select="$B871-month" />-<xsl:value-of select="$B871-date" /></b></td>
			</tr>
			</xsl:if>
			
			<xsl:if test=".//B300">
				<xsl:variable name="B300-year" select="substring(.//B320/DATE/PDAT,1,4)" />
				<xsl:variable name="B300-month" select="substring(.//B320/DATE/PDAT,5,2)" />
				<xsl:variable name="B300-date" select="substring(.//B320/DATE/PDAT,7,2)" />
			
				<tr><td class="table_data">(30)</td>
					<td class="table_data" colspan="3"><b>Foreign Application Priority Data</b></td>
					<td/>
				</tr>
				<tr><td/>
					<td class="table_data"><xsl:value-of select="$B300-year" />-<xsl:value-of select="$B300-month" />-<xsl:value-of select="$B300-date" />&#160;&#160;&#160;(<xsl:value-of select=".//B330/CTRY/PDAT" />)</td>
					<td class="table_data"><xsl:value-of select=".//B310/DNUM/PDAT" /></td>
				</tr>
			</xsl:if>
            
            
            <!-- ***** Test for Continuity Data ***** -->
        <xsl:for-each select="B600/child::*">
            <tr><td/><td/><td class="table_data" colspan="3" ><b>Related U.S. Application Data</b></td></tr>
            <tr>
            <xsl:choose>
                <xsl:when test="../B610"><td/>                              <td class="table_data"><xsl:text>Addition to </xsl:text>  <xsl:call-template name="continuity"/></td></xsl:when>
                <xsl:when test="../B620"><td class="table_data">(62)</td> <td class="table_data" colspan="4"><xsl:text>Division of </xsl:text> <xsl:call-template name="continuity"/></td></xsl:when>
                <xsl:when test="../B631"><td class="table_data">(63)</td> <td class="table_data" colspan="4"><xsl:text>Continuation of </xsl:text> <xsl:call-template name="continuity"/></td></xsl:when>
                <xsl:when test="../B632"><td class="table_data">(63)</td> <td class="table_data" colspan="4"><xsl:text>Continuation in part of </xsl:text> <xsl:call-template name="continuity"/></td></xsl:when>
                <xsl:when test="../B633"><td class="table_data">(63)</td> <td class="table_data" colspan="4"><xsl:text>Continuing reissue of </xsl:text> <xsl:call-template name="continuity"/></td></xsl:when>
                <xsl:when test="../B640"><td class="table_data">(64)</td> <td class="table_data" colspan="4"><xsl:text>Reissue of </xsl:text> <xsl:call-template name="continuity"/></td></xsl:when>
                <xsl:when test="../B641US"><td/>                          <td class="table_data" colspan="4"><xsl:text>Divisional reissue of </xsl:text> <xsl:call-template name="continuity"/></td></xsl:when>
                <xsl:when test="../B645"><td/>                              <td class="table_data" colspan="4"><xsl:text>Reexamination of </xsl:text> <xsl:call-template name="continuity"/></td></xsl:when>
                <xsl:when test="../B645US"><td/>                          <td class="table_data" colspan="4"><xsl:text>Reissue of reexamination of </xsl:text> <xsl:call-template name="continuity"/></td></xsl:when>
                <xsl:when test="../B660"><td class="table_data">(66)</td> <td class="table_data" colspan="4"><xsl:text>Substitution for </xsl:text> <xsl:call-template name="continuity"/></td></xsl:when>
                <xsl:when test="../B680US"><td/>                          <td class="table_data" colspan="4"><xsl:text>Non-provisional of provisional </xsl:text> <xsl:call-template name="continuity"/></td></xsl:when>
            </xsl:choose>        
            </tr>
        </xsl:for-each>
            
            <!-- Todo: table width="50%" border="0">
                <xsl:if test="//B300">
                    <xsl:call-template name="foreign_data"/>    
                </xsl:if>
            </table-->
            <xsl:call-template name="tech_info"/>
            <xsl:apply-templates select="appendix-data"/>
            <tr><td class="table_data">(58)</td>
                <td class="table_data"><b>Field of Search </b></td>
                <td class="table_data">
            <!-- ***** field of search ***** -->
                <xsl:value-of select=".//B580/*" />
                <!-- ***** repeating USPCs ***** -->
                    <xsl:for-each select="//B582[1]/following-sibling::*">,
                        <xsl:value-of select="PDAT" />
                    </xsl:for-each>
                </td>
            </tr>
        </table>
    <xsl:call-template name="citations"/>
    </xsl:template>

    <xsl:template name="continuity">
   		<xsl:param name="continuity-year">
			<xsl:value-of select="substring(.//DATE/PDAT,1,4)"/>
		</xsl:param>
		<xsl:param name="continuity-month">
			<xsl:value-of select="substring(.//DATE/PDAT,5,2)"/>
		</xsl:param>
		<xsl:param name="continuity-day">
			<xsl:value-of select="substring(.//DATE/PDAT,7,2)"/>
		</xsl:param>
        <xsl:value-of select=".//PDOC/DOC/DNUM/PDAT" />
        <xsl:text> filed on </xsl:text>
		<xsl:value-of select="$continuity-year"/>-<xsl:value-of select="$continuity-month"/>-<xsl:value-of select="$continuity-day"/>
        <!--xsl:value-of select=".//DATE/PDAT" /-->
    </xsl:template>

    <xsl:template name="citations" match="B560">
        <br/><br/>
        <table width="70%" cellpadding="0" cellspacing="0" border="0">     
        <colgroup>
            <col width="10%"/>    <!-- (56) -->
            <col width="15%"/>    <!-- number -->
            <col width="5%"/>     <!-- cited-by-examiner -->
            <col width="20%"/>    <!-- date -->            
            <col width="30%"/>    <!-- name / country -->
            <col width="20%"/>    <!-- PNC -->
        </colgroup>
        <!-- ***** test for cited patent documents ***** -->
        <xsl:if test="//B560">
            <tr><td class="table_data">(56)</td>
                <td class="table_data" colspan="4" align="center"><b>References Cited</b></td>
	            <td/><td/><td/><td/>
            </tr>
            <tr/>
            <tr><td/>
                <td class="table_data" colspan="4" align="center">U.S. PATENT DOCUMENTS </td>
                <td/><td/><td/><td/>
            </tr>
            <!-- ***** no container element for US patent docs; test existence of PARTY-US ***** -->
            <xsl:for-each select=".//PARTY-US/ancestor::B561">
				<xsl:variable name="citation-year">
					<xsl:value-of select="substring(.//PCIT/DOC/DATE,1,4)"/>
				</xsl:variable>
				<xsl:variable name="citation-month">
					<xsl:value-of select="substring(.//PCIT/DOC/DATE,5,2)"/>
				</xsl:variable>
                <tr><td/>
                <xsl:choose>
                	<xsl:when test="substring($doc_kind,1,1)='P'">
	                    <td class="table_data">
	                 		<xsl:choose>
	                 			<xsl:when test="substring(.//PCIT/DOC/DNUM,1,4)='P.P.'">
			                    	<xsl:value-of select="substring(.//PCIT/DOC/DNUM,1,4)" /><xsl:value-of select="format-number(substring-after(.//PCIT/DOC/DNUM,'P.P.'), '##,###,###')" />
			                    </xsl:when>
			                    <xsl:otherwise>
			                    	<xsl:value-of select=".//PCIT/DOC/DNUM" />
			                    </xsl:otherwise>
			                 </xsl:choose>
	                    </td>
	                 </xsl:when>
	                 <xsl:when test="substring($doc_kind,1,1)='S'">
                 	<td class="table_data">
	                 		<xsl:choose>
	                 			<xsl:when test="substring(.//PCIT/DOC/DNUM,1,2)='D.'">
			                    	<xsl:value-of select="substring(.//PCIT/DOC/DNUM,1,2)" /><xsl:value-of select="format-number(substring-after(.//PCIT/DOC/DNUM,'D.'), '##,###,###')" />
			                    </xsl:when>
			                    <xsl:otherwise>
			                    	<xsl:value-of select=".//PCIT/DOC/DNUM" />
			                    </xsl:otherwise>
			                 </xsl:choose>
	                 	</td>
	                 </xsl:when>
	                 <xsl:otherwise>
	                 	<td class="table_data">
	                 		<xsl:choose>
	                 			<!-- *** test for alphabetic characters in DNUM ("Re.", "D", etc.) *** -->
	                 			<!-- *** if none, format-number *** -->
	                 			<xsl:when test="contains(.//PCIT/DOC/DNUM,'R')">
			                    	<xsl:value-of select=".//PCIT/DOC/DNUM" />
			                    </xsl:when>
			                    <xsl:when test="contains(.//PCIT/DOC/DNUM,'D')">
			                    	<xsl:value-of select=".//PCIT/DOC/DNUM" />
			                    </xsl:when>
			                    <xsl:when test="contains(.//PCIT/DOC/DNUM,'P')">
			                    	<xsl:value-of select=".//PCIT/DOC/DNUM" />
			                    </xsl:when>
			                    <xsl:otherwise>
			                    	<xsl:value-of select="format-number(.//PCIT/DOC/DNUM, '##,###,###')" />
			                    </xsl:otherwise>
			                </xsl:choose>
	                    </td>
	                 </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test=".//CITED-BY-EXAMINER">
                        <td class="table_data" align="center">*</td>
                    </xsl:when>
                    <xsl:otherwise><td/></xsl:otherwise>
                  </xsl:choose>
					<td class="table_data"><xsl:value-of select="format-number($citation-month,'##')" />/<xsl:value-of select="$citation-year"/></td>

                    <td class="table_data"><xsl:value-of select=".//PCIT/PARTY-US/NAM/SNM" /></td>
                    <td class="table_data" align="right"><xsl:value-of select=".//PCIT/PNC" /></td>
                </tr>                    
            </xsl:for-each>
        </xsl:if>
            <!-- ***** no container element for foreign documents; test existence of CTRY ***** -->
            <xsl:if test=".//B561/descendant::CTRY">    
                <tr><td>&#160;</td></tr>            
                <tr><td/>
                    <td class="table_data" colspan="4" align="center">FOREIGN PATENT DOCUMENTS </td>
                    <td/>
                    <td/>
                    <td/>
                </tr>
                <xsl:for-each select=".//CTRY/ancestor::B561">

				<xsl:variable name="fcitation-year">
					<xsl:value-of select="substring(.//PCIT/DOC/DATE,1,4)"/>
				</xsl:variable>
				<xsl:variable name="fcitation-month">
					<xsl:value-of select="substring(.//PCIT/DOC/DATE,5,2)"/>
				</xsl:variable>

						<xsl:variable name="citation-year">
							<xsl:value-of select="substring(.//PCIT/DOC/DATE,1,4)"/>
						</xsl:variable>
						<xsl:variable name="citation-month">
							<xsl:value-of select="substring(.//PCIT/DOC/DATE,5,2)"/>
						</xsl:variable>
						<xsl:variable name="citation-day">
							<xsl:value-of select="substring(.//PCIT/DOC/DATE,7,2)"/>
						</xsl:variable>

                        <tr><td/>
                        <td class="table_data"><xsl:value-of select=".//PCIT/DOC/DNUM" /></td>
                  <xsl:choose>
                        <xsl:when test=".//CITED-BY-EXAMINER">
                            <td class="table_data" align="center">*</td>
                        </xsl:when>
                        <xsl:otherwise><td/></xsl:otherwise>
                  </xsl:choose>
                        <!--td class="table_data"--><!--xsl:value-of select=".//PCIT/DOC/DATE" /--><!--/td-->
						<td class="table_data"><xsl:value-of select="format-number($fcitation-month,'##')" />/<xsl:value-of select="$fcitation-year"/></td>
                        <td class="table_data">(<xsl:value-of select=".//PCIT/DOC/CTRY" />)</td>
                        <td class="table_data" align="right"><xsl:value-of select=".//PCIT/PNC" /></td>
                    </tr>                    
                </xsl:for-each>
            </xsl:if>

            <!-- ***** test for OTHER PUBLICATIONS (B562) ***** -->
            <xsl:if test="//B562">
                <tr><td>&#160;</td></tr>
                <tr><td/>
                    <td class="table_data" align="center" colspan="4">OTHER PUBLICATIONS</td>
                </tr>
                <xsl:for-each select="//B562">
                    <tr><td class="table_data" colspan="6">
                        <xsl:apply-templates />
                    </td></tr>
                </xsl:for-each>
                <tr><td>&#160;</td></tr>
            </xsl:if>

            <xsl:if test=".//CITED-BY-EXAMINER">
                <tr><td colspan="3" class="table_data">* cited by examiner</td></tr>
            </xsl:if>
        <!-- ***** primary examiner ***** -->
            <tr><td class="table_data" colspan="5"><i>Primary Examiner</i>
                <xsl:text> </xsl:text>
                &#8212;
                <xsl:value-of select=".//B746/PARTY-US/NAM/FNM"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select=".//B746/PARTY-US/NAM/SNM" />
                </td>
            </tr>
        <!-- ***** test for assistant examiner(s) ***** -->
            <xsl:if test="//B747">
            <!-- ***** assistant examiner(s) ***** -->
            <tr><td class="table_data" colspan="6"><i>Assistant Examiner<xsl:if test="count(//B747) &gt; 1">s</xsl:if></i>
                <xsl:text> </xsl:text>
                &#8212;
                    <xsl:value-of select=".//B747/PARTY-US/NAM/FNM"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select=".//B747/PARTY-US/NAM/SNM" />
            
                <!-- ***** add commas after each SNM except final ***** -->
                    <xsl:for-each select="//B747[1]/following-sibling::B747">, 
                        <xsl:value-of select="PARTY-US/NAM/FNM"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="PARTY-US/NAM/SNM" />
                    </xsl:for-each>
                </td>
            </tr>
            </xsl:if>
            <!-- ***** attorney or agent ***** -->
            <xsl:if test="//B740">
            <tr><td class="table_data" colspan="6">(74)
                &#160;&#160;&#160;<i>Attorney, Agent, or Firm</i>
                <xsl:text> </xsl:text>
                &#8212;
                <xsl:text> </xsl:text>
                <!-- ***** B741+ ***** -->
                <xsl:value-of select=".//B741/PARTY-US/NAM"/>
                <!-- ***** additional agents (B741) ***** -->
                <xsl:for-each select="//B741[2]/descendant::PARTY-US">;
                    <xsl:apply-templates select="NAM"/>
                </xsl:for-each>
                </td>
            </tr>
            </xsl:if>
        </table>
    </xsl:template>

    <xsl:template name="foreign_data" match="B300">
        <tr>
            <td class="table_data" width="9%">(30)</td>
            <td class="table_data" colspan="3" align="center"><b>Foreign Application Priority Data</b></td>
        </tr>
        <tr><td/>
            <!-- ***** foreign priority data, filing date ***** -->
            <td class="table_data"><xsl:value-of select="B300/B320"/></td>
            <!-- ***** foreign priority data, country code ***** -->
            <td class="table_data"><xsl:value-of select="B300/B330"/></td>
            <!-- ***** foreign priority data, priority application number ***** -->
            <td class="table_data" align="right"><xsl:value-of select=".//B310/DNUM"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template name="tech_info" match="B500">
    <!-- ***** technical information ***** -->
        <tr><td class="table_data">(51)</td>
        <xsl:choose>
            <xsl:when test="substring($doc_kind,1,1)='S'">
                <td class="table_data" width="15%"><b>LOC (7) Cl.: </b></td>
            </xsl:when>
            <xsl:otherwise>    
                <td class="table_data" width="15%"><b>Int. Cl.:<font size="1" style="vertical-align: super">7</font></b></td>
            </xsl:otherwise>            
        </xsl:choose>    
                <xsl:call-template name="ST32classifications_ipc" />
        </tr>
        <tr><td class="table_data">(52)</td>
            <td class="table_data"><b>U.S. Cl.:</b></td>
                <xsl:call-template name="ST32classifications_us" />
        </tr>
    </xsl:template>
    
    <xsl:template name="ST32classifications_ipc" match="B510">
            <td class="table_data">
            <!-- ***** classification-ipc-primary  ***** -->
            <b><xsl:value-of select=".//B511/*"/></b>
            <!-- ***** classification-ipc-secondary ***** -->
            <xsl:for-each select="descendant::B512">;            
                <xsl:value-of select="."/>                
            </xsl:for-each>
            </td>
            <xsl:text> </xsl:text>
            <!-- ***** IPC edition ***** -->
            <td class="table_data"><xsl:value-of select="./B516"/></td>
    </xsl:template>
    
    <xsl:template name="ST32classifications_us" match="B520">
    
            <td class="table_data">
            <!-- ***** classification-us-primary ***** -->
                <b><xsl:value-of select=".//B521/*"/></b>
            <!-- ***** classification-us-secondary, allow multiples ***** -->
                <xsl:for-each select=".//B520[1]/B522">;
                    <xsl:value-of select="PDAT"/>
                </xsl:for-each>
            </td>
    </xsl:template>


<!-- ********************************************************* -->
<!--   SUBDOC ABSTRACT                                            -->
<!-- ********************************************************* -->

    <xsl:template match="SDOAB">
        <br/>
        <div class="break_before">
            <xsl:choose>
            <!-- ***** If no H, add heading, text "Abstract" ***** -->
                <xsl:when test="not(.//H)">
                    <table width="90%" border="0">
                    <tr><td width="9%" class="table_data">(57)</td>
                        <td><h3>Abstract</h3></td>
                    </tr>
                    </table>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates mode="abstract_heading" select=".//H" />
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates mode="abstract_para" select=".//PARA" />
        </div>
        <xsl:apply-templates mode="drawing-section" select="//SDODR"/>
    </xsl:template>
    
    <xsl:template mode="abstract_heading" match="H">
        <h3 align="center">
            <xsl:apply-templates mode="abstract_para" />
        </h3>
    </xsl:template>
    
    <xsl:template mode="abstract_para" match="PARA">
          <div class="left_para">
            <table border="0" width="100%">
                <tr>
                    <td width="8%" valign="top">
                        <div class="para_text"></div>
                    </td>
                    <td width="85%">
                        <div class="para_text">
                            &#160;&#160;&#160;                
                        <xsl:apply-templates />
                        </div>
                    </td>
                    <td/>
                    </tr>
                </table>
        </div>
    </xsl:template>


<!-- ********************************************************** -->
<!--     SUBDOC DESCRIPTION                                         -->
<!-- ********************************************************** -->
    
<xsl:template match="SDODE">
    <div class="smalltitle" style="page-break-before: always;">
    <!-- ***** title of invention ***** -->
        <xsl:value-of select="//B540/*" />
    </div>
         <xsl:apply-templates />
</xsl:template>
    
<!-- ********************************************************** -->
<!--     SUBDOC CLAIMS                                            -->
<!-- ********************************************************** -->
    <xsl:template match="SDOCL">
        <xsl:if test="not(.//H)">
        <!-- ***** if no H, add heading, text "Claim" ***** -->
            <table width="90%" border="0">
                <tr><td width="9%" class="table_data">(57)</td>
                    <td><h3>Claim</h3></td>
                </tr>
            </table>
        </xsl:if>
    <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="CLM">
        <table border="0" width="90%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="10%"/>
                <td width="80%" valign="top" class="para_text">
                    &#160;&#160;&#160;
                    <xsl:apply-templates select=".//PTEXT" mode="claimtext"/>                    
                </td>
                <td width="*"/>
            </tr>
        </table>
        <br/><br/>
     </xsl:template>

    <xsl:template match="PTEXT" mode="claimtext">
        <xsl:choose>
        <!-- ***** if parent element is CLMSTEP, indent ***** -->
            <xsl:when test="./parent::CLMSTEP">
                <div class="claim_text">
                    <xsl:apply-templates />
                </div>
            </xsl:when>
            <xsl:otherwise>        
                <xsl:apply-templates />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    

<!-- ********************************************************* -->
<!--   SUBDOC DRAWINGS (called by SDOAB)                       -->
<!-- ********************************************************* -->

    <!-- ***** if there's no SDOAB, manually trigger drawings ***** -->
    <xsl:template match="SDODR">
        <xsl:if test="not(//SDOAB)">
            <xsl:apply-templates select=".//EMI"/>
        </xsl:if>
    </xsl:template>
	
	<!-- **** show only the first image in the document browser window *** -->
	<!-- **** subsequent images are shown in new window upon clicking cross-reference hyperlink **** -->

    <xsl:template match="EMI[1] | EMR">
        <div class="break_before" >
        [<xsl:value-of select="substring-after(@ID,'-')"/>]
        <embed toolbar="off" fit="best" align="top" width="600" height="800" src="{@FILE}"/>
        </div>
    </xsl:template>
    
    <xsl:template match="EMI">
		<div class="break_before">
	       [<xsl:value-of select="substring-after(@ID,'-')"/>]
	       <embed toolbar="off" fit="best" align="top" width="300" height="400" src="{@FILE}"/>
	    </div>
	</xsl:template>
 

    <xsl:template mode="drawing-section" match="*">
    <!-- creates an anchor named 'DRAWINGS' after the abstract -->
    	<a name="DRAWINGS"/>
         <xsl:apply-templates />
    </xsl:template>

<!-- ********************************************************** -->
<!--     COMMON ELEMENTS (in roughly alphabetical order            -->
<!-- ********************************************************** -->
    <xsl:template match="ADR">
        <xsl:text> </xsl:text>
    	<xsl:value-of select="STR" />,
        <xsl:text> </xsl:text>
        <xsl:value-of select="OMC" />
        <xsl:text> </xsl:text>
        <xsl:value-of select="CITY" />,
        <xsl:text> </xsl:text>
        <xsl:value-of select="STATE" />
        <xsl:text> </xsl:text>
        <xsl:if test="CTRY">
	        (<xsl:value-of select="CTRY" />)
	    </xsl:if>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="FGREF">
		<a href="#{@ID}">
               <xsl:apply-templates />
        </a>
    </xsl:template>
    
    <xsl:template match="HIL/BOLD/PDAT | FGREF/PDAT | BOLD">
        <b>    <xsl:apply-templates /> </b>
    </xsl:template>
    
    <xsl:template match="H">
        <h3><xsl:apply-templates /></h3>
    </xsl:template>
    
    <xsl:template match="HIL">
        <xsl:apply-templates />
        <xsl:text> </xsl:text>
    </xsl:template>

    <xsl:template match="ITALIC">
        <i>    <xsl:apply-templates />    </i>
    </xsl:template>
    
    <xsl:template match="NAM">
        <xsl:apply-templates />
    </xsl:template>
    
    <!-- ***** components of NAM ***** -->
    <xsl:template match="ONM | SFX | TTL | FNM | SNM">
            <xsl:text> </xsl:text>
            <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="PARA">
        <div class="left_para">
        <table border="0" width="100%">
            <tr>
                <td width="8%" valign="top" class="para_text">
                    <xsl:text> </xsl:text>
                </td>
        <!-- ***** test LVL attribute, indent as required ***** -->
            <xsl:choose>
                <xsl:when test="@LVL='0'">
                    <td width="85%" class="para_text">
                    &#160;&#160;&#160;                
                        <xsl:apply-templates />
                    </td>
                </xsl:when>
                <xsl:when test="@LVL='1'"><!-- ***** left-align, no indent ***** -->
                    <td width="85%" class="para_text">
                        <xsl:apply-templates />
                    </td>
                </xsl:when>
                <xsl:when test="@LVL='3'">
                    <td width="5%"/>
                    <td width="*" class="para_text">
                        <xsl:apply-templates />
                    </td>
                </xsl:when>
                <xsl:otherwise><!-- ***** other value or no value at all ***** -->
                    <td width="85%" class="para_text">
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

    <xsl:template match="PTEXT | STEXT | PDAT">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="ULINE | DULINE">
        <u>    <xsl:apply-templates />    </u>
    </xsl:template>
    

    <xsl:template match="SMALLCAPS">
        <span class="smallcaps">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <!-- ***** hide MathML elements ***** -->
    <xsl:template match="//MATH/*" />

<!-- **** include Grant components **** -->
<xsl:include href="grant_sequences.xsl"/>
<xsl:include href="grant_cals.xsl"/>
<xsl:include href="css-styles.xsl"/>


</xsl:stylesheet>