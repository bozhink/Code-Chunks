<refentry xmlns="http://docbook.org/ns/docbook"
          xmlns:xlink="http://www.w3.org/1999/xlink"
          xmlns:xi="http://www.w3.org/2001/XInclude"
          xmlns:src="http://nwalsh.com/xmlns/litprog/fragment"
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
          version="5.0" xml:id="section.title.properties">
<refmeta>
<refentrytitle>section.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.title.properties</refname>
<refpurpose>Properties for section titles</refpurpose>
</refnamediv>

<refsynopsisdiv>
<src:fragment xml:id="section.title.properties.frag">
<xsl:attribute-set name="section.title.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <!-- font size is calculated dynamically by section.heading template -->
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="text-align">left</xsl:attribute>
  <xsl:attribute name="start-indent"><xsl:value-of select="$title.margin.left"/></xsl:attribute>
</xsl:attribute-set>
</src:fragment>
</refsynopsisdiv>

<refsection><info><title>Description</title></info>

<para>The properties common to all section titles.</para>

</refsection>
</refentry>
