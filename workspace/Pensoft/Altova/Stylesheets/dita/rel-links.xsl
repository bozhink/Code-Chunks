<?xml version="1.0" encoding="UTF-8" ?>
<!--  related-links.xsl 1.03; 2002 May 7
 | DITA link processor (xref, related-links)
 |
 | Copyright IBM Corporation, 2002
 | This file is part of the DITA package on IBM's developerWorks site.
 | See license.txt for disclaimers.
 *-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
            encoding="iso-8859-1"
            indent="yes"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
            doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
/>
<!--issues: can't eliminate dups or do adequate test for heading if conrefs present - not currently eliminating dups-->


<xsl:template match="*[contains(@class,' topic/related-links ')]">
   <span>
    <xsl:call-template name="setclass"/>
     <xsl:variable name="currentrole">
          <xsl:choose>
               <xsl:when test="@role"><xsl:value-of select="@role"/></xsl:when>
               <xsl:otherwise>none</xsl:otherwise>
          </xsl:choose>
     </xsl:variable>
     <xsl:variable name="currenttype">
          <xsl:choose>
               <xsl:when test="@type"><xsl:value-of select="@type"/></xsl:when>
               <xsl:otherwise>none</xsl:otherwise>
          </xsl:choose>
     </xsl:variable>

     <!--children-->
     <xsl:if test="descendant-or-self::*[not(ancestor-or-self::linklist)][(ancestor-or-self::*/@role)[last()]='child']">
     <dl>
     <xsl:apply-templates select="*[contains(@class,' topic/link ')]|*[contains(@class,' topic/linkpool ')]">
          <xsl:with-param name="procrole">child descendant</xsl:with-param>
          <xsl:with-param name="parentrole"><xsl:value-of select="$currentrole"/></xsl:with-param>
     </xsl:apply-templates>
     </dl>
     </xsl:if>

     <!--todo: grab rel-link heading text from strings.xml-->
     <!--related concepts-->
     <xsl:if test="descendant-or-self::*[not(ancestor-or-self::*[contains(@class,' topic/linklist ')])][not((ancestor-or-self::*/@role)[last()]='child')][(ancestor-or-self::*/@type)[last()]='concept']">
          <p>
          <b>
             <xsl:call-template name="getString">
                  <xsl:with-param name="stringName" select="'Related concepts'"/>
               </xsl:call-template>
          </b><br class="br"/>
     <xsl:call-template name="sort-links-by-role">
          <xsl:with-param name="proctype">concept</xsl:with-param>
          <xsl:with-param name="currentrole"><xsl:value-of select="$currentrole"/></xsl:with-param>
          <xsl:with-param name="currenttype"><xsl:value-of select="$currenttype"/></xsl:with-param>
     </xsl:call-template>
          </p>
     </xsl:if>

     <!--related tasks-->
     <xsl:if test="descendant-or-self::*[not(ancestor-or-self::*[contains(@class,' topic/linklist ')])][not((ancestor-or-self::*/@role)[last()]='child')][(ancestor-or-self::*/@type)[last()]='task']">
          <p>
          <b>
             <xsl:call-template name="getString">
                  <xsl:with-param name="stringName" select="'Related tasks'"/>
               </xsl:call-template>
          </b><br class="br"/>
     <xsl:call-template name="sort-links-by-role">
          <xsl:with-param name="proctype">task</xsl:with-param>
          <xsl:with-param name="currentrole"><xsl:value-of select="$currentrole"/></xsl:with-param>
          <xsl:with-param name="currenttype"><xsl:value-of select="$currenttype"/></xsl:with-param>
     </xsl:call-template>
          </p>
     </xsl:if>


     <!--related reference-->
     <xsl:if test="descendant-or-self::*[not(ancestor-or-self::*[contains(@class,' topic/linklist ')])][not((ancestor-or-self::*/@role)[last()]='child')][(ancestor-or-self::*/@type)[last()]='reference']">
          <p>
          <b>
             <xsl:call-template name="getString">
                  <xsl:with-param name="stringName" select="'Related reference'"/>
               </xsl:call-template>
          </b><br class="br"/>
     <xsl:call-template name="sort-links-by-role">
          <xsl:with-param name="proctype">reference</xsl:with-param>
          <xsl:with-param name="currentrole"><xsl:value-of select="$currentrole"/></xsl:with-param>
          <xsl:with-param name="currenttype"><xsl:value-of select="$currenttype"/></xsl:with-param>
     </xsl:call-template>
          </p>
     </xsl:if>

     <!--other info-->
     <xsl:if test="descendant::*[not(ancestor-or-self::*[contains(@class,' topic/linklist ')])]
[not((ancestor-or-self::*/@role)[last()]='child')]
[not((ancestor-or-self::*/@type)[last()]='concept')]
[not((ancestor-or-self::*/@type)[last()]='task')]
[not((ancestor-or-self::*/@type)[last()]='reference')]">
          <p>
          <b>
             <xsl:call-template name="getString">
                  <xsl:with-param name="stringName" select="'Related information'"/>
               </xsl:call-template>
          </b><br class="br"/>
     <xsl:call-template name="sort-links-by-role">
          <xsl:with-param name="proctype">catch-all</xsl:with-param>
          <xsl:with-param name="currentrole"><xsl:value-of select="$currentrole"/></xsl:with-param>
          <xsl:with-param name="currenttype"><xsl:value-of select="$currenttype"/></xsl:with-param>
     </xsl:call-template>
          </p>
     </xsl:if>


     <!--linklists-->
     <xsl:apply-templates select="*[contains(@class,' topic/linklist ')]"/>
   </span>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/link ')]">
     <xsl:param name="procrole">none</xsl:param>
     <xsl:param name="proctype">none</xsl:param>
     <xsl:param name="parentrole">none</xsl:param>
     <xsl:param name="parenttype">none</xsl:param>
     <xsl:variable name="currentrole">
          <xsl:choose>
               <xsl:when test="@role"><xsl:value-of select="@role"/></xsl:when>
               <xsl:otherwise><xsl:value-of select="$parentrole"/></xsl:otherwise>
          </xsl:choose>
     </xsl:variable>
     <xsl:variable name="currenttype">
          <xsl:choose>
               <xsl:when test="@type"><xsl:value-of select="@type"/></xsl:when>
               <xsl:otherwise><xsl:value-of select="$parenttype"/></xsl:otherwise>
          </xsl:choose>
     </xsl:variable>
     <xsl:choose>
          <xsl:when test="contains($procrole,'child') and $currentrole='child'">
               <xsl:call-template name="make-link"><xsl:with-param name="child">yes</xsl:with-param></xsl:call-template>
          </xsl:when>
          <xsl:when test="contains($procrole,$currentrole) and contains($proctype,$currenttype)"><xsl:call-template name="make-link"/></xsl:when>
          <xsl:when test="contains($procrole,$currentrole) and $proctype='catch-all' and not($currentrole='child') and not($currenttype='concept') and not($currenttype='task') and not($currenttype='reference')"><xsl:call-template name="make-link"/></xsl:when>
          <xsl:when test="$procrole='linklist'"><xsl:call-template name="make-link"/></xsl:when>
          <xsl:otherwise/><!--do nothing - not appropriate to create link this pass through-->
     </xsl:choose>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/linkpool ')]">
     <xsl:param name="procrole">none</xsl:param>
     <xsl:param name="proctype">none</xsl:param>
     <xsl:param name="parentrole">none</xsl:param>
     <xsl:param name="parenttype">none</xsl:param>
     <xsl:variable name="currentrole">
          <xsl:choose>
               <xsl:when test="@role"><xsl:value-of select="@role"/></xsl:when>
               <xsl:otherwise><xsl:value-of select="$parentrole"/></xsl:otherwise>
          </xsl:choose>
     </xsl:variable>
     <xsl:variable name="currenttype">
          <xsl:choose>
               <xsl:when test="@type"><xsl:value-of select="@type"/></xsl:when>
               <xsl:otherwise><xsl:value-of select="$parenttype"/></xsl:otherwise>
          </xsl:choose>
     </xsl:variable>

     <xsl:apply-templates select="*[contains(@class,' topic/link ')]|*[contains(@class,' topic/linkpool ')]">
          <xsl:with-param name="procrole"><xsl:value-of select="$procrole"/></xsl:with-param>
          <xsl:with-param name="proctype"><xsl:value-of select="$proctype"/></xsl:with-param>
          <xsl:with-param name="parentrole"><xsl:value-of select="$currentrole"/></xsl:with-param>
          <xsl:with-param name="parenttype"><xsl:value-of select="$currenttype"/></xsl:with-param>
     </xsl:apply-templates>

</xsl:template>

<xsl:template name="sort-links-by-role">
     <xsl:param name="proctype">none</xsl:param>
     <xsl:param name="currentrole">none</xsl:param>
     <xsl:param name="currenttype">none</xsl:param>
     <xsl:apply-templates select="*[contains(@class,' topic/link ')]|*[contains(@class,' topic/linkpool ')]">
          <xsl:with-param name="procrole">ancestor parent</xsl:with-param>
          <xsl:with-param name="parentrole"><xsl:value-of select="$currentrole"/></xsl:with-param>
          <xsl:with-param name="proctype"><xsl:value-of select="$proctype"/></xsl:with-param>
          <xsl:with-param name="parenttype"><xsl:value-of select="$currenttype"/></xsl:with-param>
     </xsl:apply-templates>
     <xsl:apply-templates select="*[contains(@class,' topic/link ')]|*[contains(@class,' topic/linkpool ')]">
          <xsl:with-param name="procrole">next previous sibling</xsl:with-param>
          <xsl:with-param name="parentrole"><xsl:value-of select="$currentrole"/></xsl:with-param>
          <xsl:with-param name="proctype"><xsl:value-of select="$proctype"/></xsl:with-param>
          <xsl:with-param name="parenttype"><xsl:value-of select="$currenttype"/></xsl:with-param>
     </xsl:apply-templates>
     <xsl:apply-templates select="*[contains(@class,' topic/link ')]|*[contains(@class,' topic/linkpool ')]">
          <xsl:with-param name="procrole">friend cousin sample other none</xsl:with-param>
          <xsl:with-param name="parentrole"><xsl:value-of select="$currentrole"/></xsl:with-param>
          <xsl:with-param name="proctype"><xsl:value-of select="$proctype"/></xsl:with-param>
          <xsl:with-param name="parenttype"><xsl:value-of select="$currenttype"/></xsl:with-param>
     </xsl:apply-templates>
     <xsl:apply-templates select="*[contains(@class,' topic/link ')]|*[contains(@class,' topic/linkpool ')]">
          <xsl:with-param name="procrole">external</xsl:with-param>
          <xsl:with-param name="parentrole"><xsl:value-of select="$currentrole"/></xsl:with-param>
          <xsl:with-param name="proctype"><xsl:value-of select="$proctype"/></xsl:with-param>
          <xsl:with-param name="parenttype"><xsl:value-of select="$currenttype"/></xsl:with-param>
     </xsl:apply-templates>
</xsl:template>

<xsl:template name="make-link">
  <xsl:param name="child">no</xsl:param>
  <xsl:variable name="file">
  <xsl:choose>
     <xsl:when test="starts-with(@href,'http://')"><xsl:value-of select="@href"/></xsl:when>
     <xsl:when test="starts-with(@href,'http://') and contains(@href,'#')"><xsl:value-of select="substring-before(@href,'#')"/></xsl:when>
     <xsl:when test="contains(@href,'#')"><xsl:value-of select="$WORKDIR"/><xsl:value-of select="substring-before(@href,'#')"/></xsl:when>
     <xsl:otherwise><xsl:value-of select="$WORKDIR"/><xsl:value-of select="@href"/></xsl:otherwise>
  </xsl:choose>
  </xsl:variable>

  <xsl:variable name="topicid">
     <xsl:choose>
          <xsl:when test="contains(@href,'#')"><xsl:value-of select="substring-after(@href,'#')"/></xsl:when>
          <xsl:otherwise>none</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>

  <xsl:variable name="topicpos">
  <xsl:choose>
     <xsl:when test="starts-with(@href,'#')">samefile</xsl:when>
     <xsl:when test="contains(@href,'#')">otherfile</xsl:when>
     <xsl:otherwise>firstinfile</xsl:otherwise>
  </xsl:choose>
  </xsl:variable>

  <xsl:variable name="topictype">
     <xsl:choose>
          <xsl:when test="@type='other'"><xsl:value-of select="@othertype"/></xsl:when>
          <xsl:when test="@type"><xsl:value-of select="@type"/></xsl:when>
          <xsl:otherwise>topic</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>

  <xsl:variable name="classval"><xsl:text> </xsl:text><xsl:value-of select="$topictype"/>/<xsl:value-of select="$topictype"/><xsl:text> </xsl:text></xsl:variable>


  <xsl:choose>
     <xsl:when test="$child='yes'">

          <dt><a>
               <xsl:call-template name="setclass"/>
               <xsl:attribute name="href">
                    <xsl:choose>
                         <xsl:when test="@type='external'"><xsl:value-of select="@href"/></xsl:when>
                         <xsl:when test="starts-with(@href,'#')"><xsl:value-of select="@href"/></xsl:when>
                         <xsl:when test="contains(@href,'.xml')">
                              <xsl:value-of select="substring-before(@href,'.xml')"/>.<xsl:value-of select="$OUTEXT"/><xsl:value-of select="substring-after(@href,'.xml')"/>
                         </xsl:when>
                         <xsl:when test="contains(@href,'.dita')">
                              <xsl:value-of select="substring-before(@href,'.dita')"/>.<xsl:value-of select="$OUTEXT"/><xsl:value-of select="substring-after(@href,'.dita')"/>
                         </xsl:when>
                         <xsl:otherwise>
				 <xsl:call-template name="output-message">
				   <xsl:with-param name="msg">Unknown file extension. If this is a link to an external resource, set type="external". If it's a link to a DITA resource, the file extension must be .dita or .xml .</xsl:with-param>
				   <xsl:with-param name="msgnum">030</xsl:with-param>
				   <xsl:with-param name="msgsev">E</xsl:with-param>
				 </xsl:call-template>
                         </xsl:otherwise>
                    </xsl:choose>
               </xsl:attribute>
          <xsl:call-template name="get-link-text">
          <xsl:with-param name="file"><xsl:value-of select="$file"/></xsl:with-param>
          <xsl:with-param name="topicid"><xsl:value-of select="$topicid"/></xsl:with-param>
          <xsl:with-param name="topictype"><xsl:value-of select="$topictype"/></xsl:with-param>
          <xsl:with-param name="topicpos"><xsl:value-of select="$topicpos"/></xsl:with-param>
          <xsl:with-param name="classval"><xsl:value-of select="$classval"/></xsl:with-param>
          </xsl:call-template></a></dt>

          <dd><xsl:call-template name="get-link-shortdesc">
          <xsl:with-param name="file"><xsl:value-of select="$file"/></xsl:with-param>
          <xsl:with-param name="topicid"><xsl:value-of select="$topicid"/></xsl:with-param>
          <xsl:with-param name="topictype"><xsl:value-of select="$topictype"/></xsl:with-param>
          <xsl:with-param name="topicpos"><xsl:value-of select="$topicpos"/></xsl:with-param>
          <xsl:with-param name="classval"><xsl:value-of select="$classval"/></xsl:with-param>
          </xsl:call-template></dd>

     </xsl:when>
     <xsl:otherwise>
          <a>
             <xsl:call-template name="setclass"/>
               <xsl:attribute name="href">
                    <xsl:choose>
                         <xsl:when test="@type='external'"><xsl:value-of select="@href"/></xsl:when>
                         <xsl:when test="starts-with(@href,'#')"><xsl:value-of select="@href"/></xsl:when>
                         <xsl:when test="contains(@href,'.xml')">
                              <xsl:value-of select="substring-before(@href,'.xml')"/>.<xsl:value-of select="$OUTEXT"/><xsl:value-of select="substring-after(@href,'.xml')"/>
                         </xsl:when>
                         <xsl:when test="contains(@href,'.dita')">
                              <xsl:value-of select="substring-before(@href,'.dita')"/>.<xsl:value-of select="$OUTEXT"/><xsl:value-of select="substring-after(@href,'.dita')"/>
                         </xsl:when>
                         <xsl:otherwise>
				 <xsl:call-template name="output-message">
				   <xsl:with-param name="msg">Unknown file extension. If this is a link to an external resource, set type="external". If it's a link to a DITA resource, the file extension must be .dita or .xml .</xsl:with-param>
				   <xsl:with-param name="msgnum">031</xsl:with-param>
				   <xsl:with-param name="msgsev">E</xsl:with-param>
				 </xsl:call-template>
                          </xsl:otherwise>
                    </xsl:choose>
               </xsl:attribute>
          <xsl:attribute name="title">
              <xsl:call-template name="get-link-shortdesc">
               <xsl:with-param name="file"><xsl:value-of select="$file"/></xsl:with-param>
               <xsl:with-param name="topicid"><xsl:value-of select="$topicid"/></xsl:with-param>
               <xsl:with-param name="topictype"><xsl:value-of select="$topictype"/></xsl:with-param>
               <xsl:with-param name="topicpos"><xsl:value-of select="$topicpos"/></xsl:with-param>
               <xsl:with-param name="classval"><xsl:value-of select="$classval"/></xsl:with-param>
              </xsl:call-template>
          </xsl:attribute>
          <xsl:call-template name="get-link-text">
               <xsl:with-param name="file"><xsl:value-of select="$file"/></xsl:with-param>
               <xsl:with-param name="topicid"><xsl:value-of select="$topicid"/></xsl:with-param>
               <xsl:with-param name="topictype"><xsl:value-of select="$topictype"/></xsl:with-param>
               <xsl:with-param name="topicpos"><xsl:value-of select="$topicpos"/></xsl:with-param>
               <xsl:with-param name="classval"><xsl:value-of select="$classval"/></xsl:with-param>
          </xsl:call-template></a><br class="br"/>
     </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<xsl:template name="get-link-text">
     <xsl:param name="file">file</xsl:param>
     <xsl:param name="topicid">topicid</xsl:param>
     <xsl:param name="topictype">topictype</xsl:param>
     <xsl:param name="topicpos">topicposition</xsl:param>
     <xsl:param name="classval">class value</xsl:param>
     <xsl:choose>
          <xsl:when test="*[contains(@class,' topic/linktext ')]"><xsl:value-of select="*[contains(@class,' topic/linktext ')]"/></xsl:when>
          <xsl:when test="@type='external'"><xsl:value-of select="@href"/></xsl:when>
          <xsl:when test="$topicpos='samefile'">
            <xsl:choose>
               <xsl:when test="//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class, ' topic/title ')]">
               <xsl:value-of select="normalize-space(//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class, ' topic/title ')])"/>
               </xsl:when>
               <xsl:otherwise>***
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Unable to retrieve link text from target (topic in same file). Make sure the link type matches the target, and that the topic id is correct.</xsl:with-param>
		   <xsl:with-param name="msgnum">032</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
	       </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
                <xsl:when test="$topicpos='firstinfile'">
            <xsl:choose>
               <xsl:when test="document($file)//*[contains(@class, $classval)][1]/*[contains(@class, ' topic/title ')]">
               <xsl:value-of select="normalize-space(document($file)//*[contains(@class, $classval)][1]/*[contains(@class, ' topic/title ')])"/>
               </xsl:when>
               <xsl:otherwise>***
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Unable to retrieve link text from target (first topic in target file). Make sure the link type matches the target. If the target is not accessible at build time, define the link text in the link.</xsl:with-param>
		   <xsl:with-param name="msgnum">033</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
	       </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="$topicpos='otherfile'">
            <xsl:choose>
               <xsl:when test="document($file)//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class, ' topic/title ')]">
               <xsl:value-of select="normalize-space(document($file)//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class, ' topic/title ')])"/>
               </xsl:when>
               <xsl:otherwise>***
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Unable to retrieve link text from target (topic in another file). Make sure the link type matches the target, and that the topic id is correct. If the target is not accessible at build time, define the link text in the link.</xsl:with-param>
		   <xsl:with-param name="msgnum">034</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
	       </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Problem with link text retrieval. Check that the href attribute is correctly formed.<!--this error msg should never appear, since all three vals for topicpos are tested, but including for completeness--></xsl:with-param>
		   <xsl:with-param name="msgnum">035</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
	  </xsl:otherwise>
     </xsl:choose>
</xsl:template>

<xsl:template name="get-link-shortdesc">
     <xsl:param name="file">file</xsl:param>
     <xsl:param name="topicid">file</xsl:param>
     <xsl:param name="topictype">file</xsl:param>
     <xsl:param name="topicpos">topicposition</xsl:param>
     <xsl:param name="classval">class value</xsl:param>
     <xsl:choose>
          <xsl:when test="*[contains(@class,' topic/desc ')]"><xsl:value-of select="*[contains(@class,' topic/desc ')]"/></xsl:when>
	  <xsl:when test="@type='external'"/><!--do nothing - no way to get desc from external source-->
          <xsl:when test="$topicpos='samefile'">
		<xsl:choose>
			<xsl:when test="//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class, ' topic/shortdesc ')]">
		               <xsl:value-of select="normalize-space(//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class, ' topic/shortdesc ')])"/>
			</xsl:when>
			<xsl:otherwise>
			 <xsl:call-template name="output-message">
			   <xsl:with-param name="msg">Unable to retrieve short description from target (topic in same file). Make sure the link type matches the target, and that the topic id is correct.</xsl:with-param>
			   <xsl:with-param name="msgnum">036</xsl:with-param>
			   <xsl:with-param name="msgsev">E</xsl:with-param>
			 </xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>		
          </xsl:when>
                <xsl:when test="$topicpos='firstinfile'">
		<xsl:choose>
			<xsl:when test="document($file)//*[contains(@class, $classval)][1]/*[contains(@class, ' topic/shortdesc ')]">
		               <xsl:value-of select="normalize-space(document($file)//*[contains(@class, $classval)][1]/*[contains(@class, ' topic/shortdesc ')])"/>
			</xsl:when>
			<xsl:otherwise>
			 <xsl:call-template name="output-message">
			   <xsl:with-param name="msg">Unable to retrieve short description from target (first topic in target file). Make sure the link type matches the target. If the target is not accessible at build time or does not have a short description, define the description in the link.</xsl:with-param>
			   <xsl:with-param name="msgnum">037</xsl:with-param>
			   <xsl:with-param name="msgsev">E</xsl:with-param>
			 </xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>		
           </xsl:when>
          <xsl:when test="$topicpos='otherfile'">
		<xsl:choose>
			<xsl:when test="document($file)//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class, ' topic/shortdesc ')]">
		               <xsl:value-of select="normalize-space(document($file)//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class, ' topic/shortdesc ')])"/>
			</xsl:when>
			<xsl:otherwise>
			 <xsl:call-template name="output-message">
			   <xsl:with-param name="msg">Unable to retrieve short description from target (topic in another file). Make sure the link type matches the target, and that the topic id is correct. If the target is not accessible at build time or does not have a short description, define the description in the link.</xsl:with-param>
			   <xsl:with-param name="msgnum">038</xsl:with-param>
			   <xsl:with-param name="msgsev">E</xsl:with-param>
			 </xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>		
          </xsl:when>
          <xsl:otherwise>
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Problem with link description retrieval. Check that the href attribute is correctly formed.<!--this error msg should never appear, since all three vals for topicpos are tested, but including for completeness--></xsl:with-param>
		   <xsl:with-param name="msgnum">039</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
	  </xsl:otherwise>
     </xsl:choose>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/xref ')]">
  <xsl:variable name="file">
  <xsl:choose>
     <xsl:when test="contains(@href,'#')"><xsl:value-of select="$WORKDIR"/><xsl:value-of select="substring-before(@href,'#')"/></xsl:when>
     <xsl:otherwise><xsl:value-of select="$WORKDIR"/><xsl:value-of select="@href"/></xsl:otherwise>
  </xsl:choose>
  </xsl:variable>

  <xsl:variable name="topicid">
  <xsl:choose>
     <xsl:when test="contains(@href,'#') and contains(substring-after(@href,'#'),'/')"><xsl:value-of select="substring-before(substring-after(@href,'#'),'/')"/></xsl:when>
     <xsl:when test="contains(@href,'#')"><xsl:value-of select="substring-after(@href,'#')"/></xsl:when>
     <xsl:otherwise>none</xsl:otherwise>
  </xsl:choose>
  </xsl:variable>

  <xsl:variable name="elemid">
    <xsl:choose>
     <xsl:when test="contains(@href,'#') and contains(substring-after(@href,'#'),'/')"><xsl:value-of select="substring-after(substring-after(@href,'#'),'/')"/></xsl:when>
     <xsl:otherwise>none</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="topicpos">
  <xsl:choose>
     <xsl:when test="starts-with(@href,'#')">samefile</xsl:when>
     <xsl:when test="contains(@href,'#')">otherfile</xsl:when>
     <xsl:otherwise>firstinfile</xsl:otherwise>
  </xsl:choose>
  </xsl:variable>

  <xsl:variable name="targettype">
     <xsl:choose>
          <xsl:when test="@type='other'"><xsl:value-of select="@othertype"/></xsl:when>
          <xsl:when test="@type"><xsl:value-of select="@type"/></xsl:when>
          <xsl:otherwise>topic</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>


  <xsl:variable name="classval">
     <xsl:choose>
          <xsl:when test="@type='fig' or @type='figgroup' or @type='table' or @type='section' or @type='li' or @type='fn'"><xsl:text> </xsl:text>topic/<xsl:value-of select="$targettype"/><xsl:text> </xsl:text></xsl:when>
          <xsl:otherwise><xsl:text> </xsl:text><xsl:value-of select="$targettype"/>/<xsl:value-of select="$targettype"/><xsl:text> </xsl:text></xsl:otherwise>
     </xsl:choose>
  </xsl:variable>

  <a>
    <xsl:call-template name="setclass"/>
     <xsl:attribute name="href">
          <xsl:choose>
               <xsl:when test="@type='external'"><xsl:value-of select="@href"/></xsl:when>
               <xsl:when test="starts-with(@href,'#')">#<xsl:value-of select="$topicid"/><xsl:if test="contains(substring-after(@href,'#'),'/')">__<xsl:value-of select="$elemid"/></xsl:if>
	       </xsl:when>
               <xsl:when test="contains(@href,'.xml')">
                    <xsl:value-of select="substring-before(@href,'.xml')"/>.<xsl:value-of select="$OUTEXT"/><xsl:if test="contains(@href,'#')">#<xsl:value-of select="$topicid"/></xsl:if><xsl:if test="contains(substring-after(@href,'#'),'/')">__<xsl:value-of select="$elemid"/></xsl:if>
               </xsl:when>
               <xsl:when test="contains(@href,'.dita')">
                    <xsl:value-of select="substring-before(@href,'.dita')"/>.<xsl:value-of select="$OUTEXT"/><xsl:if test="contains(@href,'#')">#<xsl:value-of select="$topicid"/></xsl:if><xsl:if test="contains(substring-after(@href,'#'),'/')">__<xsl:value-of select="$elemid"/></xsl:if>
               </xsl:when>
               <xsl:otherwise>
			 <xsl:call-template name="output-message">
			   <xsl:with-param name="msg">Unknown file extension. If this is a link to an external resource, set type="external". If it's a link to a DITA resource, the file extension must be .dita or .xml .</xsl:with-param>
			   <xsl:with-param name="msgnum">040</xsl:with-param>
			   <xsl:with-param name="msgsev">E</xsl:with-param>
			 </xsl:call-template>
                </xsl:otherwise>
          </xsl:choose>
     </xsl:attribute>
  <xsl:choose>
     <xsl:when test="*|text()"><xsl:value-of select="."/></xsl:when>
     <xsl:when test="@type='external'"><xsl:value-of select="@href"/></xsl:when>
     <xsl:when test="$targettype='fig' or $targettype='figgroup' or $targettype='table' or $targettype='section'">
       <xsl:choose>
          <xsl:when test="$topicpos='samefile' and //*[contains(@class, ' topic/topic ')][@id=$topicid]/*[contains(@class,' topic/body ')]//*[contains(@class, $classval)][@id=$elemid]/*[contains(@class,' topic/title ')]">
               <xsl:value-of select="normalize-space(//*[contains(@class, ' topic/topic ')][@id=$topicid]/*[contains(@class,' topic/body ')]//*[contains(@class, $classval)][@id=$elemid]/*[contains(@class,' topic/title ')])"/>
          </xsl:when>
          <xsl:when test="$topicpos='otherfile' and document($file)//*[contains(@class, ' topic/topic ')][@id=$topicid]/*[contains(@class,' topic/body ')]//*[contains(@class, $classval)][@id=$elemid]/*[contains(@class,' topic/title ')]">
               <xsl:value-of select="normalize-space(document($file)//*[contains(@class, ' topic/topic ')][@id=$topicid]/*[contains(@class,' topic/body ')]//*[contains(@class, $classval)][@id=$elemid]/*[contains(@class,' topic/title ')])"/>
          </xsl:when>
          <xsl:otherwise>***
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Unable to retrieve link text from target. Make sure the link type matches the target, the ids for topic and element are correct, and that the target has a title. If the target is not accessible at build time, or does not have a title, give the link text as content of the xref element.</xsl:with-param>
		   <xsl:with-param name="msgnum">041</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
	  </xsl:otherwise>
       </xsl:choose>
     </xsl:when>
     <xsl:when test="$targettype='li'">
       <xsl:choose>
          <xsl:when test="$topicpos='samefile' and //*[contains(@class, ' topic/topic ')][@id=$topicid]/*[contains(@class,' topic/body ')]//*[contains(@class, $classval)][@id=$elemid]">
               <xsl:apply-templates mode="xref" select="//*[contains(@class, ' topic/topic ')][@id=$topicid]/*[contains(@class,' topic/body ')]//*[contains(@class, $classval)][@id=$elemid]"/>
          </xsl:when>
          <xsl:when test="$topicpos='otherfile' and document($file)//*[contains(@class, ' topic/topic ')][@id=$topicid]/*[contains(@class,' topic/body ')]//*[contains(@class, $classval)][@id=$elemid]">
               <xsl:apply-templates mode="xref" select="document($file)//*[contains(@class, ' topic/topic ')][@id=$topicid]/*[contains(@class,' topic/body ')]//*[contains(@class, $classval)][@id=$elemid]"/>
          </xsl:when>
          <xsl:otherwise>***
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Unable to find the target to determine the list item number. Make sure the link type matches the target, and that the ids for topic and element are correct.</xsl:with-param>
		   <xsl:with-param name="msgnum">042</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
	  </xsl:otherwise>
       </xsl:choose>
     </xsl:when>
     <xsl:when test="$targettype='fn'">
          <!--??? what do I do here?-->
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Linking to footnotes not currently supported.</xsl:with-param>
		   <xsl:with-param name="msgnum">043</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
     </xsl:when>
     <xsl:otherwise><!--topic-->
       <xsl:choose>
          <xsl:when test="$topicpos='samefile'">
            <xsl:choose>
               <xsl:when test="//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class,' topic/title ')]">
               <xsl:value-of select="normalize-space(//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class,' topic/title ')])"/>
               </xsl:when>
               <xsl:otherwise>***
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Unable to retrieve link text from target (topic in same file). Make sure the link type matches the target, and that the id for the topic is correct.</xsl:with-param>
		   <xsl:with-param name="msgnum">044</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
	       </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
             <xsl:when test="$topicpos='firstinfile'">
            <xsl:choose>
               <xsl:when test="document($file)//*[contains(@class, $classval)][1]/*[contains(@class, ' topic/title ')]">
               <xsl:value-of select="normalize-space(document($file)//*[contains(@class, $classval)][1]/*[contains(@class, ' topic/title ')])"/>
               </xsl:when>
               <xsl:otherwise>***
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Unable to retrieve link text from target (first topic in target file). Make sure the link type matches the target, which is the first topic in the referenced file, and that the referenced file is accessible. If the target is not accessible at build time, give the link text as content of the xref element.</xsl:with-param>
		   <xsl:with-param name="msgnum">045</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
	       </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="$topicpos='otherfile'">
            <xsl:choose>
               <xsl:when test="document($file)//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class, ' topic/title ')]">
               <xsl:value-of select="normalize-space(document($file)//*[contains(@class, $classval)][@id=$topicid]/*[contains(@class, ' topic/title ')])"/>
               </xsl:when>
               <xsl:otherwise>***
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Unable to retrieve link text from target (topic in target file). Make sure the link type matches the target, that the id for the topic is correct, and that the file is accessible. If the target is not accessible at build time, give the link text as content of the xref element.</xsl:with-param>
		   <xsl:with-param name="msgnum">046</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
	       </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
		 <xsl:call-template name="output-message">
		   <xsl:with-param name="msg">Unable to retrieve link text from target. Make sure the href is correctly formed and can be used to reach the target. If the target is not a DITA resource, make sure type="external" is set. If the target is not accessible at build time, give the link text as content of the xref element.</xsl:with-param>
		   <xsl:with-param name="msgnum">047</xsl:with-param>
		   <xsl:with-param name="msgsev">E</xsl:with-param>
		 </xsl:call-template>
	  </xsl:otherwise>
       </xsl:choose>
     </xsl:otherwise>
  </xsl:choose>
  </a>


</xsl:template>

<xsl:template match="*[contains(@class,' topic/linklist ')]">
   <xsl:choose>
     <xsl:when test="parent::*[contains(@class,' topic/related-links ')]">
          <p>
          <xsl:call-template name="setclass"/>
          <xsl:call-template name="makelinklist"/>
          </p>
     </xsl:when>
     <xsl:otherwise>
          <blockquote>
               <xsl:call-template name="setclass"/>
               <xsl:call-template name="makelinklist"/>
          </blockquote>
     </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="makelinklist">
  <xsl:apply-templates select="*[contains(@class, ' topic/title ')]"/>
  <xsl:apply-templates select="*[contains(@class,' topic/desc ')]"/>
  <xsl:apply-templates select="*[contains(@class,' topic/linklist ')]|*[contains(@class,' topic/link ')]"><xsl:with-param name="procrole">linklist</xsl:with-param></xsl:apply-templates>
</xsl:template>


<xsl:template match="*[contains(@class, ' topic/linklist ')]/*[contains(@class, ' topic/title ')]">
  <b><xsl:apply-templates/></b><br class="br"/>
</xsl:template>

<xsl:template match="*[contains(@class, ' topic/linklist ')]/*[contains(@class, ' topic/desc ')]">
  <xsl:apply-templates/><br class="br"/>
</xsl:template>

</xsl:stylesheet>

