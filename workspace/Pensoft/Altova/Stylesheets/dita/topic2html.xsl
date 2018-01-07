<?xml version="1.0" encoding="UTF-8" ?>
<!--  topic2html.xsl 1.03; 2002 May 7
 | DITA topic to HTML; "single topic to single web page"-level view
 |
 | Copyright IBM Corporation, 2002
 | This file is part of the DITA package on IBM's developerWorks site.
 | See license.txt for disclaimers.
 *-->

<xsl:transform version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!-- OTHER STYLESHEET INCLUDES/IMPORTS -->
<xsl:include href="rel-links.xsl"/>
<xsl:include href="domains.xsl"/>


<!-- OUTPUT METHOD -->

<!-- XHTML output with XML syntax) -->
<xsl:output method="xml"
            encoding="iso-8859-1"
            indent="no"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
            doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
/>

<!-- HTML output with HTML 4.0 syntax) -->
<!--xsl:output method="html"
            encoding="iso-8859-1"
            indent="no"
            doctype-system="http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd"
            doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
/-->


<!-- USER SPECIFIC DECLARED VALUES  (change as needed) -->

<!-- copyright string for placing into meta of each generated HTML topic -->
<xsl:variable name="copyright">Copyright IBM Corp. 1994, 2002</xsl:variable>


<!-- "GLOBAL" DECLARATIONS -->

<xsl:variable name="newline">
</xsl:variable>

<!-- Filler for A-name anchors  - was &nbsp;-->
<xsl:variable name="afill"></xsl:variable>


<!-- DEFAULT VALUES FOR EXTERNALLY MODIFIABLE PARAMETERS -->

<!-- /CSS = user's CSS filename parameter ('')-->
<xsl:param name="default-css" select="'common.css'"/>
<xsl:param name="CSS" select="''"/>

<!-- /CSSPATH = default CSS path parameter (null)-->
<xsl:param name="CSSPATH" select="''"/>

<!-- /IP = default image path parameter (null)-->
<xsl:param name="IP" select="''"/>

<!-- /ARTLBL = default "output artwork filenames" processing parameter ('no')-->
<xsl:param name="ARTLBL" select="'no'"/><!-- "no" and "yes" are valid values; non-'yes' is ignored -->

<!-- /DRAFT = default "hide draft & cleanup content" processing parameter ('no' = hide them)-->
<xsl:param name="DRAFT" select="'no'"/><!-- "no" and "yes" are valid values; non-'yes' is ignored -->

<!-- /INDEXSHOW = default "hide index entries" processing parameter ('no' = hide them)-->
<xsl:param name="INDEXSHOW" select="'no'"/><!-- "no" and "yes" are valid values; non-'yes' is ignored -->

<!-- /OUTEXT = default "output extension" processing parameter ('html')-->
<xsl:param name="OUTEXT" select="'html'"/><!-- "htm" and "html" are valid values -->

<!-- /WORKDIR = the working directory that contains the document being transformed.
     Needed as a directory prefix for the @conref and @href "document()" function calls.
     default is '../doc/')-->
<xsl:param name="WORKDIR" select="'../docs/'"/>

<!-- /FILENAME = the file name (file name and extension only - no path) of the document being transformed.
     Needed to help with debugging.
     default is 'myfile.xml')-->
<xsl:param name="FILENAME" select="'myfile.xml'"/>

<!-- /DBG = Debug mode - enables XSL debugging xsl-messages.
     Needed to help with debugging.
     default is 'no')-->
<xsl:param name="DBG" select="'no'"/><!-- "no" and "yes" are valid values; non-'yes' is ignored -->

<!-- /Lang = default language parameter  -->
<xsl:param name="Lang" select="'en-US'"/>



<!-- NULL PROCESSORS (for things whose content will be used by reference or excluded) -->

<!-- section title for now is pulled due to need for resolution of possible multiple title methods -->
<xsl:template match="*[contains(@class,' topic/section ')]/*[contains(@class,' topic/title ')]"/>

<!-- fig and table titles can be relocated, therefore must be pulled; can't fall through -->
<xsl:template match="*[contains(@class,' topic/table ')]/*[contains(@class,' topic/title ')]"/>
<xsl:template match="*[contains(@class,' topic/fig ')]/*[contains(@class,' topic/title ')]"/>
<xsl:template match="*[contains(@class,' topic/table ')]/*[contains(@class,' topic/desc ')]"/>
<xsl:template match="*[contains(@class,' topic/fig ')]/*[contains(@class,' topic/desc ')]"/>

<!-- these elements are never processed in a conventional presentation. can be overridden. -->
<xsl:template match="*[contains(@class,' topic/titlealts ')]"/>
<xsl:template match="*[contains(@class,' topic/searchtitle ')]"/>
<xsl:template match="*[contains(@class,' topic/navtitle ')]"/>
<xsl:template match="*[contains(@class,' topic/shortdesc ')]"/>
<xsl:template match="*[contains(@class,' topic/no-topic-nesting ')]"/>

<xsl:template match="*[contains(@class,' topic/prolog ')]"/>
<xsl:template match="*[contains(@class,' topic/metadata ')]"/>
<xsl:template match="*[contains(@class,' topic/author ')]"/>
<xsl:template match="*[contains(@class,' topic/source ')]"/>
<xsl:template match="*[contains(@class,' topic/publisher ')]"/>
<xsl:template match="*[contains(@class,' topic/copyright ')]"/>
<xsl:template match="*[contains(@class,' topic/copyryear ')]"/>
<xsl:template match="*[contains(@class,' topic/copyrholder ')]"/>
<xsl:template match="*[contains(@class,' topic/critdates ')]"/>
<xsl:template match="*[contains(@class,' topic/created ')]"/>
<xsl:template match="*[contains(@class,' topic/revised ')]"/>
<xsl:template match="*[contains(@class,' topic/permissions ')]"/>
<xsl:template match="*[contains(@class,' topic/category ')]"/>
<xsl:template match="*[contains(@class,' topic/audience ')]"/>
<xsl:template match="*[contains(@class,' topic/keywords ')]"/>
<xsl:template match="*[contains(@class,' topic/prodinfo ')]"/>
<xsl:template match="*[contains(@class,' topic/prodname ')]"/>
<xsl:template match="*[contains(@class,' topic/vrmlist ')]"/>
<xsl:template match="*[contains(@class,' topic/vrm ')]"/>
<xsl:template match="*[contains(@class,' topic/brand ')]"/>
<xsl:template match="*[contains(@class,' topic/series ')]"/>
<xsl:template match="*[contains(@class,' topic/platform ')]"/>
<xsl:template match="*[contains(@class,' topic/prognum ')]"/>
<xsl:template match="*[contains(@class,' topic/featnum ')]"/>
<xsl:template match="*[contains(@class,' topic/component ')]"/>
<xsl:template match="*[contains(@class,' topic/othermeta ')]"/>
<xsl:template match="*[contains(@class,' topic/resourceid ')]"/>

<!-- handled by related-links.xsl: related-links, link, linkpool, linklist,
     title and desc in linklist, and xref -->



<!-- ROOT RULE (just fall through) -->

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>




<!-- This first template rule generates the outer-level shell for a delivery context. -->
<!-- In an override stylesheet, the same call to "chapter-setup" must be issued to
     maintain the consistency of overall look'n'feel of the output HTML. -->

<xsl:template match="*[contains(@class,' topic/topic ')]" name="toptopic">
  <xsl:comment>Common DITA topic to HTML application by IBM Corp., 2001, 2002</xsl:comment>
  <xsl:call-template name="chapter-setup"/>
</xsl:template>


<!-- =============== start of contextual topic titles ================= -->

<!-- NESTED TOPIC CONTEXTS (child topics get a div wrapper and fall through) -->
<xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]" priority="2">
  <div class="nested1">
    <xsl:apply-templates select="@id"/>
    <xsl:call-template name="gen-toc-id"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]" priority="3">
  <div class="nested2">
    <xsl:apply-templates select="@id"/>
    <xsl:call-template name="gen-toc-id"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]" priority="4">
  <div class="nested3">
    <xsl:apply-templates select="@id"/>
    <xsl:call-template name="gen-toc-id"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]" priority="5">
  <div class="nested4">
    <xsl:apply-templates select="@id"/>
    <xsl:call-template name="gen-toc-id"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]" priority="6">
  <div class="nested5">
    <xsl:apply-templates select="@id"/>
    <xsl:call-template name="gen-toc-id"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>



<!-- NESTED TOPIC TITLES (sensitive to nesting depth, but are still processed for contained markup) -->

<xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/title ')]" priority="2">
  <h1 class="topictitle1"><xsl:call-template name="get-title"/></h1>
  <xsl:call-template name="gen-ptoc"/>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/title ')]" priority="3">
  <h2 class="topictitle2"><xsl:call-template name="get-title"/></h2>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/title ')]" priority="4">
  <h3 class="topictitle3"><xsl:call-template name="get-title"/></h3>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/title ')]" priority="5">
  <h4 class="topictitle4"><xsl:call-template name="get-title"/></h4>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/title ')]" priority="6">
  <h5 class="topictitle5"><xsl:call-template name="get-title"/></h5>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/title ')]" priority="7">
  <h6 class="topictitle6"><xsl:call-template name="get-title"/></h6>
</xsl:template>

<!-- =============== end of contextual topic titles ================= -->



<xsl:template match="*[contains(@class,' topic/shortdesc ')]" mode="outofline">
  <p style="padding: 3pt; background: #e0e0e0">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates/>
  </p>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/body ')]" name="topbody">
  <div>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <!-- here, you can generate a toc based on what's a child of body -->
    <!--xsl:call-template  name="gen-sect-ptoc"/-->
    <xsl:apply-templates select="parent::*/shortdesc" mode="outofline"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/section ')]">
  <div>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:call-template name="gen-toc-id"/>
    <xsl:call-template name="sect-heading">
       <xsl:with-param name="deftitle"></xsl:with-param>
    </xsl:call-template>
    <xsl:apply-templates/>
    <xsl:if test="$link-top-section='yes'">
      <p align="left"><a href="#TOP">
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Return to Top'"/>
        </xsl:call-template>
      </a></p>
    </xsl:if>
  </div>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/example ')]">
  <div>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:call-template name="gen-toc-id"/>
    <xsl:call-template name="sect-heading">
      <xsl:with-param name="deftitle">
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Example'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:apply-templates/>
    <xsl:if test="$link-top-section='yes'">
      <p align="left"><a href="#TOP">
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Return to Top'"/>
        </xsl:call-template>
      </a></p>
    </xsl:if>
  </div>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/p ')]">
<xsl:apply-templates select="@id"/>
 <xsl:choose>
  <xsl:when test="descendant::*[contains(@class,' topic/pre ')]"><div><xsl:call-template name="setclass"/><xsl:apply-templates /></div></xsl:when>
  <xsl:when test="descendant::*[contains(@class,' topic/ul ')]"><div><xsl:call-template name="setclass"/><xsl:apply-templates /></div></xsl:when>
  <xsl:when test="descendant::*[contains(@class,' topic/ol ')]"><div><xsl:call-template name="setclass"/><xsl:apply-templates /></div></xsl:when>
  <xsl:otherwise><p><xsl:call-template name="setclass"/><xsl:apply-templates /></p></xsl:otherwise>
 </xsl:choose>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/note ')]">
  <p>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:choose>
      <xsl:when test="@type='note'"><b>
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Note'"/>
        </xsl:call-template><xsl:text>: </xsl:text></b>
      </xsl:when>
      <xsl:when test="@type='tip'"><b>
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Tip'"/>
        </xsl:call-template><xsl:text>: </xsl:text></b>
      </xsl:when>
      <xsl:when test="@type='fastpath'"><b>
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Fastpath'"/>
        </xsl:call-template><xsl:text>: </xsl:text></b>
      </xsl:when>
      <xsl:when test="@type='restriction'"><b>
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Restriction'"/>
        </xsl:call-template><xsl:text>: </xsl:text></b>
      </xsl:when>
      <xsl:when test="@type='important'"><b>
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Important'"/>
        </xsl:call-template><xsl:text>: </xsl:text></b>
      </xsl:when>
      <xsl:when test="@type='remember'"><b>
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Remember'"/>
        </xsl:call-template><xsl:text>: </xsl:text></b>
      </xsl:when>
      <xsl:when test="@type='attention'"><b>
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Attention'"/>
        </xsl:call-template><xsl:text>: </xsl:text></b>
      </xsl:when>
      <xsl:when test="@type='caution'"><b>
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Caution'"/>
        </xsl:call-template><xsl:text>: </xsl:text></b>
      </xsl:when>
      <xsl:when test="@type='danger'"><b>
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Danger'"/>
        </xsl:call-template><xsl:text>: </xsl:text></b>
      </xsl:when>
      <xsl:when test="@type='other'">
        <xsl:choose>
          <xsl:when test="@othertype">
          <!-- othertype is a key that should look up external, translateable text. -->
          <b>
           <xsl:value-of select="@othertype"/><xsl:text>: </xsl:text>
          </b>
          </xsl:when>
          <xsl:otherwise>
            <!-- nop -->
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
          <!-- nop -->
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates />
  </p>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/lq ')]">
  <blockquote>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
    <xsl:choose>
      <xsl:when test="@href">
        <br class="br"/><div style="text-align:right"><a href="{@href}"><cite><xsl:value-of select="@reftitle"/></cite></a></div>
      </xsl:when>
      <xsl:when test="@reftitle">
        <br class="br"/><div style="text-align:right"><cite><xsl:value-of select="@reftitle"/></cite></div>
      </xsl:when>
      <xsl:otherwise><!--nop--></xsl:otherwise>
    </xsl:choose>
  </blockquote>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/q ')]">
  <!-- for HTML 4 aware browsers, use HTML's q element with CSS lang properties -->
  <xsl:text>"</xsl:text><xsl:apply-templates/><xsl:text>"</xsl:text>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/ul ')]">
  <ul>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@compact"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </ul>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/ol ')]">
  <ol>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@compact"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </ol>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/li ')]">
  <li>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </li>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/itemgroup ')]">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/dl ')]">
  <dl>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@compact"/>
    <xsl:apply-templates select="@id"/>

    <xsl:apply-templates/>
  </dl>
</xsl:template>


<xsl:template match="*[contains(@class, ' topic/dlhead ')]">
  <xsl:apply-templates/>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/dthd ')]">
  <dt>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <b><xsl:apply-templates/></b>
  </dt>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/ddhd ')]">
  <dd>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <b><xsl:apply-templates/></b>
  </dd>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/dlentry ')]">
  <xsl:if test="@id">
  <xsl:call-template name="output-message">
    <xsl:with-param name="msg">The ID attribute on DLENTRY will be ignored. Move that ID to a DT tag.</xsl:with-param>
    <xsl:with-param name="msgnum">002</xsl:with-param>
    <xsl:with-param name="msgsev">W</xsl:with-param>
  </xsl:call-template>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>



<xsl:template match="*[contains(@class,' topic/dt ')]">
  <dt>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:choose>
      <xsl:when test="*"> <!-- tagged content - do not default to bold -->
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <b><xsl:apply-templates/></b> <!-- text only - bold it -->
      </xsl:otherwise>
    </xsl:choose>
  </dt>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/dd ')]">
  <dd>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </dd>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/fig ')]">
  <xsl:if test="contains(@frame,'top')"><hr class="hr"/></xsl:if>
  <div>
    <xsl:call-template name="setclass"/>
    <xsl:choose>
      <xsl:when test="@frame='all'">
        <xsl:attribute name="class">figborder</xsl:attribute>
      </xsl:when>
      <xsl:when test="@frame='sides'">
        <!-- sides-only borders using CSS -->
      </xsl:when>
      <xsl:otherwise>
        <!-- CSS for any remaining frame treatments -->
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="$fmt-fig-lbl-loc='over'"><xsl:call-template name="place-fig-lbl"/></xsl:if>
      <xsl:apply-templates select="@id"/>
      <xsl:apply-templates/>
    <xsl:if test="$fmt-fig-lbl-loc='under'"><xsl:call-template name="place-fig-lbl"/></xsl:if>
  </div>
  <xsl:if test="contains(@frame,'bot')"><hr class="hr"/></xsl:if>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/figgroup ')]">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/pre ')]">
  <xsl:if test="contains(@frame,'top')"><hr class="hr"/></xsl:if>
  <xsl:call-template name="gen-att-label"/>
  <pre>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:if test="@scale">
      <xsl:attribute name="style">font-size: <xsl:value-of select="@scale"/>%;</xsl:attribute>
    </xsl:if>
    <xsl:apply-templates/>
  </pre>
  <xsl:if test="contains(@frame,'bot')"><hr class="hr"/></xsl:if>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/lines ')]">
  <pre style="font-family: sans-serif;">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </pre>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/term ')]">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/ph ')]">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/tm ')]">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
    <sup>
    <xsl:choose>
      <xsl:when test="@tmtype='tm'">(TM)</xsl:when>
      <xsl:when test="@tmtype='reg'">(R)</xsl:when>
      <xsl:when test="@tmtype='service'">(SM)</xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="output-message">
          <xsl:with-param name="msg">Invalid trademark attribute.</xsl:with-param>
          <xsl:with-param name="msgnum">003</xsl:with-param>
          <xsl:with-param name="msgsev">W</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
    </sup>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/boolean ')]">
  <span style="color:green">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:value-of select="name()"/><xsl:text>: </xsl:text><xsl:value-of select="@state"/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/state ')]">
  <span style="color:red">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:value-of select="name()"/><xsl:text>: </xsl:text><xsl:value-of select="@name"/><xsl:text>=</xsl:text><xsl:value-of select="@value"/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/image ')]">
  <!-- build any pre break indicated by style -->
  <xsl:choose>
    <xsl:when test="parent::fig[contains(@frame,'top ')]">
      <!-- NOP if there is already a break implied by a parent property -->
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="not(@placement='inline')"><br clear="all"/></xsl:if>
    </xsl:otherwise>
  </xsl:choose>
  <!-- now invoke the actual content and its alt text -->
  <xsl:element name="img">
    <xsl:call-template name="setclass"/>
    <xsl:attribute name="src">
     <xsl:value-of select="$IP"/>
       <xsl:choose>
         <xsl:when test="@href">
           <xsl:value-of select="@href"/>
         </xsl:when>
         <xsl:otherwise>
           <!-- no action -->
         </xsl:otherwise>
       </xsl:choose>
     </xsl:attribute>
    <xsl:if test="@height"><xsl:attribute name="height"><xsl:value-of select="@height"/></xsl:attribute></xsl:if>
    <xsl:if test="@width"><xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute></xsl:if>
    <xsl:choose>
      <xsl:when test="@alt">
        <xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="alt"><xsl:value-of select="textalt|*[contains(@class,' topic/textalt')]"/></xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@align"><xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute></xsl:if>
  </xsl:element>
  <!-- build any post break indicated by style -->
  <xsl:if test="not(@placement='inline')"><br clear="all"/></xsl:if>
  <!-- build optional echo of the image name for review -->
  <xsl:if test="$ARTLBL='yes'">
     <br class="br"/><b>[<xsl:value-of select="$IP"/> <xsl:value-of select="@href"/>]</b>
  </xsl:if>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/object ')]">
  <!-- copy through for HTML -->
  <xsl:copy>
    <xsl:copy-of select="@*" />
    <xsl:apply-templates />
  </xsl:copy>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/param ')]">
  <!-- copy through for HTML -->
  <xsl:copy>
    <xsl:copy-of select="@*" />
    <xsl:apply-templates />
  </xsl:copy>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/simpletable ')]">
  <table border="1">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </table>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/sthead ')]">
  <tr>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/strow ')]">
  <tr>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/sthead ')]/*[contains(@class,' topic/stentry ')]" priority="2">
  <th align="left" valign="bottom">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates/>
  </th>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/stentry ')]">
  <td align="left" valign="top">
    <xsl:call-template name="setclass"/>
    <xsl:variable name="localkeycol">
      <xsl:choose>
        <xsl:when test="ancestor::simpletable/@keycol">
          <xsl:value-of select="ancestor::simpletable/@keycol"/>
        </xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$localkeycol=position()"><b><xsl:apply-templates/></b></xsl:when>
      <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
    </xsl:choose>
  </td>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/draft-comment ')]">
  <xsl:if test="$DRAFT='yes'">
    <xsl:apply-templates select="@id"/>
    <div style="background-color: #FF99FF; color:#CC3333; border: 1pt black solid;">
      <xsl:call-template name="setclass"/>
      <b>Review comment<xsl:if test="@author"> [from <xsl:value-of select="@author"/>]</xsl:if><xsl:if test="@disposition"> (<xsl:value-of select="@disposition"/>)</xsl:if><xsl:if test="@time"> {<xsl:value-of select="@time"/>}</xsl:if><xsl:text>: </xsl:text></b>
      <xsl:apply-templates/>
    </div>
  </xsl:if>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/required-cleanup ')]">
  <xsl:if test="$DRAFT='yes'">
    <xsl:call-template name="output-message">
      <xsl:with-param name="msg">Required cleanup area found.</xsl:with-param>
      <xsl:with-param name="msgnum">001</xsl:with-param>
      <xsl:with-param name="msgsev">W</xsl:with-param>
    </xsl:call-template>
    <xsl:apply-templates select="@id"/>
    <span style="background-color: #FFFF99; color:#CC3333">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <b>Required Cleanup! <xsl:if test="@remap">[<xsl:value-of select="@remap"/>] </xsl:if></b>
    <xsl:apply-templates/>
    </span>
  </xsl:if>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/fn ')]">
  <xsl:apply-templates select="@id"/>
  <xsl:variable name="fnid"><xsl:number from="/" level="any"/></xsl:variable>
  <xsl:variable name="callout"><xsl:value-of select="@callout"/></xsl:variable>
  <xsl:variable name="convergedcallout">
    <xsl:choose>
      <xsl:when test="string-length($callout)>'0'"><xsl:value-of select="$callout"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$fnid"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
    <!-- <xsl:variable name="fnbody"><xsl:apply-templates/></xsl:variable> -->
    <!-- <a name="fnsrc_{$fnid}" href="#fntarg_{$fnid}" OnClick='alert ("{$fnbody}")'> -->
  <a name="fnsrc_{$fnid}" href="#fntarg_{$fnid}">
    <sup><xsl:value-of select="$convergedcallout"/></sup>
  </a>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/cite ')]">
<cite>
  <xsl:call-template name="setclass"/>
  <xsl:apply-templates select="@id"/>
  <xsl:apply-templates/>
</cite>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/indextermref ')]"/>


<xsl:template match="*[contains(@class,' topic/indexterm ')]">
  <xsl:if test="$INDEXSHOW='yes'">
    <span style="margin: 1pt; background-color: #ffddff; border: 1pt black solid;">
      <xsl:call-template name="setclass"/>
      <xsl:apply-templates/>
    </span>
  </xsl:if>
</xsl:template>


<xsl:template match="*[contains(@class,' topic/keyword ')]">
  <xsl:apply-templates select="@id"/>
  <xsl:apply-templates/>
</xsl:template>


<!--  CALS (OASIS) TABLE  -->

<xsl:template match="*[contains(@class,' topic/tgroup ')]">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/spanspec ')]"/>

<xsl:template match="*[contains(@class,' topic/colspec ')]"></xsl:template>


<xsl:template match="*[contains(@class,' topic/table ')]">
  <xsl:if test="$fmt-tbl-lbl-loc='over'"><xsl:call-template name="place-tbl-lbl"/></xsl:if>
  <xsl:if test="contains(@frame,'top')"><hr class="hr"/></xsl:if>

  <xsl:apply-templates select="@id"/>
  <table>
    <xsl:call-template name="setclass"/>
    <!-- apply longdesc processing here if outputting HTML 4 -->
    <xsl:if test="@frame">
      <xsl:variable name="frameval" select="@frame"/>
      <xsl:choose>
        <xsl:when test="$frameval='none'">
          <xsl:attribute name="border">0</xsl:attribute>
        </xsl:when>
        <xsl:when test="contains($frameval,'top')">
          <!-- any HTML table frame controls for this condition? -->
        </xsl:when>
        <xsl:when test="contains($frameval,'bot')">
          <!-- any HTML table frame controls for this condition? -->
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="border">1</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    <xsl:if test="not(@frame)">
      <xsl:attribute name="border">1</xsl:attribute>
    </xsl:if>
    <xsl:call-template name="tblatts"/>
    <xsl:call-template name="place-tbl-width"/> <!-- pick up global definition -->
      <xsl:apply-templates/>
    <xsl:apply-templates select="*[contains(@class,' topic/tfoot ')]" mode="outofline"/>
  </table>
  <br clear="all"/>
  <br clear="all"/>
  <xsl:if test="contains(@frame,'bot')"><hr class="hr"/></xsl:if>
  <xsl:if test="$fmt-tbl-lbl-loc='under'"><xsl:call-template name="place-tbl-lbl"/></xsl:if>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/row ')]">
  <tr>
  <xsl:call-template name="setclass"/>
    <xsl:call-template name="tblatts"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/thead ')]">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/tfoot ')]" mode="outofline">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/tbody ')]">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/thead ')]/*/*[contains(@class,' topic/entry ')]" name="thdr">
  <th>
    <xsl:call-template name="setclass"/>
    <xsl:call-template name="tblatts-nocolst"/>
    <xsl:call-template name="fillit"/>
  </th>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/tfoot ')]/*/*[contains(@class,' topic/entry ')]" name="tftr">
  <td>
    <xsl:call-template name="setclass"/>
    <xsl:call-template name="tblatts-nocolst"/>
    <xsl:value-of select="./tft/c"/>
  </td>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/tbody ')]/*/*[contains(@class,' topic/entry ')]" name="tbod">
  <td>
    <xsl:call-template name="setclass"/>
    <xsl:call-template name="tblatts-nocolst"/>
    <xsl:call-template name="fillit"/>
  </td>
</xsl:template>

<xsl:template match="*[contains(@class,' topic/tnote ')]">
  <tr>
    <xsl:call-template name="setclass"/>
    <xsl:call-template name="tblatts"/>
    <td>
      <xsl:call-template name="tblatts-nocolst"/>
      <p><b>
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Note'"/>
        </xsl:call-template><xsl:text>: </xsl:text>
      </b><xsl:apply-templates/></p>
    </td>
  </tr>
</xsl:template>

<!-- named templates for CALS table -->

<!-- generate &nbsp filler if the cell is evidently empty -->
<xsl:template name="fillit">
  <xsl:choose>
    <xsl:when test="not(text()[normalize-space(.)] | *)">&#160;</xsl:when>
    <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- process the generic table attributes (convert CALS properties to HTML properties) -->
<xsl:template name="tblatts">
  <xsl:choose>
    <xsl:when test="@valign"><xsl:attribute name="valign"><xsl:value-of select="@valign"/></xsl:attribute></xsl:when>
    <xsl:otherwise><xsl:attribute name="valign">top</xsl:attribute></xsl:otherwise>
  </xsl:choose>
  <xsl:choose>
    <xsl:when test="@align"><xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute></xsl:when>
    <xsl:otherwise><xsl:attribute name="align">left</xsl:attribute></xsl:otherwise>
  </xsl:choose>
  <xsl:if test="@colsep">
    <xsl:if test="@colsep='1'"><xsl:attribute name="cellpadding">10</xsl:attribute></xsl:if>
  </xsl:if>
  <xsl:if test="@morerows">
    <xsl:attribute name="rowspan"><xsl:value-of select="@morerows+1"/></xsl:attribute>
  </xsl:if>
  <xsl:if test="@colname">
    <xsl:attribute name="colstart"><xsl:value-of select="ancestor::tgroup/colspec[@colname=current()/@colname]/@colnum"/></xsl:attribute>
  </xsl:if>
  <xsl:if test="@namest">
    <xsl:variable name="colst" select="substring-after(@namest,'col')"/>
    <xsl:variable name="colend" select="substring-after(@nameend,'col')"/>
    <xsl:attribute name="colspan"><xsl:value-of select="$colend - $colst + 1"/></xsl:attribute>
  </xsl:if>
</xsl:template>


<!-- process the generic table attributes (convert CALS properties to HTML properties) -->
<xsl:template name="tblatts-nocolst">
  <xsl:choose>
    <xsl:when test="@valign"><xsl:attribute name="valign"><xsl:value-of select="@valign"/></xsl:attribute></xsl:when>
    <xsl:otherwise><xsl:attribute name="valign">top</xsl:attribute></xsl:otherwise>
  </xsl:choose>
  <xsl:choose>
    <xsl:when test="@align"><xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute></xsl:when>
    <xsl:otherwise><xsl:attribute name="align">left</xsl:attribute></xsl:otherwise>
  </xsl:choose>
  <xsl:if test="@colsep">
    <xsl:if test="@colsep='1'"><xsl:attribute name="cellpadding">10</xsl:attribute></xsl:if>
  </xsl:if>
  <xsl:if test="@morerows">
    <xsl:attribute name="rowspan"><xsl:value-of select="@morerows+1"/></xsl:attribute>
  </xsl:if>
  <xsl:if test="@colname">
    <!--xsl:attribute name="colstart"><xsl:value-of select="ancestor::tgroup/colspec[@colname=current()/@colname]/@colnum"/></xsl:attribute-->
  </xsl:if>
  <xsl:if test="@namest">
    <xsl:variable name="colst" select="substring-after(@namest,'col')"/>
    <xsl:variable name="colend" select="substring-after(@nameend,'col')"/>
    <xsl:attribute name="colspan"><xsl:value-of select="$colend - $colst + 1"/></xsl:attribute>
  </xsl:if>
</xsl:template>

<!-- end of table section -->


<!-- =================== end of element rules ====================== -->




<!-- =================== start of processors  ====================== -->


<!--  COMMON ATTRIBUTE PROCESSORS  -->

<!-- If the element has an ID, copy it through as an anchor. -->
<xsl:template match="@id">
  <a>
    <xsl:attribute name="name">
      <xsl:if test="ancestor::*[contains(@class,' topic/body ')]">
       <xsl:value-of select="ancestor::*[contains(@class,' topic/body ')]/parent::*/@id"/><xsl:text>__</xsl:text>
      </xsl:if>
      <xsl:value-of select="."/>
    </xsl:attribute>
  <xsl:value-of select="$afill"/>
  </a>
</xsl:template>


<!-- Generate an ID to use for generated toc. -->
<xsl:template name="gen-toc-id">
  <a name="{generate-id()}">&#160;</a>

</xsl:template>


<!-- Create the class attribute for an element when the DITA element has an outputclass attribute. -->
<xsl:template name="setclass">
  <xsl:if test="@outputclass">
     <xsl:attribute name="class"><xsl:value-of select="@outputclass"/></xsl:attribute>
  </xsl:if>
</xsl:template>


<!-- If the element has a compact=yes attribute, assert it in HTML form. -->
<!-- (assumes that no compaction is default) -->
<xsl:template match="@compact">
  <xsl:if test="@compact = 'yes'">
   <xsl:attribute name="compact">compact</xsl:attribute>
  </xsl:if>
</xsl:template>


<!--  CONREF (content fetched by id from conrefed element)  -->

<xsl:template match="*[@conref]" priority="10">
  <!--get element local name, parent topic's domains, and then file name, topic id, element id from conref value-->
  <xsl:variable name="element">
    <xsl:value-of select="local-name(.)"/>
  </xsl:variable>
  <xsl:variable name="domains">
    <xsl:value-of select="ancestor::*[contains(@class, ' topic/body ')]/parent::*/@domains"/>
  </xsl:variable>
  <xsl:variable name="file">
    <xsl:choose>
       <xsl:when test="contains(@conref,'#')"><xsl:value-of select="$WORKDIR"/><xsl:value-of select="substring-before(@conref,'#')"/></xsl:when>
       <xsl:otherwise><xsl:value-of select="$WORKDIR"/><xsl:value-of select="@conref"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="topicid">
    <xsl:choose>
       <xsl:when test="contains(@conref,'#') and contains(substring-after(@conref,'#'),'/')"><xsl:value-of select="substring-before(substring-after(@conref,'#'),'/')"/></xsl:when>
       <xsl:when test="contains(@conref,'#')"><xsl:value-of select="substring-after(@conref,'#')"/></xsl:when>
       <xsl:otherwise>none</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="elemid">
    <xsl:choose>
     <xsl:when test="contains(@conref,'#') and contains(substring-after(@conref,'#'),'/')"><xsl:value-of select="substring-after(substring-after(@conref,'#'),'/')"/></xsl:when>
     <xsl:otherwise>none</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="topicpos">
    <xsl:choose>
       <xsl:when test="starts-with(@conref,'#')">samefile</xsl:when>
       <xsl:when test="contains(@conref,'#')">otherfile</xsl:when>
       <xsl:otherwise>firstinfile</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="DBG">no</xsl:variable>
  <xsl:if test="$DBG='yes'">
    <xsl:call-template name="output-message">
      <xsl:with-param name="msg">Conref trace: </xsl:with-param>
      <xsl:with-param name="msgnum">006</xsl:with-param>
      <xsl:with-param name="msgsev">I</xsl:with-param>
    </xsl:call-template>
    <xsl:message> Element: <xsl:value-of select="name()"/>:<xsl:value-of select="$element"/></xsl:message>
    <xsl:message> Domains: <xsl:value-of select="$domains"/></xsl:message>
    <xsl:message> Working dir: <xsl:value-of select="$WORKDIR"/></xsl:message>
    <xsl:message> File: <xsl:value-of select="$file"/></xsl:message>
    <xsl:message> Topicid: <xsl:value-of select="$topicid"/></xsl:message>
    <xsl:message> Elemid: <xsl:value-of select="$elemid"/></xsl:message>
    <xsl:message> Topic location: <xsl:value-of select="$topicpos"/></xsl:message>
  </xsl:if>

  <xsl:choose>
     <xsl:when test="contains(substring-after(@conref,'#'),'/')"><!--targetting an element inside a topic-->
       <xsl:choose>
          <xsl:when test="$topicpos='samefile'">
            <xsl:apply-templates select="//*[contains(@class, ' topic/topic ')][@id=$topicid][@domains=$domains]/*[contains(@class, ' topic/body ')]//*[local-name()=$element][@id=$elemid]"/>
          </xsl:when>
          <xsl:when test="$topicpos='otherfile'">
            <xsl:apply-templates select="document($file)//*[contains(@class, ' topic/topic ')][@id=$topicid][@domains=$domains]/*[contains(@class, ' topic/body ')]//*[local-name()=$element][@id=$elemid]"/>
          </xsl:when>
          <xsl:otherwise/><!-- error msg -->
       </xsl:choose>
     </xsl:when>
     <xsl:otherwise><!--assume targetting a topic-->
       <xsl:choose>
          <xsl:when test="$topicpos='samefile'">
            <xsl:apply-templates select="//*[contains(@class, ' topic/topic ')][@id=$topicid][@domains=$domains][local-name()=$element]"/>
          </xsl:when>
          <xsl:when test="$topicpos='otherfile'">
            <xsl:apply-templates select="document($file)//*[contains(@class, ' topic/topic ')][@id=$topicid][@domains=$domains][local-name()=$element]"/>
          </xsl:when>
          <xsl:when test="$topicpos='firstinfile'">
            <xsl:apply-templates select="document($file)//*[contains(@class, ' topic/topic ')][1][@domains=$domains][local-name()=$element]"/>
          </xsl:when>
          <xsl:otherwise/><!-- error msg -->
       </xsl:choose>
     </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- SCRIPT SUPPORT -->

<xsl:template name="script-sample">
<script language="JavaScript">
<xsl:comment>
  // define JavaScript within here; use CDATA sections as appropriate
  self.focus();
  function popwin(popupitem)
  {
         var PopUpWin=window.open(popupitem,"PopUpWin","toolbar=no,directories=no,menubar=no,status=no,scrollbars=yes,resizable=yes,width=500,height=200");
         PopUpWin.focus();
  }
//</xsl:comment>
</script>
</xsl:template>



<!--  NAMED TEMPLATES (call by name, only)  -->

<xsl:template name="gen-att-label">
<xsl:if test="@spectitle"><div style="margin-bottom: 0;"><b><xsl:value-of select="@spectitle"/></b></div></xsl:if>
</xsl:template>


<!-- named templates that can be used anywhere -->

<!-- this replaces newlines with the BR element, forcing non-concatenation even in flow contexts -->
<xsl:template name="br-replace">
  <xsl:param name="word"/>
<!-- capture an actual newline within the xsl:text element -->
  <xsl:variable name="cr"><xsl:text>
</xsl:text></xsl:variable>
  <xsl:choose>
    <xsl:when test="contains($word,$cr)">
       <xsl:value-of select="substring-before($word,$cr)"/>
       <br class="br"/>
       <xsl:call-template name="br-replace">
         <xsl:with-param name="word" select="substring-after($word,$cr)"/>
       </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$word"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- diagnostic: call this to generate a path-like view of an element's ancestry! -->
<xsl:template name="breadcrumbs">
<xsl:variable name="full-path">
  <xsl:for-each select="ancestor-or-self::*">
    <xsl:value-of select="concat('/',name())"/>
  </xsl:for-each>
</xsl:variable>
<p><b><xsl:value-of select="$full-path"/></b></p>
</xsl:template>


<!-- the following named templates generate inline content for the delivery context -->


<!-- named templates for labels and titles related to topic structures -->

<xsl:template name="get-title"><!-- get fully-processed title content by whatever mechanism -->
  <xsl:choose>
   <xsl:when test="@classif">
     <xsl:value-of select="//classdef[@classname=current()/@classif]/title"/>
   </xsl:when>
   <xsl:when test="@spectitle">
     <xsl:value-of select="@spectitle"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates/> <!-- select="title|*[contains(@class,' topic/title ')]"/-->
   </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template name="get-sect-heading">
     <xsl:choose>
      <xsl:when test="@classif">
        <xsl:value-of select="//classdef[@classname=current()/@classif]/title"/>
      </xsl:when>
      <xsl:when test="@spectitle">
        <xsl:value-of select="@spectitle"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="title"/>
      </xsl:otherwise>
     </xsl:choose>
</xsl:template>


<xsl:template name="sect-heading">
  <xsl:param name="deftitle" select="."/> <!-- get param by reference -->
  <xsl:variable name="heading">
     <xsl:choose>
      <xsl:when test="*[contains(@class,' topic/title ')]">
        <xsl:value-of select="*[contains(@class,' topic/title ')]"/>
        <xsl:if test="*[contains(@class,' topic/title ')][2]">
         <xsl:call-template name="output-message">
           <xsl:with-param name="msg">More than one title element in a section. Using the first one for the section's title.</xsl:with-param>
           <xsl:with-param name="msgnum">007</xsl:with-param>
           <xsl:with-param name="msgsev">W</xsl:with-param>
         </xsl:call-template>
      </xsl:if>
      </xsl:when>
      <xsl:when test="@spectitle">
        <xsl:value-of select="@spectitle"/>
      </xsl:when>
      <xsl:otherwise/>
     </xsl:choose>
  </xsl:variable>

  <!-- based on graceful defaults, build an appropriate section-level heading -->
  <xsl:choose>
    <xsl:when test="not($heading='')">
      <xsl:if test="normalize-space($heading)=''">
        <!-- hack: a title with whitespace ALWAYS overrides as null -->
        <xsl:comment>no heading</xsl:comment>
      </xsl:if>
      <p class="sectiontitle"><b><xsl:call-template name="proc-ing"/><xsl:value-of select="$heading"/></b></p>
    </xsl:when>
    <xsl:when test="$deftitle">
      <p class="sectiontitle"><b><xsl:value-of select="$deftitle"/></b></p>
    </xsl:when>
    <xsl:otherwise><br /><!-- no heading title, output section starting with a break --></xsl:otherwise>
  </xsl:choose>
</xsl:template>




<!-- render any contained footnotes as endnotes.  Links back to reference point -->
<xsl:template name="gen-endnotes">
  <xsl:if test="//fn">
   <hr class="hr"/>
   <div>
   <h3 class="sectiontitle">
      <xsl:call-template name="getString">
        <xsl:with-param name="stringName" select="'End Notes'"/>
      </xsl:call-template>
    </h3>
    <xsl:for-each select="//fn">
     <p>
       <xsl:variable name="fnid"><xsl:number from="/" level="any"/></xsl:variable>
       <xsl:variable name="callout"><xsl:value-of select="@callout"/></xsl:variable>
       <xsl:variable name="convergedcallout">
         <xsl:choose>
           <xsl:when test="string-length($callout)>'0'"><xsl:value-of select="$callout"/></xsl:when>
           <xsl:otherwise><xsl:value-of select="$fnid"/></xsl:otherwise>
         </xsl:choose>
       </xsl:variable>
       <a name="fntarg_{$fnid}" href="#fnsrc_{$fnid}">
         <sup><xsl:value-of select="$convergedcallout"/></sup>
       </a><xsl:text>  </xsl:text>
       <xsl:apply-templates/>
     </p>
    </xsl:for-each>
  </div>
  </xsl:if>
</xsl:template>


<!-- listing of topics from calling context only; can be expanded for nesting -->
<xsl:template name="gen-toc">
  <div>
  <h3 class="sectiontitle">
    <!--xsl:value-of select="$deftxt-toc"/-->
      <xsl:call-template name="getString">
        <xsl:with-param name="stringName" select="'Contents'"/>
      </xsl:call-template>
  </h3>
   <ul>
    <xsl:for-each select="//topic/title">
     <li>
<!-- this directive provides a "depth" indicator without doing recursive nesting -->
<xsl:value-of select="substring('------',1,count(ancestor::*))"/>
     <a>
       <xsl:attribute name="href">#<xsl:value-of select="generate-id()"/></xsl:attribute>
       <xsl:value-of select="."/>
     </a>
     <!--recursive call for subtopics here"/-->
     </li>
    </xsl:for-each>
   </ul>
  </div>
</xsl:template>


<!-- listing of immediate child topics; can be expanded for nesting -->
<xsl:template name="gen-ptoc">
<xsl:if test="*[contains(@class,' topic/topic ')]">
  <div>
  <h3 class="sectiontitle">
     <!--xsl:value-of select="$deftxt-ptoc"/-->
      <xsl:call-template name="getString">
        <xsl:with-param name="stringName" select="'Local topics'"/>
      </xsl:call-template><xsl:text>: </xsl:text>
  </h3>
   <ol>
    <xsl:for-each select="*[contains(@class,' topic/topic ')]">
     <li><a>
       <xsl:attribute name="href">#<xsl:value-of select="generate-id()"/></xsl:attribute>
       <xsl:value-of select="title"/>
     </a>
     <!--recursive call for subtopics here"/-->
     </li>
    </xsl:for-each>
   </ol>
  </div>
</xsl:if>
</xsl:template>

<xsl:template name="gen-sect-ptoc">
  <xsl:if test="section"><!-- only in case of child sections of body -->
  <div>
  <h3>Sections in this topic:</h3>
    <ol>
    <xsl:for-each select="section">
     <li><xsl:call-template name="get-sect-heading"/></li>
    </xsl:for-each>
    </ol>
  <hr class="hr"/>
  </div>
  </xsl:if>
</xsl:template>


<!-- basis for string localization -->

<xsl:template name="getString">
  <xsl:param name="stringName"/>
  <xsl:value-of select="$stringName"/>
</xsl:template>


<!--  SETTINGS  -->
<xsl:variable name="trace">no</xsl:variable> <!--set string to 'yes' to turn on trace -->

<!-- set up keys based on xref's "type" attribute: %info-types;|hd|fig|table|li|fn -->
<xsl:key name="topic" match="topic" use="@id"/> <!-- uses "title" -->
<xsl:key name="fig"   match="fig"   use="@id"/> <!-- uses "title" -->
<xsl:key name="table" match="table" use="@id"/> <!-- uses "title" -->
<xsl:key name="li"    match="li"    use="@id"/> <!-- uses "?" -->
<xsl:key name="fn"    match="fn"    use="@id"/> <!-- uses "callout?" -->


<!--  FORMATTER DECLARATIONS AND GLOBALS  -->



<!--  "FORMAT" GLOBAL DECLARATIONS  -->

<xsl:variable name="fmt-fig-lbl-loc">over</xsl:variable><!-- values: over, under -->
<xsl:variable name="fmt-tbl-lbl-loc">over</xsl:variable><!-- values: over, under -->
<xsl:variable name="link-top-section">no</xsl:variable><!-- values: yes, no (or any not "yes") -->
<xsl:variable name="do-place-ing">no</xsl:variable><!-- values: yes, no (or any not "yes") -->

<!-- this value should be created in a named template since it needs to increment per call -->
<!-- for now, the static value is null until we can redo this intent -->
<xsl:variable name="fig-pfx-txt"></xsl:variable>
<xsl:variable name="xfig-pfx-txt">
 <!--xsl:value-of select="$deftxt-fig"/-->
      <xsl:call-template name="getString">
        <xsl:with-param name="stringName" select="'Figure'"/>
      </xsl:call-template> <xsl:number level="any" count="label" from="/" />
 of <xsl:value-of select="count(//fig/label)"/>. </xsl:variable><!-- values: '' or custom design -->
<xsl:variable name="tbl-pfx-txt"></xsl:variable>



<!--  "FORMAT" MACROS  -->
<!--
 | These macros support globally-defined formatting constants for
 | document content.  Some elements have attributes that permit local
 | control of formatting; such logic is part of the pertinent template rule.
 +-->

<xsl:template name="place-tbl-width">
<xsl:variable name="twidth-fixed">100%</xsl:variable>
  <xsl:if test="$twidth-fixed != ''">
    <xsl:attribute name="width"><xsl:value-of select="$twidth-fixed"/></xsl:attribute>
  </xsl:if>
</xsl:template>


<xsl:template name="place-tbl-lbl">
<xsl:variable name="tbl-count">                  <!-- Number of table/title's before this one -->
 <xsl:number count="*/table/title" level="any"/>
</xsl:variable>
<xsl:variable name="tbl-count-actual">           <!-- Number of table/title's including this one -->
 <xsl:choose>
   <xsl:when test="not($tbl-count&gt;0) and not($tbl-count=0) and not($tbl-count&lt;0)">1</xsl:when>
   <xsl:otherwise><xsl:value-of select="$tbl-count+1"/></xsl:otherwise>
 </xsl:choose>
</xsl:variable>
  <xsl:choose>
    <xsl:when test="*[contains(@class,' topic/title ')]">
      <br /><div><strong>
        <xsl:call-template name="getString">
         <xsl:with-param name="stringName" select="'Table'"/>
        </xsl:call-template><xsl:text> </xsl:text><xsl:value-of select="$tbl-count-actual"/>.<xsl:text> </xsl:text>
        <xsl:value-of select="*[contains(@class,' topic/title ')]"/>
      </strong>
      <xsl:if test="*[contains(@class,' topic/desc ')]">
        <xsl:text>. </xsl:text><xsl:value-of select="*[contains(@class,' topic/desc ')]"/>
      </xsl:if>
      </div>
    </xsl:when>
    <xsl:when test="*[contains(@class,' topic/desc ')]">
      <div><xsl:value-of select="*[contains(@class,' topic/desc ')]"/></div>
    </xsl:when>
  </xsl:choose>
</xsl:template>


<xsl:template name="place-fig-lbl">
<xsl:variable name="fig-count">                 <!-- Number of fig/title's before this one -->
 <xsl:number count="*/fig/title" level="any"/>
</xsl:variable>
<xsl:variable name="fig-count-actual">          <!-- Number of fig/title's including this one -->
 <xsl:choose>
   <xsl:when test="not($fig-count&gt;0) and not($fig-count=0) and not($fig-count&lt;0)">1</xsl:when>
   <xsl:otherwise><xsl:value-of select="$fig-count+1"/></xsl:otherwise>
 </xsl:choose>
</xsl:variable>
  <xsl:choose>
    <xsl:when test="*[contains(@class,' topic/title ')]">
      <br /><div><strong>
        <xsl:call-template name="getString">
          <xsl:with-param name="stringName" select="'Figure'"/>
        </xsl:call-template><xsl:text> </xsl:text><xsl:value-of select="$fig-count-actual"/>.<xsl:text> </xsl:text>
        <xsl:value-of select="*[contains(@class,' topic/title ')]"/>
      </strong>
      <xsl:if test="desc">
        <xsl:text>. </xsl:text><xsl:value-of select="*[contains(@class,' topic/desc ')]"/>
      </xsl:if>
      </div>
    </xsl:when>
    <xsl:when test="*[contains(@class, ' topic/desc ')]">
      <div><xsl:value-of select="*[contains(@class,' topic/desc ')]"/></div>
    </xsl:when>
  </xsl:choose>
</xsl:template>



<xsl:template name="proc-ing">
  <xsl:if test="$do-place-ing = 'yes'"> <!-- set in a global variable, as with label placement, etc. -->
    <img src="tip-ing.jpg"/> <!-- this should be an xsl:choose with the approved list and a selection method-->
    <!-- add any other required positioning controls, if needed, but must be valid in the location
         from which the call to this template was made -->
    &#160;
  </xsl:if>
</xsl:template>

<!-- =================== end of processors  ====================== -->




<!-- =================== start of diagnostics  ====================== -->


<xsl:template name="output-message">
  <xsl:param name="msg" select="***"/>
  <xsl:param name="msgnum" select="000"/>
  <xsl:param name="msgsev" select="I"/>
  <xsl:variable name="localclass"><xsl:value-of select="@class"/></xsl:variable>
  <xsl:variable name="debugloc">
   <!-- DocID = test.dita, Element = searchtitle:1 -->
   <xsl:text>DocID = </xsl:text><xsl:value-of select="generate-id(/)"/><xsl:text>, </xsl:text>
   <xsl:text>Element = </xsl:text><xsl:value-of select="name()"/>:<xsl:value-of select="count(preceding::*[@class=$localclass])+count(ancestor-or-self::*[@class=$localclass])"/>
  </xsl:variable>
  <xsl:message><xsl:text>------------------------------------------------------------------
DITA</xsl:text><xsl:value-of select="$msgnum"/>
    <xsl:choose>
      <xsl:when test="$msgsev='I'">I Informational: </xsl:when>
      <xsl:when test="$msgsev='W'">W Warning: </xsl:when>
      <xsl:when test="$msgsev=E">E Error: </xsl:when>
      <xsl:when test="$msgsev=F">F Fatal: </xsl:when>
      <xsl:otherwise>I Informational: </xsl:otherwise>
    </xsl:choose>
    <xsl:text> (</xsl:text><xsl:value-of select="$debugloc"/><xsl:text>)
</xsl:text><xsl:value-of select="$msg"/><xsl:text>
</xsl:text>
  </xsl:message>
</xsl:template>

<!-- =================== end of diagnostics  ====================== -->




<!-- =================== start of override stubs ====================== -->

<!--  STUBS FOR USER PROVIDED OVERRIDE EXTENSIONS  -->

<xsl:template name="gen-user-header">
  <!-- to customize: copy this to your override transform, add whatever content you want! -->
  <!-- for example, to display logos, search/nav widgets, etc. -->
</xsl:template>

<xsl:template name="gen-user-footer">
  <!-- to customize: copy this to your override transform, add whatever content you want! -->
  <!-- for example, to display compliances for: XHTML, accessibility, content ratings, etc. -->
</xsl:template>

<xsl:template name="gen-user-sidetoc">
  <!-- to customize: copy this to your override transform, add whatever content you want! -->
  <!-- Common implementations use a table with align=right to place generated content
       adjacent to the start of the body content -->
</xsl:template>

<xsl:template name="gen-user-scripts">
  <!-- to customize: copy this to your override transform, add whatever content you want! -->
  <!-- see (or enable) the named template "script-sample" for an example -->
  <!--xsl:call-template name="script-sample"/-->
</xsl:template>

<xsl:template name="gen-user-styles">
  <!-- to customize: copy this to your override transform, add whatever content you want! -->
</xsl:template>


<xsl:template name="gen-user-panel-title-pfx">
  <!-- to customize: copy this to your override transform, add whatever content you want! -->
  <!-- Generate content based on run-time parameter value, with local logic here -->
  <!-- This is overrideable -->
</xsl:template>

<xsl:template name="gen-main-panel-title">
  <!-- use the searchtitle unless there's no value - else use title -->
  <xsl:variable name="schtitle"><xsl:value-of select="/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/titlealts ')]/*[contains(@class,' topic/searchtitle ')]"/></xsl:variable>
  <xsl:variable name="ditaschtitle"><xsl:value-of select="/dita/*[contains(@class,' topic/topic ')][1]/*[contains(@class,' topic/titlealts ')]/*[contains(@class,' topic/searchtitle ')]"/></xsl:variable>
  <xsl:variable name="maintitle"><xsl:value-of select="/*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/title ')]"/></xsl:variable>
  <xsl:variable name="ditamaintitle"><xsl:value-of select="/dita/*[contains(@class,' topic/topic ')][1]/*[contains(@class,' topic/title ')]"/></xsl:variable>
  <xsl:choose>
    <xsl:when test="string-length($schtitle)>'0'"><xsl:value-of select="$schtitle"/></xsl:when>
    <xsl:when test="string-length($ditaschtitle)>'0'"><xsl:value-of select="$ditaschtitle"/></xsl:when>
    <xsl:when test="string-length($maintitle)>'0'"><xsl:value-of select="$maintitle"/></xsl:when>
    <xsl:when test="string-length($ditamaintitle)>'0'"><xsl:value-of select="$ditamaintitle"/></xsl:when>
    <xsl:otherwise>
      <xsl:text>***</xsl:text>
      <xsl:call-template name="output-message">
        <xsl:with-param name="msg">No title specified; using "***".</xsl:with-param>
        <xsl:with-param name="msgnum">009</xsl:with-param>
        <xsl:with-param name="msgsev">W</xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- =================== end of override stubs ====================== -->



<!-- =================== DEFAULT PAGE LAYOUT ====================== -->

<xsl:template name="chapter-setup">
<html lang="en-US"><xsl:value-of select="$newline"/>
  <head><xsl:value-of select="$newline"/>
    <meta http-equiv="generator" content="IBM Darwin Information Typing Architecture topic-to-html transform" /><xsl:value-of select="$newline"/>
    <meta name="copyright" content="(C) {$copyright}" /><xsl:value-of select="$newline"/>
    <meta name="security" content="public" /><xsl:value-of select="$newline"/>
    <xsl:variable name="shortdesc"><xsl:value-of select="normalize-space(descendant-or-self::*[contains(@class,' topic/shortdesc ')])"/></xsl:variable>
    <xsl:if test="not(string($shortdesc) = '')">
      <meta name="description" content="{$shortdesc}" /><xsl:value-of select="$newline"/>
    </xsl:if>
    <!-- call any other meta processors here -->
    <link rel="stylesheet" type="text/css" href="{$CSSPATH}{$default-css}" /><xsl:value-of select="$newline"/>
    <xsl:if test="string-length($CSS)>0">
     <link rel="stylesheet" type="text/css" href="{$CSSPATH}{$CSS}" /><xsl:value-of select="$newline"/>
    </xsl:if>
    <title>
      <xsl:call-template name="gen-user-panel-title-pfx"/>
      <xsl:call-template name="gen-main-panel-title"/>
    </title><xsl:value-of select="$newline"/>
    <!-- include scripts here -->
    <xsl:call-template name="gen-user-scripts" />
    <!-- include style element and content here -->
    <xsl:call-template name="gen-user-styles" />
  </head><xsl:value-of select="$newline"/>
  <body class="base"><xsl:value-of select="$newline"/>
  <xsl:apply-templates select="@id"/>

  <xsl:call-template name="gen-user-header"/>
    <!-- here, you can generate a toc based on what's a child of topic -->
    <!--xsl:call-template name="gen-user-sidetoc"/-->

    <xsl:apply-templates/> <!-- this will include all things within topic; therefore, -->
    <!-- title content will appear here by fall-through -->
    <!-- followed by prolog, if fall-through is permitted on it -->
    <!-- followed by body content, again by fall-through in document order -->
    <!-- finally, and child topics and includes will imbed here by fall-through -->

  <xsl:call-template name="gen-endnotes"/>
  <xsl:call-template name="gen-user-footer"/>

  </body><xsl:value-of select="$newline"/>
</html>
</xsl:template>

</xsl:transform>