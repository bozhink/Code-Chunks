<refentry xmlns="http://docbook.org/ns/docbook"
          xmlns:xlink="http://www.w3.org/1999/xlink"
          xmlns:xi="http://www.w3.org/2001/XInclude"
          xmlns:src="http://nwalsh.com/xmlns/litprog/fragment"
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
          version="5.0" xml:id="refentry.title.properties">
<refmeta>
<refentrytitle>refentry.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>refentry.title.properties</refname>
<refpurpose>Title properties for a refentry title</refpurpose>
</refnamediv>

<refsynopsisdiv>
<src:fragment xml:id="refentry.title.properties.frag">
<xsl:attribute-set name="refentry.title.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-size">18pt</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="space-after">1em</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.6em</xsl:attribute>
  <xsl:attribute name="start-indent"><xsl:value-of select="$title.margin.left"/></xsl:attribute>
</xsl:attribute-set>
</src:fragment>
</refsynopsisdiv>

<refsection><info><title>Description</title></info>

<para>Formatting properties applied to the title generated for the
<tag>refnamediv</tag> part of output for
<tag>refentry</tag> when the value of the
<parameter>refentry.generate.title</parameter> parameter is
non-zero. The font size is supplied by the appropriate <parameter>section.level<replaceable>X</replaceable>.title.properties</parameter>
attribute-set, computed from the location of the
<tag>refentry</tag> in the section hierarchy.</para>

<note>
  <para>This parameter has no effect on the the title generated for
  the <tag>refnamediv</tag> part of output for
  <tag>refentry</tag> when the value of the
  <parameter>refentry.generate.name</parameter> parameter is
  non-zero. By default, that title is formatted with the same
  properties as the titles for all other first-level children of
  <tag>refentry</tag>.</para>
</note>

</refsection>
</refentry>
