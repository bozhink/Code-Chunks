<?xml version="1.0" encoding="UTF-8" ?>
<!--  domains.xsl 1.03; 2002 May 8
 | DITA domains support for the demo set; extend as needed
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



<!-- Start of UI domain -->

<xsl:template match="*[contains(@class,' ui-d/uicontrol ')]" priority="2">
  <!-- insert an arrow before all but the first uicontrol in a menucascade -->
  <xsl:if test="ancestor::*[contains(@class,' ui-d/menucascade ')]">
    <xsl:variable name="uicontrolcount"><xsl:number count="*[contains(@class,' ui-d/uicontrol ')]"/></xsl:variable>
    <xsl:if test="$uicontrolcount&gt;'1'">
      <xsl:text> --> </xsl:text>
    </xsl:if>
  </xsl:if>
  <b>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </b>
</xsl:template>


<xsl:template match="*[contains(@class,' ui-d/wintitle ')]" priority="2">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' ui-d/menucascade ')]" priority="2">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' ui-d/shortcut ')]" priority="2">
  <u>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </u>
</xsl:template>


<!-- start of highlighting domain -->

<xsl:template match="*[contains(@class,' hi-d/b ')]" priority="2">
  <b>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </b>
</xsl:template>


<xsl:template match="*[contains(@class,' hi-d/i ')]" priority="2">
  <i>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </i>
</xsl:template>


<xsl:template match="*[contains(@class,' hi-d/u ')]" priority="2">
  <u>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </u>
</xsl:template>


<xsl:template match="*[contains(@class,' hi-d/tt ')]" priority="2">
  <tt>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </tt>
</xsl:template>


<xsl:template match="*[contains(@class,' hi-d/sup ')]" priority="2">
  <sup>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </sup>
</xsl:template>


<xsl:template match="*[contains(@class,' hi-d/sub ')]" priority="2">
  <sub>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </sub>
</xsl:template>


<!-- start of programming domain -->

<xsl:template match="*[contains(@class,' pr-d/codeph ')]" priority="2">
  <code>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </code>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/codeblock ')]" priority="2">
  <xsl:if test="contains(@frame,'top')"><hr /></xsl:if>
  <xsl:call-template name="gen-att-label"/>
  <pre>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:if test="@scale">
      <xsl:attribute name="style">font-size: <xsl:value-of select="@scale"/>%;</xsl:attribute>
    </xsl:if>
    <xsl:apply-templates/>
  </pre>
  <xsl:if test="contains(@frame,'bot')"><hr /></xsl:if>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/option ')]" priority="2">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/var ')]" priority="2">
  <var>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </var>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/parmname ')]" priority="2">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/synph ')]" priority="2">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/oper ')]" priority="2">
  <kbd>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </kbd>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/delim ')]" priority="2">
  <kbd>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </kbd>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/sep ')]" priority="2">
  <kbd>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </kbd>
</xsl:template>



<xsl:template match="*[contains(@class,' pr-d/apiname ')]" priority="2">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/parml ')]" priority="2">
  <xsl:call-template name="gen-att-label"/>
  <dl>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@compact"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </dl>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/plentry ')]" priority="2">
  <xsl:apply-templates/>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/pt ')]" priority="2">
  <dt>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <b><xsl:apply-templates/></b>
  </dt>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/pd ')]" priority="2">
  <dd>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </dd>
</xsl:template>


<!-- syntax diagram -->

<xsl:template match="*[contains(@class,' pr-d/synblk ')]" priority="2">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template name="gen-synnotes">
  <h3>Notes:</h3>
  <xsl:for-each select="//synnote">
    <xsl:call-template name="dosynnt"/>
  </xsl:for-each>
</xsl:template>

<xsl:template name="dosynnt"> <!-- creates a list of endnotes of synnt content -->
 <xsl:variable name="callout">
  <xsl:choose>
   <xsl:when test="@callout"><xsl:value-of select="@callout"/></xsl:when>
   <xsl:otherwise><xsl:value-of select="@id"/></xsl:otherwise>
  </xsl:choose>
 </xsl:variable>
 <a name="{@id}">{<xsl:value-of select="$callout"/>}</a>
 <table border="1" cellpadding="6">
   <tr><td bgcolor="LightGrey">
     <xsl:apply-templates/>
   </td></tr>
 </table>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/synnoteref ')]" priority="2">
<sup>
  <xsl:element name="a">
  <xsl:attribute name="href">#FNsrc_<xsl:value-of select="@refid"/>
  </xsl:attribute>
    [<xsl:value-of select="@refid"/>]
  </xsl:element>
</sup>
</xsl:template>


<xsl:template match="*[contains(@class,' pr-d/synnote ')]" priority="2">
  <xsl:choose>
    <xsl:when test="not(@id='')"> <!-- case of an explicit id -->
      <sup>(explicit id <xsl:value-of select="@id"/>)
        <xsl:element name="a">
          <xsl:attribute name="name">FNsrc_<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:attribute name="href">#FNtarg_<xsl:value-of select="@id"/></xsl:attribute>
            <xsl:value-of select="@id"/>
        </xsl:element>
      </sup>
    </xsl:when>
    <xsl:when test="not(@callout='')"> <!-- case of an explicit callout (presume id for now) -->
      <sup>(callout <xsl:value-of select="@callout"/>)
        <xsl:element name="a">
          <xsl:attribute name="name">FNsrc_<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:attribute name="href">#FNtarg_<xsl:value-of select="@id"/></xsl:attribute>
            <xsl:value-of select="@callout"/>
        </xsl:element>
      </sup>
    </xsl:when>
    <xsl:otherwise>
        <xsl:element name="a">
          <xsl:attribute name="href">#</xsl:attribute>
          <xsl:attribute name="onMouseOver">
            <xsl:text>alert('</xsl:text><xsl:apply-templates/><xsl:text>')</xsl:text>
          </xsl:attribute>*</xsl:element>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>



<xsl:template match="*[contains(@class,' pr-d/syntaxdiagram ')]" priority="2">
	<div style="color: red; margin-bottom: 6pt;">
	<xsl:apply-templates/>
	</div>
</xsl:template>

<xsl:template match="*[contains(@class,' pr-d/fragment ')]" priority="2">
	<div>
	<a><xsl:attribute name="name"><xsl:value-of select="title"/></xsl:attribute> </a>
	<xsl:apply-templates/>
	</div>
</xsl:template>

<!-- Title is optional-->
<xsl:template match="syntaxdiagram/title">
	<h3>
	<xsl:value-of select="."/>
	</h3>
</xsl:template>

<!-- Basically, we want to hide his content. -->
<xsl:template match="*[contains(@class,' pr-d/repsep ')]" priority="2"/>


<xsl:template match="*[contains(@class,' pr-d/kwd ')]" priority="2">
<kbd>
  <xsl:if test="parent::groupchoice"><xsl:if test="count(preceding-sibling::*)!=0"> | </xsl:if></xsl:if>
  <xsl:if test="@importance='optional'"> [</xsl:if>
  <xsl:choose>
    <xsl:when test="@importance='default'"><u><xsl:value-of select="."/></u></xsl:when>
    <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
  </xsl:choose>
  <xsl:if test="@importance='optional'">] </xsl:if>
</kbd>
</xsl:template>

<!-- This should test to see if there's a fragment with matching title 
and if so, produce an associative link. -->
<xsl:template match="*[contains(@class,' pr-d/fragref ')]" priority="100">
	<kbd>
      <a><xsl:attribute name="href">#<xsl:value-of select="."/></xsl:attribute>
	&lt;<xsl:value-of select="."/>&gt;</a>
	</kbd>
</xsl:template>

<!-- Where is the template for var with a priority of 50? -->
<xsl:template match="var" priority="51">
 <var>
  <xsl:if test="parent::groupchoice"> | </xsl:if>
  <xsl:if test="@importance='optional'"> [</xsl:if>
  <xsl:choose>
    <xsl:when test="@importance='default'"><u><xsl:value-of select="."/></u></xsl:when>
    <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
  </xsl:choose>
  <xsl:if test="@importance='optional'">] </xsl:if>
 </var>
</xsl:template>


<xsl:template match="fragment/title">
	<h4><xsl:apply-templates/></h4>
</xsl:template>

<xsl:template match="fragment/groupcomp|fragment/groupchoice|fragment/groupseq">
	<blockquote>
	<xsl:call-template name="dogroup"/>
	</blockquote>
</xsl:template>


<xsl:template match="syntaxdiagram/*[contains(@class,' pr-d/groupcomp ')]|syntaxdiagram/*[contains(@class,' pr-d/groupseq ')]|syntaxdiagram/*[contains(@class,' pr-d/groupchoice ')]">
	<xsl:call-template name="dogroup"/>
</xsl:template>


<!-- okay, here we have to work each permutation because figgroup/figroup fallback is too general -->
<xsl:template match="*[contains(@class,' pr-d/groupcomp ')]/*[contains(@class,' pr-d/groupcomp ')]">
	<xsl:call-template name="dogroup"/>
</xsl:template>

<xsl:template match="*[contains(@class,' pr-d/groupchoice ')]/*[contains(@class,' pr-d/groupchoice ')]">
	<xsl:call-template name="dogroup"/>
</xsl:template>

<xsl:template match="*[contains(@class,' pr-d/groupseq ')]/*[contains(@class,' pr-d/groupseq ')]">
	<xsl:call-template name="dogroup"/>
</xsl:template>

<xsl:template match="*[contains(@class,' pr-d/groupchoice ')]/*[contains(@class,' pr-d/groupcomp ')]">
	<xsl:call-template name="dogroup"/>
</xsl:template>
<xsl:template match="*[contains(@class,' pr-d/groupchoice ')]/*[contains(@class,' pr-d/groupseq ')]">
	<xsl:call-template name="dogroup"/>
</xsl:template>

<xsl:template match="*[contains(@class,' pr-d/groupcomp ')]/*[contains(@class,' pr-d/groupchoice ')]">
	<xsl:call-template name="dogroup"/>
</xsl:template>

<xsl:template match="*[contains(@class,' pr-d/groupcomp ')]/*[contains(@class,' pr-d/groupseq ')]">
	<xsl:call-template name="dogroup"/>
</xsl:template>

<xsl:template match="*[contains(@class,' pr-d/groupseq ')]/*[contains(@class,' pr-d/groupchoice ')]">
	<xsl:call-template name="dogroup"/>
</xsl:template>

<xsl:template match="*[contains(@class,' pr-d/groupseq ')]/*[contains(@class,' pr-d/groupcomp ')]">
	<xsl:call-template name="dogroup"/>
</xsl:template>

<!--
<xsl:template match="*[contains(@class,' topic/figgroup ')]/*[contains(@class,' topic/figgroup ')]">
	<xsl:call-template name="dogroup"/>
</xsl:template>
-->


	<!--xsl:if test="../@choiceseq='choice'"> | </xsl:if-->
<xsl:template name="dogroup">
	<xsl:if test="parent::groupchoice">
		<xsl:if test="count(preceding-sibling::*)!=0"> | </xsl:if>
	</xsl:if>
	<xsl:if test="@importance='optional'">[</xsl:if>
	<xsl:if test="name()='groupchoice'">{</xsl:if>
	  <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text> </xsl:text>
<!-- repid processed here before -->
	<xsl:if test="name()='groupchoice'">}</xsl:if>
	<xsl:if test="@importance='optional'">]</xsl:if>
</xsl:template>

<xsl:template match="*[contains(@class,' pr-d/groupcomp ')]/title|*[contains(@class,' pr-d/groupseq ')]/title|*[contains(@class,' pr-d/groupseq ')]|title"/>  <!-- Consume title -->








<!-- start of software domain elements -->

<xsl:template match="*[contains(@class,' sw-d/msgph ')]" priority="2">
  <code>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </code>
</xsl:template>


<xsl:template match="*[contains(@class,' sw-d/msgblock ')]" priority="2">
  <xsl:if test="contains(@frame,'top')"><hr /></xsl:if>
  <xsl:call-template name="gen-att-label"/>
  <pre>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:if test="@scale">
      <xsl:attribute name="style">font-size: <xsl:value-of select="@scale"/>%;</xsl:attribute>
    </xsl:if>
    <xsl:apply-templates/>
  </pre>
  <xsl:if test="contains(@frame,'bot')"><hr /></xsl:if>
</xsl:template>


<xsl:template match="*[contains(@class,' sw-d/msgnum ')]" priority="2">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' sw-d/cmdname ')]" priority="2">
  <span>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="*[contains(@class,' sw-d/varname ')]" priority="2">
  <var>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </var>
</xsl:template>


<xsl:template match="*[contains(@class,' sw-d/filepath ')]" priority="2">
  <tt>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </tt>
</xsl:template>


<xsl:template match="*[contains(@class,' sw-d/userinput ')]" priority="2">
  <kbd>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </kbd>
</xsl:template>


<xsl:template match="*[contains(@class,' sw-d/systemoutput ')]" priority="2">
  <code>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </code>
</xsl:template>

</xsl:stylesheet>

